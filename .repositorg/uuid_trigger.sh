#!/usr/bin/env bash

findmnt -o action,target,uuid -r -n --poll |
	while read -r eaction etarget euuid; do
		# findmnt returns reformatted whitespace	
		etarget=${etarget/\\x20/ }
		if [[ "$eaction" == "mount" ]]; then
			~/.repositorg/sources/${euuid}.sh "${etarget}"
		fi
	done
