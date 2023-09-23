#!/bin/sh

set -e

( \
cd buildroot; \
make BR2_EXTERNAL=board/opendingux clean; \
)

rm releases/*
rm select_kernel/*.opk

echo "## Cleaned successfully!"
