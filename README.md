# Optimus LTE3 Device Tree
#### 빌드 요구사항
1. Optimus LTE3 Android 4.4.2 Kernel Source
2. Optimus LTE3 Device Tree (지금 이 저장소)
3. Optimus LTE3 Vendor

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
  - [ ] 결과물이 완전히 엉망인것을 Fix (Emulator 전용이라는 등등)
- [ ] TWRP 와 같이 빌드