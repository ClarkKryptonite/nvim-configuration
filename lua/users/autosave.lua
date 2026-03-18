local M = {}

-- 定义状态文件保存路径
local state_file = vim.fn.stdpath("data") .. "/autosave_setting"

-- 函数：从文件读取状态
local function load_state()
    local f = io.open(state_file, "r")
    if f then
        local content = f:read("*all")
        f:close()
        return content == "true"
    end
    return false -- 默认初始状态
end

-- 函数：保存状态到文件
local function save_state(value)
    local f = io.open(state_file, "w")
    if f then
        f:write(tostring(value))
        f:close()
    end
end

-- 初始化：从本地文件加载状态
vim.g.Autosave_enabled = load_state()

local autosave_group = vim.api.nvim_create_augroup("CustomAutosave", { clear = true })
local permanent_extensions = { "txt", "md" }

vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
    group = autosave_group,
    pattern = "*",
    callback = function()
        if not vim.bo.modified or vim.bo.buftype ~= "" then
            return
        end

        local extension = vim.fn.expand("%:e")
        local is_permanent = vim.tbl_contains(permanent_extensions, extension)

        if vim.g.Autosave_enabled or is_permanent then
            vim.cmd("silent! write")
        end
    end,
})

-- 修改切换命令：切换时同步写入文件
vim.api.nvim_create_user_command("AutosaveToggle", function()
    vim.g.Autosave_enabled = not vim.g.Autosave_enabled
    
    -- 【核心修改】立即持久化到硬盘文件
    save_state(vim.g.Autosave_enabled)
    
    vim.cmd("redrawstatus")

    local msg, level
    if vim.g.Autosave_enabled then
        msg = "自动保存：全格式模式 (ALL)"
        level = vim.log.levels.INFO
    else
        msg = "自动保存：仅限文档模式 (TXT/MD)"
        level = vim.log.levels.WARN
    end
    vim.notify(msg, level, { title = "Autosave" })
end, {})

function M.get_status()
    if vim.g.Autosave_enabled then
        return "💾 AS:ALL"
    else
        return "📝 AS:DOC"
    end
end

return M
