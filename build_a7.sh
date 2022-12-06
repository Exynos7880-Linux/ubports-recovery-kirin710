#!/bin/bash
source hadk_a7.env
cd $ANDROID_ROOT

sed -i '/^[^#]/ s/\(^.*CACHE.*$\)/#\ \1/' device/samsung/universal7880-common/ramdisk/fstab.samsungexynos7880

./hybris-patches/apply-patches.sh --mb

source build/envsetup.sh 2>&1
#lunch $DEVICE
breakfast $DEVICE

echo "clean .repo folder"
rm -rf $ANDROID_ROOT/.repo

make -j$(nproc --all) recoveryimage

