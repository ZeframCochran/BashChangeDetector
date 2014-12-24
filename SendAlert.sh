# Send an alert using the given data and template.
cat changeTemplate.txt >> tmpfile
echo There has been a change to $1 >> tmpfile
echo "$2"  >> tmpfile
echo has become >> tmpfile
echo "$3" >> tmpfile
echo Alerts are currently not enabled. Edit SendAlert.sh to fix this.
echo Edit changeTemplate.txt to change the email template.
#cat tmpfile | msmtp Anonygram@gmail.com
rm tmpfile
