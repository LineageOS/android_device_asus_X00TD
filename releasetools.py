# Copyright (C) 2009 The Android Open Source Project
# Copyright (c) 2011, The Linux Foundation. All rights reserved.
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

import hashlib
import common
import re

def FullOTA_InstallEnd(info):
  info.script.AppendExtra('ifelse(is_mounted("/system"), unmount("/system"));');
  info.script.AppendExtra('ifelse(is_mounted("/vendor"), unmount("/vendor"));');
  info.script.AppendExtra('ifelse(is_mounted("/persist"), unmount("/persist"));');
  info.script.Mount("/system")
  info.script.Mount("/vendor")
  info.script.Mount("/persist")
  RunCustomScript(info, "device_check.sh", "")
  info.script.Unmount("/system")
  info.script.Unmount("/vendor")
  info.script.Unmount("/persist")
  return

def RunCustomScript(info, name, arg):
  info.script.AppendExtra(('run_program("/tmp/install/bin/%s", "%s");' % (name, arg)))
  return
