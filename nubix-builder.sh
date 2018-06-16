# nubix-builder-script
# param: build-script
# build Makefile Project. To write a new script just ad a line in script with following sytanx:
# <src_director> <make-flags>
#
# this Script is part of nubix-toolchain Version 1
# author: Jan-Frederic Kurzweil
# version: 0.1.1
# license: GNU/GPL V2
#!/bin/bash

readarray -t mksubs < $1
	sub_count=${#mksubs[@]}

	if [ ${#mksubs[@]} > 0 ]; then
		echo "building nubix package"
		for ((i=0; $i < ${sub_count}; i++))
		do
			make_cmd=${mksubs[$i]}
			make -C ${make_cmd}
		done
	else
		echo "error: no entries in .mksubs"
	fi