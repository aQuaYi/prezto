#
# Integrates zsh-autosuggestions into Prezto.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
pmodload 'editor'

source ${0:h}/zsh-autosuggestions/zsh-autosuggestions.zsh || return 1

#
# Highlighting
#

# Set highlight color, default 'fg=8'.
zstyle -s ':prezto:module:autosuggestions:color' found \
  'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE' || ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Disable highlighting.
if ! zstyle -t ':prezto:module:autosuggestions' color; then
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=''
fi

#
# Key Bindings
#

if [[ -n "$key_info" ]]; then
  # vi
  bindkey -M viins "$key_info[Control]F" vi-forward-word
  bindkey -M viins "$key_info[Control]E" vi-add-eol
fi

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

bindkey '^j' autosuggest-execute # CTRL-j
bindkey '^e' autosuggest-accept # CTRL-e
