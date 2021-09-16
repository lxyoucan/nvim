"主题配置,下面只保留一个没注释的
"NeoSolarized|gruvbox|gruvbox_material
"let themeName = "NeoSolarized"
"let themeName = "gruvbox"
let themeName = "gruvbox_material"

if themeName == "NeoSolarized"
	runtime ./colors/NeoSolarized.rc.vim
endif
if themeName == "gruvbox"
	runtime ./colors/gruvbox.rc.vim
endif
if themeName == "gruvbox_material"
	runtime ./colors/gruvbox_material.rc.vim
endif
