#!/bin/bash
# Display all active fish aliases

cat ~/.config/fish/config.fish | \
	grep -e '^alias\|^#\w' | \
	grep -v '^#\w*alias' | \
	sed 's/#/ \n/g' | \
	sed 's/alias //g' | \
	less

