-- Non-plugin based requirements
require "core.keymaps"
require "core.options"

-- Attempts to download lazy, an nvim packagemanager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	-- Clone from git
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath
	})
	-- Check if it errored
	if vim.v.shell_error ~= 0 then
	vim.api.nvim_echo({
	{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
	{ out, "WarningMsg" },
	{ "\nPress any key to exit..." },
	}, true, {})
	vim.fn.getchar()
	os.exit(1)
	end
end

-- Load remaining plugins from lua/plugins
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

