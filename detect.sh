#This function contains the list of websites, css paths, and cookie files
function config(){
    entryPoint https://www.wyzant.com/Tutor/Mail "#MailBodyMain > div > table > tbody > tr > td > i" Cookie2.txt
    entryPoint http://imgur.com/gallery/bx7vMyv "#under-image > div.relative.action-bar > div.title.left.stats-link.gallery-info > div.point-info-container.left > span.points-bx7vMyv"
}

function downloadPage(){
url=$1
cookieFile=$2
    if [ -n "$cookieFile" ]
    then
       wget -x --load-cookies $cookieFile --no-directories -P pageCache $url
    else
       wget -x --no-directories -P pageCache $url
    fi
}

function sendAlert(){
url=$1
newString=$2
newString=$3
    # Send an alert using the given data and template.
    cat changeTemplate.txt >> tmpfile
    echo There has been a change to $url >> tmpfile
    echo "$newString"  >> tmpfile
    echo has become >> tmpfile
    echo "$newString" >> tmpfile
    echo Alerts are currently not enabled. Edit sendAlert to fix this.
    echo Edit changeTemplate.txt to change the email template.
    #cat tmpfile | msmtp Anonygram@gmail.com
    rm tmpfile
}

function parseForString() {
    # This script parses html and returns the content of a CSS Path
    filename=$1
    cssPath=$2
    hxnormalize -l 240 -x $filename | hxselect -i -c -s '\n' "$cssPath"
}

function unitTests(){
    #entryPoint
    #parseForString
        #Should parse a file and return the correct String
    #sendAlert
        #Should 
    #downloadPage
        #After running, there should be a new file in pageCache
    #config
     #a
     echo none yet.
}

function entryPoint(){
    #This will:
    #       download the specified pages,
    #       using the provided cookies,
    #       and alert you when they update
    ######################################
    
    #Get parameters from the config file
    
    
    #List of pages and [optional] cookie files
    url=$1
    cssPath=$2 
    cookieFile=$3
    
    downloadPage $url $cookieFile
    
    
    filename=$(ls ./pageCache/)
    
    #Parse for the important String
    temp=$(./parseForString.sh pageCache/$filename "$cssPath")
    echo $temp > ./pageCache/$filename 
    newString=$(cat pageCache/$filename)
    
    
    #Check for an archived instance.
    if [ -f "./pageArchive/"$filename ]
    then
            echo $filename exists in archive, comparing..
            oldString=$(cat pageArchive/$filename)
            if [[ "$newString" != "$oldString" ]];
            then
                    echo "Comparison: "
                    echo --------------------
                    echo "New String is ('$newString')"
                    echo "Old String is ('$oldString')"
                    echo --------------------
                    echo sending email with both strings..
                    sendAlert $url $oldString $newString
                    mv "./pageCache/"$filename "./pageArchive/"
            else
                    echo "The string has not changed. ('$oldString')"
                    echo No action required.
                    rm pageCache/*
            fi
        else
            echo Copying important String from $filename to archive..
            mv "./pageCache/"$filename "./pageArchive/"
    fi
}

config