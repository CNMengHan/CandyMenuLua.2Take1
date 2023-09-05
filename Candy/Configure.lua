-- Lib version: V13
local essentials = {}
local key_mapper = {}

local home = utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\"

local menu_keys_to_vk = {
	["NUM5"] = 0x65,
	["RETURN"] = 0x0D,
	["CLEAR"] = 0xC,
	["NUM0"] = 0x60,
	["NUM1"] = 0x61,
	["NUM2"] = 0x62,
	["NUM3"] = 0x63,
	["NUM4"] = 0x64,
	["NUM6"] = 0x66,
	["NUM7"] = 0x67,
	["NUM8"] = 0x68,
	["NUM9"] = 0x69,
	["NUM+"] = 0xBB,
	["NUM-"] = 0xBD,
	["0"] = 0x30,
	["1"] = 0x31,
	["2"] = 0x32,
	["3"] = 0x33,
	["4"] = 0x34,
	["5"] = 0x35,
	["6"] = 0x36,
	["7"] = 0x37,
	["8"] = 0x38,
	["9"] = 0x39,
	["A"] = 0x41,
	["B"] = 0x42,
	["C"] = 0x43,
	["D"] = 0x44,
	["E"] = 0x45,
	["F"] = 0x46,
	["G"] = 0x47,
	["H"] = 0x48,
	["I"] = 0x49,
	["J"] = 0x4A,
	["K"] = 0x4B,
	["L"] = 0x4C,
	["M"] = 0x4D,
	["N"] = 0x4E,
	["O"] = 0x4F,
	["P"] = 0x50,
	["Q"] = 0x51,
	["R"] = 0x52,
	["S"] = 0x53,
	["T"] = 0x54,
	["U"] = 0x55,
	["V"] = 0x56,
	["W"] = 0x57,
	["X"] = 0x58,
	["Y"] = 0x59,
	["Z"] = 0x5A,
	["END"] = 0x23,
	["F1"] = 0x70,
	["F2"] = 0x71,
	["F3"] = 0x72,
	["F4"] = 0x73,
	["F5"] = 0x74,
	["F6"] = 0x75,
	["F7"] = 0x76,
	["F8"] = 0x77,
	["F9"] = 0x78,
	["F10"] = 0x79,
	["F11"] = 0x7A,
	["F12"] = 0x7B,
	["LSHIFT"] = 0xA0,
	["RSHIFT"] = 0xA1,
	["LCONTROL"] = 0xA2,
	["RCONTROL"] = 0xA3,
	["NUMLOCK"] = 0x90,
	["SCROLLLOCK"] = 0x91,
	["BACKSPACE"] = 0x08,
	["TAB"] = 0x09,
	["ALT"] = 0x12,
	["PAUSE"] = 0x13,
	["PRINTSCREEN"] = 0x2C,
	["INSERT"] = 0x2D,
	["DELETE"] = 0x2E,
	["PERIOD"] = 0xBE,
	["COMMA"] = 0xBC,
	["CAPSLOCK"] = 0x14,
	["HOME"] = 0x24,
	["QUESTIONMARK"] = 0xBF,
	["~"] = 0xC0,
	["ESCAPESEQ"] = 0xDC,
	["APOSTROPHE"] = 0xDE,
	["Æ"] = 0x28,
	["Ø"] = 0x27,
	["Å"] = 0x1A

}

function key_mapper.get_virtual_key_of_2take1_bind(bind_name)
	local file = io.open(utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\2Take1Menu.ini")
	if file then
		local Key = file:read("*a")
		file:close()
		if Key then
			Key = Key:match(bind_name.."=([%w_%+]+)\n")
		end
		if Key then
			local keys = {}
			for key in Key:gmatch("([_%w]+)%+?") do
				local Key = -1
				for name, vk in pairs(menu_keys_to_vk) do
					if name:upper() == key:upper() then
						keys[#keys + 1] = menu_keys_to_vk[key:upper()]
						break
					end
				end
			end
			return keys
		end
	end
	return {}
end

function essentials.msg(text, color, notifyOn, duration)
    if type(text) == "string" and math.type(color) == "integer" then
        if notifyOn then
            if math.type(duration) ~= "integer" then
                duration = 3
            end
            menu.notify(text, "历史玩家", duration, color)
        end
    else
        essentials.log_error("Failed to send notification.")
    end
end

function key_mapper.is_table_of_virtual_keys_all_pressed(keys)
	for i = 1, #keys do
		local Key = MenuKey()
		Key:push_vk(keys[i])
		if not Key:is_down_stepped() then
			return false
		end
	end
	return true
end

function key_mapper.do_vk(t, virtual_keys)
	local time = utils.time_ms() + t
	while key_mapper.is_table_of_virtual_keys_all_pressed(virtual_keys) and time > utils.time_ms() do
		system.yield(0)
	end
end

function essentials.get_input(title, default, len, Type)
    if type(title) ~= "string" then
        title = ""
    end
    if type(default) ~= "string" and math.type(default) ~= "integer" then
        default = ""
    end
    if math.type(len) == "integer" and math.type(Type) == "integer" then
        local Keys = key_mapper.get_virtual_key_of_2take1_bind("MenuSelect")
        key_mapper.do_vk(10000, Keys)
        local input_status, text = nil, ""
        repeat
            input_status, text = input.get(title, default, len, Type)
            system.yield(0)
        until input_status ~= 1
        key_mapper.do_vk(10000, Keys)
        if not text or #text:gsub("%s", "") == 0 or input_status == 2 then
            essentials.msg("已取消", 6, true)
            return "", 2
        else
            return text, 0
        end
    else
        essentials.log_error("Failed to get input.", true)
        return "", 2
    end
end

function essentials.file(file, Type, str)
    if io.type(file) == "file" or (type(file) == "string" and Type == "rename") then
        if Type == "close" then
            file:close()
        elseif Type == "read" and type(str) == "string" then
            return file:read(str)
        elseif Type == "flush" then
            file:flush()
        elseif Type == "write" and type(str) == "string" then
            file:write(str)
        elseif Type == "rename" and type(str) == "string" and type(file) == "string" then
            if not tostring(str:match(".+\\(.-)$")):find("[<>:\"/\\|%?%*]") then
                if utils.file_exists(home..file) then
                    local file_string = essentials.get_file_string(file, "*a")
                    io.remove(home..file)
                    local file = io.open(home..str, "w+")
                    essentials.file(file, "write", file_string)
                    essentials.file(file, "flush")
                    essentials.file(file, "close")
                    return true
                else
                    return false 
                end
            else
                return false
            end
        end
    else
        essentials.log_error("Failed to interact with a file.")
    end
end

function essentials.get_ip_in_ipv4(pid)
	local ip = player.get_player_ip(pid)
	return string.format("%i.%i.%i.%i", ip >> 24 & 255, ip >> 16 & 255, ip >> 8 & 255, ip & 255)
end

function essentials.sort_numbers(t)
    table.sort(t, function(a, b) return (tonumber(a:match("[%d]+")) or 0) > (tonumber(b:match("[%d]+")) or 0) end)
    return t
end

function essentials.random_wait(t)
	local t = math.ceil(t)
	if t < 1 then
		t = 1
	end
	if math.random(1, t) == 1 then
		system.yield(0)
	end
end 

function essentials.search_for_match_and_get_line(file_name, search, exact, yield)
    local str = essentials.get_file_string(file_name, "*a")
    if yield then
        for i = 1, #search do
            for line in str:gmatch("([^\n]*)\n?") do
                if search[i] == line or (not exact and line:find(search[i], 1, true)) then
                    return line, search[i]
                end
                essentials.random_wait(500)
            end
        end
    else
        for i = 1, #search do
            for line in str:gmatch("([^\n]*)\n?") do
                if search[i] == line or (not exact and line:find(search[i], 1, true)) then
                    return line, search[i]
                end
            end
        end
    end
end

function essentials.log(file_name, text_to_log, search, exact, yield)
    if search then
        local str = essentials.search_for_match_and_get_line(file_name, search, exact, yield)
        if str then
            return str
        end
    end
    local file = io.open(home..file_name, "a+")
    essentials.file(file, "write", text_to_log.."\n")
    essentials.file(file, "close")
end

function essentials.remove_special(text)
    if type(text) == "string" then
        text = text:gsub("%%", "%%%%")
        text = text:gsub("%[", "%%[")
        text = text:gsub("%]", "%%]")
        text = text:gsub("%(", "%%(")
        text = text:gsub("%)", "%%)")
        text = text:gsub("%-", "%%-")
        text = text:gsub("%+", "%%+")
        text = text:gsub("%?", "%%?")
        text = text:gsub("%*", "%%*")
        text = text:gsub("%^", "%%^")
        text = text:gsub("%$", "%%$")
        text = text:gsub("%.", "%%.")
        return text
    else
        return ""
    end
end

function essentials.get_file_string(path, type, not_wait)
    if utils.file_exists(home..path) then
        local file = io.open(home..path)
        if file then
            local str = essentials.file(file, "read", type) or ""
            essentials.file(file, "close")
            return str
        else
            essentials.log_error("FAILED TO OPEN "..path)
            return ""
        end
    end
    return ""
end

-- Log errors
local last_error_time = 0
local last_error = ""
function essentials.log_error(str, yield)
    if utils.time_ms() > last_error_time and last_error ~= debug.traceback(str, 2) then
        last_error_time = utils.time_ms() + 100
        last_error = debug.traceback(str, 2)
        local file = io.open(home.."2Take1Menu.log", "a+")
        local additional_info = ""
        for i2 = 2, 1000 do
            if pcall(function() 
                return debug.getlocal(i2 + 2, 1)
            end) then
                if i2 == 2 then
                    additional_info = additional_info.."\nLocals triggering the error:\n"
                else
                    additional_info = additional_info.."\nLocals at level "..i2..":\n"
                end
                for i = 1, 200 do
                    local name, value = debug.getlocal(i2, i)
                    if not name then
                        break
                    end
                    if name ~= "(temporary)" then
                        local Type = type(value)
                        if Type == "number" then
                            Type = math.type(value)
                        end
                        additional_info = additional_info .. "	["..name.."] = "..tostring(value):sub(1, 50).." ("..Type..")".."\n"
                    end
                end
            else
                break
            end
        end
        file:write(debug.traceback("["..os.date().."]: "..str.." [zero lua version: "..zero_lua.version.."]", 2)..additional_info)
        file:close()
    end
    if yield then
        system.yield(0)
    end
end

return essentials
