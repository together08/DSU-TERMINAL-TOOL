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
common="$LOCALDIR/../common"
magiskboot="$bin/magiskboot"

chmod a+x $magiskboot
$magiskboot unpack ./boot.img
$magiskboot cpio ./ramdisk.cpio extract

if [ -d ./avb ]; then
	echo "检测到存在 avb 文件夹...正在删除"
	$magiskboot cpio ./ramdisk.cpio "rm -r avb"
fi

echo "正在添加密钥..."
$magiskboot cpio ./ramdisk.cpio \
"mkdir 755 avb" \
"add 755 avb/q-developer-gsi.avbpubkey $common/q-developer-gsi.avbpubkey" \
"add 755 avb/r-developer-gsi.avbpubkey $common/r-developer-gsi.avbpubkey" \
"add 755 avb/s-developer-gsi.avbpubkey $common/s-developer-gsi.avbpubkey" \
"add 755 avb/q-gsi.avbpubkey $common/q-gsi.avbpubkey" \
"add 755 avb/r-gsi.avbpubkey $common/r-gsi.avbpubkey" \
"add 755 avb/s-gsi.avbpubkey $common/s-gsi.avbpubkey" \
"patch" 

echo "正在打包..."
$magiskboot repack ./boot.img
$magiskboot cleanup
rm -rf avb debug_ramdisk dev init mnt patch proc sys

echo "密钥添加完成，请刷入本工具目录下的new-boot.img"
read -p "按任意键继续..." var
