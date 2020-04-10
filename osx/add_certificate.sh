  
  #!/bin/sh
  
  export CERTIFICATE_P12=Certificate.p12;
  echo $CERTIFICATE_OSX_P12 | base64 — decode > $CERTIFICATE_P12;
  export KEYCHAIN=build.keychain;
  security create-keychain -p mysecretpassword $KEYCHAIN;
  security default-keychain -s $KEYCHAIN;
  security unlock-keychain -p mysecretpassword $KEYCHAIN;
  security import $CERTIFICATE_P12 -k $KEYCHAIN -P $CERTIFICATE_OSX_P12_PASSWORD -T /usr/bin/codesign;
