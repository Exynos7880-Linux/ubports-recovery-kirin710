#!/bin/bash
source hadk.env
cd $ANDROID_ROOT

./hybris-patches/apply-patches.sh --mb

source build/envsetup.sh 2>&1
export ALLOW_MISSING_DEPENDENCIES=true
#export KERNEL_MAKE_FLAGS="-j4 -O=2"
breakfast $DEVICE

echo "clean .repo folder"
rm -rf $ANDROID_ROOT/.repo

make -j$(nproc --all) recoveryimage

