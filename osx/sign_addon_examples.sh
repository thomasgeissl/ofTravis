#!/bin/sh
cd ${HOME}/oF/addons/${GH_REPO}
for d in example*/ ; do
    echo "$d"
    cd $d
    codesign --force --sign "Thomas Geissl" ./bin/*.app
    cd ..
done