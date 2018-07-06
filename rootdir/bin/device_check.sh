#!/sbin/sh
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

if ! grep "nfc" /persist/manifest.xml
	then
    # Remove NFC
    rm -rf /system/app/*Nfc*
    rm -rf /system/etc/permissions/*nfc*
    rm -rf /system/framework/*nfc*
    rm -rf /system/lib/*nfc*
    rm -rf /system/lib64/*nfc*
    rm -rf /system/priv-app/Tag
    rm -rf /vendor/app/SmartcardService
    rm -rf /vendor/bin/*nfc*
    rm -rf /vendor/bin/hw/*nfc*
    rm -rf /vendor/etc/*nfc*
    rm -rf /vendor/etc/init/*nfc*
    rm -rf /vendor/etc/permissions/*nfc*
    rm -rf /vendor/firmware/libpn553_fw.so
    rm -rf /vendor/lib/*nfc*
    rm -rf /vendor/lib/hw/*nfc*
    rm -rf /vendor/lib64/*nfc*
    rm -rf /vendor/lib64/hw/*nfc*
    # Use Non NFC manifest
    rm -rf /vendor/manifest.xml
    mv -f /vendor/manifest_no_nfc.xml /vendor/manifest.xml
fi

