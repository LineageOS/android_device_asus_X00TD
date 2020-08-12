#!/bin/bash
#
# Copyright (C) 2020 The LineageOS Project
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

    # Rename to fp service avoid conflicts
    vendor/etc/init/android.hardware.biometrics.fingerprint@2.1-service_asus.rc)
        sed -i 's|android.hardware.biometrics.fingerprint@2.1-service|android.hardware.biometrics.fingerprint@2.1-service_asus|g' "${2}"
        ;;

    # remove android.hidl.base dependency
    vendor/lib/hw/camera.sdm660.so)
        patchelf --remove-needed "android.hidl.base@1.0.so" "${2}"
        ;;

    esac
}

if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

# Required
export DEVICE=X00TD
export DEVICE_COMMON=sdm660-common
export VENDOR=asus

export DEVICE_BRINGUP_YEAR=2020

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
