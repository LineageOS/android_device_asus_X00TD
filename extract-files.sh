#!/bin/bash
#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

DEVICE=X00TD
VENDOR=asus

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

LINEAGE_ROOT="$MY_DIR"/../../..

HELPER="$LINEAGE_ROOT"/vendor/lineage/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

while [ "$1" != "" ]; do
    case $1 in
        -n | --no-cleanup )     CLEAN_VENDOR=false
                                ;;
        -s | --section )        shift
                                SECTION=$1
                                CLEAN_VENDOR=false
                                ;;
        * )                     SRC=$1
                                ;;
    esac
    shift
done

if [ -z "$SRC" ]; then
    SRC=adb
fi

# Initialize the helper
setup_vendor "$DEVICE" "$VENDOR" "$LINEAGE_ROOT" false "$CLEAN_VENDOR"

extract "$MY_DIR"/proprietary-files.txt "$SRC" "$SECTION"
extract "$MY_DIR"/proprietary-files-twrp.txt "$SRC" "$SECTION"

BLOB_ROOT="$LINEAGE_ROOT"/vendor/"$VENDOR"/"$DEVICE"/proprietary

TWRP_QSEECOMD="$BLOB_ROOT"/recovery/root/sbin/qseecomd
TWRP_GATEKEEPER="$BLOB_ROOT"/recovery/root/sbin/android.hardware.gatekeeper@1.0-service-qti
TWRP_KEYMASTER="$BLOB_ROOT"/recovery/root/sbin/android.hardware.keymaster@3.0-service-qti

sed -i "s|/system/bin/linker64|/sbin/linker64\x0\x0\x0\x0\x0\x0|g" "$TWRP_QSEECOMD"
sed -i "s|/system/bin/linker64|/sbin/linker64\x0\x0\x0\x0\x0\x0|g" "$TWRP_GATEKEEPER"
sed -i "s|/system/bin/linker64|/sbin/linker64\x0\x0\x0\x0\x0\x0|g" "$TWRP_KEYMASTER"

IMSCMSERVICE="$BLOB_ROOT"/vendor/etc/permissions/com.qualcomm.qti.imscmservice.xml
IMSCMSERVICE_1_1="$BLOB_ROOT"/vendor/etc/permissions/com.qualcomm.qti.imscmservice_1_1.xml

sed -i "s|/system/framework/|/vendor/framework/|g" "$IMSCMSERVICE"
sed -i "s|/system/framework/|/vendor/framework/|g" "$IMSCMSERVICE_1_1"

. "$MY_DIR"/setup-makefiles.sh
