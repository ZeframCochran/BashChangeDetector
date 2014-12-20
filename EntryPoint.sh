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

#sed -e 's/^ *//' -e 's/ *$//'
string1=$(cat pageCache/$filename)
#Check for an archived instance.
if [ -f "./pageArchive/"$filename ]
then
		echo $filename exists in archive, comparing..
		string2=$(cat pageArchive/$filename)
		if [[ "$string1" != "$string2" ]];
		then
				echo "string1('$string1') is not equal to string2('$string2')"
				echo --------------------
				echo "String 1 is ('$string1')"
				echo "String 2 is ('$string2')"
				echo --------------------
				echo sending email with both strings..
		else
				echo "string1('$string1') is equal to string2('$string2')"
				echo No action required.
		fi
	else
		echo Copying important String from $filename to archive..
		mv "./pageCache/"$filename "./pageArchive/"
fi
rm pageCache/*



#	s2 = $(./parseForString $file2)
#	if there is a diff (get get Files pageCache/Mail and pageCache/Mail.1 differ)
#	Send email.

