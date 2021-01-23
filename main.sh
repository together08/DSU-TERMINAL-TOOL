#!/bin/bash
# DSU-TERMINAL-TOOL script file.
# Powered by jvlong520(together08)<together08@yeah.net> from KOUMI Studio.
# Copyright 2021 KOUMI Studio.

clear

echo "Dynamic System Updates 脚本工具 20210122"
echo "本工具适用于 Android 10 Beta 4 及以上版本"
echo "请在 Termux 下打开本工具"
echo "官方QQ交流群：1051856285"
echo "本工具发布于酷安，拒绝未经授权的转发、打包，打包狗全家火葬场！"
echo "Powered by jvlong520(together08)."
echo "Copyright 2021 KOUMI Studio."
echo ""
echo ""

echo "1. 启用 Dynamic System Updates（安卓10/11 userdebug build 包：直接打开 设置>系统>开发者选项>功能标记>settings_dynamic_system 即可；其他设备须使用此条命令）"
echo "2. 刷入 Dynamic System Updates GSI 镜像（所有 GSI 均可以使用，包括 erfan/phh 等 GSI）"
echo "3. 启用 Dynamic System Updates 粘滞模式（多次重启直至舍弃）"
echo "4. 停用 Dynamic System Updates 粘滞模式"
echo "5. 安装启动依赖（必选，第一次打开工具须执行）"
echo "0. 退出本工具"

echo ""
echo ""

read -p "请输入您的选择：" c

if [ "$c" == "0" ]; then 
    exit
elif [ $c == 1 ]; then 
	bash ./scripts/enable_dsu.sh	     
elif [ $c == 2 ]; then 
	bash ./scripts/flash_dsu.sh
elif [ $c == 3 ]; then 
	bash ./scripts/enable_dsu_stickmode.sh
elif [ $c == 4 ]; then 
	bash ./scripts/disable_dsu_stickmode.sh
elif [ $c == 5 ]; then
	bash ./scripts/install_deps.sh
else
	echo "指令不存在"
	exit 
fi
