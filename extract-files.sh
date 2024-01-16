#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.

function blob_fixup() {
    case "${1}" in

    # Fix jar path
    product/etc/permissions/qti_fingerprint_interface.xml)
        sed -i 's|/system/framework/|/system/product/framework/|g' "${2}"
        ;;

    # remove android.hidl.base dependency
    vendor/lib/hw/camera.sdm660.so)
        "${PATCHELF}" --remove-needed "android.hidl.base@1.0.so" "${2}"
        ;;

    # fingerprint: use libhidlbase-v32 for goodix
    vendor/lib64/libvendor.goodix.hardware.fingerprint@1.0.so | vendor/lib64/libvendor.goodix.hardware.fingerprint@1.0-service.so)
        grep -q "libhidlbase-v32.so" "${2}" || "${PATCHELF}" --replace-needed "libhidlbase.so" "libhidlbase-v32.so" "${2}"
        ;;

    esac
}

if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=X00TD
export DEVICE_COMMON=sdm660-common
export VENDOR=asus

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
