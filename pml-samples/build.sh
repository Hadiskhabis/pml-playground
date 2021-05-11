#!/bin/bash
for f in *.pml; do
	pmlc $f
done
