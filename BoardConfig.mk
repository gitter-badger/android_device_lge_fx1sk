# inherit from the proprietary version
-include vendor/lge/fx1sk/BoardConfigVendor.mk

# Inherit from MSM8960 common (Jellybean..)
# -include device/msm8960-common/BoardConfigCommon.mk

# CPU
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno225
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := fx1sk

# Init
TARGET_PROVIDES_INIT_RC := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# PMEM compatibility
# linux/android_pmem.h: No such file or directory
#BOARD_NEEDS_MEMORYHEAPPMEM := true

# Preload bootanimation
TARGET_BOOTANIMATION_PRELOAD := true

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=fx1sk user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 maxcpus=2 lpj=67741
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x00000100 --kernel_offset 0x00008000

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/fx1sk/Addon/bluetooth

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
USE_CAMERA_STUB := true

# Dex (Copied by One+)
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
DONT_DEXPREOPT_PREBUILTS := true

# Graphics
USE_OPENGL_RENDERER := true
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK -DQCOM_ROTATOR_KERNEL_FORMATS
TARGET_NO_HW_VSYNC := true
BOARD_USES_HWCOMPOSER := true
BOARD_USES_GENLOCK := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
TARGET_SF_BYPASS := true
TARGET_USES_OVERLAY := true
TARGET_HARDWARE_3D := true
TARGET_QCOM_HDMI_OUT := true
BOARD_EGL_CFG := device/lge/fx1sk/Addon/configs/egl.cfg

BOARD_USES_ADRENO_200 := true

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true
WEBCORE_INPAGE_VIDEO := true

# Partition
BOARD_BOOTIMAGE_PARTITION_SIZE := 12582912
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1798307840
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4404019200
BOARD_CACHEIMAGE_PARTITION_SIZE := 826277888
BOARD_PERSISTIMAGE_PARTITION_SIZE := 5127433
BOARD_FLASH_BLOCK_SIZE := 131072

# Kernel
TARGET_PREBUILT_KERNEL := device/lge/fx1sk/kernel

# Other
BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_VOLD_CRYPTFS_MIGRATE := true

# Audio
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
BOARD_USES_ALSA_AUDIO := true
TARGET_USES_ION_AUDIO := true

# JIT / Optimizations
WITH_DEXPREOPT := true
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/lge/fx1sk/Addon/overlay
TARGET_SPECIFIC_HEADER_PATH := device/lge/fx1sk/Addon/include