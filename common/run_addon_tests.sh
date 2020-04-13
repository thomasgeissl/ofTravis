#!/bin/sh
cd ${HOME}/oF/addons
cp -R ${TRAVIS_BUILD_DIR} .
cd ${GH_REPO}

for d in test*/ ; do
    echo "$d"
    cd $d
    make run
    cd ..
done