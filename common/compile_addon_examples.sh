#!/bin/sh
cd ${HOME}/oF/addons
cp -R ${TRAVIS_BUILD_DIR} .
cd ${GH_REPO}

for d in example*/ ; do
    if [[ -d $d ]]
    then
        echo "$d"
        cd $d
        bash -c "$(curl -sSL https://raw.githubusercontent.com/thomasgeissl/ofPackageManager/master/scripts/ofPackageManager.sh)" install
        make
        cd ..
    fi
done

for d in test*/ ; do
    echo "$d"
    if [[ -d $d ]]
    then
        cd $d
        bash -c "$(curl -sSL https://raw.githubusercontent.com/thomasgeissl/ofPackageManager/master/scripts/ofPackageManager.sh)" install
        make
        cd ..
    fi
done