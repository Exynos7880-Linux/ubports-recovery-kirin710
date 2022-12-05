#!/bin/bash
source hadk.env
cd $ANDROID_ROOT

./hybris-patches/apply-patches.sh --mb

source build/envsetup.sh 2>&1
#lunch $DEVICE
breakfast $DEVICE

echo "clean .repo folder"
rm -rf $ANDROID_ROOT/.repo

make -j$(nproc --all) recoveryramdisk
