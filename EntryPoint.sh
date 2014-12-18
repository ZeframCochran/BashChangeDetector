#!/bin/bash
#
#This will 
#       download the specified pages, 
#       using the provided cookies, 
#       on a schedule
#       And email you when they update
######################################

# $1 url
# $2 css path
# $3 cookie file

#List of pages and [optional] cookie files
./DownloadPage.sh  $1 $2 $3 

#Check for an old copy, compare if it exists.
#Parse for the filename
#diff -q pageCache/filename*

#Compare the important Strings
#If there is not another copy (We get a missing Operand error
#	Store this one as the record
#else
#	s1 = $(./parseForString $file1)
#	s2 = $(./parseForString $file2)
#	"$1"="$2"
#	if there is a diff (get get Files pageCache/Mail and pageCache/Mail.1 differ)
#	Send email.

