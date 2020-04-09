#!/bin/sh
cd ${HOME}/oF/addons
# git clone https://github.com/${TRAVIS_REPO_SLUG}.git && cd ${GH_REPO}
cp -R ${TRAVIS_BUILD_DIR} .
pwd && ls
# bash -c "$(curl -sSL https://raw.githubusercontent.com/thomasgeissl/ofPackageManager/master/scripts/ofPackageManager.sh)" install
# make
# for d in example*/ ; do
#     echo "$d"
#     cd $d
#     make
#     cd ..
# done