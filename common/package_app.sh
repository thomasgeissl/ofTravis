#!/bin/sh
cd ${HOME}/oF/apps/${GH_USER}
zip -r ${GH_REPO}_${OF_PLATFORM}_${TRAVIS_TAG}.zip ${GH_REPO}
mkdir ${HOME}/packaged
mv ${GH_REPO}_${OF_PLATFORM}_${TRAVIS_TAG}.zip ${HOME}/packaged