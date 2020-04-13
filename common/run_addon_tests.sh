#!/bin/sh
cd ${HOME}/oF/addons/${GH_REPO}

for d in test*/ ; do
    echo "$d"
    cd $d
    make run
    cd ..
done