#!/bin/bash
source hadk.env
cd $ANDROID_ROOT

./hybris-patches/apply-patches.sh --mb

source build/envsetup.sh 2>&1
export ALLOW_MISSING_DEPENDENCIES=true
lunch omni_$DEVICE-eng

echo "clean .repo folder"
rm -rf $ANDROID_ROOT/.repo

make -j$(nproc --all) recoveryimage

