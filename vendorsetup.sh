#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="a55x"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

# Version & Variant
export FOX_BUILD_TYPE="Unofficial"
export USE_CCACHE="1"
export TARGET_ARCH="arm64"
export FOX_VANILLA_BUILD="1"
export OF_MAINTAINER="Kevios12"
export LC_ALL="C"

# OrangeFox Addons
export FOX_ENABLE_APP_MANAGER="1"

# Binaries & Tools
export FOX_REPLACE_TOOLBOX_GETPROP="1"
export FOX_USE_BASH_SHELL="1"
export FOX_ASH_IS_BASH="1"
export FOX_USE_NANO_EDITOR="1"
export FOX_USE_TAR_BINARY="1"
export FOX_USE_SED_BINARY="1"
export FOX_USE_XZ_UTILS="1"

# Compression & Binary
export OF_USE_LZ4_COMPRESSION="1"
export FOX_USE_LZ4_BINARY="1"
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES="1"
export OF_USE_NEW_MAGISKBOOT="1"

# OrangeFox Device Properties
export FOX_AB_DEVICE="1"
export OF_DEVICE_WITHOUT_PERSIST="1"

# Others
export OF_ALLOW_DISABLE_NAVBAR=0
export OF_NO_TREBLE_COMPATIBILITY_CHECK="1"
export OF_DISABLE_MIUI_SPECIFIC_FEATURES="1"
export OF_SCREEN_H="2340"
export OF_STATUS_INDENT_LEFT="64"
export OF_STATUS_INDENT_RIGHT="64"
export OF_HIDE_NOTCH="1"
export OF_CLOCK_POS=1
export OF_USE_GREEN_LED="0"

# Flashlight
export OF_FL_PATH1="/tmp/flashlight"

# Decrypt/Encrypt
export OF_SKIP_FBE_DECRYPTION="1"
export OF_DONT_PATCH_ENCRYPTED_DEVICE="1"

	lunch twrp_$FDEVICE-eng
	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
