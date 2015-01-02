# BashChangeDetector
==================

Checks websites for changes and alerts the user

#### Dependencies:
#####   For parsing the html using css paths:
    sudo apt-get  install html-xml-utils 
#####   For sending alerts (disabled by default)
    sudo apt-get install mailutils
    sudo apt-get install openssl ca-certificates
    sudo apt-get install msmtp
    Make sure to configure .msmtprc

#### Goal:
  My goal here was to write a bash script that did something non-trivial and was easy 
  to read and modify.

#### Problems:
  I used files for temporary stuff because bash kept adding spaces around 
  things.

#### To configure:
  edit the detect.sh

#### To run:
  ./detect.sh
