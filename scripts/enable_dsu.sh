#!/bin/bash
# DSU-TERMINAL-TOOL script file.
# Powered by jvlong520(together08)<together08@yeah.net> from KOUMI Studio.
# Copyright 2021 KOUMI Studio.

setprop persist.sys.fflag.override.settings_dynamic_system true

echo "DSU 启用完成"
read -p "按任意键继续..." var
bash ../main.sh
