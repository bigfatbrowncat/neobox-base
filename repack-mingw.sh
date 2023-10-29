#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

set -e

SRC=`realpath $1`    #tar xf ../releases/opendingux-gcw0-toolchain.2023-10-28.tar.xz
DST=`realpath $2`

(\
  TMP=`mktemp -d`; \
  echo $TMP; \
  cd $TMP; \
  tar xf $SRC; \
  rm gcw0-toolchain/lib64; \
  rm gcw0-toolchain/usr; \
  rm -rf gcw0-toolchain/libexec/gcc/x86_64-w64-mingw32; \
  find gcw0-toolchain/bin/ -type f,l ! -name "*.exe" -delete; \
  find gcw0-toolchain/libexec/gcc/mipsel-gcw0-linux-uclibc/12.2.0 -type f,l ! -name "*.?*" -delete; \
  find gcw0-toolchain/libexec/gcc/mipsel-gcw0-linux-uclibc/12.2.0 -type f,l ! -name "*.so*" -delete; \
  find gcw0-toolchain/libexec/gcc/mipsel-gcw0-linux-uclibc/12.2.0/plugin -type f,l ! -name "*.?*" -delete; \
  zip -r $DST/neobox-toolchain-mingw.zip gcw0-toolchain/ \
)

rm -rf $TMP
