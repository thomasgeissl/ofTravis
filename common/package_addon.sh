#!/bin/sh
cd ${HOME}/oF/addons/
zip -qq -r ${GH_REPO}_${OF_PLATFORM}_${TRAVIS_TAG}.zip ${GH_REPO}
mkdir ${HOME}/packaged
openssl dgst -sha256 ${GH_REPO}_${OF_PLATFORM}_${TRAVIS_TAG}.zip >> ${HOME}/packaged/${GH_REPO}_${OF_PLATFORM}_${TRAVIS_TAG}.sha256
mv ${GH_REPO}_${OF_PLATFORM}_${TRAVIS_TAG}.zip ${HOME}/packaged