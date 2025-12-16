#!/bin/bash
# 输入法
fcitx5 -d &

# 合成器
picom --config ~/.config/picom/picom.conf &

# 状态栏
slstatus &

# 通知
dunst &

# 音频处理 (自动加载 CleanMic 预设)
# sleep 5 && easyeffects --gapplication-service &

redshift &

#剪贴板
xcliphistd.sh &

