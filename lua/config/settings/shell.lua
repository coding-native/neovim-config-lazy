--- Check if dev is using Microsoft Sad Time OS
---@return boolean is_windows
local function is_windows()
    return vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
end

---@param type string
function set_shell(type)
    if type ~= "bash" and type ~= "zsh" and type ~= "powershell" then
        vim.notify("Unsupported shell type: " .. type, vim.log.levels.ERROR)
        return
    end

    if is_windows() and (type == "bash" or type == "zsh") then
        vim.notify("Bash and Zsh are not natively supported on Windows.", vim.log.levels.WARN)
        return
    end

    if type == "bash" then
        vim.cmd([[
          set shell=bash
          set shellcmdflag=-c
          set shellquote=\"
          set shellxquote=
        ]])
    elseif type == "zsh" then
        vim.cmd([[
          set shell=zsh
          set shellcmdflag=-c
          set shellquote=\"
          set shellxquote=
        ]])
    elseif type == "powershell" then
        vim.cmd([[
          set shell=powershell
          set shellcmdflag=-command
          set shellquote=\"
          set shellxquote=
        ]])
    end
end

-- Uncomment one of the following lines to set your preferred shell
-- I prefer zsh personally...

--set_shell("bash")
--set_shell("powershell")
set_shell("zsh")
