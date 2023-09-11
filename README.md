# 兆能 ZN-M2 OpenWrt 固件

无 WiFi / 无 USB / 弱电箱专用 · 内核 4.4.60 · 推荐内存 512M+

感谢 [sdf8057](https://github.com/sdf8057/ipq6000) 大佬的 IPQ6000 源码贡献。

已反向移植：
- `kmod-ipt-socket` / `iptables-mod-socket` — Passwall 4.66-8+ 依赖
- `kmod-netlink-diag` — Passwall 4.70+ SingBox 依赖

已合并到 [sdf8057/ipq6000](https://github.com/openwrt-fork/sdf8057-ipq6000)。

---

## 固件变体

每次构建产出 **两个变体**，发布在同一个 GitHub Release 中：

| 变体 | 说明 | 文件名后缀 |
|------|------|-----------|
| **basic** | 纯净版，不含集客 AC 控制器 | `-basic` |
| **gecoosac-v2** | 含集客 AC 控制器 V2 | `-gecoosac-v2` |

---

## 自动构建 & 更新

- **手动触发**：在 Actions 页面运行 `zn-m2 build`
- **自动触发**：`check-passwall-update` 每 6 小时检测上游 [Passwall](https://github.com/Openwrt-Passwall/openwrt-passwall) 是否有新版本发布，若有则自动触发构建
- **Release Tag** 与上游 Passwall 版本号完全一致（如 `26.7.16-1`）

### 增量编译流程

```
全量 config make download (含 gecoosac)
  → sed 删 gecoosac → make (basic) → 保存
  → 恢复 gecoosac config → make (增量, 仅编 gecoosac) → gecoosac-v2
  → 两套固件一起发布
```

---

## 集成软件

| 分类 | 软件 |
|------|------|
| 科学上网 | Passwall (Haproxy / Hysteria / SingBox / Xray)、ChinaDNS-NG |
| VPN | WireGuard、OpenVPN |
| DDNS | ddns-scripts (阿里云 / DNSPod) |
| 内网穿透 | Lucky、NPS |
| 管理 | ttyd (Web 终端)、htop、bash、curl |
| 主题 | Argon、Design |
| 其他 | UPnP、WOL 唤醒、ARP 绑定、coremark / stress-ng |

---

## 刷机 & 升级

- 控制台：`192.168.1.1` · 默认密码：`password`

| 场景 | 文件 |
|------|------|
| uboot 刷机 | `*factory-basic.ubi` 或 `*factory-gecoosac-v2.ubi` |
| 系统升级 | `*sysupgrade-basic.bin` 或 `*sysupgrade-gecoosac-v2.bin` |
| 软件包清单 | `*basic.manifest` 或 `*gecoosac-v2.manifest` |

---

## 手动构建

1. Fork 本仓库
2. 在 Actions 页面选择 `zn-m2 build` → `Run workflow`
3. 等待约 2-3 小时，构建产物自动发布到 Release
