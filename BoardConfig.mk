#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/lamu

# Partitions
BOARD_SUPER_PARTITION_SIZE := 8589934592

# Inherit from common tree
include device/motorola/mt6768-common/BoardConfigCommon.mk

# Inherit the proprietary files
include vendor/motorola/lamu/BoardConfigVendor.mk
