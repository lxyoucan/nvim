" 配置文件导入 "{{{
" ---------------------------------------------------------------------
" 基础使用习惯配置
runtime ./vimrc.vim
" 插件管理
"./lua/plugins.lua
lua require('plugins')
" 按键映射
runtime ./maps.vim
"讲一下文件切换吧,按<leader>+数字切换页面
source ~/.config/nvim/after/plugin/airline.rc.vim
"接下来配置一下主题
"主题的配置文件引一下
source ~/.config/nvim/colors/gruvbox_material.rc.vim
source ~/.config/nvim/after/plugin/defx-icons.rc.vim
"彩虹括号
source ~/.config/nvim/after/plugin/rainbow.rc.vim


