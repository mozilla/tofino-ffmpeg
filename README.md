The `ffmpeg` directory contains a copy of chromium's (ffmpeg source)[https://chromium.googlesource.com/chromium/third_party/ffmpeg]
with the source code for unused codecs removed. The update.sh script automates
this by downloading the latest code specified in FFMPEG_REVISION and then
removing the files that we know are unnecessary in our build configuration.

Find this revision for FFMPEG_REVISION with the following steps:

Find the libchromiumcontent revision for the version of electron you are
building: https://github.com/mozilla/tofino-electron/blob/tofino/script/lib/config.py#L11

Find the chromium version that that uses: https://github.com/electron/libchromiumcontent/blob/<revision>/VERSION

Find the chromium ffmpeg revision from that: https://chromium.googlesource.com/chromium/src/+/<version>/DEPS#82

`patch` makes some minor modifications to the ffmpeg source, mainly adjusting
the build files to work without the rest of the chromium source.

The `tools` directory contains some other sources from the chromium tree that
are needed for building.
