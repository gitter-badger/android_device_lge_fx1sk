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

# Inherit from msm8960-common (Disabled)
#$(call inherit-product, device/lge/msm8960-common/msm8960.mk)

## MSM8960

# Media config
PRODUCT_COPY_FILES += \
    device/lge/msm8960-common/configs/media_codecs.xml:system/etc/media_codecs.xml

# apn config
PRODUCT_COPY_FILES += \
    device/lge/msm8960-common/configs/apns-conf.xml:/system/etc/apns-conf.xml

# Sound configs
PRODUCT_COPY_FILES += \
    device/lge/msm8960-common/configs/audio_policy.conf:system/etc/audio_policy.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardwardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# Audio
PRODUCT_PACKAGES += \
    audio_policy.msm8960 \
    audio.primary.msm8960 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libalsa-intf \
    libaudioutils

# Graphics
# copybit.msm8960 is an error
PRODUCT_PACKAGES += \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    memtrack.msm8960 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libQcomUI \
    libtilerenderer

# NFC

# Commands to migrate prefs from com.android.nfc3 to com.android.nfc
PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt)

# NFC EXTRAS add-on API
PRODUCT_PACKAGES += \
    com.android.nfc_extras
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

PRODUCT_PACKAGES += \
    nfc.msm8960 \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag

# OMX
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libstagefrighthw

# HDMI
PRODUCT_PACKAGES += \
    hdmid

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs