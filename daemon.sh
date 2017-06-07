#!/bin/bash

REPO=$1

I=20000
while true; do
	while [ -e output/${I}.csv ]; do I=$((I+1)); done
	th eval.lua  -model models/model_id1-501-1448236541.t7 -dump_images 0 -num_images -1 -image_folder $REPO -dump_csv 1 -dump_json 0 -batch_size 86 -delete 1 -iter $I
	echo "${I}k images processed so far"
done
