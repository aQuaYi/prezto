# 我的自定义插件

想要直接导入这个目录下的插件，需要在 `runcoms/zpreztorc` 文件中，添加一行

```zsh
zstyle ':prezto:load' pmodule-dirs $ZPREZTODIR/plugins
```

为了避免命名冲突和便于管理，我会在我定制的插件前面添加 `a-` 前缀。

## bindkey 键位

- ALT-C: '\ec'
- CTRL-T: '^T'
