# Source module files
source "${0:h}/fzy/zsh-fzy.plugin.zsh" || return 1

#
# Key Bindings
#

bindkey '^@d' fzy-cd-widget
bindkey '\ef' fzy-file-widget ## ALT-F
bindkey '^@p' fzy-proc-widget
bindkey '^@r' fzy-history-widget
