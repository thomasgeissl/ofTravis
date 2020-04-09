#!/bin/sh
cd ${HOME}/oF/apps/${GH_USER}
zip -r ${GH_REPO}.zip ${GH_REPO}
mkdir ${HOME}/packaged
mv ${GH_REPO}.zip ${HOME}/packaged