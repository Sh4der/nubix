# setup-nubix-devenv
# create a basic configuration file for new nubix-image-build
#	this file can be extend while adding required Shell Variables with export <VAR_NAME>=<VAR_VALUE>
#
# this Script is part of nubix-toolchain Version 1
# author: Jan-Frederic Kurzweil
# version: 0.1.1
# license: GNU/GPL V2

#!/bin/bash
BASE_ALIAS=""
BASE_MIRROR_SERVER=""
BASE_ROOT_DIR=""
BASE_ARCH=""
CONFIG_PATH=""

if [ "$#" -ne 5 ]; then
	echo "usage: <debian-alias> <debian-mirror-server> <base-root-directory> <target-arch> <config-output-dir>"
	exit 1
fi

echo "exporting $1 as debian-alias"
BASE_ALIAS=$1
echo "exporting $2 as debian-mirror-server"
BASE_MIRROR_SERVER=$2
echo "exporting $3 as base-root-directory"
BASE_ROOT_DIR=$3
echo "exporting $4 as target-arch"
BASE_ARCH=$4
echo "exporting $5 as config-path"
CONFIG_PATH=$5

timestamp="$(date)"

echo "creating new config file nubix.cfg"
touch nubix.cfg
echo "# auto generated config file, please do not change!" > nubix.cfg
echo "# generation date: $timestamp" >> nubix.cfg 
echo "export BASE_ALIAS=$BASE_ALIAS" >> nubix.cfg
echo "export BASE_MIRROR_SERVER=$BASE_MIRROR_SERVER" >> nubix.cfg
echo "export BASE_ROOT_DIR=$BASE_ROOT_DIR" >> nubix.cfg
echo "export BASE_ARCH=$BASE_ARCH" >> nubix.cfg
echo "export BASE_IMAGE_DIR=nubix-image/" >> nubix.cfg
echo "export NUBIX_VERSION=0.0.1" >> nubix.cfg