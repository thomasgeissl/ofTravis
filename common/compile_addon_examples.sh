#!/bin/sh
cd ${HOME}/oF/addons
cp -R ${TRAVIS_BUILD_DIR} .
cd ${GH_REPO}

for d in example*/ ; do
    echo "$d"
    cd $d
    bash -c "$(curl -sSL https://raw.githubusercontent.com/thomasgeissl/ofPackageManager/master/scripts/ofPackageManager.sh)" install
    make
    cd ..
done

for d in test*/ ; do
    echo "$d"
    cd $d
    bash -c "$(curl -sSL https://raw.githubusercontent.com/thomasgeissl/ofPackageManager/master/scripts/ofPackageManager.sh)" install
    make
    cd ..
done