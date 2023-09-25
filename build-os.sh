#!/bin/bash

set -e

export CONFIG=gcw0

if [ ! -d "releases" ] ; then
    mkdir "releases"
fi

if [ ! -d "buildroot/output/$CONFIG/images" ]; then
	mkdir -p "buildroot/output/$CONFIG";
	( \
		cd buildroot/output/gcw0; \
		ln -s ../../../releases images; \
	)
fi

( \
cd buildroot; \
./build.sh all; \
)

#make BR2_EXTERNAL=board/opendingux od_gcw0_defconfig
#make BR2_EXTERNAL=board/opendingux -j5; \
