Steps to build cpprestsdk for android

1. create a symbolic link for boost library, currently it is as follows:
under Build_android folder, and create a symbolic link for openssl libraries.
Currently, it is under Build_android/openssl folder.

2. create a build folder under Build_android: bld-android-armv7a

3. cmake command:
build shared library:
cmake -DCMAKE_TOOLCHAIN_FILE=../crystax.toolchain.cmake -DANDROID_ABI="armeabi-v7a with NEON" -DANDROID_NDK=~/android/crystax-ndk -DANDROID_TOOLCHAIN_VERSION=4.9 -DARM=1 -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON ../../Release

build static library:
cmake -DCMAKE_TOOLCHAIN_FILE=../crystax.toolchain.cmake -DANDROID_ABI="armeabi-v7a with NEON" -DANDROID_NDK=~/android/crystax-ndk -DANDROID_TOOLCHAIN_VERSION=4.9 -DARM=1 -DCMAKE_BUILD_TYPE=Release ../../Release
