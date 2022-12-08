#!/bin/bash
source hadk.env
cd $ANDROID_ROOT

./hybris-patches/apply-patches.sh --mb

source build/envsetup.sh 2>&1
#lunch $DEVICE
breakfast $DEVICE

sed -i '10d' ~/halium/device/samsung/universal7880-common/ramdisk/fstab.samsungexynos7880
sed -i '4d' ~/halium/device/samsung/universal7880-common/twrp/twrp.fstab

echo "clean .repo folder"
rm -rf $ANDROID_ROOT/.repo

make -j$(nproc --all) recoveryimage

