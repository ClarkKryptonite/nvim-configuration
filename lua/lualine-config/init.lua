local autosave = require("users.autosave")

require("lualine").setup({
	options = {
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
			"diagnostics",
		},
		lualine_c = { "filename" },

		-- 我们通常把这种状态显示放在右侧的 lualine_x 组
		lualine_x = {
			-- 插入自动保存组件
			{
				function()
					return autosave.get_status()
				end,
				color = function()
					-- 颜色逻辑：开启时用绿色，关闭时用灰色
					return { fg = vim.g.Autosave_enabled and "#98be65" or "#ff8800" }
				end,
			},
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
