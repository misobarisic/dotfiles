#!/bin/bash
# Display all active zsh aliases

cat ~/.zshrc | \
	grep -e '^alias\|^#\w' | \
	grep -v '^#\w*alias' | \
	sed 's/#/ \n/g' | \
	less
