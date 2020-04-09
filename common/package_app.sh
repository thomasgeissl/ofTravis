#!/bin/sh
cd ${HOME}/oF/apps/${GH_USER}
zip -r ${GH_REPO}_${OF_PLATFORM}.zip ${GH_REPO}
mkdir ${HOME}/packaged
mv ${GH_REPO}_${OF_PLATFORM}_${RAVIS_TAG}.zip ${HOME}/packaged