
return function()
  local comment = {
    'numToStr/Comment.nvim',
    config = function()
      local plugin = safe_require 'Comment'
      if not plugin then
        return
      end

      plugin.setup()

    end
  }
  return comment
end
