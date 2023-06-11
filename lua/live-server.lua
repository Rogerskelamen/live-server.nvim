-- Title:        Live Server
-- Description:  Little development server with live reload capability.
-- Last Change:  09 June 2023
-- Maintainer:   Rogerskelamen <https://github.com/Rogerskelamen>
-- Credits:      <https://www.npmjs.com/package/live-server> (MIT License) Copyright (c) 2012 Tapio Vierros

local M = {}
local api = vim.api

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
    for _, bufnr in pairs(api.nvim_list_bufs()) do
      if string.find(api.nvim_buf_get_name(bufnr), "^term.*live%-server$") then
        table.insert(buffers, bufnr)
      end
    end
    if next(buffers) ~= nil then
      for _, bufnr in pairs(buffers) do
        api.nvim_buf_delete(bufnr, { force = true })
      end
      print("Stopped all live-server instances (npm).")
    end
  else
    print("Enter a valid argument: start/stop.")
  end
end

-- setup program
function M.setup(opts)
  -- define user command
  vim.api.nvim_create_user_command('LiveServer',
    LiveServer,
    {
      nargs = 1,
      complete = function(ArgLead, CmdLine, CursorPos)
        -- return completion candidates as a list-like table
        return { "start", "stop" }
      end,
    }
  )
end

return M
