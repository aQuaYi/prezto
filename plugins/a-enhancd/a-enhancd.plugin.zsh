# Source module files.
source "${0:h}/enhancd/init.sh" || return 1

## 添加这么一段无聊的内容是因为
# https://github.com/b4b4r07/enhancd/issues/123
# 问题解决后，可以删除下面这段
export ENHANCD_HOOK_AFTER_CD=''
NOW_DIR=`pwd`
cd $ZPREZTODIR/plugins/a-enhancd/enhancd
git checkout .
cd $NOW_DIR

export ENHANCD_HOOK_AFTER_CD='exa --classify -a'

