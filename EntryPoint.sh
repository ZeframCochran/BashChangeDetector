#!/bin/bash
#
#This will:
#       download the specified pages,
#       using the provided cookies,
#       on a schedule
#       And email you when they update
######################################

#Get parameters from the config file


#List of pages and [optional] cookie files
echo	$1 url
echo	$2 css path
echo	$3 cookie file

./DownloadPage.sh  $1 $3 


filename=$(ls ./pageCache/)

#Parse for the important String

s1=$(./parseForString.sh pageCache/$filename $2)

#Check for an archived instance.
if [ -f "./pageArchive/"$filename ]
	then
		echo $filename exists
	else
		echo Copying important String from $filename to archive..
fi
rm pageCache/*
echo got important String $s1

#	s2 = $(./parseForString $file2)
#	"$1"="$2"
#	if there is a diff (get get Files pageCache/Mail and pageCache/Mail.1 differ)
#	Send email.

