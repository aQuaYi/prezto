##系统管理
# update every thing
alias ue='yay -Syyu'
# update zsh all
alias uza='echo "====== cd prezto dir ======" && \
  cd $ZPREZTODIR && \
  echo "====== fetch sorin ======" && \
  git fetch sorin && \
  echo "====== checkout master ======" && \
  git checkout master && \
  echo "====== merge sorin/master ======" && \
  git merge sorin/master && \
  echo "====== submodule update ======" && \
  git submodule update --remote --recursive && \
  echo "====== status ======"
  git status && \
  zsh'
# commit update zsh 
alias uzc='echo "====== cd prezto dir ======" && \
  cd $ZPREZTODIR && \
  echo "====== add all ======" && \
  git add -A -v && \
  echo "====== commit ======" && \
  git commit -m "update prezto" && \
  echo "====== submodule force init ======" && \
  git submodule update -f --init --recursive && \
  echo "====== push ======" && \
  git push && \
  zsh'
# 关闭系统
alias sshn="sudo shutdown -h now"

##日常操作
#
# md 创建目录
alias md='mkdir -p'
# rd 删除目录
alias rmrf='rm -rf'

##exa
# --classify 在不同类型的文件后面添加标记
# 比如，文件夹后面添加了 /
# 详见：https://the.exa.website/features/colours#classify
alias ls='exa --classify'
alias la='exa --classify -a'
# long list
alias ll='exa -lbhmF --time-style=iso --git --color-scale'
# long list all
alias lla='exa -lbhmF --time-style=iso --git --color-scale --all'
# long list, order by modified time
alias lm='exa --sort=modified -lbhmF --time-style=iso --git --color-scale'
# long list all, order by modified time 
alias lma='exa --sort=modified -lbhmF --time-style=iso --git --color-scale --all'
#
# one column, just names
alias lss='exa -1'
#
# alias tree command
alias lt='exa --tree --level=2'
alias ltt='exa --tree --level=3'
alias lttt='exa --tree --level=4'

##zsh
# open .zshrc with nvim
alias zfg='nvim ~/.zshrc'

##golang
alias grm="go run *.go"
alias gtb="go test -bench . -benchmem -gcflags "-N -l""
alias gt="go test -v -race"
alias gtc="go test -v -race -cover -coverprofile cover.out && go tool cover -html=cover.out"
alias gtci="go test -v -race -cover -gcflags=all=-l -coverprofile cover.out && go tool cover -html=cover.out"
alias gob="go build"

##conda
# 罗列全部的虚拟环境
alias cel="conda env list"
# 取消当前的虚拟环境
alias cod="conda deactivate"
# 激活某个虚拟环境
alias coa="conda activate"
# 创建新的虚拟环境
alias ccn="conda create -n"
# 更新 conda
alias cuc="conda update conda"

##其他
# 统计从 1am 到现在，此 git 仓库本人的工作量
alias gzl='git log --author="$(git config --get user.name)" --pretty=tformat: --numstat --since=1am | gawk '"'"'{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "add: %s \ndel: %s \ntol: %s\n",add,subs,loc }'"'"''
# 使用 neovim 替代 vi
alias vi='nvim'
