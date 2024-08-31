#!/usr/bin/env bash

# 出错退出
# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo ""
echo "test replace base resources ...."
# i18n/src/commonMain/resources/MR/zh-rCN/strings.xml
tmp_file="tmp_myfile.txt"
cat << EOF > $tmp_file
<string name="ext_revoke_trust">撤销已信任的未知插件</string>

<!-- Extension Repos -->
<string name="action_add_repo">添加仓库</string>
<string name="action_add_repo_message">在 应用 中添加仓库，输入的网址结尾应为“index.min.json”。</string>
<string name="extension_repos">插件仓库</string>
<plurals name="num_repos"><item quantity="one">%d 个仓库</item><item quantity="other">%d 个仓库</item></plurals>
<string name="error_repo_exists">此仓库已存在！</string>
<string name="repo_cannot_be_blank">仓库名不能为空！</string>
<string name="snack_repo_deleted">仓库已删除</string>
<string name="invalid_repo_name">仓库网址无效</string>
<string name="confirm_repo_deletion">删除仓库</string>
<string name="delete_repo_confirmation">确定要删除仓库“%s”吗？</string>
<string name="url_not_set_click_again">仓库网址没设置，请编辑网址</string>

<!-- search manga chapters -->
<string name="fetch_manga_chapters">在搜索结果显示漫画章节数</string>
<string name="fetch_manga_chapters_summary">自动获取最新的漫画详情和章节并将其保存在数据库中\\n警告：此功能将极大地影响设备性能并增加到源的网络流量</string>

<string name="force_bypass_cloudflare">尝试强制绕过cloudflare错误</string>
<string name="force_bypass_cloudflare_summary">当应用程序试图强制绕过时，此功能可能会降低网络速度\\n警告：这是一个实验性功能，仅适用于某些来源</string>
<string name="toggle_force_bypass_cloudflare">切换cloudflare旁路</string>

    <!-- Storage -->
    <string name="data_and_storage">数据与存储</string>
    <string name="storage_location">存储位置</string>
    <string name="storage_usage">存储占用</string>
    <string name="available_disk_space_info">可用: %1\$s / 总共: %2\$s</string>

    <!-- Common -->
    <string name="recents_long_tap_default">显示下载队列</string>
    <string name="recents_long_tap_last_read">打开最后阅读章节</string>
    <string name="recents_long_tap">长按最近按钮</string>
	
	<string name="browse_long_tap_default">打开扩展/迁移菜单</string>
    <string name="browse_long_tap_search">打开全局搜索</string>
    <string name="browse_long_tap">长按浏览按钮</string>

    <string name="recents_long_tap_default">显示下载队列</string>
    <string name="recents_long_tap_last_read">打开最后阅读章节</string>
    <string name="recents_long_tap">长按最近按钮</string>
	
	<string name="browse_long_tap_default">打开扩展/迁移菜单</string>
    <string name="browse_long_tap_search">打开全局搜索</string>
    <string name="browse_long_tap">长按浏览按钮</string>
	
	
	<!-- book -->
	<string name="enable_chapter_swipe_action">启用章节滑动操作</string>
	
	<!-- read -->
	<string name="long_strip">条漫</string>
	<string name="crop_borders_long_strip">裁剪边缘 (条漫)</string>
	<!-- Cutout -->
	<string name="cutout_area_behavior">剪切区域行为</string>
    <string name="pad_cutout_areas">平板剪切区域</string>
    <string name="start_past_cutout">从剪切开始</string>
    <string name="cutout_behavior_only_applies">剪切区域行为仅适用于具有特定比例类型的纵向模式</string>
    <string name="pref_legacy_cutout">打开传统剪切设置</string>
    <string name="pref_legacy_cutout_info">在Android 9.0之前的设备上，除了手动设置到系统设置外，无法修改剪切设置</string>
    <string name="pref_cutout_short">在剪切区域显示内容</string>
    <string name="cutout_ignore">忽略剪切区域</string>
	
	<string name="pref_double_tap_zoom">双击放大</string>
	
	<string name="save_pages_separately">将图片保存到单独文件夹</string>
    <string name="create_folders_by_manga_title">根据作品标题创建文件夹</string>
	
	<!-- Download -->
	<string name="download_with_id">章节名自动附加ID</string>
    <string name="download_with_id_details">可以修复下载的章节同名时相互冲突的问题</string>
	
	
	<!-- adv -->
	<string name="action_revoke_all_extensions">撤销已信任的未知插件</string>
    <string name="confirm_revoke_all_extensions">是否撤销已信任的未知插件?</string>
	
	<string name="pref_display_profile">自定义显示配置文件</string>

    <string name="backup_private_pref">包括敏感设置(例如进度记录平台的账号信息)</string>

EOF
sed -i '/^$/d' $tmp_file
sed -i '/^#/d' $tmp_file
sed -i '/<!--/d' $tmp_file
cat $tmp_file

t_file="i18n/src/commonMain/moko-resources/zh-rCN/strings.xml"
if test -f $t_file ; then
  
  
  echo "" >> $t_file


  cat $tmp_file | while read line
    do   
    fix_txt="$line"
    echo "fix_txt: $fix_txt"
    find_txt=`echo "$fix_txt" | awk -F '\"' '{ print $2 }'`
    echo "find_txt: $find_txt"
    match=`grep "\"$find_txt\"" $t_file`
    if [ -z "$match" ]; then
      echo "$fix_txt" >> $t_file
      echo "fix succ."
    else
      echo "fix Error !!!!"
    fi
  done

  # delete  </resources>
  sed -i '/<\/resources>/d' $t_file
  # replace </resources>
  echo "</resources>" >> $t_file

  echo ""
  echo "Fix file: $t_file"
  tail -n 100 $t_file
  echo ""
fi
rm -f $tmp_file


t_file="app/src/main/java/eu/kanade/tachiyomi/ui/setting/controllers/SettingsAdvancedController.kt"
sed -i 's/Crash the app!/崩溃应用程序！/g' $t_file
sed -i 's/To test crashes/测试崩溃/g' $t_file
sed -i 's/I told you this would crash the app, why would you want that?/这会使应用程序崩溃，一定要这样做吗？/g' $t_file
sed -i 's/Crash it anyway/确认崩溃/g' $t_file
sed -i 's/Nevermind/取消/g' $t_file

cat $t_file

exit 0