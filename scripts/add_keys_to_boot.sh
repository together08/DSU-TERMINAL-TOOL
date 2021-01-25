#!/bin/bash
# DSU-TERMINAL-TOOL script file.
# Powered by jvlong520(together08)<together08@yeah.net> from KOUMI Studio.
# Copyright 2021 KOUMI Studio.

read -p "请输入原始 boot 文件完整路径：" bootpath
read -p "请输入原始 boot 文件名：" bootname

cp -fpr "$bootpath" .
mv "$bootname" "boot.img"

echo "正在使用 magiskboot 工具解包 boot.img ..."

LOCALDIR=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`
bin="$LOCALDIR/../bin"
common"$LOCALDIR/../common"
magiskboot="$bin/magiskboot"

$magiskboot unpack ./boot.img
$magiskboot cpio $bin/ramdisk.cpio extract

if [ -d $bin/avb ]; then
	rm -rf $bin/avb
fi

echo "正在添加密钥..."
cp -fpr $common/avb $bin

echo "正在打包..."
$magiskboot cpio $bin/ramdisk.cpio patch
$magiskboot repack ./boot.img

cp -fpr $bin/new-boot.img .

echo "密钥添加完成，请刷入本工具目录下的new-boot.img"
read -p "按任意键继续..." var
