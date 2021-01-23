#!/bin/bash
# DSU-TERMINAL-TOOL script file.
# Powered by jvlong520(together08)<together08@yeah.net> from KOUMI Studio.
# Copyright 2021 KOUMI Studio.

echo "正在刷入 DSU 支持 vbmeta.img 依赖..."
LOCALDIR=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`
VBMETADIR="$LOCALDIR"/../vbmeta_support

read -p "请输入您的安卓版本：" androidver

if [ $androidver == 10 ]; then
	dd if=$VBMETADIR/vbmeta-support_dsu-10.img of=/dev/block/bootdevice/by-name/vbmeta
elif [ $androidver == 11 ]; then
	dd if=$VBMETADIR/vbmeta-support_dsu-11.img of=/dev/block/bootdevice/by-name/vbmeta
else
	echo "该安卓版本不存在！"
fi

echo "依赖安装完毕"
read -p "按任意键继续..." var
