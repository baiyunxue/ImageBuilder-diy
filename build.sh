#!/bin/bash

# 打印 info
make info

# 指定要构建的目标映像
PROFILE="cmcc_rax3000m"

# 要嵌入映像的软件包列表
PACKAGES=""
# 基础包
## 基础组件
PACKAGES="$PACKAGES "
## 虚拟网卡驱动
#PACKAGES="$PACKAGES " # 虚拟网卡驱动，默认已包含，无需额外添加
## 主题
#PACKAGES="$PACKAGES luci-theme-argon"
## 界面翻译补全
#PACKAGES="$PACKAGES luci-i18n-opkg-zh-cn luci-i18n-base-zh-cn luci-i18n-firewall-zh-cn"

# 系统
## 定时重启
#PACKAGES="$PACKAGES luci-i18n-autoreboot-zh-cn"

# 服务
## passwall
#PACKAGES="$PACKAGES luci-i18n-passwall-zh-cn"
## upnp
#PACKAGES="$PACKAGES luci-i18n-upnp-zh-cn"


# 移除不需要的包
## 磁盘驱动和挂载
#PACKAGES="$PACKAGES -kmod-fs-f2fs -mkf2fs -automount -block-mount"
## 音频驱动
#PACKAGES="$PACKAGES "
## 网卡驱动
#PACKAGES="$PACKAGES "
## USB驱动
#PACKAGES="$PACKAGES -kmod-usb-audio -kmod-usb-hid -kmod-usb-net -kmod-usb-net-asix -kmod-usb-net-asix-ax88179 -kmod-usb-net-rtl8150 -kmod-usb-net-rtl8152-vendor"
## pppoe 拨号
#PACKAGES="$PACKAGES -ppp -ppp-mod-pppoe"
## IPv6，CONFIG_IPV6=n
#PACKAGES="$PACKAGES -ipv6helper"
## filetransfer
#PACKAGES="$PACKAGES -luci-app-filetransfer"

# 包含自定义文件的目录
#FILES="files"

# 要禁用的 /etc/init.d 中服务的名称
#DISABLED_SERVICES="sshd"

make image PROFILE="$PROFILE" PACKAGES="$PACKAGES" FILES="$FILES" DISABLED_SERVICES="$DISABLED_SERVICES"
