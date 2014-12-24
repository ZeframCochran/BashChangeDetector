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
url=$1
cssPath=$2 
cookieFile=$3

./DownloadPage.sh  $url $cookieFile


filename=$(ls ./pageCache/)

#Parse for the important String
temp=$(./parseForString.sh pageCache/$filename "$cssPath")
echo $temp > ./pageCache/$filename 
string1=$(cat pageCache/$filename)


#Check for an archived instance.
if [ -f "./pageArchive/"$filename ]
then
		echo $filename exists in archive, comparing..
		string2=$(cat pageArchive/$filename)
		if [[ "$string1" != "$string2" ]];
		then
				echo "Comparison: "
				echo --------------------
				echo "New String is ('$string1')"
				echo "Old String is ('$string2')"
				echo --------------------
				echo sending email with both strings..
				./SendAlert.sh $1 $string2 $string1
				mv "./pageCache/"$filename "./pageArchive/"
		else
				echo "The string has not changed. ('$string2')"
				echo No action required.
				rm pageCache/*
		fi
	else
		echo Copying important String from $filename to archive..
		mv "./pageCache/"$filename "./pageArchive/"
fi
