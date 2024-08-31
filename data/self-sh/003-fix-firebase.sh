#!/usr/bin/env bash

# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo "run path: $PWD"

    
    t_file="app/src/main/java/yokai/core/CrashlyticsLogWriter.kt"
    sed -i '/firebase/d' $t_file
    sed -i '/Firebase/d' $t_file
    
echo ""
cat $t_file
echo ""

exit 0