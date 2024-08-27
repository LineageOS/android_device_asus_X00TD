#!/bin/bash
#
# SPDX-FileCopyrightText: 2016 The CyanogenMod Project
# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        product/etc/permissions/qti_fingerprint_interface.xml)
            [ "$2" = "" ] && return 0
            sed -i 's|/system/framework/|/system/product/framework/|g' "${2}"
            ;;
        vendor/etc/init/android.hardware.biometrics.fingerprint@2.1-service_asus.rc)
            [ "$2" = "" ] && return 0
            sed -i 's|android.hardware.biometrics.fingerprint@2.1-service|android.hardware.biometrics.fingerprint@2.1-service_asus|g' "${2}"
            ;;
        vendor/lib/hw/camera.sdm660.so)
            [ "$2" = "" ] && return 0
            "${PATCHELF}" --remove-needed "android.hidl.base@1.0.so" "${2}"
            ;;
        vendor/lib64/libvendor.goodix.hardware.fingerprint@1.0.so | vendor/lib64/libvendor.goodix.hardware.fingerprint@1.0-service.so)
            [ "$2" = "" ] && return 0
            grep -q "libhidlbase-v32.so" "${2}" || "${PATCHELF}" --replace-needed "libhidlbase.so" "libhidlbase-v32.so" "${2}"
            ;;
        *)
            return 1
            ;;
    esac

    return 0
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=X00TD
export DEVICE_COMMON=sdm660-common
export VENDOR=asus
export VENDOR_COMMON=${VENDOR}

"./../../${VENDOR_COMMON}/${DEVICE_COMMON}/extract-files.sh" "$@"
