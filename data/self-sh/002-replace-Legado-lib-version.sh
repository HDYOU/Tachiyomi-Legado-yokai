#!/usr/bin/env bash

# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo "run path: $PWD"



    echo  "repalce mangaLegado dependencies:"
    

    sed -i 's/${kotlinx.versions.kotlin.version}/${kotlinx.versions.kotlin}/g' mangaLegado/build.gradle
    sed -i 's/${compose.versions.compiler}/1.5.7/g' mangaLegado/build.gradle

    # sed -i 's/kotlinx.reflect/"org.jetbrains.kotlin:kotlin-reflect:${kotlinx.versions.kotlin}"/g' mangaLegado/build.gradle
    sed -i '/kotlinx.reflect/d' mangaLegado/build.gradle

    # kotlinx.bundles.coroutines
    # sed -i '/kotlinx.bundles.coroutines/a \compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.7.3")' mangaLegado/build.gradle
    # sed -i '/kotlinx.bundles.coroutines/a \compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3")' mangaLegado/build.gradle
    # sed -i '/kotlinx.bundles.coroutines/a \compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-guava:1.7.3")' mangaLegado/build.gradle
    # sed -i '/kotlinx.bundles.coroutines/d' mangaLegado/build.gradle

    # sed -i 's/kotlinx.serialization.json.okio/"org.jetbrains.kotlinx:kotlinx-serialization-json-okio:1.6.0"/g' mangaLegado/build.gradle
    # sed -i 's/kotlinx.serialization.protobuf/"org.jetbrains.kotlinx:kotlinx-serialization-protobuf:1.6.0"/g' mangaLegado/build.gradle
    # sed -i 's/compileOnly(kotlinx.serialization.json)/compileOnly("org.jetbrains.kotlinx:kotlinx-serialization-json:1.6.0")/g' mangaLegado/build.gradle

    sed -i 's/libs.bundles.js.engine/libs.quickjs.android/g' mangaLegado/build.gradle

    # androidx.bundles.lifecycle
    # sed -i '/androidx.bundles.lifecycle/a \compileOnly("androidx.lifecycle:lifecycle-common:2.6.2")' mangaLegado/build.gradle
    # sed -i '/androidx.bundles.lifecycle/a \compileOnly("androidx.lifecycle:lifecycle-process:2.6.2")' mangaLegado/build.gradle
    # sed -i '/androidx.bundles.lifecycle/a \compileOnly("androidx.lifecycle:lifecycle-runtime-ktx:2.6.2")' mangaLegado/build.gradle
    # sed -i '/androidx.bundles.lifecycle/d' mangaLegado/build.gradle
    sed -i 's/androidx.bundles.lifecycle/androidx.bundles.androidx/g' mangaLegado/build.gradle


    # sed -i 's/libs.injekt.core/"com.github.inorichi.injekt:injekt-core:65b0440"/g' mangaLegado/build.gradle
    # sed -i 's/libs.rxjava/"io.reactivex:rxjava:1.3.8"/g' mangaLegado/build.gradle
    sed -i 's/libs.okhttp.core/libs.okhttp/g' mangaLegado/build.gradle

    # sed -i 's/libs.jsoup/"org.jsoup:jsoup:1.16.1"/g' mangaLegado/build.gradle

    ####### 替换版本
    sed -i 's/"com.google.android.material:material:1.6.1"/libs.material/g' mangaLegado/build.gradle

    sed -i 's/coil_version = "2.0.0"/coil_version = "3.0.0-alpha10"/g' mangaLegado/build.gradle

    ####### androidx
    sed -i '/core-ktx:1.8.0/d' mangaLegado/build.gradle
    sed -i '/appcompat:1.4.2/d' mangaLegado/build.gradle
    sed -i '/activity-ktx:1.4.0/d' mangaLegado/build.gradle
    sed -i '/fragment-ktx:1.4.1/d' mangaLegado/build.gradle
    sed -i '/viewpager2:1.0.0/d' mangaLegado/build.gradle
    sed -i '/webkit:1.4.0/d' mangaLegado/build.gradle

    sed -i '/androidx.preference:preference-ktx/d' mangaLegado/build.gradle
    sed -i '/androidx.constraintlayout:constraintlayout/d' mangaLegado/build.gradle
    sed -i '/androidx.swiperefreshlayout:swiperefreshlayout/d' mangaLegado/build.gradle

echo ""
cat mangaLegado/build.gradle
echo ""

exit 0