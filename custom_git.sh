#!/bin/bash
echo "src-link krystic ../../packages" >> feeds.conf.default 
cat ../feeds.conf.custom >> feeds.conf.default

rm -rf feeds/luci/applications/luci-app-cifs-mount
rm -rf feeds/luci/themes/luci-theme-argon

#git clone https://github.com/AlexZhuo/luci-app-bandwidthd.git package/luci-app-bandwidthd
#git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
#git clone https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
#git clone https://github.com/1wrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
#git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
#git clone https://github.com/honwen/luci-app-aliddns package/luci-app-aliddns
