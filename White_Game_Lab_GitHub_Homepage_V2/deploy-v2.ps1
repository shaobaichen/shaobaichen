#requires -version 5.1
$ErrorActionPreference = 'Stop'
$base = Split-Path -Parent $MyInvocation.MyCommand.Path
$gitCmd = Get-Command git -ErrorAction SilentlyContinue
if (-not $gitCmd) { throw '未发现 Git。请先安装 Git for Windows 并完成 GitHub 登录。' }
$workspace = Join-Path $env:TEMP 'white-game-lab-homepage-v2'
if (Test-Path $workspace) { throw "临时目录已存在，为避免误覆盖，请先检查后移走：$workspace" }
$repo = 'https://github.com/shaobaichen/shaobaichen.git'
& git clone --depth 1 --branch main $repo $workspace
if ($LASTEXITCODE -ne 0) { throw '克隆失败。请检查网络与 GitHub 登录权限。' }
$remote = (& git -C $workspace remote get-url origin).Trim()
if ($LASTEXITCODE -ne 0 -or $remote -notmatch 'shaobaichen/shaobaichen(\.git)?$') { throw "远端仓库不匹配：$remote" }
$backup = Join-Path $workspace 'backup'
New-Item -ItemType Directory -Path $backup -Force | Out-Null
$date = Get-Date -Format 'yyyyMMdd-HHmmss'
Copy-Item (Join-Path $workspace 'README.md') (Join-Path $backup "README-before-v2-$date.md") -ErrorAction Stop
Copy-Item (Join-Path $base 'README.md') (Join-Path $workspace 'README.md') -Force
Copy-Item (Join-Path $base 'assets') $workspace -Recurse -Force
& git -C $workspace add README.md assets backup
if ($LASTEXITCODE -ne 0) { throw 'git add 失败。' }
& git -C $workspace diff --cached --check
if ($LASTEXITCODE -ne 0) { throw '发现不合规的空白字符；已停止提交。' }
& git -C $workspace commit -m 'docs(profile): launch V2 game showcase cabinets'
if ($LASTEXITCODE -ne 0) { throw '提交失败。' }
& git -C $workspace push origin main
if ($LASTEXITCODE -ne 0) { throw "Push 失败，本地提交保留在：$workspace" }
Write-Host '已发布 V2： https://github.com/shaobaichen' -ForegroundColor Green
Write-Host "原始 README 已备份到仓库：backup/README-before-v2-$date.md"
