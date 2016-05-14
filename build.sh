cd ffmpeg
../gyp/gyp -f make -I ../config.gypi -D target_arch=x64 --depth=. ffmpeg.gyp
make
