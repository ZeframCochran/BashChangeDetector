# This script parses html and returns the content of a CSS Path
filename="pageCache/bx7vMyv"
cssPath="#under-image > div.relative.action-bar > div.title.left.stats-link.gallery-info > div.point-info-container.left > span.points-bx7vMyv"
 hxnormalize -l 240 -x $filename | hxselect -i -c -s '\n' "$cssPath"
 echo --debug-- 
 echo csspath "$cssPath"