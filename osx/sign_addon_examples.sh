#!/bin/sh
cd ${HOME}/oF/addons/${GH_REPO}
for d in example*/ ; do
    echo "$d"
    cd $d
    codesign --force --sign "${CERTIFICATE_OSX_P12_NAME}" ./bin/*.app
    cd ..
done