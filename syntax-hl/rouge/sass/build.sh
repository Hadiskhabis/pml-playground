#!/bin/bash

# Build Rouge stylesheet
########################
sass rouge.scss rouge.css

# Create docinfo file from CSS:

echo "<style>"  >  docinfo.html
cat rouge.css 	>> docinfo.html
echo "</style>" >> docinfo.html


if [[ $(uname -s) == MINGW* ]];then
	unix2dos docinfo.html
fi

# Deploy docinfo file to dest folders (can't be used via relative paths):

cp docinfo.html "../"
