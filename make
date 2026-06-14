#!/bin/env bash
gradle assembleDebug  |& $P/bin/ack -i error -A3 -m1 ||  share ./app/build/outputs/apk/debug/*debug.apk
apk=app/build/outputs/apk/debug/app-debug.apk
chmod 400 $apk
CLASSPATH=$apk  app_process -Xnoimage-dex2oat / com.termux.termuxam.Am
