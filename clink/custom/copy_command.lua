-- Helper to trim leading/trailing whitespace and surrounding quotes
local function clean_arg(str)
  if not str then return "" end
  str = str:match("^%s*(.-)%s*$")
  str = str:match('^"(.-)"$') or str
  return str
end

-- Intercept 'copyfile' and 'copypath' when typed in CMD
local function handle_copy_commands(line)
  -- 1. copyfile <filepath>
  if line:match("^%s*copyfile%s*$") or line:match("^%s*copyfile%s+.+$") then
    local file_arg = clean_arg(line:match("^%s*copyfile%s*(.*)$"))
    if file_arg == "" then
      print("Usage: copyfile <file>")
      return "", false
    end

    local file = io.open(file_arg, "rb")
    if not file then
      print("Error: '" .. file_arg .. "' is not a valid file.")
      return "", false
    end
    local content = file:read("*a")
    file:close()

    os.setclipboardtext(content)
    print("'" .. file_arg .. "' copied to clipboard.")
    return "", false
  end

  -- 2. copypath [optional_file_or_dir]
  if line:match("^%s*copypath%s*$") or line:match("^%s*copypath%s+.+$") then
    local path_arg = clean_arg(line:match("^%s*copypath%s*(.*)$"))
    local target = (path_arg ~= "") and path_arg or "."
    local fullpath = os.getfullpathname(target)

    os.setclipboardtext(fullpath)
    print(fullpath .. " copied to clipboard.")
    return "", false
  end
end

if clink.onfilterinput then
  clink.onfilterinput(handle_copy_commands)
end

-- 3. Global function for copybuffer (copies current typed command line)
function copy_current_buffer(rl_buffer)
  local text = rl_buffer:getbuffer()
  if text and text ~= "" then
    os.setclipboardtext(text)
  end
end

rl.describemacro("luafunc:copy_current_buffer", "Copy current command buffer to clipboard")

-- Highlight copyfile, copypath, and copybuffer as valid commands (not red)
local custom_cmds = {
  copyfile = true,
  copypath = true,
}

local classifier = clink.classifier(1)
function classifier:classify(commands)
  local cmd_color = settings.get("color.cmd") or "bold"
  for _, command in ipairs(commands) do
    local info = command.line_state:getwordinfo(1)
    if info then
      local word = command.line_state:getword(1):lower()
      if custom_cmds[word] then
        command.classifications:applycolor(info.offset, info.length, cmd_color, true)
      end
    end
  end
end

-- Enable Tab file/folder completion for copyfile and copypath
clink.argmatcher("copyfile"):addarg(clink.filematches)
clink.argmatcher("copypath"):addarg(clink.filematches)
