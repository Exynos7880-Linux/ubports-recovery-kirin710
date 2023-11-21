#!/bin/bash
source hadk.env
cd $ANDROID_ROOT

git clone https://github.com/Exynos7880-Linux/android_vendor_huawei_kirin710-9-common.git vendor/huawei/kirin710-9-common
git clone https://github.com/Exynos7880-Linux/android_vendor_huawei_kirin710.git vendor/huawei/kirin710
git clone https://github.com/Exynos7880-Linux/android_device_huawei_kirin710-9-common.git device/huawei/kirin710-9-common
git clone https://github.com/Exynos7880-Linux/android_device_huawei_kirin710.git device/huawei/kirin710
git clone https://github.com/Exynos7880-Linux/kernel_huawei_miami.git kernel/huawei/kirin710-9 --recurse-submodules
git clone https://github.com/Exynos7880-Linux/android_hardware_huawei.git hardware/huawei
#git clone https://github.com/Iceows/android_vendor_huawei_hi6250-9-common.git vendor/huawei/hi6250-9-common
git clone https://android.googlesource.com/platform/hardware/broadcom/wlan hardware/broadcom/wlan -b android10-release
git clone https://android.googlesource.com/platform/external/wpa_supplicant_8 external/wpa_supplicant_8 -b android10-release

./hybris-patches/apply-patches.sh --mb

source build/envsetup.sh 2>&1
export ALLOW_MISSING_DEPENDENCIES=true
#export KERNEL_MAKE_FLAGS="-j4 -O=2"
breakfast $DEVICE

echo "clean .repo folder"
rm -rf $ANDROID_ROOT/.repo

make -j$(nproc --all) recoveryimage

