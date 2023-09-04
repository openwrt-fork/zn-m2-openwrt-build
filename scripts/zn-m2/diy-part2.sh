#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

# Enable Cache
echo -e 'CONFIG_DEVEL=y\nCONFIG_CCACHE=y' >>.config
# 检出 luci-app-design-config
git clone https://github.com/gngpp/luci-app-design-config.git package/luci-app-design-config
# ttyd免登陆
sed -i -r 's#/bin/login#/bin/login -f root#g' feeds/packages/utils/ttyd/files/ttyd.config
# 指定passwall版本
#mkdir openwrt-passwall
#git -C openwrt-passwall init
#git -C openwrt-passwall remote add origin https://github.com/xiaorouji/openwrt-passwall.git

# 4.69-4 版本
#git -C openwrt-passwall fetch --depth 1 origin d1e618220a9a0a4b73d536101f452a2f4cf14861
# 4.68-5 版本
#git -C openwrt-passwall fetch --depth 1 origin b84f5529422e8a8ac2a3634df1b13b1cb907f351
# 4.66-8 版本
#git -C openwrt-passwall fetch --depth 1 origin 360eb8928d226160756cd37adc5851cf81032d58

#git -C openwrt-passwall checkout FETCH_HEAD
#rm -rf feeds/luci/applications/luci-app-passwall
#mv openwrt-passwall/luci-app-passwall feeds/luci/applications/luci-app-passwall


# 替换为passwall官方源
git clone https://github.com/xiaorouji/openwrt-passwall.git
git -C openwrt-passwall checkout 4.69-4
for packagepath in openwrt-passwall/*; do package=`basename "$packagepath"`; rm -rf "feeds/packages/net/${package}" ; cp -rf "openwrt-passwall/${package}" "feeds/packages/net/${package}"; done
git -C openwrt-passwall checkout d1e618220a9a0a4b73d536101f452a2f4cf14861
rm -rf feeds/luci/applications/luci-app-passwall
cp -rf openwrt-passwall/luci-app-passwall feeds/luci/applications/luci-app-passwall