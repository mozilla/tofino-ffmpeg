The `ffmpeg` directory contains a copy of chromium's (ffmpeg source)[https://chromium.googlesource.com/chromium/third_party/ffmpeg]
with proprietary code removed. The update.sh script automates updating this.
Part of the update process includes removing all source files that aren't
necessary for the build configuration we use.

You must set the revision to update to in FFMPEG_REVISION. Find this revision
with the following steps:

Find the libchromiumcontent revision for the version of electron you are
building: https://github.com/mozilla/tofino-electron/blob/tofino/script/lib/config.py#L11

Find the chromium version that that uses: https://github.com/electron/libchromiumcontent/blob/<revision>/VERSION

Find the chromium ffmpeg revision from that: https://chromium.googlesource.com/chromium/src/+/<version>/DEPS#82

`patch` makes some minor modifications to the ffmpeg source, mainly adjusting
the build files to work without the rest of the chromium source.

The `tools` directory contains some other sources from the chromium tree that
are needed for building.
