cd ffmpeg
../gyp/gyp -f make -I ../config.gypi -D target_arch=x64 -G output_dir=. --depth=. ffmpeg.gyp
#make
