/*
   Copyright (c) 2015, The Linux Foundation. All rights reserved.
   Copyright (C) 2016 The CyanogenMod Project.
   Copyright (C) 2018 The LineageOS Project

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <cstdio>

#include <android-base/file.h>
#include <android-base/properties.h>
#include <android-base/strings.h>

#include <sys/sysinfo.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "property_service.h"
#include "vendor_init.h"

using android::base::GetProperty;
using android::base::ReadFileToString;
using android::base::Trim;
using android::init::property_set;

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void property_override_dual(char const system_prop[], char const vendor_prop[], char const value[])
{
    property_override(system_prop, value);
    property_override(vendor_prop, value);
}

void property_override_triple(char const system_prop[], char const vendor_prop[], char const bootimg_prop[], char const value[])
{
    property_override(system_prop, value);
    property_override(vendor_prop, value);
    property_override(bootimg_prop, value);
}

void vendor_check_variant()
{
    struct sysinfo sys;
    char const *region_file = "/persist/flag/countrycode.txt";
    char const *build_fingerprint, *product_device, *product_model, *product_name;
    std::string region;

    sysinfo(&sys);

    // Make sure the region value is trimmed first
    if (ReadFileToString(region_file, &region))
        region = Trim(region);

    // Russian model has a slightly different product name
    if (region == "RU")
        product_name = "RU_X00TD";
    else
        product_name = "WW_X00TD";

    // 6 GB variant
    if (sys.totalram > 4096ull * 1024 * 1024) {
        // Russian model
        if (region == "RU") {
            build_fingerprint = "asus/RU_X00TD/ASUS_X00T_9:8.1.0/OPM1/15.2016.1805.318-20180712:user/release-keys";
            product_device = "ASUS_X00T_9";

        // Global model
        } else {
            build_fingerprint = "asus/WW_X00TD/ASUS_X00T_3:8.1.0/OPM1/15.2016.1805.318-20180712:user/release-keys";
            product_device = "ASUS_X00T_3";
        }

    // 3/4 GB variants
    } else {
        // Russian model
        if (region == "RU") {
            build_fingerprint = "asus/RU_X00TD/ASUS_X00T_6:8.1.0/OPM1/15.2016.1805.318-20180712:user/release-keys";
            product_device = "ASUS_X00T_6";

        // Global model
        } else {
            build_fingerprint = "asus/WW_X00TD/ASUS_X00T_2:8.1.0/OPM1/15.2016.1805.318-20180712:user/release-keys";
            product_device = "ASUS_X00T_2";
        }
    }

    // Product model overrides
    if (region == "RU" || region == "TW" ||
        (region == "PH" && sys.totalram > 3072ull * 1024 * 1024))
        product_model = "ASUS_X00TDB";
    else if (sys.totalram < 3072ull * 1024 * 1024)
        product_model = "ASUS_X00TDA";

    // Override props based on values set
    property_override_dual("ro.product.device", "ro.vendor.product.device", product_device);
    property_override_dual("ro.product.model", "ro.vendor.product.model", product_model);
    property_override_dual("ro.product.name", "ro.vendor.product.name", product_name);
    property_override_triple("ro.build.fingerprint", "ro.vendor.build.fingerprint", "ro.bootimage.build.fingerprint", build_fingerprint);

    // Set region code via ro.config.versatility prop
    property_set("ro.config.versatility", region);
}

void vendor_load_properties()
{
    vendor_check_variant();
}
