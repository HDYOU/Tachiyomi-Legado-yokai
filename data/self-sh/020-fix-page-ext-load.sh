#!/usr/bin/env bash

# 出错退出
# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo "fix ext load ...."


t_file="app/build.gradle.kts"
sed -i '/dependencies {/a \    implementation("io.arrow-kt:arrow-stack:1.2.4")' $t_file
sed -i '/dependencies {/a \    implementation("io.arrow-kt:arrow-fx-coroutines:1.2.4")' $t_file

echo ""
echo ""
cat -n $t_file
echo ""

t_file="app/src/main/java/eu/kanade/tachiyomi/extension/util/ExtensionLoader.kt"
if test -f $t_file ; then

 match=`grep "arrow.fx.coroutines.parMapNotNull" $t_file`
 if [ -z "$match" ]; then
  sed -i '/import android.content.pm.PackageInfo/a \import arrow.fx.coroutines.parMapNotNull' $t_file
  sed -i 's/mapNotNull/parMapNotNull/g' $t_file
  echo "fix succ."
 fi
 echo ""
 echo ""
 cat -n $t_file
 echo ""
fi
exit 0