Steps to build cpprestsdk for android

1. create a symbolic link for boost library, currently it is as follows:
Build_android/boost

lrwxr-xr-x  1 xuesong  staff    55B Feb 13 15:14 Build_android/boost -> /Users/xuesong/android/crystax-ndk/sources/boost/1.59.0

under Build_android folder, and create a symbolic link for openssl libraries.
Currently, it is under Build_android/openssl folder.
Build_android/openssl/armeabi-v7a

lrwxr-xr-x  1 xuesong  staff   105B Feb 13 15:19 Build_android/openssl/armeabi-v7a -> /Users/xuesong/Documents/Personal/programming/ALLI Enterprises/vault-deps/prebuilt/android/19/armeabi-v7a

2. create a build folder under Build_android: bld-android-armv7a

3. cmake command:
build shared library:
cmake -DCMAKE_TOOLCHAIN_FILE=../crystax.toolchain.cmake -DANDROID_ABI="armeabi-v7a with NEON" -DANDROID_NDK=~/android/crystax-ndk -DANDROID_TOOLCHAIN_VERSION=4.9 -DARM=1 -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON ../../Release

build static library:
cmake -DCMAKE_TOOLCHAIN_FILE=../crystax.toolchain.cmake -DANDROID_ABI="armeabi-v7a with NEON" -DANDROID_NDK=~/android/crystax-ndk -DANDROID_TOOLCHAIN_VERSION=4.9 -DARM=1 -DCMAKE_BUILD_TYPE=Release ../../Release
