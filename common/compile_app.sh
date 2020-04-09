#!/bin/sh
cd ${HOME}/oF/apps
mkdir ${GH_USER} && cd ${GH_USER}
# git clone https://github.com/${TRAVIS_REPO_SLUG}.git && cd ${GH_REPO}
cp -R ${TRAVIS_BUILD_DIR} .
cd ${GH_REPO}

bash -c "$(curl -sSL https://raw.githubusercontent.com/thomasgeissl/ofPackageManager/master/scripts/ofPackageManager.sh)" install
make