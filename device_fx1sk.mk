$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/fx1sk/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/fx1sk/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_fx1sk
PRODUCT_DEVICE := fx1sk

## Customize

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/Addon/audio/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/Addon/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/Addon/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# NFC packages
PRODUCT_PACKAGES += \
    nfc.msm8960 \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    $(LOCAL_PATH)/Addon/nfc/nfcee_access.xml:system/etc/nfcee_access.xml \
    $(LOCAL_PATH)/Addon/nfc/nfcee_access_debug.xml:system/etc/nfcee_access_debug.xml \
    $(LOCAL_PATH)/Addon/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf


# Boot Animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_LOCALES += ko_KR xhdpi

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config (Disabled)
# $(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# call vendor
$(call inherit-product-if-exists, vendor/lge/fx1sk/fx1sk-vendor.mk)

# Inherit from msm8960-common
$(call inherit-product, device/lge/msm8960-common/msm8960.mk)
