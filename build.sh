#!/bin/bash
source hadk.env
cd $ANDROID_ROOT

sed -i '/^[^#]/ s/\(^.*CACHE.*$\)/#\ \1/' device/samsung/universal7880-common/ramdisk/fstab.samsungexynos7880

./hybris-patches/apply-patches.sh --mb

source build/envsetup.sh 2>&1
#lunch $DEVICE
breakfast $DEVICE

echo "clean .repo folder"
rm -rf $ANDROID_ROOT/.repo

make -j$(nproc --all) recoveryimage

git clone -b lineage-17.1 https://github.com/LineageOS/android_device_samsung_a7y17lte.git device/samsung/a7y17lte
breakfast a7y17lte
make -j$(nproc --all) recoveryimage
