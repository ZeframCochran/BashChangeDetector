# BashChangeDetector
==================

Checks websites for changes and alerts the user

## Dependencies:
============
  ### For parsing the html using css paths:
    sudo apt-get  install html-xml-utils 
  ### For sending alerts (although you can skip these as I have disabled alerts for the moment, I am looking for a better way to send emails)
    sudo apt-get install mailutils
    sudo apt-get install openssl ca-certificates
    sudo apt-get install msmtp

## Goal:
====
  My goal here was to write a bash script that did something non-trivial and was easy 
  to read and modify.

## Problems:
========
  I used files for temporary stuff because bash kept adding spaces around 
  things otherwise and I got sick of trying to solve it for now.

## To configure:
  edit the detect.sh

## To run:
  ./detect.sh
