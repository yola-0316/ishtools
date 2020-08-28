# Shell Tools

## 核心

shell load 机制，参照 node_modules 查找机制
可设置默认 modules 目录名，默认为 sh_include
设置全局 fallback 目录，默认为 $HOME/.local/share/sh_include
用法:
load 'common'
load 'color'
加载成功返回 0，失败返回 1
load 'too' break 则加载失败推出执行
