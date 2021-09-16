# nvim

#### 介绍
How to set up Neovim 0.5 +(LSP, Treesitter, fuzzy finder, etc)
国内网络加速，解决github访问慢的问题

1. typescript自动补全支持
2. lua自动补全支持
3. 界面ui美化，图标显示
4. 文件管理器
5. 文件搜索
6. ...

#### 软件架构
需要Neovim 0.5 +版本

#### 安装教程
```shell
git clone --depth 1 https://gitee.com/lxyoucan/nvim.git ~/.config/nvim
```
~/.config/nvim/lsp目录中保存的zip需要手动解压。

##### 手动安装packer
默认会自动安装，如果packer没有安装成功，可以尝试下面的命令手动安装
```shell
git clone --depth 1 https://hub.fastgit.org/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
首次使用需要安装插件
分别在`:`命令模式执行以下命令
```shell
:PackerInstall
:PackerCompile
```

##### LSP
typescript
```shell
npm i -g typescript typescript-language-server
#或者
yarn global add typescript typescript-language-server
```
#### 使用说明
空格键=`<leader>`

1. sf文件管理器
2. sr浮动打开ranger
3. `<leader>` ff 文件搜索
4. `<leader>` f 代码格式化
5. `<leader>` j 代码建议
6. `<leader>` rn 变量修改名称

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request


#### 特技

博客  [https://blog.csdn.net/lxyoucan](https://blog.csdn.net/lxyoucan) 
