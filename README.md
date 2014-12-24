BashChangeDetector
==================

Checks websites for changes and alerts the user

 Dependencies:
  For parsing the html using css paths:
    sudo apt-get  install html-xml-utils 
  For sending alerts (although you can skip these as I have disabled alerts for the moment, I am looking for abetter way to send emails)
    sudo apt-get install mailutils
    sudo apt-get install openssl ca-certificates
    sudo apt-get install msmtp

Goal:
  My goal here was to write a bash script that did something non-trivial and was easy 
  to read and modify.
Problems:
  I should change the config.sh to a file read by the EntryPoint.sh because the names 
  are stupid otherwise.
  
  All of the other names are quite clear and hopefully this is something a beginner
  could understand and modify in under an hour. 
  and a skilled scripter can in probably be well versed with a read of config and EntryPoint.
  
  Also, I used files for even temporary stuff because bash kept adding spaces around 
  things otherwise and I got sick of trying to solve it tonight.

To run:
./config.sh
