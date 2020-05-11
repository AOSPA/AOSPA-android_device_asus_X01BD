#
# Copyright 2020 The Paranoid Android Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/asus/X01BD/X01BD-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-pa

PRODUCT_TARGET_VNDK_VERSION := 29

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-service \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.soundtrigger@2.1-impl \
    android.hardware.audio@4.0 \
    android.hardware.audio.common@4.0 \
    android.hardware.audio.common@4.0-util \
    android.hardware.audio@4.0-impl \
    android.hardware.audio.effect@4.0 \
    android.hardware.audio.effect@4.0-impl \
    audio.primary.sdm660

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_platform_info.xml

# Bluetooth
PRODUCT_PACKAGES += \
    libbluetooth_qti \
    libbt-logClient.so

# Custom init
PRODUCT_PACKAGES += \
    init.qcom.rc

# Display
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libqdMetaData.system

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

PRODUCT_BOOT_JARS += \
    qcom.fmradio

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gestures.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gestures.kl

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0 \
    android.hardware.nfc@1.1 \
    android.hardware.nfc@1.2 \
    android.hardware.secure_element@1.0 \
    com.android.nfc_extras \
    Tag \
    vendor.nxp.nxpese@1.0 \
    vendor.nxp.nxpnfc@1.0

# ParanoidDoze
PRODUCT_PACKAGES += \
    ParanoidDoze

# Perf
PRODUCT_PACKAGES += \
    $(LOCAL_PATH)/configs/perfconfigstore.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/perf/perfconfigstore.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:system/etc/permissions/privapp-permissions-qti.xml

# QTI Common
TARGET_COMMON_QTI_COMPONENTS := \
    av \
    bt \
    perf \
    telephony

# USB
PRODUCT_PACKAGES += \
	android.hardware.usb@1.0-service.x01bd

# WFD
PRODUCT_PACKAGES += \
    libaacwrapper \
    libnl \
    libwfdaac

PRODUCT_BOOT_JARS += \
    WfdCommon
