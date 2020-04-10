#!/bin/sh
cd ${HOME}/oF/apps/${TRAVIS_REPO_SLUG}
codesign --force --sign "${CERTIFICATE_OSX_P12_NAME}" ./bin/*.app