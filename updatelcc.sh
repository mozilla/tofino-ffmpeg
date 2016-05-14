#! /bin/sh

lcc=`curl -fsSL https://raw.githubusercontent.com/mozilla/tofino-electron/tofino/script/lib/config.py \
  | grep "LIBCHROMIUMCONTENT_COMMIT" | sed -e s/[^\']*\'// -e s/\'.*//`

echo ${lcc} >LCC_REVISION
