cd luajit-2.1/src/
source ~/.bash_profile
APP_PLATFORM=28
NDKVER=$NDK_ROOT/toolchains/llvm
NDKP=$NDKVER/prebuilt/darwin-x86_64/bin/aarch64-linux-android-
NDKF="--sysroot $NDKVER/prebuilt/darwin-x86_64/sysroot"
NDKARCH="-DLJ_ABI_SOFTFP=0 -DLJ_ARCH_HASFPU=1 -DLUAJIT_ENABLE_GC64=1"

make clean
make CC="clang" CROSS=$NDKP TARGET_SYS=Linux TARGET_FLAGS="$NDKF $NDKARCH"
cp ./libluajit.a ../../android/jni/libluajit.a
make clean

cd ../../android
ndk-build clean APP_ABI="arm64-v8a" APP_PLATFORM=android-28
ndk-build APP_ABI="arm64-v8a" APP_PLATFORM=android-28
cp libs/arm64-v8a/libtolua.so ../Plugins/Android/libs/arm64-v8a
ndk-build clean APP_ABI="arm64-v8a" APP_PLATFORM=android-28