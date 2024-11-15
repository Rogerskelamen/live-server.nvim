<div align="center">

# Live server for NeoVim in Lua

<h4>
    Little development server with live reload capability.<br>
</h4>
<h6>
    Original project: manzeloth/live-server
</h6>

[![GitHub](https://img.shields.io/badge/by-Rogerskelamen-blue)](https://github.com/Rogerskelamen)
[![npm](https://img.shields.io/badge/npm-live%20server-red)](https://www.npmjs.com/package/live-server)

</div>


## Installation

Install [nodejs](https://nodejs.org/en/download/) and [live-server](https://www.npmjs.com/package/live-server) npm package globally. Make sure you have npm in your `PATH`.

For [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
-- Live Server
use {
  "Rogerskelamen/live-server.nvim",
  config = true
}
```

## Usage

Type `:LiveServer start` to open a new instance of live-server in your web browser.

Type `:LiveServer stop` to close all instances of live-server.

## Credits

All credits goes to Tapio Vierros. This unofficial plugin uses [Live Server](https://www.npmjs.com/package/live-server) which is under the MIT License.
