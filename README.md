# ofTravis

## Description
Some useful scripts to be used for travis and openFrameworks.

## Build status
[![Build Status](https://travis-ci.com/thomasgeissl/ofTravis.svg?branch=master)](https://travis-ci.com/thomasgeissl/ofTravis)


## Usage

## travis.yml
* clone this repo: `git clone https://github.com/thomasgeissl/ofTravis.git`
* source the needed scripts: e.g. `source ./ofTravis/common/export.sh`

## travis project config, e.g. https://travis-ci.com/github/thomasgeissl/ofTravis/settings

If you want to deployment to github releases or sign and notarise your app, then please set the following environment variables in the travis settings for your repo 

* GH_TOKEN: github personal access token with at least repo/public_repo rights: 
* CERTIFICATE_OSX_P12: your apple developer p12 certificate, base64 encoded
* CERTIFICATE_OSX_P12_PASSWORD: the corresponding password
* CERTIFICATE_OSX_P12_NAME: the name of the certificate, can be found on apple developer account page