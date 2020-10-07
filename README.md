# Prezto — 又快又好的 Zsh

在经历了 Zinit 和 Zplug 无法正常更新插件的煎熬后，
才能意识到 Prezto 使用纯 git 方式管理插件的好处。

- [安装](#%e5%ae%89%e8%a3%85)
	- [Fork Prezto](#fork-prezto)
	- [Clone 到本地](#clone-%e5%88%b0%e6%9c%ac%e5%9c%b0)
	- [生成 Zsh 配置文件的软连接](#%e7%94%9f%e6%88%90-zsh-%e9%85%8d%e7%bd%ae%e6%96%87%e4%bb%b6%e7%9a%84%e8%bd%af%e8%bf%9e%e6%8e%a5)
	- [把 Zsh 设置成默认 Shell](#%e6%8a%8a-zsh-%e8%ae%be%e7%bd%ae%e6%88%90%e9%bb%98%e8%ae%a4-shell)
	- [保存自己的配置](#%e4%bf%9d%e5%ad%98%e8%87%aa%e5%b7%b1%e7%9a%84%e9%85%8d%e7%bd%ae)
- [安装插件](#%e5%ae%89%e8%a3%85%e6%8f%92%e4%bb%b6)
	- [自带插件](#%e8%87%aa%e5%b8%a6%e6%8f%92%e4%bb%b6)
	- [其他插件](#%e5%85%b6%e4%bb%96%e6%8f%92%e4%bb%b6)
	- [添加 prezto-contrib 模块库](#%e6%b7%bb%e5%8a%a0-prezto-contrib-%e6%a8%a1%e5%9d%97%e5%ba%93)
- [从 sorin-ionescu/prezto 同步](#%e4%bb%8e-sorin-ionescuprezto-%e5%90%8c%e6%ad%a5)
	- [给本地仓库配置远程库](#%e7%bb%99%e6%9c%ac%e5%9c%b0%e4%bb%93%e5%ba%93%e9%85%8d%e7%bd%ae%e8%bf%9c%e7%a8%8b%e5%ba%93)
	- [抓取 sorin 的内容](#%e6%8a%93%e5%8f%96-sorin-%e7%9a%84%e5%86%85%e5%ae%b9)
	- [合并到 master 分支](#%e5%90%88%e5%b9%b6%e5%88%b0-master-%e5%88%86%e6%94%af)
	- [推送更新内容到 origin](#%e6%8e%a8%e9%80%81%e6%9b%b4%e6%96%b0%e5%86%85%e5%ae%b9%e5%88%b0-origin)
- [更新插件](#%e6%9b%b4%e6%96%b0%e6%8f%92%e4%bb%b6)

## 安装

### Fork Prezto

到 <https://github.com/sorin-ionescu/prezto> 进行 Fork

### Clone 到本地

> 记得把以下命令中的 `aQuaYi` 替换成**你自己的ID**。

```Zsh
$ zsh
$ git clone --recursive --shallow-submodules https://github.com/aQuaYi/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
$
```

### 生成 Zsh 配置文件的软连接

> 在 zsh 中执行以下命令。
> 如果你已经拥有了 zsh 的相关配置的话，
> 请备份后，把命令中的 `ln` 替换成 `ln -f`

```Zsh
$ setopt EXTENDED_GLOB
$ for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
$
```

生成符号链接的好处是，配置文件始终在资源库中，可以利用 git 进行管理。

### 把 Zsh 设置成默认 Shell

```zsh
$ which zsh
/usr/bin/zsh
$ chsh -s /usr/bin/zsh
$
```

### 保存自己的配置

1. 删除了 `.gitignore` 中的 `contrib`
1. 修改项目的 `README.md` 为 `README-EN.md`
1. 添加此 `README.md` 文件到项目根目录。
1. git `add`，`commit` & `push` 到 github

## 安装插件

### 自带插件

例如，想要添加 `modules` 目录中的 `git` 插件。
只需在 `~/.zpreztorc` 文件的

```text
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'prompt'
```

中添加一行 `'git' \`， 成为

```text
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'git' \
  'prompt'
```

即可。

### 其他插件

想要在 Prezto 中添加 <https://github.com/aQuaYi/zsh-alias> 插件

```zsh
$ cd $ZPREZTODIR/modules
$ git submodule add https://github.com/aQuaYi/zsh-alias.git
$
```

> 对于不需要自己修改的模块，可以在 `$ZPREZTODIR/.gitmodules` 文件中的
[submodule "modules/zsh-alias"] 项目下，
添加 `shallow = true`

```text
[submodule "modules/zsh-alias"]
	path = modules/zsh-alias
	url = https://github.com/aQuaYi/zsh-alias.git
	shallow = true
```

```zsh
$ git add -A
$ git commit -m "add zsh-alias"
$ git push
$
```

现在可以像[自带插件](#%e8%87%aa%e5%b8%a6%e6%8f%92%e4%bb%b6)一样启用了。

### 添加 prezto-contrib 模块库

<https://github.com/belak/prezto-contrib> 也收集了一些兼容 Prezto 的插件。
按照其 README 安装后，可以很方便地添加插件。
但是由于 `contrib` 也包含在 `.gitignore` 文件中，无法以子模块的方式更新。

本人使用以下方式安装 prezto-contrib 模块库。

1. 删除了 `.gitignore` 中的 `contrib`

2. 把 `prezto-contrib` 作为子模块拷贝到 `$ZPREZTODIR`

```zsh
$ cd $ZPREZTODIR
$ git submodule add https://github.com/belak/prezto-contrib.git contrib
$ git submodule update --init --recursive
$
```

## 从 sorin-ionescu/prezto 同步

按照以上方法安装 Prezto 后，还可以同步其后续的更新。

以下过程从 Github 的官方文档[为复刻配置远程仓库](https://help.github.com/cn/github/collaborating-with-issues-and-pull-requests/configuring-a-remote-for-a-fork)和[同步复刻](https://help.github.com/cn/github/collaborating-with-issues-and-pull-requests/syncing-a-fork)总结。

### 给本地仓库配置远程库

```zsh
$ git remote -v
origin	https://github.com/aQuaYi/prezto.git (fetch)
origin	https://github.com/aQuaYi/prezto.git (push)
$ git remote add sorin https://github.com/sorin-ionescu/prezto.git
$ git remote -v
origin	https://github.com/aQuaYi/prezto.git (fetch)
origin	https://github.com/aQuaYi/prezto.git (push)
sorin	https://github.com/sorin-ionescu/prezto.git (fetch)
sorin	https://github.com/sorin-ionescu/prezto.git (push)
```

### 抓取 sorin 的内容

```zsh
$ git fetch sorin
$
```

### 合并到 master 分支

```zsh
$ git checkout master && git merge sorin/master
$
```

>遭遇冲突，可用 `git status` 查看冲突内容

只有 README 的冲突是以本文件为准。其余的冲突一律以 sorin 的为准。

可以在运行了 `git status` 后，使用 `git add <文件名>` 来解决。

### 推送更新内容到 origin

```zsh
$ git push origin master
$
```

## 更新插件

```zsh
$ cd $ZPREZTODIR && \
  git submodule update --remote --recursive && \
  git add -A -v && \
  git commit -m "update submodules" && \
  git submodule update -f --init --recursive && \
  git push && \
  zsh
```

添加`git submodule update -f --init --recursive` 的原因在[这里](https://github.com/aQuaYi/dirty-module)

最好可以在 git config 中添加以下内容

```zsh
$ git config --global diff.ignoreSubmodules dirty
$
```

还可以参考 [aQuaYi/zsh-alias](https://github.com/aQuaYi/zsh-alias/blob/master/zsh-alias.plugin.zsh) 中的 `uza` 和 `uzc` 命令。

## 在 `runcoms` 中修改环境变量

Go 和 Rust 的环境变量设置， 均在 `/runcoms/zshenv` 文件中。

## Zsh

### .git/config 无法使用 github 同步的问题

由于 .git 文件夹中包含的内容，不用同步到远程，所以 .git/config 关于 submodule 的路径信息也就丢失了。
需要收到添加在别处添加的 submodule 的路径地址。

我现在想到的解决办法是，

把原版的 config 移动到上级目录的 .git-config，然后生成 .git/config 到 ../.git-config 的符号链接。

```zsh
~/.zprezto/.git master                                  22:58:26
❯ mv config ../.git-config

~/.zprezto/.git master ?2                               23:00:22
❯ ln -s ../.git-config config

~/.zprezto/.git master !1 ?2                                                                                                                           23:08:13
❯ ll config
Permissions Size User Date Modified Git Name
lrwxrwxrwx    14 aqua 04-20 23:00    -N config -> ../.git-config
```

