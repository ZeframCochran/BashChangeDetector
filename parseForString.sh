# This script parses html and returns the content of a CSS Path
# $1 Filename
# $2 CSS Path
#echo Getting string from
#echo 	file:$1
#echo 	css path: $2
 hxnormalize -l 240 -x $1 | hxselect -i -c -s '\n' "$2"