Please consult the documentation [here](https://github.com/Microsoft/cpprestsdk/wiki/How-to-build-for-iOS) for iOS compilation.

cmake commandline options for iOS
cmake -GXcode -DIOS=1 -DCMAKE_OSX_ARCHITECTURES="x86_64 i386 armv7 armv7s arm64" ../Release
xcodebuild -sdk iphoneos10.2

This will build a fat archive targetting armv7, armv7s and arm64
