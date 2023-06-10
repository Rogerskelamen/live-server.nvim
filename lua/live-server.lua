-- Title:        Live Server
-- Description:  Little development server with live reload capability.
-- Last Change:  09 June 2023
-- Maintainer:   Rogerskelamen <https://github.com/Rogerskelamen>
-- Credits:      <https://www.npmjs.com/package/live-server> (MIT License) Copyright (c) 2012 Tapio Vierros

-- functions to call live-server npm package
local function LiveServer(opts)
  -- starts live-server in a new buffer in the background
  if opts.fargs[1] == "start" then
    vim.cmd [[
      tabe
      term live-server
      tabclose
    ]]
    print("Started a new live-server (npm) instance.")
  -- delete all buffers running live-server
  elseif opts.fargs[1] == "stop" then
    local buffers = {}
    for _, buf in pairs(vim.api.nvim_list_bufs()) do
      if string.find(vim.api.nvim_buf_get_name(buf), "^term.*live%-server$") then
        table.insert(buffers, buf)
      end
    end
    if next(buffers) ~= nil then
      for _, buf in pairs(buffers) do
        vim.api.nvim_buf_delete(buf, { force = true })
      end
      print("Stopped all live-server instances (npm).")
    end
  else
    print("Enter a valid argument: start/stop.")
  end
end

-- define user command
vim.api.nvim_create_user_command('LiveServer',
  LiveServer,
  {
    nargs = 1,
    complete = function (ArgLead, CmdLine, CursorPos)
      -- return completion candidates as a list-like table
      return { "start", "stop" }
    end,
  }
)