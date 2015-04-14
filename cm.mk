## Specify phone tech before including full_phone
# Not working
# $(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := fx1sk

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lge/fx1sk/device_fx1sk.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := fx1sk
PRODUCT_NAME := cm_fx1sk
PRODUCT_BRAND := lge
PRODUCT_MODEL := fx1sk
PRODUCT_MANUFACTURER := lge
