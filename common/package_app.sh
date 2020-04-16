#!/bin/sh
cd ${HOME}/oF/apps/${GH_USER}
cp -r ${GH_REPO} package
rm -rf package/.git
# TODO: further clean up, e.g. obj
zip -qq -r ${GH_REPO}_${OF_PLATFORM}_${TRAVIS_TAG}.zip package
mkdir ${HOME}/packaged
openssl dgst -sha256 ${GH_REPO}_${OF_PLATFORM}_${TRAVIS_TAG}.zip >> ${HOME}/packaged/${GH_REPO}_${OF_PLATFORM}_${TRAVIS_TAG}.sha256
mv ${GH_REPO}_${OF_PLATFORM}_${TRAVIS_TAG}.zip ${HOME}/packaged