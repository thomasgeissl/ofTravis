#!/bin/sh
cd ${HOME}/oF/addons/${GH_REPO}
for d in example*/ ; do
    echo "$d"
    cd $d
    codesign --force --sign "Developer ID Application: My Company" ./bin/*.app
    cd ..
done