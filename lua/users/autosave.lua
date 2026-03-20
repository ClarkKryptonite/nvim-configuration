local M = {}

-----------------------------------------------------------
-- 基础配置与状态持久化
-----------------------------------------------------------
local state_file = vim.fn.stdpath("data") .. "/autosave_setting"

local function load_state()
    local f = io.open(state_file, "r")
    if f then
        local content = f:read("*all")
        f:close()
        return content == "true"
    end
    return false
end

local function save_state(value)
    local f = io.open(state_file, "w")
    if f then
        f:write(tostring(value))
        f:close()
    end
end

vim.g.Autosave_enabled = load_state()
local autosave_group = vim.api.nvim_create_augroup("CustomAutosave", { clear = true })
local permanent_extensions = { "txt", "md" }

-----------------------------------------------------------
-- 核心逻辑：保存判定
-----------------------------------------------------------
local function should_save()
    -- 仅当 buffer 被修改、非特殊类型 buffer (如 terminal, quickfix) 时保存
    if not vim.api.nvim_buf_get_option(0, "modified") or vim.bo.buftype ~= "" then
        return false
    end

    local extension = vim.fn.expand("%:e")
    local is_permanent = vim.tbl_contains(permanent_extensions, extension)

    -- 如果全局开关开启，或者属于永久保存后缀，则允许保存
    return vim.g.Autosave_enabled or is_permanent
end

local function do_save()
    if should_save() then
        -- 使用 schedule 确保在安全的上下文执行 cmd
        vim.schedule(function()
            -- 再次检查 modified 状态，防止冗余写入
            if vim.api.nvim_buf_get_option(0, "modified") then
                vim.cmd("silent! write")
            end
        end)
    end
end

-----------------------------------------------------------
-- 保存策略：立即保存 vs 防抖保存
-----------------------------------------------------------
local save_timer = nil

-- 1. 立即保存函数 (用于 TextChanged, InsertLeave)
local function instant_save()
    if save_timer then
        save_timer:stop()
        save_timer = nil
    end
    do_save()
end

-- 2. 防抖保存函数 (用于 TextChangedI)
local function debounced_save()
    if save_timer then
        save_timer:stop()
    end

    save_timer = vim.defer_fn(function()
        save_timer = nil
        do_save()
    end, 1000) -- 插入模式下 1000ms 停顿后保存
end

-----------------------------------------------------------
-- 事件监听绑定
-----------------------------------------------------------

-- 策略 A: 插入模式下的变动 -> 防抖处理
vim.api.nvim_create_autocmd({ "TextChangedI" }, {
    group = autosave_group,
    pattern = "*",
    callback = function()
        debounced_save()
    end,
})

-- 策略 B: 普通模式变动 或 退出插入模式 -> 立即处理
vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
    group = autosave_group,
    pattern = "*",
    callback = function()
        instant_save()
    end,
})

-----------------------------------------------------------
-- 用户命令与状态显示
-----------------------------------------------------------
vim.api.nvim_create_user_command("AutosaveToggle", function()
    vim.g.Autosave_enabled = not vim.g.Autosave_enabled
    save_state(vim.g.Autosave_enabled)
    vim.cmd("redrawstatus")

    local msg = vim.g.Autosave_enabled and "自动保存：全格式模式 (ALL)"
        or "自动保存：仅限文档模式 (TXT/MD)"
    local level = vim.g.Autosave_enabled and vim.log.levels.INFO or vim.log.levels.WARN
    vim.notify(msg, level, { title = "Autosave" })
end, {})

function M.get_status()
    return vim.g.Autosave_enabled and "💾 AS:ALL" or "📝 AS:DOC"
end

return M
