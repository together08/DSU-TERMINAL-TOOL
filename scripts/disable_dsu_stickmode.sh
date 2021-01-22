#!/bin/bash
# DSU-TERMINAL-TOOL script file.
# Powered by jvlong520(together08)<together08@yeah.net> from KOUMI Studio.
# Copyright 2021 KOUMI Studio.

echo "停用 DSU 粘滞模式"
gsi_tool disable
gsi_tool enable -s
gsi_tool disable

echo "DSU 粘滞模式已停用"
read -p "按任意键继续..." var
bash ../main.sh
