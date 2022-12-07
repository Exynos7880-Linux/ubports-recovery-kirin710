#!/bin/bash
source hadk_a7.env
cd $ANDROID_ROOT

sed -i '10d' device/samsung/universal7880-common/ramdisk/fstab.samsungexynos7880
sed -i '4d' device/samsung/universal7880-common/twrp/twrp.fstab

./hybris-patches/apply-patches.sh --mb

source build/envsetup.sh 2>&1
#lunch $DEVICE
breakfast $DEVICE

echo "clean .repo folder"
rm -rf $ANDROID_ROOT/.repo

make -j$(nproc --all) recoveryimage
