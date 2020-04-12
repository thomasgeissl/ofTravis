OF_PLATFORM=msys2
export OF_PLATFORM

curl -O https://openframeworks.cc/versions/v${OF_VERSION}/of_v${OF_VERSION}_${OF_PLATFORM}_release.zip
unzip -a -qq of_v${OF_VERSION}_${OF_PLATFORM}_release.zip
rm of_v${OF_VERSION}_${OF_PLATFORM}_release.zip
mv of_v${OF_VERSION}_${OF_PLATFORM}_release ${HOME}/oF
# ${HOME}/oF/scripts/${OF_PLATFORM}/install_dependencies.sh --noconfirm

#Analyse script arguments
confirm="no"

# List of MSYS packages to be installed
msyspackages="make rsync unzip wget"

# List of MINGW packages to be installed (without prefix)
mingwPackages="assimp boost cairo curl freeglut FreeImage gcc gdb glew glfw \
			  harfbuzz libsndfile libusb libxml2 mpg123 ntldd-git openal opencv \
			  pkg-config poco tools zlib"

# Build the full list of packages adding prefix to MINGW packages
packages=${msyspackages}
for pkg in ${mingwPackages}; do
	packages="$packages  $MINGW_PACKAGE_PREFIX-$pkg"
done

# Install packages
if [[ "${confirm}" == "yes" ]]; then
	for pkg in ${packages}; do
		pacman -Su --confirm --needed ${pkg}
	done
else
	$msys2 pacman -Su --noconfirm --needed --debug --verbose ${packages}
fi


# this would install gstreamer which can be used in mingw too
#pacman -Su ${MINGW_PACKAGE_PREFIX}-gst-libav ${MINGW_PACKAGE_PREFIX}-gst-plugins-bad ${MINGW_PACKAGE_PREFIX}-gst-plugins-base ${MINGW_PACKAGE_PREFIX}-gst-plugins-good ${MINGW_PACKAGE_PREFIX}-gst-plugins-ugly ${MINGW_PACKAGE_PREFIX}-gstreamer

exit_code=$?
if [ $exit_code != 0 ]; then
	echo "error installing packages, there could be an error with your internet connection"
	exit $exit_code
fi


# Update addon_config.mk files to use OpenCV 3 or 4 depending on what's installed
addons_dir="$(readlink -f "{HOME}/oF/addons")"
$(pkg-config opencv4 --exists)
exit_code=$?
if [ $exit_code != 0 ]; then
	echo "Updating ofxOpenCV to use openCV3"
	sed -i -E 's/ADDON_PKG_CONFIG_LIBRARIES =(.*)opencv4(.*)$/ADDON_PKG_CONFIG_LIBRARIES =\1opencv\2/' "$addons_dir/ofxOpenCv/addon_config.mk"
else
	echo "Updating ofxOpenCV to use openCV4"
	sed -i -E 's/ADDON_PKG_CONFIG_LIBRARIES =(.*)opencv\s/ADDON_PKG_CONFIG_LIBRARIES =\1opencv4 /g' "$addons_dir/ofxOpenCv/addon_config.mk"
	sed -i -E 's/ADDON_PKG_CONFIG_LIBRARIES =(.*)opencv$/ADDON_PKG_CONFIG_LIBRARIES =\1opencv4/g' "$addons_dir/ofxOpenCv/addon_config.mk"
fi
