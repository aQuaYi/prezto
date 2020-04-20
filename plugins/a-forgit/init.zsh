# source after git plugin

# Define them before sourcing the plugin if you don't use any plugin manager.
forgit_log=glo
forgit_diff=gd
forgit_add=ga
forgit_reset_head=grh
forgit_ignore=gi
forgit_restore=gcf

# my custom
forgit_clean=gcl        # formly gclean
forgit_stash_show=fgs   # formly gss

#
source ${0:h}/forgit/forgit.plugin.zsh || return 1
