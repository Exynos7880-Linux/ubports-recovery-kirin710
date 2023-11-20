#!/bin/bash
source hadk.env
cd $ANDROID_ROOT

git clone https://github.com/Exynos7880-Linux/android_vendor_huawei_kirin710-9-common.git vendor/huawei/kirin710-9-common
git clone https://github.com/Exynos7880-Linux/android_vendor_huawei_kirin710.git vendor/huawei/kirin710
git clone https://github.com/Exynos7880-Linux/android_device_huawei_kirin710-9-common.git device/huawei/kirin710-9-common
git clone https://github.com/Exynos7880-Linux/android_device_huawei_kirin710.git device/huawei/kirin710
git clone https://github.com/Exynos7880-Linux/kernel_huawei_miami.git kernel/huawei/kirin710-9
git clone https://github.com/Bakoubak/android_hardware_huawei.git hardware/huawei

./hybris-patches/apply-patches.sh --mb

source build/envsetup.sh 2>&1
export ALLOW_MISSING_DEPENDENCIES=true
#export KERNEL_MAKE_FLAGS="-j4 -O=2"
breakfast $DEVICE

echo "clean .repo folder"
rm -rf $ANDROID_ROOT/.repo

make -j$(nproc --all) recoveryimage

