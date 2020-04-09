#!/bin/sh
OF_PLATFORM=linux64gcc6
export OF_PLATFORM

curl -O https://openframeworks.cc/versions/v${OF_VERSION}/of_v${OF_VERSION}_${OF_PLATFORM}_release.tar.gz
tar -zxf of_v${OF_VERSION}_${OF_PLATFORM}_release.tar.gz
rm of_v${OF_VERSION}_${OF_PLATFORM}_release.tar.gz
mv of_v${OF_VERSION}_${OF_PLATFORM}_release ${HOME}/oF
sudo ${HOME}/oF/scripts/linux/ubuntu/install_dependencies.sh -y