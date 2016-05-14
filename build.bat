setlocal
cd ffmpeg
..\gyp\gyp -I ..\config.gypi -G msvs_version=2013 -D target_arch=x64 --depth=. ffmpeg.gyp
cd ..
msbuild ffmpeg.sln
