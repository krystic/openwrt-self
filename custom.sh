#!/bin/bash

set PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

#1. Modify default IP
sed -i 's/192.168.1.1/192.168.1.9/g' package/base-files/files/bin/config_generate

#2. Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings
#sed -i "s/OpenWrt /$(date +%Y.%m.%d) by Krystic /g" package/lean/default-settings/files/zzz-default-settings
sed -i "s/DISTRIB_DESCRIPTION='.*'/DISTRIB_DESCRIPTION='$(date +%Y.%m.%d) by Krystic @ Openwrt '/g" package/lean/default-settings/files/zzz-default-settings

#4. Change bulid filename
sed -i 's/IMG_PREFIX:=\$(VERSION_DIST_SANITIZED)/IMG_PREFIX:=$(shell date +%Y%m%d-%H%M%S)-$(VERSION_DIST_SANITIZED)/g' include/image.mk

#5. 
sed -i 's/\+libgd\s/\+libgd-full /g' package/feeds/packages/bandwidthd/Makefile
echo > feeds/packages/net/nginx-util/files/nginx.config
sed -i 's?h=${g}?h=${g//Default string\\\/Default string/SOFT ROUTER}?' package/lean/autocore/files/x86/autocore

#6
find package/feeds -name filebrowser | xargs -I {} sed -i 's#stop$#stop; export HOME="/root"#' {}/files/filebrowser.init
find package/feeds -name filebrowser | xargs -I {} sed -i '/killall.*filebrowser*/c\\tps -w | grep -v "grep" | grep "filebrowser -a" | awk "{print $1}" | xargs kill -9 >\/dev\/null 2>&1' {}/files/filebrowser.init
find package/feeds -name luci-app-baidupcs-web | xargs -I {} sed -i '/killall.*baidupcs-web*/c\\tps -w | grep -v "grep" | grep "baidupcs-web web" | awk "{print $1}" | xargs kill -9 >\/dev\/null 2>&1' {}/root/etc/init.d/baidupcs-web
