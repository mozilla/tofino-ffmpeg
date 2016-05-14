mkdir -p dist

copy ffmpeg\\%target_arch%\\*.dll dist
cd dist
7z a ..\ffmpeg-win32-%target_arch%.zip *
