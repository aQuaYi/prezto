# Load dependencies.
pmodload 'editor'

source ${0:A:h}/zsh-autosuggestions/zsh-autosuggestions.zsh || return 1

export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)

bindkey '^j' autosuggest-execute # CTRL-j

