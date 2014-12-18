#!/bin/bash
#
#       we need to know:
#               $1 The url
#               $2 The cookie file if needed
if [ -n "$2" ]
then
   wget -x --load-cookies $2 --no-directories -P pageCache $1
else
   wget -x --no-directories -P pageCache $1
fi

