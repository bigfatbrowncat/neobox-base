#!/bin/bash

set -e

if [ ! -f "buildroot/output/gcw0/images" ]; then
	mkdir -p buildroot/output/gcw0;
	( \
		cd buildroot/output/gcw0; \
		ln -s ../../../releases images; \
	)
fi

exit(123)

( \
export CONFIG=gcw0; \
cd buildroot; \
./build.sh gcw0; \
)

#make BR2_EXTERNAL=board/opendingux od_gcw0_defconfig
#make BR2_EXTERNAL=board/opendingux -j5; \
