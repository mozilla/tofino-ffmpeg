#! /bin/sh

lcc=`cat LCC_REVISION`

cv=`curl -fsSL https://raw.githubusercontent.com/electron/libchromiumcontent/${lcc}/VERSION`

REVISION=`curl -fsSL https://chromium.googlesource.com/chromium/src/+/${cv}/DEPS \
  | grep "ffmpeg.git" | sed -e s/.*ffmpeg\\.git@// -e s/\&#39\;.*//`

echo ${REVISION} >FFMPEG_REVISION

rm -rf ffmpeg
mkdir ffmpeg
git checkout -- ffmpeg/README.mozilla
cd ffmpeg
curl -L https://chromium.googlesource.com/chromium/third_party/ffmpeg/+archive/${REVISION}.tar.gz | \
  tar xz --exclude=libavdevice --exclude=libavfilter --exclude=libavresample --exclude=libpostproc \
         --exclude=libswscale --exclude=doc --exclude=presets --exclude=tools \
         --exclude=tests --exclude="*/aarch64/*" --exclude="*/alpha/*" --exclude="*/arm/*" \
         --exclude="*/avr32/*" --exclude="*/mips/*" --exclude="*/neon/*" --exclude="*/ppc/*" \
         --exclude="*/sparc/*" --exclude="*/bfin/*" --exclude="*/sh4/*" --exclude="*/tomi/*" \
         --exclude="chromium/config/Chrome" --exclude="chromium/config/ChromeOS" \
         --exclude="chromium/config/ChromiumOS"

patch -p1 <../patch

# Remove any source files that we don't want
git clean -f -X

# git clean doesn't handle directories with untracked files so well
rm -rf libswresample/aarch64 libswresample/arm libswresample/x86
rm -f ffmpeg/*.c ffmpeg/*.h ffmpeg/*.gni

# Clean up empty directories
find . -type d -empty -delete
