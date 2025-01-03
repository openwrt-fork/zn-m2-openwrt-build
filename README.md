# 兆能ZN-M2 openwrt 无wifi 无USB 弱电箱专用
自用款固件 弱电箱专用 想用passwall 推荐内存512M以上 内核版本 4.4.60

不包含自己用不上的wifi和USB支持 集成了少量自己用的上的软件

感谢大佬 sdf8057 的贡献 https://github.com/sdf8057/ipq6000

自己从主干反向移植了 kmod-ipt-socket iptables-mod-socket （passwall 4.66-8+新增依赖） kmod-netlink-diag （passwall 4.70+新增的 singbox 的依赖）已合并到大佬的代码库

会跟进passwall的更新

控制台地址`192.168.1.1` 默认密码`password`

uboot刷机用`openwrt-ipq60xx-generic-zn_m2-squashfs-nand-factory.ubi`

openwrt系统升级用`openwrt-ipq60xx-generic-zn_m2-squashfs-nand-sysupgrade.bin`
