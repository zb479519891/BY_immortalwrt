#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# mihomo 使用 Go 编译器的链接优化（-s -w）减小二进制体积，不依赖 UPX
# OpenWrt golang-package.mk 的 Go 构建流程通常已启用 -s -w；这里只移除 UPX 后处理步骤
sed -i '\|$(STAGING_DIR_HOST)/bin/upx --lzma --best|d' feeds/helloworld/mihomo/Makefile
