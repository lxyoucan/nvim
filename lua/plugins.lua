---@diagnostic disable: undefined-global
-- Only required if you have packer configured as `opt`
require('auto-install-packer')
vim.cmd [[packadd packer.nvim]]
return require('packer').startup({
	function()
		use 'wbthomason/packer.nvim'-- Packer can manage itself
		--主题
		use 'sainnhe/gruvbox-material'
		-- 飞机线美化
		use {
			'vim-airline/vim-airline',
			requires = {
				'vim-airline/vim-airline-themes',
				--综合图标支持such vim-airline lightline, vim-startify
				'ryanoasis/vim-devicons'
			}
		}
		-- Collection of configurations for built-in LSP client
		use {
			'neovim/nvim-lspconfig',
			requires = {
				-- 自动为尚不支持 Neovim 0.5 内置 lsp 客户端的配色方案创建缺少的 LSP 诊断突出显示组。
				'folke/lsp-colors.nvim',
				-- 基于neovim 内置lsp 的轻量级lsp 插件，具有高性能UI。非常酷
				'glepnir/lspsaga.nvim'
			}
		}
		-- 自动完成
		use {
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-buffer", 			--从buffer中智能提示
				"hrsh7th/cmp-nvim-lsp",			--neovim 内置 LSP 客户端的 nvim-cmp 源
				'hrsh7th/cmp-nvim-lua',			--nvim-cmp source for neovim Lua API.
				'octaltree/cmp-look',			--用于完成英语单词
				'hrsh7th/cmp-path',				--自动提示硬盘上的文件
				'hrsh7th/cmp-calc',				--输入数学算式（如1+1=）自动计算
				'f3fora/cmp-spell', 			--nvim-cmp 的拼写源基于 vim 的拼写建议
				'hrsh7th/cmp-emoji',			--输入: 可以显示表情
				'onsails/lspkind-nvim'			--美化自动完成提示信息
			}
		}
		-- 代码段提示
		use {
			'L3MON4D3/LuaSnip',
			requires = {
				'saadparwaiz1/cmp_luasnip', 	-- Snippets source for nvim-cmp
				'rafamadriz/friendly-snippets' 	--代码段合集
			}
		}
		-- 文件管理插件，类似与ranger。小孩子才做选择，我都要
		use {
			'Shougo/defx.nvim',
			requires = {
				'kristijanhusak/defx-icons', 	-- dexf文件管理图标支持
				't9md/vim-choosewin'			-- 窗口选择器,可以让defx使用i打开文件
			}
		}
		-- 文件搜索 预览 等
		use {
			'nvim-telescope/telescope.nvim',
			requires = {
				'nvim-lua/plenary.nvim',
				'kyazdani42/nvim-web-devicons'
			}
		}
		use 'lxyoucan/bufexplorer'				-- 缓冲区文件管理器
		--内嵌浮动ranger插件
		use 'kevinhwang91/rnvimr'
		-- 显示css的颜色代码的颜色
		use 'ap/vim-css-color'
		-- 符号自动匹配，比如：输入(自动闭合）
		use 'windwp/nvim-autopairs'
		-- vim输入法
		use 'ZSaberLv0/ZFVimIM'--可选, 用于提升词库加载性能
		use 'ZSaberLv0/ZFVimJob'--可选，百度云输入法，打热门词有用

	end,
	config = {
		max_jobs = 16,
		git = {
			default_url_format = 'https://hub.fastgit.org/%s'
		},
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'single' })
			end
		}
	}
})
