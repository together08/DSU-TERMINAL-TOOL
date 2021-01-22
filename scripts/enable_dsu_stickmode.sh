#!/bin/bash
# DSU-TERMINAL-TOOL script file.
# Powered by jvlong520(together08)<together08@yeah.net> from KOUMI Studio.
# Copyright 2021 KOUMI Studio.

echo "启用 DSU 粘滞模式"
gsi_tool enable

echo "DSU 粘滞模式已启用"
read -p "按任意键继续..." var
bash ../main.sh
