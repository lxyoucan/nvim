
local status, formatter = pcall(require, "formatter")
if (not status) then
  return
end
formatter.setup(
  {
    filetype = {
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      sql = {
        -- sqlformat
        -- 安装方法:pip3 install --upgrade sqlparse
        function()
          return {
            exe = "sqlformat",
            -- upper|lower
            args = {"-k", "lower", "-i", "lower", "-r", "-"},
            stdin = true
          }
        end
      }
    }
  }
)

--配置保存文件自动格式化代码
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.rs,*.lua FormatWrite
augroup END
]],
  true
)

