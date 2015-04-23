# Optimus LTE3 Device Tree
#### 빌드 요구사항
1. Optimus LTE3 Android 4.4.2 Kernel Source
2. Optimus LTE3 Device Tree (지금 이 저장소)

#### 진행중
- [x] 빌드 가능
- [ ] 부팅 가능

#### 다음 목표

- [x] Qualcomm display-caf library 에러 Fix
  - [x] 주석처리 헤제
- [x] Qualcomm audio-caf library 에러 Fix
  - [x] 주석처리 헤제
- [x] Qualcomm media-caf library 에러 Fix
  - [x] alsa_mixer library 에러 Fix
  - [x] 주석처리 헤제
- [x] Kernel 빌드 오류 Fix [Build Hack]
  - [x] audio_defs.h: No such file or directory [Build Hack]
- [ ] Build Hack 으로 빌드해야만 하는 문제점 Fix
- [x] init.rc 파일이 생성되지 않는 문제 Fix
- [ ] init.recovery.*.rc 파일이 생성되지 않는 문제 Fix
- [ ] 여전히 커널 빌드에 문제가 있는 것을 Fix
- [ ] Philz Recovery 와 같이 빌드

#### LTE 관련 로그오류
```
frameworks/opt/telephony/../../../device/lge/fx1sk/Addon/ril/telephony/java/com/android/internal/telephony/LgeLteRIL.java:73: error: cannot find symbol
        mSetPreferredNetworkType = -1;
        ^
  symbol:   variable mSetPreferredNetworkType
  location: class LgeLteRIL
frameworks/opt/telephony/../../../device/lge/fx1sk/Addon/ril/telephony/java/com/android/internal/telephony/LgeLteRIL.java:224: error: cannot find symbol
            mSetPreferredNetworkType = mPreferredNetworkType;
            ^
  symbol:   variable mSetPreferredNetworkType
  location: class LgeLteRIL
frameworks/opt/telephony/../../../device/lge/fx1sk/Addon/ril/telephony/java/com/android/internal/telephony/LgeLteRIL.java:353: error: cannot find symbol
        if (RILJ_LOGD) riljLog("setCurrentPreferredNetworkType: " + mSetPreferredNetworkType);
                                                                    ^
  symbol:   variable mSetPreferredNetworkType
  location: class LgeLteRIL
frameworks/opt/telephony/../../../device/lge/fx1sk/Addon/ril/telephony/java/com/android/internal/telephony/LgeLteRIL.java:354: error: cannot find symbol
        setPreferredNetworkType(mSetPreferredNetworkType, null);
                                ^
  symbol:   variable mSetPreferredNetworkType
  location: class LgeLteRIL
frameworks/opt/telephony/../../../device/lge/fx1sk/Addon/ril/telephony/java/com/android/internal/telephony/LgeLteRIL.java:351: error: method does not override or implement a method from a supertype
    @Override
    ^
frameworks/opt/telephony/../../../device/lge/fx1sk/Addon/ril/telephony/java/com/android/internal/telephony/LgeLteRIL.java:363: error: cannot find symbol
                 mSetPreferredNetworkType >= RILConstants.NETWORK_MODE_WCDMA_PREF) {
                 ^
  symbol:   variable mSetPreferredNetworkType
  location: class LgeLteRIL
frameworks/opt/telephony/../../../device/lge/fx1sk/Addon/ril/telephony/java/com/android/internal/telephony/LgeLteRIL.java:366: error: cannot find symbol
        mSetPreferredNetworkType = networkType;
        ^
  symbol:   variable mSetPreferredNetworkType
  location: class LgeLteRIL
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
7 errors
build/core/java.mk:346: recipe for target '/home/cloud9350/android/cm/out/target/common/obj/JAVA_LIBRARIES/telephony-common_intermediates/classes-full-debug.jar' failed
make: *** [/home/cloud9350/android/cm/out/target/common/obj/JAVA_LIBRARIES/telephony-common_intermediates/classes-full-debug.jar] Error 41
make: *** 끝나지 않은 작업을 기다리고 있습니다....
```