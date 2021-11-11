---@diagnostic disable: undefined-global
--@diagnostic disable: undefined-global
--在没有安装packer的电脑上，自动安装packer插件
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  --fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})	--默认地址
  fn.system(
    {"git", "clone", "--depth", "1", "https://codechina.csdn.net/mirrors/wbthomason/packer.nvim.git", install_path}
  ) --csdn加速镜像
  vim.cmd "packadd packer.nvim"
end
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require("packer").startup(
  {
    function()
      use "wbthomason/packer.nvim"
      -- Packer can manage itself
      use {
        "vim-airline/vim-airline",
        requires = {
          "vim-airline/vim-airline-themes",
          --综合图标支持such vim-airline lightline, vim-startify
          "ryanoasis/vim-devicons"
        }
      }
      use "sainnhe/gruvbox-material"
      --内嵌浮动ranger插件
      use "kevinhwang91/rnvimr"

      -- 文件管理插件，类似与ranger。小孩子才做选择，我都要
      use {
        "Shougo/defx.nvim",
        requires = {
          "kristijanhusak/defx-icons", -- dexf文件管理图标支持
          "t9md/vim-choosewin" -- 窗口选择器,可以让defx使用i打开文件
        }
      }
      --Nvim LSP 客户端的快速入门配置
      use "neovim/nvim-lspconfig"
      use {
        "hrsh7th/nvim-cmp",
        requires = {
          "hrsh7th/cmp-nvim-lsp", --neovim 内置 LSP 客户端的 nvim-cmp 源
          --以下插件可选，可以根据个人喜好删减
          "onsails/lspkind-nvim", --美化自动完成提示信息
          "hrsh7th/cmp-buffer", --从buffer中智能提示
          --"hrsh7th/cmp-nvim-lua", --nvim-cmp source for neovim Lua API.
          --"octaltree/cmp-look", --用于完成英语单词
          "hrsh7th/cmp-path" --自动提示硬盘上的文件
          --"hrsh7th/cmp-calc", --输入数学算式（如1+1=）自动计算
          --"f3fora/cmp-spell", --nvim-cmp 的拼写源基于 vim 的拼写建议
          --"hrsh7th/cmp-emoji", --输入: 可以显示表情
        }
      }

      -- 代码段提示
      use {
        "L3MON4D3/LuaSnip",
        requires = {
          "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
          "rafamadriz/friendly-snippets" --代码段合集
        }
      }

      --markdown预览插件
      use "iamcco/markdown-preview.nvim"
      use "kabouzeid/nvim-lspinstall"
      -- 自动为尚不支持 Neovim 0.5 内置 lsp 客户端的配色方案创建缺少的 LSP 诊断突出显示组。
      use "folke/lsp-colors.nvim"
      -- 基于neovim 内置lsp 的轻量级lsp 插件，具有高性能UI。非常酷
      use "rinx/lspsaga.nvim"

      -- 显示css的颜色代码的颜色
      use "ap/vim-css-color"
      -- 符号自动匹配，比如：输入(自动闭合）
      use "windwp/nvim-autopairs"
      --代码格式化工具，主要用于lua语法格式化
      use "mhartington/formatter.nvim"
      -- 文件搜索 预览 等
      use {
        "nvim-telescope/telescope.nvim",
        requires = {
          "nvim-lua/plenary.nvim",
          "kyazdani42/nvim-web-devicons"
        }
      }
      -- 加速文件搜索速度,如果安装失败需要到插件目录执行make命令手动编译
      -- 用了这个插件以后，貌似更快了(感觉输入更跟手了，可能是心理作用)。但是对于我的小项目感受不是很明显
      use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
      --语法高亮
      use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
      }
      --彩虹括号
      use "luochen1990/rainbow"
      --注释插件
      use "b3nj5m1n/kommentary"
      --jsx注释
      use "JoosepAlviste/nvim-ts-context-commentstring"
    end,
    config = {
      max_jobs = 16,
      git = {
        --修改这里可以切换加速的节点
        default_url_format = "https://hub.fastgit.org/%s"
      },
      display = {
        open_fn = function()
          return require("packer.util").float({border = "single"})
        end
      }
    }
  }
)
