# 阻止 z.lua 创建别名
export _ZL_NO_ALIASES=1

# Source module files
source "${0:h}/z.lua/z.lua.plugin.zsh" || return 1

# 以下可以修改默认配置。

# 设置 $_ZL_CMD 来改变命令名称 (默认为 z)。
# 设置 $_ZL_DATA 来改变数据文件 (default ~/.zlua)。
# 设置 $_ZL_NO_PROMPT_COMMAND 为 1 来跳过钩子函数初始化（方便自己处理）。
# 设置 $_ZL_EXCLUDE_DIRS 逗号分隔的路径列表，列表内的路径不会被收集。
# 设置 $_ZL_ADD_ONCE 为 '1' 时，仅在当前路径 $PWD 改变时才更新数据库。
export _ZL_ADD_ONCE=1
# 设置 $_ZL_MAXAGE 来确定一个数据老化的阀值 (默认为 5000)。
# 设置 $_ZL_CD 用来指定你想用的 cd 命令，比如有人用 cd_func 。
# 设置 $_ZL_ECHO 为 1 可以在跳转后显示目标路径名称。
export _ZL_ECHO=1
# 设置 $_ZL_MATCH_MODE 为 1 可以打开 “增强匹配模式”。
export _ZL_MATCH_MODE=1
# 设置 $_ZL_HYPHEN 为 1 可以允许关键字中包含横线 （横线默认是 lua 正则关键字，要转写成 %-）。

# 添加另一个别名 j
alias j='z'

# 使用 fzf 进行选择
alias jf='j -I'

# 使用 fzf 选择要退回的父目录
alias jb='j -b -I'

# 使用 fzf 选择要退回的历史目录
alias jh='j -t -I'

# 严格匹配当前路径的子路径
alias jc='j -c'

