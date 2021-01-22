#!/bin/bash
# DSU-TERMINAL-TOOL script file.
# Powered by jvlong520(together08)<together08@yeah.net> from KOUMI Studio.
# Copyright 2021 KOUMI Studio.

read -p "请输入原始 GSI 文件完整路径：" gsipath
read -p "请输入原始 GSI 文件名：" gsiname

cp -fpr "$gsipath" .
mv "$gsiname" "system.img"

echo "正在转换并压缩 GSI..."
chmod a+x ./bin/simg2img
./bin/simg2img ./system.img ./system_raw.img
gzip -c ./system_raw.img > ./system_raw.gz

read -p "请输入你想要的 USERDATA 分区大小（以 GB 为单位，不要加单位字母；前提是 /data/ 分区下必须有足够的空间）" datasize
userdatasize=$(($datasize*1024*1024*1024))

LOCALDIR=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`

echo "正在启动 DSU.."
am start-activity \
-n com.android.dynsystem/com.android.dynsystem.VerificationActivity  \
-a android.os.image.action.START_INSTALL  \
-d file://"$LOCALDIR"/../system_raw.gz  \
--el KEY_SYSTEM_SIZE $((`du system_raw.img | cut -f1`*1024))  \
--el KEY_USERDATA_SIZE $userdatasize

echo "DSU 启动完毕，请检查您的通知栏"
read -p "按任意键继续..." var
