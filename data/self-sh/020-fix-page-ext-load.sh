# #!/usr/bin/env bash

# # 出错退出
# # 出错退出
# # set -e

# export HOME="$(cd "`dirname "$0"`"/..; pwd)"

# echo "fix ext load ...."


# # t_file="app/build.gradle.kts"
# # sed -i '/dependencies {/a \    implementation("io.arrow-kt:arrow-stack:1.2.4")' $t_file
# # sed -i '/dependencies {/a \    implementation("io.arrow-kt:arrow-fx-coroutines:1.2.4")' $t_file

# echo ""
# echo ""
# cat -n $t_file
# echo ""

# t_file="app/src/main/java/eu/kanade/tachiyomi/extension/util/ExtensionLoader.kt"
# if test -f $t_file ; then

# #   sed -i '/import android.content.pm.PackageInfo/a \import arrow.fx.coroutines.parMapNotNull' $t_file
# #   sed -i 's/mapNotNull/parMapNotNull/g' $t_file

#   sed -i '/?.mapNotNull {/a \async {' $t_file
# #   sed -i '/applicationInfo.fixBasePaths(path)/a \}' $t_file
#   sed -i '/?.filter { isPackageAnExtension(it)/i \}.awaitAll()' $t_file
#   echo "fix succ."
#  echo ""
#  echo ""
#  cat -n $t_file
#  echo ""
# fi
# exit 0