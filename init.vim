" 配置文件导入 "{{{
" ---------------------------------------------------------------------
" 基础使用习惯配置
runtime ./vimrc.vim
" 插件管理
lua require('plugins')
" 按键映射
runtime ./maps.vim
" 主题配置
runtime ./themes.vim


" 需要同步加载的插件配置 "{{{
" ---------------------------------------------------------------------
source ~/.config/nvim/after/plugin/airline.rc.vim
source ~/.config/nvim/after/plugin/defx-icons.rc.vim
"-----输入法  插入模式 ;; 英文/中文切换  ;: 切换 五笔/拼音------
"五笔输入法
source ~/.config/nvim/other/ZFVimIM/wubi/plugin/ZFVimIM_wubi.vim
"拼音输入法
source ~/.config/nvim/other/ZFVimIM/pinyin/plugin/ZFVimIM_pinyin.vim

