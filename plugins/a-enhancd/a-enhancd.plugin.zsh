# Source module files.
source "${0:h}/enhancd/init.sh" || return 1

export ENHANCD_HOOK_AFTER_CD='exa --classify -a'

