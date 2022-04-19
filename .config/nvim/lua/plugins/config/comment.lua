local function config()
  local comment = safe_require 'Comment'
  if not comment then
    return
  end
  comment.setup()
end

return function()
  local comment = {
    'numToStr/Comment.nvim',
    config = config
  }
  return comment
end
