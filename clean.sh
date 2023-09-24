#!/bin/sh

set -e

( \
export CONFIG=gcw0; \
cd buildroot; \
./build.sh clean; \
)

rm -rf buildroot/output		# Finishing the buildroot cleaning

rm -rf releases/*
rm -rf select_kernel/*.opk

echo "## Cleaned successfully!"
