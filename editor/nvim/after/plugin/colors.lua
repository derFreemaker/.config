local function load_color_scheme(color)
	color = color or "tokyonight-storm"
	vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

load_color_scheme()

