#!/bin/sh
OF_PLATFORM=osx
export OF_PLATFORM

curl -O https://openframeworks.cc/versions/v${OF_VERSION}/of_v${OF_VERSION}_${OF_PLATFORM}_release.zip
unzip -a -qq of_v${OF_VERSION}_${OF_PLATFORM}_release.zip
rm of_v${OF_VERSION}_${OF_PLATFORM}_release.zip
mv of_v${OF_VERSION}_${OF_PLATFORM}_release ${HOME}/oF

brew tap thomasgeissl/tools
brew install ofpackagemanager