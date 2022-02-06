#!/bin/bash

function pandoc2json() {
	# --------------------------------------------------------------------------
	# Convert a document to pandoc JSON AST and pretty-format it via jsome.
	# Parameters:
	# 	$1 : input document file
	# --------------------------------------------------------------------------
	jsonF="${1%.*}.json"
	echo "\"$1\" -> \"$jsonF\""
	pandoc -t json $1 | jsome -c false -r true | sed 's/[ \t]\+$//' > $jsonF
	if [[ $(uname -s) == MINGW* ]];then
		unix2dos $jsonF > /dev/null 2>&1
	fi
}

function pandoc2pml() {
	# --------------------------------------------------------------------------
	# Convert a document to PML via our custom PML writer (Lua) and template.
	# Parameters:
	# 	$1 : input document file
	# --------------------------------------------------------------------------
	pmlF="${1%.*}.pml"
	echo "\"$1\" -> \"$pmlF\""
	pandoc -t pml-writer.lua --template=default.pml.lua $1 -o $pmlF || exit 1
	if [[ $(uname -s) == MINGW* ]];then
		unix2dos $pmlF > /dev/null 2>&1
	fi
}

pandoc2json pandoc.markdown
pandoc2pml  pandoc.markdown
pmlc pandoc.pml
# pmlc convert -od ./ --input_file pandoc.pml
