#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/lamu
KERNEL_PATH := $(DEVICE_PATH)-kernel

# Partitions
BOARD_SUPER_PARTITION_SIZE := 8589934592

# Inherit from common tree
include device/motorola/mt6768-common/BoardConfigCommon.mk

# Display
TARGET_SCREEN_DENSITY := 400

# Kernel
BOARD_SYSTEM_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/system_dlkm.modules.load))
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/vendor_dlkm.modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/vendor_ramdisk.modules.load))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/vendor_ramdisk.modules.load.recovery))

TARGET_PREBUILT_KERNEL := $(KERNEL_PATH)/$(BOARD_KERNEL_IMAGE_NAME)
TARGET_BOARD_KERNEL_HEADERS := $(KERNEL_PATH)/kernel-headers
BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PATH)/dtb

ALL_VENDOR_RAMDISK_MODULES := $(sort $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD) $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD))
BOARD_KERNEL_MODULE_DIR := $(KERNEL_PATH)/modules
BOARD_SYSTEM_KERNEL_MODULES := $(addprefix $(BOARD_KERNEL_MODULE_DIR)/,$(BOARD_SYSTEM_KERNEL_MODULES_LOAD))
BOARD_VENDOR_KERNEL_MODULES := $(addprefix $(BOARD_KERNEL_MODULE_DIR)/,$(BOARD_VENDOR_KERNEL_MODULES_LOAD))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(addprefix $(BOARD_KERNEL_MODULE_DIR)/,$(ALL_VENDOR_RAMDISK_MODULES))

BOARD_VENDOR_KERNEL_MODULES += \
    $(KERNEL_PATH)/modules/gps_drv_stp.ko \
    $(KERNEL_PATH)/modules/wlan_drv_gen4m_6768.ko \
    $(KERNEL_PATH)/modules/wmt_chrdev_wifi.ko \
    $(KERNEL_PATH)/modules/wmt_drv.ko

# Recovery
TARGET_RECOVERY_DENSITY := xhdpi

# Inherit the proprietary files
include vendor/motorola/lamu/BoardConfigVendor.mk
