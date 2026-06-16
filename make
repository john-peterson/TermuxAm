#!/bin/env bash
# set -x
set -e
# set -o pipefail
apk=app/build/outputs/apk/debug/app-debug.apk
chmod 644 $apk
gradle assembleDebug  |& ack -i error -A3 -m1 && false
# false | ack abc
# echo abc | ack abc && false
# echo 123
chmod 400 $apk
CLASSPATH=$apk  app_process -Xnoimage-dex2oat / com.termux.termuxam.Am
