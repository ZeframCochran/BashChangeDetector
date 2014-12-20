# This script parses html and returns the content of a CSS Path
filename=$1
cssPath=$2
 hxnormalize -l 240 -x $filename | hxselect -i -c -s '\n' "$cssPath"