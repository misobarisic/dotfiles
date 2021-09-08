#!/bin/bash
# Display all active bash aliases

cat ~/.bashrc | \
	grep -e '^alias\|^#\w' | \
	grep -v '^#\w*alias' | \
	sed 's/#/ \n/g' | \
	less
