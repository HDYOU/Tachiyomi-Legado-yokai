#!/usr/bin/env bash

# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo "test run-self-script ...."

# formatKotlin
test -f app/build.gradle.kts && sed -i 's/CrashlyticsPlugin/d' app/build.gradle.kts
test -f app/build.gradle.kts && sed -i 's/GoogleServicesPlugin/d' app/build.gradle.kts
test -f app/build.gradle.kts && sed -i 's/play.services.gcm/d' app/build.gradle.kts

exit 0