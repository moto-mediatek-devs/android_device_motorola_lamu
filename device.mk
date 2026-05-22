#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from common tree
$(call inherit-product, device/motorola/mt6768-common/mt6768.mk)

# Inherit the proprietary files
$(call inherit-product, vendor/motorola/lamu/lamu-vendor.mk)
