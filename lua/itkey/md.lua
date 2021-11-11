local auto_select = {}
--向上查找关键字 return {行号,字符开始,字符结束}
function auto_select.findUp(keyword)
  return auto_select.findFirstStr(keyword, -1)
end
--向上查找关键字 return {行号,字符开始,字符结束}
function auto_select.findDown(keyword)
  return auto_select.findFirstStr(keyword, 1)
end
--查找字符第一次出现的位置
--@param keyword 查询的关键字
--@param upOrDown -1|1  -1向上或1向下查询字符
function auto_select.findFirstStr(keyword, upOrDown)
  local buff = vim.api.nvim_get_current_buf
  local a = vim.api
  --最大行数
  local line_count = vim.inspect(a.nvim_buf_line_count(buff))
  line_count = tonumber(line_count)
  --获取光标位置
  local lineCursor = a.nvim_win_get_cursor(0)[1]
  local line = lineCursor
  local isFind = false
  --获取指定行的值string
  local function getline(line_num)
    local result
    if line_num >= 1 and line_num <= line_count then
      result = a.nvim_buf_get_lines(nil, line_num - 1, line_num, true)
      result = result[1]
    end
    return result
  end
  while isFind == false do
    local result = getline(line)
    if result == nil then
      result = ""
    end
    local start, _ = string.find(result, keyword)
    if start ~= nil then
      return {line, start}
    end
    --向下找,如果找到文章末尾没有找到;就默认最后一行为结尾
    if upOrDown == 1 and line >= line_count then
      return {line, #result}
    end
    --向上找,如果找到文章末尾没有找到;就默认最后一行为结尾
    if upOrDown == -1 and line <= 0 then
      return {1, 0}
    end
    line = line + upOrDown
  end
end
--自动根据开始结束位置v模式选择
function auto_select.v(startCursor, endCursor)
  --设置光标开始位置
  vim.api.nvim_win_set_cursor(0, startCursor)
  --选中SQL
  vim.fn.feedkeys("0v" .. endCursor[1] .. "G")
  --横向坐标>0才移动
  if endCursor[2] > 0 then
    vim.fn.feedkeys(endCursor[2] .. "l")
  end
end
function auto_select.markdownV()
  local keyword = "```"
  local lineCursor = vim.api.nvim_win_get_cursor(0)[1]
  local lineString = vim.api.nvim_buf_get_lines(nil, lineCursor - 1, lineCursor, true)[1]
  --如果当前行本就有```,则判断字符长度是否超过3,来判断是开始点还是结束点
  local start, _ = string.find(lineString, keyword)
  if start ~= nil then
    if #lineString > 3 then
      vim.api.nvim_win_set_cursor(0, {lineCursor + 1, 1})
    else
      vim.api.nvim_win_set_cursor(0, {lineCursor - 1, 1})
    end
  end
  local startCursor = auto_select.findUp(keyword)
  local endCursor = auto_select.findDown(keyword)
  --markdown不考虑```与内容在同一行的情况,只选中间部分
  auto_select.v({startCursor[1] + 1, 0}, {endCursor[1] - 1, 0})
  vim.fn.feedkeys("$")
end
--复制markdown的代码块
function auto_select.markdownCopyPlus()
  auto_select.markdownV()
  vim.fn.feedkeys('"+y')
end
--auto_select.markdownCopyPlus()
return auto_select
