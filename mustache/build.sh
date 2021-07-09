#!/bin/bash

# Tested with mustache.js:
# 	https://www.npmjs.com/package/mustache

rm *.json *.txt 2> /dev/null
pmlc export_tags
for template in *.mustache; do
	outfile="${template%.mustache}"
	outfile="${outfile/__/.}"
	echo -e "Processing: \"$template\" -> \"$outfile\""
	mustache pml_tags.json $template > $outfile
done
