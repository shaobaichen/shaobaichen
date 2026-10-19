# White's Game Lab V2 · 发布与验收

此目录是完整的 GitHub Profile README 交付包。对应仓库：`https://github.com/shaobaichen/shaobaichen`，需要把 `README.md` 与整个 `assets/` 文件夹一起上传到该仓库根目录。

## 文件
- `README.md`：GitHub 原生 Markdown/部分受支持 HTML 排版。
- `assets/yan-exhibit-v2.webp`：东方民俗志怪主题陈列柜。背景为概念美术，内嵌用户项目截图。
- `assets/lockstep-exhibit-v2.webp`：蓝色科技主题陈列柜。背景为概念美术，不冒充项目真实画面。
- `assets/yan-restpoint.webp`：《魇》开发过程截图，含未完成的占位模型。
- `assets/mini-*.webp`：三个次要项目装饰图。
- `preview.html`：方便本地打开的视觉预览，不属于 GitHub README。
- `deploy-v2.ps1`：在本机一键备份并提交到仓库的 PowerShell 脚本（需要已安装 Git 且已登录 GitHub）。

## 数据准确性
- Lockstep Arena 仅链接正式仓库 `LockstepArena_Portfolio`。
- 项目内的局域网 TCP、预测回滚和离线回放等声明依据该仓库公开文档与源码。
- Lockstep 的三张真实图通过 `raw.githubusercontent.com` 直接引用正式仓库，今后那里更新图片，个人主页也会同步显示。
- 《魇》仍为进行中私有项目，不提供无法访问的源码链接。场景/UI 截图与概念背景已明确区分。
- 展柜背景并非实际游戏画面，请勿在求职材料中当作游戏实机截图。

## 使用说明
1. 先打开 `preview.html` 查看 V2 的结构预览（动态打字与远程截图在 GitHub 上显示才是最终效果）。
2. 确认无误后，在 Windows PowerShell 里运行 `deploy-v2.ps1`，或手工将 README.md 与 assets 目录上传至 `shaobaichen/shaobaichen` 仓库。
3. 打开 https://github.com/shaobaichen 刷新查看；如果看见缺失图片，检查大小写与路径。
4. 默认没有覆盖此前 README 备份的机会丢失：脚本会先将原版保存到 `backup/` 并核对远端仓库地址后再推送。

GitHub README 对 CSS 和 JS 有严格限制，不能像效果图那样自由叠加 HTML 图层。复杂的展柜画面已经渲染成 WebP，技术介绍和跳转仍为原生可阅读内容。
