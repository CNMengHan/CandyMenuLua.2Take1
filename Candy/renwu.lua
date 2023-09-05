if menu.is_trusted_mode_enabled() then
  audio.play_sound_from_coord(-1, "Hack_Success", player.get_player_coords(player.player_id()), "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", false, 0, true)
  menu.notify("\228\189\156\232\128\133: jhowkNx\n\230\177\137\229\140\150\232\128\133:czm180#4644,QQ:1807219610\n\n\231\137\136\230\156\172\229\143\183: v2.22.0\n\230\155\180\230\150\176\228\186\1422022.6.18", "\230\172\162\232\191\142\228\189\191\231\148\168\228\187\187\229\138\161\232\132\154\230\156\172", 7, 1342202900)
  menu.notify("* \230\131\179\229\134\141\229\185\178\229\144\140\228\184\128\228\184\170\230\138\162\229\138\171?\n\t\231\173\13716\229\136\134\233\146\159\229\134\141\233\135\141\229\164\141\229\144\167,\229\147\165\228\187\172,\229\164\170\229\191\171\228\184\141\230\152\175\229\149\165\229\165\189\228\186\139\n* \232\174\176\229\190\151\230\138\138\228\187\187\229\138\161\229\134\133\231\154\132\231\142\169\229\174\182\229\138\160\229\136\176\231\153\189\229\144\141\229\141\149\229\151\183\n* \232\175\183\229\133\179\233\151\173\228\191\157\230\138\164\229\146\140\232\153\154\229\129\135\228\191\161\230\129\175\n* \228\189\191\231\148\168\230\173\164\232\132\154\230\156\172\230\151\182\232\175\183\228\191\157\230\140\129\229\174\137\229\133\168\230\168\161\229\188\143\230\191\128\230\180\187", "\228\187\187\229\138\161\232\132\154\230\156\172\229\176\143\230\143\144\231\164\186", 10, 1342202900)
  menu.notify("\229\166\130\228\187\152\232\180\185\232\180\173\228\185\176\232\175\183\229\164\167\232\130\134\229\174\163\228\188\160\229\156\136\231\139\151\229\141\150\229\174\182\231\154\132\230\173\187\229\166\136\232\161\140\228\184\186\n\229\166\136\228\186\134\228\184\170\233\128\188\231\154\132\232\135\173\229\156\136\231\139\151\n\228\189\160\233\130\163\228\184\170\230\151\169\230\173\187\231\154\132\228\186\178\229\166\136\230\152\175\228\184\141\230\152\175\231\188\186\228\186\134\230\163\186\230\157\144\233\146\177\229\149\138?", "\230\156\172\232\132\154\230\156\172\229\174\140\229\133\168\229\133\141\232\180\185", 18, 255)
else
  if not menu.is_trusted_mode_enabled() then
    menu.notify("\232\175\183\230\137\147\229\188\128lua\232\132\154\230\156\172\229\134\133\231\154\132\228\191\161\228\187\187\230\168\161\229\188\143(\229\174\137\229\133\168\230\168\161\229\188\143)\228\187\165\228\189\191\232\132\154\230\156\172\230\173\163\231\161\174\229\156\176\232\191\144\232\161\140", "\232\173\166\229\145\138", 8, 1679093950)
    menu.notify("\229\166\130\228\187\152\232\180\185\232\180\173\228\185\176\232\175\183\229\164\167\232\130\134\229\174\163\228\188\160\229\156\136\231\139\151\229\141\150\229\174\182\231\154\132\230\173\187\229\166\136\232\161\140\228\184\186\n\229\166\136\228\186\134\228\184\170\233\128\188\231\154\132\232\135\173\229\156\136\231\139\151\n\228\189\160\233\130\163\228\184\170\230\151\169\230\173\187\231\154\132\228\186\178\229\166\136\230\152\175\228\184\141\230\152\175\231\188\186\228\186\134\230\163\186\230\157\144\233\146\177\229\149\138?", "\230\156\172\232\132\154\230\156\172\229\174\140\229\133\168\229\133\141\232\180\185", 18, 4278190335)
  end
  return
end
if Heist_Control then
  return menu.notify("\229\183\178\230\156\137\228\187\187\229\138\161\232\132\154\230\156\172\229\138\160\232\189\189.", "\228\187\187\229\138\161\232\132\154\230\156\172", 10, 1350057080)
end
local stat_set_int = function(hash, prefix, value, save)
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
local stat_set_bool = function(hash, prefix, value, save)
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
local ID = native.call(-2879672645410256730, 0):__tonumber()
function GTAO_USER_MP()
  MP_ = stats.stat_get_int(gameplay.get_hash_key("MPPLY_LAST_MP_CHAR"), 1)
  return tostring(MP_)
end
local CharID = "" .. GTAO_USER_MP()
local PlayerMP = "MP" .. GTAO_USER_MP()
Heist_Control = "Heist Control v1.22.0"
local Heist_Control = job_option
local PERICO_HEIST = menu.add_feature("\228\189\169\233\135\140\231\167\145\229\178\155", "parent", Heist_Control.id)
local CAYO_AUTO_PRST = menu.add_feature("\232\135\170\229\138\168\233\162\132\232\174\190", "parent", PERICO_HEIST.id, function()
  menu.notify("* \229\191\133\233\161\187\229\156\168\232\153\142\233\178\184\229\164\150\230\136\150\228\184\187\231\148\178\230\157\191\228\184\173\233\128\137\230\139\169\233\162\132\232\174\190\n* \230\138\162\229\138\171\229\174\140\230\136\144\228\185\139\229\144\142\229\134\141\229\133\179\233\151\173\233\128\137\233\161\185", "\230\179\168\230\132\143\228\186\139\233\161\185", 6, 1343503610)
end)
local NON_EVENT = menu.add_feature("\229\184\184\231\148\168\233\162\132\232\174\190[250\228\184\135]", "parent", CAYO_AUTO_PRST.id)
local AUTOMATED_SOLO = menu.add_feature("\229\141\149\228\186\186\230\184\184\231\142\169(240\228\184\135)", "parent", NON_EVENT.id)
local AUTOMATED_2P = menu.add_feature("\229\143\140\228\186\186\230\184\184\231\142\169(240\228\184\135)", "parent", NON_EVENT.id)
local AUTOMATED_3P = menu.add_feature("\228\184\137\228\186\186\230\184\184\231\142\169(240\228\184\135)", "parent", NON_EVENT.id)
local AUTOMATED_4P = menu.add_feature("\229\155\155\228\186\186\230\184\184\231\142\169(240\228\184\135)", "parent", NON_EVENT.id)
local QUICK_PRST = menu.add_feature("[1-4\228\186\186]\229\191\171\233\128\159\233\162\132\232\174\190(250\228\184\135)", "parent", NON_EVENT.id)
local WEEKLY_PRESET = menu.add_feature("\230\175\143\229\145\168\230\180\187\229\138\168\233\162\132\232\174\190[410\228\184\135]", "parent", CAYO_AUTO_PRST.id, function()
  menu.notify(": \230\175\143\229\145\168\230\180\187\229\138\168\233\162\132\232\174\190\229\143\170\232\131\189\229\156\168Rockstar\230\191\128\230\180\187\230\175\143\229\145\168\230\180\187\229\138\168\230\151\182\228\189\191\231\148\168\n\n\228\189\191\231\148\168\229\137\141\232\175\183\231\161\174\228\191\157\230\180\187\229\138\168\229\183\178\230\191\128\230\180\187,\229\144\166\229\136\153\230\156\137\229\176\129\229\143\183\233\163\142\233\153\169\n\230\181\143\232\167\136:\nwww.rockstargames.com/newswire\228\187\165\232\142\183\229\190\151\231\155\184\229\133\179\228\191\161\230\129\175", "", 6, 1357971220)
end)
local WEEKLY_SOLO = menu.add_feature("\229\141\149\228\186\186\230\184\184\231\142\169(410\228\184\135)", "parent", WEEKLY_PRESET.id)
local WEEKLY_F2 = menu.add_feature("\229\143\140\228\186\186\230\184\184\231\142\169(410\228\184\135)", "parent", WEEKLY_PRESET.id)
local WEEKLY_F3 = menu.add_feature("\228\184\137\228\186\186\230\184\184\231\142\169(410\228\184\135)", "parent", WEEKLY_PRESET.id)
local WEEKLY_F4 = menu.add_feature("\229\155\155\228\186\186\230\184\184\231\142\169(410\228\184\135)", "parent", WEEKLY_PRESET.id)
local TELEPORT = menu.add_feature("\228\189\169\233\135\140\231\167\145\229\178\155\228\188\160\233\128\129\233\128\137\233\161\185", "parent", PERICO_HEIST.id)
local TELEPORT_QL = menu.add_feature("\229\191\171\233\128\159\228\188\160\233\128\129", "parent", TELEPORT.id)
local TELEPORTLOOT = menu.add_feature("\229\178\155\229\177\191\230\136\152\229\136\169\229\147\129", "parent", TELEPORT.id)
local TELEPORTMANSIONO = menu.add_feature("\232\177\170\229\174\133\229\164\150\233\131\168", "parent", TELEPORT.id)
local TELEPORTMANSIONI = menu.add_feature("\232\177\170\229\174\133\229\134\133\233\131\168", "parent", TELEPORT.id)
local TELEPORTCHESTS = menu.add_feature("\229\174\157\231\174\177", "parent", TELEPORT.id)
local PERICO_ADV = menu.add_feature("\233\171\152\231\186\167\233\128\137\233\161\185", "parent", PERICO_HEIST.id)
local HSCUT_CP = menu.add_feature("\231\142\169\229\174\182\229\136\134\231\186\162", "parent", PERICO_ADV.id, function()
  menu.notify("\230\179\168\230\132\143\228\186\139\233\161\185: \233\171\152\231\153\190\229\136\134\230\175\148\229\136\134\231\186\162\229\143\175\232\131\189\229\175\188\232\135\180\228\184\141\229\136\176\232\180\166", "", 5, 1679094015)
end)
local PERICO_HOST_CUT = menu.add_feature("\228\189\160\231\154\132\229\136\134\231\186\162", "parent", HSCUT_CP.id)
local PERICO_P2_CUT = menu.add_feature("\231\142\169\229\174\1822\229\136\134\231\186\162", "parent", HSCUT_CP.id)
local PERICO_P3_CUT = menu.add_feature("\231\142\169\229\174\1823\229\136\134\231\186\162", "parent", HSCUT_CP.id)
local PERICO_P4_CUT = menu.add_feature("\231\142\169\229\174\1824\229\136\134\231\186\162", "parent", HSCUT_CP.id)
local CAYO_BAG = menu.add_feature("\228\184\138\229\178\155\232\131\140\229\140\133\229\174\185\233\135\143\232\176\131\232\138\130", "parent", PERICO_ADV.id)
local CAYO_VEHICLES = menu.add_feature("\232\174\190\231\189\174\230\142\165\232\191\145\232\189\189\229\133\183", "parent", PERICO_HEIST.id)
local CAYO_PRIMARY = menu.add_feature("\228\184\187\232\166\129\231\155\174\230\160\135\232\174\190\231\189\174", "parent", PERICO_HEIST.id)
local CAYO_SECONDARY = menu.add_feature("\232\174\190\231\189\174\230\172\161\232\166\129\231\155\174\230\160\135", "parent", PERICO_HEIST.id)
local CAYO_WEAPONS = menu.add_feature("\232\174\190\231\189\174\230\173\166\229\153\168\232\163\133\229\164\135", "parent", PERICO_HEIST.id)
local CAYO_EQUIPM = menu.add_feature("\232\163\133\229\164\135(\229\136\182\230\156\141,\233\146\169\231\136\170,\229\137\170\233\146\179)\231\148\159\230\136\144\229\140\186\229\159\159", "parent", PERICO_HEIST.id)
local CAYO_TRUCK = menu.add_feature("\232\174\190\231\189\174\232\161\165\231\187\153\232\189\166\230\137\128\229\156\168\231\154\132\228\189\141\231\189\174", "parent", PERICO_HEIST.id)
local CAYO_DFFCTY = menu.add_feature("\232\174\190\231\189\174\230\138\162\229\138\171\233\154\190\229\186\166", "parent", PERICO_HEIST.id)
local MORE_OPTIONS = menu.add_feature("\230\155\180\229\164\154\233\128\137\233\161\185", "parent", PERICO_HEIST.id)
local CASINO_HEIST = menu.add_feature("\230\152\142\233\146\187\232\181\140\229\156\186", "parent", Heist_Control.id)
local CASINO_PRESETS = menu.add_feature("\232\135\170\229\138\168\233\162\132\232\174\190", "parent", CASINO_HEIST.id)
local CAH_DIA_TARGET = menu.add_feature("\233\146\187\231\159\179[\229\133\168\229\145\152350\228\184\135]", "parent", CASINO_PRESETS.id)
local CAH_GOLD_TARGET = menu.add_feature("\233\187\132\233\135\145[\229\133\168\229\145\152350\228\184\135]", "parent", CASINO_PRESETS.id)
local CAH_ADVCED = menu.add_feature("\233\171\152\231\186\167\233\128\137\233\161\185", "parent", CASINO_HEIST.id)
local CASINO_BOARD1 = menu.add_feature("\231\173\150\229\136\146\231\137\136\228\184\128", "parent", CASINO_HEIST.id)
local BOARD1_APPROACH = menu.add_feature("\232\174\190\231\189\174\230\138\162\229\138\171\230\150\185\229\188\143\229\146\140\233\154\190\229\186\166", "parent", CASINO_BOARD1.id)
local CASINO_TARGET = menu.add_feature("\232\174\190\231\189\174\231\155\174\230\160\135", "parent", CASINO_BOARD1.id)
local CASINO_BOARD2 = menu.add_feature("\231\173\150\229\136\146\231\137\136\228\186\140", "parent", CASINO_HEIST.id)
local CASINO_BOARD3 = menu.add_feature("\231\173\150\229\136\146\231\137\136\228\184\137", "parent", CASINO_HEIST.id)
local CAH_MISSION_MANAGER = menu.add_feature("\232\181\140\229\156\186\228\187\187\229\138\161", "parent", CASINO_HEIST.id)
local DOOMS_HEIST = menu.add_feature("\230\156\171\230\151\165\232\177\170\229\138\171", "parent", Heist_Control.id)
local DOOMS_PRESETS = menu.add_feature("\229\191\171\233\128\159\229\188\128\229\167\139", "parent", DOOMS_HEIST.id)
local DDHEIST_PLYR_MANAGER = menu.add_feature("\231\142\169\229\174\182\229\136\134\231\186\162", "parent", DOOMS_HEIST.id)
local TELEPORT_DOOMS = menu.add_feature("\230\156\171\230\151\165\232\177\170\229\138\171\228\188\160\233\128\129\233\128\137\233\161\185", "parent", DOOMS_HEIST.id)
local CLASSIC_HEISTS = menu.add_feature("\229\133\172\229\175\147\230\138\162\229\138\171", "parent", Heist_Control.id)
local CLASSIC_CUT = menu.add_feature("\228\189\160\231\154\132\229\136\134\231\186\162(\228\189\160\228\184\186\230\136\191\228\184\187\230\151\182\228\189\191\231\148\168)", "parent", CLASSIC_HEISTS.id)
local CLASSIC_M_GAME = menu.add_feature("\229\134\133\231\189\174\230\184\184\230\136\143\231\160\180\232\167\163", "parent", CLASSIC_HEISTS.id)
local TH_CONTRACT = menu.add_feature("\229\144\136\231\186\166\228\187\187\229\138\161", "parent", Heist_Control.id)
local LS_ROBBERY = menu.add_feature("\232\189\166\229\143\139\228\188\154\230\138\162\229\138\171", "parent", Heist_Control.id)
local TOOLS = menu.add_feature("\229\183\165\229\133\183\233\128\137\233\161\185", "parent", Heist_Control.id)
local MINI_GAME_TOOL = menu.add_feature("\229\134\133\231\189\174\230\184\184\230\136\143\231\160\180\232\167\163", "parent", TOOLS.id)
local SPEED_MANIPULATOR = menu.add_feature("\228\191\174\230\148\185\232\189\189\229\133\183\230\156\128\233\171\152\233\128\159", "parent", TOOLS.id)
local PED_MANIPULATOR = menu.add_feature("NPC\231\174\161\231\144\134", "parent", TOOLS.id)
local MyWallet = menu.add_feature("\233\135\145\233\146\177\231\174\161\231\144\134", "parent", TOOLS.id, function()
end)
menu.add_feature("\232\153\142\233\178\184:\230\138\162\229\138\171\233\157\162\230\157\191[\232\175\183\229\133\136\229\145\188\229\135\186\232\153\142\233\178\184]", "action", TELEPORT_QL.id, function()
  menu.notify("\229\166\130\230\158\156\228\184\141\229\145\188\229\135\186\232\153\142\233\178\184\229\176\177\232\191\155\232\161\140\228\188\160\233\128\129,\228\188\154\228\186\167\231\148\159\233\148\153\232\175\175", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(1561.224, 386.659, -49.685))
end)
menu.add_feature("\232\153\142\233\178\184:\228\184\187\231\148\178\230\157\191[\232\175\183\229\133\136\229\145\188\229\135\186\232\153\142\233\178\184]", "action", TELEPORT_QL.id, function()
  menu.notify("\229\166\130\230\158\156\228\184\141\229\145\188\229\135\186\232\153\142\233\178\184\229\176\177\232\191\155\232\161\140\228\188\160\233\128\129,\228\188\154\228\186\167\231\148\159\233\148\153\232\175\175", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(1563.218, 406.03, -49.667))
end)
menu.add_feature("\230\142\146\230\176\180\231\174\161\233\129\147:\229\133\165\229\143\163", "action", TELEPORT_QL.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5044.726, -5816.164, -11.213))
end)
menu.add_feature("\230\142\146\230\176\180\231\174\161\233\129\147:\228\186\140\230\172\161\230\163\128\230\159\165\231\130\185", "action", TELEPORT_QL.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5054.63, -5771.519, -4.807))
end)
menu.add_feature("\231\140\142\232\177\185\233\155\149\229\131\143\230\159\156\229\143\176", "action", TELEPORT_QL.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5007.895, -5755.581, 15.484))
end)
menu.add_feature("\230\172\161\232\166\129\230\136\152\229\136\169\229\147\129\229\174\164", "action", TELEPORT_QL.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5003.467, -5749.352, 14.84))
end)
menu.add_feature("\233\135\145\229\143\145\232\128\129\229\164\167\229\138\158\229\133\172\229\174\164(\230\156\137\233\154\144\232\151\143\228\191\157\233\153\169\230\159\156)", "action", TELEPORT_QL.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5010.753, -5757.639, 28.845))
  entity.set_entity_rotation(pedmy, v3(2))
end)
menu.add_feature("\229\164\167\233\151\168\229\135\186\229\143\163", "action", TELEPORT_QL.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4992.854, -5718.537, 19.88))
end)
menu.add_feature("\229\164\167\230\181\183\233\128\131\231\148\159\231\130\185", "action", TELEPORT_QL.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  if 1 ~= player.is_player_in_any_vehicle then
    pedmy = player.get_player_vehicle(player.player_id())
    entity.set_entity_coords_no_offset(pedmy, v3(4905.05, -6339.578, -89.83))
  end
  if 0 ~= player.is_player_in_any_vehicle then
    pedmy = player.get_player_ped(player.player_id())
    entity.set_entity_coords_no_offset(pedmy, v3(4905.05, -6339.578, -89.83))
  end
end)
menu.add_feature("\232\177\170\229\174\133\229\164\150\230\176\180\228\184\139\229\133\165\229\143\163\229\164\150", "action", TELEPORTMANSIONO.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5047.394, -5820.962, -12.447))
end)
menu.add_feature("\232\177\170\229\174\133\228\184\187\229\164\167\233\151\168\229\164\150", "action", TELEPORTMANSIONO.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159 ", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4972.337, -5701.617, 19.887))
end)
menu.add_feature("\232\177\170\229\174\133\229\164\150\229\140\151\232\190\185\230\138\147\233\146\169\231\130\185\229\164\150", "action", TELEPORTMANSIONO.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5041.111, -5675.523, 19.292))
end)
menu.add_feature("\232\177\170\229\174\133\229\140\151\233\151\168\229\133\165\229\143\163\229\164\150", "action", TELEPORTMANSIONO.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5086.59, -5730.8, 15.773))
end)
menu.add_feature("\232\177\170\229\174\133\229\164\150\229\141\151\232\190\185\230\138\147\233\146\169\231\130\185\229\164\150", "action", TELEPORTMANSIONO.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4987.32, -5819.869, 19.548))
end)
menu.add_feature("\232\177\170\229\174\133\229\141\151\233\151\168\229\133\165\229\143\163\229\164\150", "action", TELEPORTMANSIONO.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4958.965, -5785.213, 20.839))
end)
menu.add_feature("\230\156\186\229\156\186\233\152\178\231\169\186\230\142\167\229\136\182", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4374.47, -4577.694, 4.208))
end)
menu.add_feature("\230\156\186\229\156\186\231\148\181\229\138\155\230\142\167\229\136\182", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4478.387, -4591.498, 5.568))
end)
menu.add_feature("\230\156\186\229\156\186\230\146\164\231\166\187\231\130\185", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4493.552, -4472.608, 4.212))
end)
menu.add_feature("\230\156\186\229\156\186\230\136\152\229\136\169\229\147\1291", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4437.678, -4449.029, 4.328))
end)
menu.add_feature("\230\156\186\229\156\186\230\136\152\229\136\169\229\147\1292", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4445.451, -4444.368, 7.237))
end)
menu.add_feature("\230\156\186\229\156\186\229\133\182\228\187\150\230\136\152\229\136\169\229\147\129", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4503.399, -4552.043, 4.161))
end)
menu.add_feature("\229\140\151\231\160\129\229\164\180\229\174\137\229\133\168\231\130\185", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5064.167, -4587.988, 2.988))
end)
menu.add_feature("\229\140\151\231\160\129\229\164\180\230\136\152\229\136\169\229\147\1291", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5065.108, -4592.708, 2.855))
end)
menu.add_feature("\229\140\151\231\160\129\229\164\180\230\136\152\229\136\169\229\147\1292", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5134.84, -4609.992, 2.529))
end)
menu.add_feature("\229\140\151\231\160\129\229\164\180\230\136\152\229\136\169\229\147\1293", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5090.356, -4682.487, 2.407))
end)
menu.add_feature("\229\164\167\233\186\187\231\167\141\230\164\141\229\156\186\230\136\152\229\136\169\229\147\129", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5331.424, -5269.504, 33.186))
end)
menu.add_feature("\229\138\160\229\183\165\229\140\186\230\136\152\229\136\169\229\147\129", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5193.133, -5134.256, 3.345))
end)
menu.add_feature("\228\184\187\231\160\129\229\164\180\229\174\137\229\133\168\231\130\185", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159 ", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4847.7, -5325.062, 15.017))
end)
menu.add_feature("\228\184\187\231\160\129\229\164\180\230\136\152\229\136\169\229\147\1291", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4923.587, -5242.541, 2.523))
end)
menu.add_feature("\228\184\187\231\160\129\229\164\180\230\136\152\229\136\169\229\147\1292", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4998.355, -5165.41, 2.764))
end)
menu.add_feature("\228\184\187\231\160\129\229\164\180\230\136\152\229\136\169\229\147\1293", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4961.247, -5109.312, 2.982))
end)
menu.add_feature("\233\128\154\232\174\175\229\161\148\229\186\149\233\131\168", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5270.362, -5422.213, 65.579))
end)
menu.add_feature("\233\128\154\232\174\175\229\161\1481\229\177\130", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5262.419, -5428.451, 90.724))
end)
menu.add_feature("\233\128\154\232\174\175\229\161\1482\229\177\130", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5263.55, -5428.477, 109.148))
end)
menu.add_feature("\233\128\154\232\174\175\229\161\1483\229\177\130(\233\161\182\233\131\168)", "action", TELEPORTLOOT.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5266.207, -5427.754, 141.047))
end)
menu.add_feature("\232\177\170\229\174\133\229\138\158\229\133\172\229\174\164", "action", TELEPORTMANSIONI.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5008.106, -5752.442, 28.845))
end)
menu.add_feature("\232\177\170\229\174\133\229\156\176\228\184\139\229\174\164\228\184\187\230\136\152\229\136\169\229\147\129", "action", TELEPORTMANSIONI.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5007.573, -5754.908, 15.484))
end)
menu.add_feature("\232\177\170\229\174\133\229\156\176\228\184\139\229\174\164\230\172\161\232\166\129\230\136\152\229\136\169\229\147\129", "action", TELEPORTMANSIONI.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5001.469, -5747.327, 14.84))
end)
menu.add_feature("\232\177\170\229\174\133\230\136\152\229\136\169\229\147\1291", "action", TELEPORTMANSIONI.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5084.015, -5758.132, 15.83))
end)
menu.add_feature("\232\177\170\229\174\133\230\136\152\229\136\169\229\147\1292", "action", TELEPORTMANSIONI.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5009.42, -5790.591, 17.832))
end)
menu.add_feature("\232\177\170\229\174\133\230\136\152\229\136\169\229\147\1293", "action", TELEPORTMANSIONI.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5031.386, -5737.249, 17.866))
end)
menu.add_feature("\232\177\170\229\174\133\230\173\163\233\151\168\229\135\186\229\143\163", "action", TELEPORTMANSIONI.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159 ", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4986.727, -5723.624, 19.88))
end)
menu.add_feature("\232\177\170\229\174\133\229\140\151\233\131\168\230\138\147\233\146\169\229\135\186\229\143\163", "action", TELEPORTMANSIONI.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159 ", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5024.82, -5682.374, 19.877))
end)
menu.add_feature("\232\177\170\229\174\133\229\141\151\233\131\168\230\138\147\233\146\169\229\135\186\229\143\163", "action", TELEPORTMANSIONI.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159 ", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4998.833, -5801.947, 20.877))
end)
menu.add_feature("\232\177\170\229\174\133\229\140\151\233\151\168\229\135\186\229\143\163", "action", TELEPORTMANSIONI.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5084.957, -5739.043, 15.677))
end)
menu.add_feature("\232\177\170\229\174\133\229\141\151\233\151\168\229\135\186\229\143\163", "action", TELEPORTMANSIONI.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4967.008, -5783.731, 20.878))
end)
menu.add_feature("\233\153\134\229\156\176\229\174\157\231\174\177\229\164\1321", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5176.394, -4678.343, 2.427))
end)
menu.add_feature("\233\153\134\229\156\176\229\174\157\231\174\177\229\164\1322", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4855.533, -5561.123, 27.534))
end)
menu.add_feature("\233\153\134\229\156\176\229\174\157\231\174\177\229\164\1323", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4877.224, -4781.618, 2.068))
end)
menu.add_feature("\233\153\134\229\156\176\229\174\157\231\174\177\229\164\1324", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5591.956, -5215.923, 14.351))
end)
menu.add_feature("\233\153\134\229\156\176\229\174\157\231\174\177\229\164\1325", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5458.669, -5860.041, 19.973))
end)
menu.add_feature("\233\153\134\229\156\176\229\174\157\231\174\177\229\164\1326", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4855.781, -5163.507, 2.439))
end)
menu.add_feature("\233\153\134\229\156\176\229\174\157\231\174\177\229\164\1327", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(3898.093, -4710.935, 4.771))
end)
menu.add_feature("\233\153\134\229\156\176\229\174\157\231\174\177\229\164\1328", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4822.828, -4322.015, 5.617))
end)
menu.add_feature("\233\153\134\229\156\176\229\174\157\231\174\177\229\164\1329", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4535.064, -4702.882, 2.431))
end)
menu.add_feature("\233\153\134\229\156\176\229\174\157\231\174\177\229\164\13210", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4179.426, -4358.279, 2.686))
end)
menu.add_feature("\230\181\183\230\180\139\229\174\157\231\174\177\229\164\1321", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4415.093, -4653.384, -4.172))
end)
menu.add_feature("\230\181\183\230\180\139\229\174\157\231\174\177\229\164\1322", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4560.742, -4355.47, -7.187))
end)
menu.add_feature("\230\181\183\230\180\139\229\174\157\231\174\177\229\164\1323", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5262.87, -4919.246, -1.878))
end)
menu.add_feature("\230\181\183\230\180\139\229\174\157\231\174\177\229\164\1324", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4561.338, -4768.874, -2.167))
end)
menu.add_feature("\230\181\183\230\180\139\229\174\157\231\174\177\229\164\1325", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4943.188, -4294.895, -5.481))
end)
menu.add_feature("\230\181\183\230\180\139\229\174\157\231\174\177\229\164\1326", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(5599.706, -5604.149, -5.064))
end)
menu.add_feature("\230\181\183\230\180\139\229\174\157\231\174\177\229\164\1327", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(3982.371, -4542.297, -5.194))
end)
menu.add_feature("\230\181\183\230\180\139\229\174\157\231\174\177\229\164\1328", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4775.263, -5394.031, -4.116))
end)
menu.add_feature("\230\181\183\230\180\139\229\174\157\231\174\177\229\164\1329", "action", TELEPORTCHESTS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4940.111, -5167.373, -2.564))
end)
menu.add_feature("\231\133\167\231\137\135\229\177\143\229\185\149:\230\189\156\230\176\180\232\137\135\231\173\150\229\136\146\230\157\191(\229\141\154\230\160\188\228\184\185\229\141\177\230\156\186)", "action", TELEPORT_DOOMS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(515.528, 4835.353, -62.587))
end)
menu.add_feature("\231\155\145\231\139\177\231\137\162\230\136\191:\230\189\156\232\137\135\229\174\164(\229\141\154\230\160\188\228\184\185\229\141\177\230\156\186)", "action", TELEPORT_DOOMS.id, function()
  menu.notify("\228\188\160\233\128\129\230\136\144\229\138\159", "", 4, 1693475860)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(512.888, 4833.033, -68.989))
end)
menu.add_feature("\229\133\179\228\186\142\232\132\154\230\156\172", "action", Heist_Control.id, function()
  menu.notify("\231\137\185\229\136\171\233\184\163\232\176\162\n* haekkzer\n* kektram\n* Proddy\n* GhostOne\n* Kiddion\n* sub1to\n* RulyPancake\n* Gee-Man521\n\n\n\230\132\159\232\176\162 Rockstar North#6880\n E.#7777\n igobythisname#3730\n TucoSalamanca#3134\n\231\154\132\230\137\147\232\181\143", "", 7, 1350090240)
  menu.notify("\229\148\175\228\184\128\228\189\156\232\128\133: jhowkNx\n\n\230\155\180\230\150\176\229\156\176\229\157\128:\ngithub.com/jhowkNx/Heist-Control-v2", "\228\187\187\229\138\161\232\132\154\230\156\172\229\174\152\231\189\145", 7, 1350090240)
  menu.notify("\231\174\128\228\189\147\228\184\173\230\150\135\231\137\136\230\156\172\230\177\137\229\140\150\232\128\133:czm180#4644,QQ:1807219610", "\231\174\128\228\189\147\228\184\173\230\150\135\230\177\137\229\140\150", 7, 1693475860)
end)
do
  local QUICK_SET_ANY = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_BS_GEN",
      262143
    },
    {
      "H4CNF_BS_ENTR",
      63
    },
    {
      "H4CNF_BS_ABIL",
      63
    },
    {
      "H4CNF_WEP_DISRP",
      3
    },
    {
      "H4CNF_ARM_DISRP",
      3
    },
    {
      "H4CNF_HEL_DISRP",
      3
    },
    {
      "H4CNF_BOLTCUT",
      4424
    },
    {
      "H4CNF_UNIFORM",
      5256
    },
    {
      "H4CNF_GRAPPEL",
      5156
    },
    {
      "H4CNF_APPROACH",
      -1
    },
    {
      "H4LOOT_CASH_I",
      0
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_WEED_I",
      0
    },
    {
      "H4LOOT_WEED_C",
      0
    },
    {
      "H4LOOT_COKE_I",
      0
    },
    {
      "H4LOOT_COKE_C",
      0
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_C",
      0
    },
    {
      "H4LOOT_PAINT",
      0
    },
    {
      "H4LOOT_CASH_V",
      0
    },
    {
      "H4LOOT_COKE_V",
      0
    },
    {
      "H4LOOT_GOLD_V",
      0
    },
    {
      "H4LOOT_PAINT_V",
      0
    },
    {
      "H4LOOT_WEED_V",
      0
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      0
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      0
    },
    {
      "H4LOOT_PAINT_SCOPED",
      0
    },
    {
      "H4CNF_TARGET",
      5
    },
    {
      "H4CNF_WEAPONS",
      5
    },
    {
      "H4_MISSIONS",
      -1
    },
    {
      "H4_PROGRESS",
      126823
    }
  }
  menu.add_feature("\232\189\189\229\133\165\229\191\171\233\128\159\233\162\132\232\174\190", "toggle", QUICK_PRST.id, function(quickcp)
    menu.notify("* \228\184\141\233\156\128\232\166\129\230\139\191\230\172\161\232\166\129\231\155\174\230\160\135,\228\189\160\231\154\132\231\155\174\230\160\135\229\143\170\230\152\175\230\139\191\228\184\187\232\166\129\231\155\174\230\160\135\231\132\182\229\144\142\232\183\145\232\183\175\n* \229\143\170\230\156\137\232\153\142\233\178\184\229\143\175\231\148\168\n* \228\184\141\232\166\129\230\155\180\230\148\185\231\153\190\229\136\134\230\175\148\230\136\150\228\184\187\230\172\161\231\155\174\230\160\135\n* \228\189\160\229\143\175\228\187\165\230\139\191\229\138\158\229\133\172\229\174\164\231\154\132\231\142\176\233\135\145(\229\143\175\233\128\137)\n\n* \228\191\157\230\140\129\230\191\128\230\180\187\231\138\182\230\128\129\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159", "\231\155\184\229\133\179\228\191\161\230\129\175", 13, 1343534320)
    while quickcp.on do
      for i = 1, #QUICK_SET_ANY do
        stat_set_int(QUICK_SET_ANY[i][1], true, QUICK_SET_ANY[i][2])
      end
      script.set_global_i(1974405, 145)
      script.set_global_i(1974406, 145)
      script.set_global_i(1974407, 145)
      script.set_global_i(1974408, 145)
      system.yield(0)
    end
  end)
end
do
  local WEAKLY_QUICK = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_BS_GEN",
      262143
    },
    {
      "H4CNF_BS_ENTR",
      63
    },
    {
      "H4CNF_BS_ABIL",
      63
    },
    {
      "H4CNF_WEP_DISRP",
      3
    },
    {
      "H4CNF_ARM_DISRP",
      3
    },
    {
      "H4CNF_HEL_DISRP",
      3
    },
    {
      "H4CNF_BOLTCUT",
      4424
    },
    {
      "H4CNF_UNIFORM",
      5256
    },
    {
      "H4CNF_GRAPPEL",
      5156
    },
    {
      "H4CNF_APPROACH",
      -1
    },
    {
      "H4LOOT_CASH_I",
      0
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_WEED_I",
      0
    },
    {
      "H4LOOT_WEED_C",
      0
    },
    {
      "H4LOOT_COKE_I",
      0
    },
    {
      "H4LOOT_COKE_C",
      0
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_C",
      0
    },
    {
      "H4LOOT_PAINT",
      0
    },
    {
      "H4LOOT_CASH_V",
      0
    },
    {
      "H4LOOT_COKE_V",
      0
    },
    {
      "H4LOOT_GOLD_V",
      0
    },
    {
      "H4LOOT_PAINT_V",
      0
    },
    {
      "H4LOOT_WEED_V",
      0
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      0
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      0
    },
    {
      "H4LOOT_PAINT_SCOPED",
      0
    },
    {
      "H4CNF_TARGET",
      5
    },
    {
      "H4CNF_WEAPONS",
      4
    },
    {
      "H4_MISSIONS",
      -1
    },
    {
      "H4_PROGRESS",
      126823
    }
  }
  menu.add_feature("[1-4\228\189\141\231\142\169\229\174\182]\229\191\171\233\128\159\233\162\132\232\174\190(410\228\184\135)[\229\143\170\230\139\191\228\184\187\232\166\129\231\155\174\230\160\135]", "toggle", WEEKLY_PRESET.id, function(quickSET)
    menu.notify("\231\155\184\229\133\179\228\191\161\230\129\175\n\n- \228\184\141\233\156\128\232\166\129\230\139\191\230\172\161\232\166\129\231\155\174\230\160\135,\228\189\160\231\154\132\231\155\174\230\160\135\229\143\170\230\152\175\230\139\191\228\184\187\232\166\129\231\155\174\230\160\135\231\132\182\229\144\142\232\183\145\232\183\175\n\n- \229\143\170\230\156\137\232\153\142\233\178\184\229\143\175\231\148\168\n\n- \228\184\141\232\166\129\232\135\170\229\183\177\232\176\131\231\153\190\229\136\134\230\175\148\230\136\150\230\155\180\230\148\185\228\187\187\228\189\149\231\155\174\230\160\135\n\n- \228\191\157\230\140\129\230\191\128\230\180\187\231\138\182\230\128\129\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159", "\228\187\187\229\138\161\232\132\154\230\156\172", 15, 1693475860)
    menu.notify("\230\179\168\230\132\143:\230\173\164\233\162\132\232\174\190\230\156\137\228\184\128\228\184\170\230\152\190\231\164\186\233\148\153\232\175\175,\229\156\168\230\138\162\229\138\171\231\187\147\230\157\159\230\151\182\228\188\154\230\152\190\231\164\186\229\188\130\229\184\184\233\135\145\233\162\157,\228\189\134\230\152\175\229\166\130\230\158\156\228\189\160\230\159\165\231\156\139\229\156\168\231\186\191\231\142\169\229\174\182,\228\189\160\229\143\175\228\187\165\233\170\140\232\175\129\229\133\182\228\187\150\230\136\144\229\145\152\231\154\132\231\156\159\229\174\158\229\136\176\232\180\166", "", 10, 1343488255)
    while quickSET.on do
      for i = 1, #WEAKLY_QUICK do
        stat_set_int(WEAKLY_QUICK[i][1], true, WEAKLY_QUICK[i][2])
      end
      script.set_global_i(1974405, 100)
      script.set_global_i(1974406, 145)
      script.set_global_i(1974407, 145)
      script.set_global_i(1974408, 145)
      script.set_global_f(291786, 0.0)
      script.set_global_f(291787, 0.0)
      script.set_global_i(291782, 4025000)
      system.yield(0)
    end
  end)
end
do
  local AUTOMATED_1P_TARGET_5 = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_TARGET",
      5
    },
    {
      "H4LOOT_CASH_I",
      8128
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      8128
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I",
      63
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      63
    },
    {
      "H4LOOT_COKE_C",
      22
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      22
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C",
      168
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      168
    },
    {
      "H4LOOT_WEED_I",
      16769024
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      16769024
    },
    {
      "H4LOOT_WEED_C",
      65
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      65
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    },
    {
      "H4LOOT_CASH_V",
      207386
    },
    {
      "H4LOOT_COKE_V",
      414772
    },
    {
      "H4LOOT_GOLD_V",
      553029
    },
    {
      "H4LOOT_PAINT_V",
      414772
    },
    {
      "H4LOOT_WEED_V",
      331818
    },
    {
      "H4_PROGRESS",
      126823
    },
    {
      "H4CNF_BS_GEN",
      -1
    },
    {
      "H4CNF_BS_ENTR",
      -1
    },
    {
      "H4CNF_BS_ABIL",
      -1
    },
    {
      "H4CNF_WEP_DISRP",
      3
    },
    {
      "H4CNF_ARM_DISRP",
      3
    },
    {
      "H4CNF_HEL_DISRP",
      3
    },
    {
      "H4CNF_APPROACH",
      -1
    }
  }
  local AUTOMATED_1P_TARGET_5_A = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_BOLTCUT",
      4424
    },
    {
      "H4CNF_UNIFORM",
      5256
    },
    {
      "H4CNF_GRAPPEL",
      5156
    },
    {
      "H4_MISSIONS",
      -1
    },
    {
      "H4CNF_WEAPONS",
      4
    },
    {
      "H4CNF_TROJAN",
      5
    }
  }
  menu.add_feature("\231\140\142\232\177\185\233\155\149\229\131\143", "toggle", AUTOMATED_SOLO.id, function(SOLO_SAPH_var0)
    menu.notify("\233\162\132\232\174\190\229\183\178\228\191\174\230\148\185\228\184\186\229\141\149\228\186\186\n\228\184\141\232\166\129\228\189\191\231\148\168\228\187\187\228\189\149\233\171\152\231\186\167\233\128\137\233\161\185\n\228\184\141\232\166\129\228\189\191\231\148\168\232\131\140\229\140\133\229\174\185\233\135\143\228\191\174\230\148\185\229\153\168\n\228\184\141\232\166\129\230\155\180\230\148\185\229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\n\230\138\138\228\189\160\231\154\132\232\131\140\229\140\133\232\163\133\230\187\161\n\n\232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\230\191\128\230\180\187,\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159", "\229\141\149\228\186\186|\231\140\142\232\177\185\233\155\149\229\131\143", 7, 1344174080)
    for i = 1, #AUTOMATED_1P_TARGET_5_A do
      stat_set_int(AUTOMATED_1P_TARGET_5_A[i][1], true, AUTOMATED_1P_TARGET_5_A[i][2])
    end
    while SOLO_SAPH_var0.on do
      for i = 1, #AUTOMATED_1P_TARGET_5 do
        stat_set_int(AUTOMATED_1P_TARGET_5[i][1], true, AUTOMATED_1P_TARGET_5[i][2])
      end
      script.set_global_f(291786, -0.1)
      script.set_global_f(291787, -0.02)
      script.set_global_i(291540, 1800)
      script.set_global_i(1974405, 100)
      system.yield(0)
    end
  end)
end
do
  local CAYO_SOLO_AUTO_TARGET_3 = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_TARGET",
      3
    },
    {
      "H4LOOT_CASH_I",
      63
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      63
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I",
      16769024
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      16769024
    },
    {
      "H4LOOT_COKE_C",
      22
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      22
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C",
      168
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      168
    },
    {
      "H4LOOT_WEED_I",
      8128
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      8128
    },
    {
      "H4LOOT_WEED_C",
      65
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      65
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    },
    {
      "H4LOOT_CASH_V",
      357386
    },
    {
      "H4LOOT_COKE_V",
      714772
    },
    {
      "H4LOOT_GOLD_V",
      953029
    },
    {
      "H4LOOT_PAINT_V",
      714772
    },
    {
      "H4LOOT_WEED_V",
      571818
    },
    {
      "H4_PROGRESS",
      126823
    },
    {
      "H4CNF_BS_GEN",
      262143
    },
    {
      "H4CNF_BS_ENTR",
      63
    },
    {
      "H4CNF_BS_ABIL",
      63
    },
    {
      "H4CNF_WEP_DISRP",
      3
    },
    {
      "H4CNF_ARM_DISRP",
      3
    },
    {
      "H4CNF_HEL_DISRP",
      3
    },
    {
      "H4CNF_APPROACH",
      -1
    }
  }
  local USER_CAN_MDFY_PRESET_AUTO_SOLO_T3 = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_BOLTCUT",
      4424
    },
    {
      "H4CNF_UNIFORM",
      5256
    },
    {
      "H4CNF_GRAPPEL",
      5156
    },
    {
      "H4_MISSIONS",
      -1
    },
    {
      "H4CNF_WEAPONS",
      4
    },
    {
      "H4CNF_TROJAN",
      5
    }
  }
  menu.add_feature("\231\178\137\233\146\187", "toggle", AUTOMATED_SOLO.id, function(SOLO_TARGET3)
    menu.notify("\233\162\132\232\174\190\229\183\178\228\191\174\230\148\185\228\184\186\229\141\149\228\186\186\233\162\132\232\174\190\n\228\184\141\232\166\129\228\189\191\231\148\168\228\187\187\228\189\149\233\171\152\231\186\167\233\128\137\233\161\185\n\228\184\141\232\166\129\228\189\191\231\148\168\232\131\140\229\140\133\229\174\185\233\135\143\228\191\174\230\148\185\229\153\168\n\228\184\141\232\166\129\230\155\180\230\148\185\229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\n\230\138\138\228\189\160\231\154\132\232\131\140\229\140\133\232\163\133\230\187\161\n\n\232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\230\191\128\230\180\187,\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159", "\229\141\149\228\186\186|\231\178\137\233\146\187", 7, 1344174080)
    for i = 1, #USER_CAN_MDFY_PRESET_AUTO_SOLO_T3 do
      stat_set_int(USER_CAN_MDFY_PRESET_AUTO_SOLO_T3[i][1], true, USER_CAN_MDFY_PRESET_AUTO_SOLO_T3[i][2])
    end
    while SOLO_TARGET3.on do
      for i = 2, #CAYO_SOLO_AUTO_TARGET_3 do
        stat_set_int(CAYO_SOLO_AUTO_TARGET_3[i][1], true, CAYO_SOLO_AUTO_TARGET_3[i][2])
      end
      script.set_global_f(291786, -0.1)
      script.set_global_f(291787, -0.02)
      script.set_global_i(291540, 1800)
      script.set_global_i(1974405, 100)
      system.yield(0)
    end
  end)
end
do
  local AUTOMATED_2P_TARGET_5 = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_TARGET",
      5
    },
    {
      "H4LOOT_CASH_I",
      8128
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      8128
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I",
      63
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      63
    },
    {
      "H4LOOT_COKE_C",
      22
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      22
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C",
      168
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      168
    },
    {
      "H4LOOT_WEED_I",
      16769024
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      16769024
    },
    {
      "H4LOOT_WEED_C",
      65
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      65
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    },
    {
      "H4LOOT_CASH_V",
      457386
    },
    {
      "H4LOOT_COKE_V",
      914772
    },
    {
      "H4LOOT_GOLD_V",
      1219696
    },
    {
      "H4LOOT_PAINT_V",
      914772
    },
    {
      "H4LOOT_WEED_V",
      731818
    },
    {
      "H4_PROGRESS",
      126823
    },
    {
      "H4CNF_BS_GEN",
      262143
    },
    {
      "H4CNF_BS_ENTR",
      63
    },
    {
      "H4CNF_BS_ABIL",
      63
    },
    {
      "H4CNF_WEP_DISRP",
      3
    },
    {
      "H4CNF_ARM_DISRP",
      3
    },
    {
      "H4CNF_HEL_DISRP",
      3
    },
    {
      "H4CNF_APPROACH",
      -1
    }
  }
  local AUTOMATED_2P_TARGET_5_A = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_BOLTCUT",
      4424
    },
    {
      "H4CNF_UNIFORM",
      5256
    },
    {
      "H4CNF_GRAPPEL",
      5156
    },
    {
      "H4_MISSIONS",
      -1
    },
    {
      "H4CNF_WEAPONS",
      4
    },
    {
      "H4CNF_TROJAN",
      5
    }
  }
  menu.add_feature("\231\140\142\232\177\185\233\155\149\229\131\143", "toggle", AUTOMATED_2P.id, function(AUTO_2_SAPH_var0)
    menu.notify("\230\175\143\228\189\141\231\142\169\229\174\182\231\154\132\233\162\132\232\174\161\229\136\134\231\186\162:\n $2,550,000\n\n\231\142\169\229\174\182\229\136\134\231\186\162\229\183\178\233\148\129\229\174\154", "\230\138\162\229\138\171\229\174\137\229\133\168\228\191\157\233\154\156", 10, 1343503580)
    menu.notify("\233\162\132\232\174\190\229\183\178\228\191\174\230\148\185\228\184\186\229\143\140\228\186\186\233\162\132\232\174\190\n\228\184\141\232\166\129\228\189\191\231\148\168\228\187\187\228\189\149\233\171\152\231\186\167\233\128\137\233\161\185\n\228\184\141\232\166\129\228\189\191\231\148\168\232\131\140\229\140\133\229\174\185\233\135\143\228\191\174\230\148\185\229\153\168\n\228\184\141\232\166\129\230\155\180\230\148\185\229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\n\230\138\138\232\131\140\229\140\133\232\163\133\230\187\161\n\n\232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\230\191\128\230\180\187,\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159", "\229\143\140\228\186\186|\231\140\142\232\177\185\233\155\149\229\131\143", 7, 1343503580)
    for i = 1, #AUTOMATED_2P_TARGET_5_A do
      stat_set_int(AUTOMATED_2P_TARGET_5_A[i][1], true, AUTOMATED_2P_TARGET_5_A[i][2])
    end
    while AUTO_2_SAPH_var0.on do
      for i = 1, #AUTOMATED_2P_TARGET_5 do
        stat_set_int(AUTOMATED_2P_TARGET_5[i][1], true, AUTOMATED_2P_TARGET_5[i][2])
      end
      script.set_global_f(291786, -0.1)
      script.set_global_f(291787, -0.02)
      script.set_global_i(291540, 1800)
      script.set_global_i(1974405, 50)
      script.set_global_i(1974406, 50)
      system.yield(0)
    end
  end)
end
do
  local AUTOMATED_2_TARGET_3 = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_TARGET",
      3
    },
    {
      "H4LOOT_CASH_I",
      63
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      63
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I",
      16769024
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      16769024
    },
    {
      "H4LOOT_COKE_C",
      22
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      22
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C",
      168
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      168
    },
    {
      "H4LOOT_WEED_I",
      8128
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      8128
    },
    {
      "H4LOOT_WEED_C",
      65
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      65
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    },
    {
      "H4LOOT_CASH_V",
      532386
    },
    {
      "H4LOOT_COKE_V",
      1064772
    },
    {
      "H4LOOT_GOLD_V",
      1419696
    },
    {
      "H4LOOT_PAINT_V",
      1064772
    },
    {
      "H4LOOT_WEED_V",
      851818
    },
    {
      "H4_PROGRESS",
      126823
    },
    {
      "H4CNF_BS_GEN",
      262143
    },
    {
      "H4CNF_BS_ENTR",
      63
    },
    {
      "H4CNF_BS_ABIL",
      63
    },
    {
      "H4CNF_WEP_DISRP",
      3
    },
    {
      "H4CNF_ARM_DISRP",
      3
    },
    {
      "H4CNF_HEL_DISRP",
      3
    },
    {
      "H4CNF_APPROACH",
      -1
    }
  }
  local AUTOMATED_2_TARGET_3_A = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_BOLTCUT",
      4424
    },
    {
      "H4CNF_UNIFORM",
      5256
    },
    {
      "H4CNF_GRAPPEL",
      5156
    },
    {
      "H4_MISSIONS",
      -1
    },
    {
      "H4CNF_WEAPONS",
      4
    },
    {
      "H4CNF_TROJAN",
      5
    }
  }
  menu.add_feature("\231\178\137\233\146\187", "toggle", AUTOMATED_2P.id, function(P2_T3)
    menu.notify("\230\175\143\228\189\141\231\142\169\229\174\182\231\154\132\233\162\132\232\174\161\229\136\134\231\186\162:\n $2,550,000\n\n\231\142\169\229\174\182\229\136\134\231\186\162\229\183\178\233\148\129\229\174\154", "\230\138\162\229\138\171\229\174\137\229\133\168\228\191\157\233\154\156", 7, 1344174080)
    menu.notify("\233\162\132\232\174\190\229\183\178\228\191\174\230\148\185\228\184\186\229\143\140\228\186\186\233\162\132\232\174\190\n\228\184\141\232\166\129\228\189\191\231\148\168\228\187\187\228\189\149\233\171\152\231\186\167\233\128\137\233\161\185\n\228\184\141\232\166\129\228\189\191\231\148\168\232\131\140\229\140\133\229\174\185\233\135\143\228\191\174\230\148\185\229\153\168\n\228\184\141\232\166\129\230\155\180\230\148\185\229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\n\230\138\138\232\131\140\229\140\133\232\163\133\230\187\161\n\n\232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\230\191\128\230\180\187,\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159", "\229\143\140\228\186\186|\231\178\137\233\146\187", 7, 1343503580)
    for i = 1, #AUTOMATED_2_TARGET_3_A do
      stat_set_int(AUTOMATED_2_TARGET_3_A[i][1], true, AUTOMATED_2_TARGET_3_A[i][2])
    end
    while P2_T3.on do
      for i = 1, #AUTOMATED_2_TARGET_3 do
        stat_set_int(AUTOMATED_2_TARGET_3[i][1], true, AUTOMATED_2_TARGET_3[i][2])
      end
      script.set_global_f(291786, -0.1)
      script.set_global_f(291787, -0.02)
      script.set_global_i(291540, 1800)
      script.set_global_i(1974405, 50)
      script.set_global_i(1974406, 50)
      system.yield(0)
    end
  end)
end
do
  local AUTOMATED_3P_TARGET_5 = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_TARGET",
      5
    },
    {
      "H4LOOT_CASH_I",
      8128
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      8128
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I",
      63
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      63
    },
    {
      "H4LOOT_COKE_C",
      22
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      22
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C",
      168
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      168
    },
    {
      "H4LOOT_WEED_I",
      16769024
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      16769024
    },
    {
      "H4LOOT_WEED_C",
      65
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      65
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    },
    {
      "H4LOOT_CASH_V",
      507034
    },
    {
      "H4LOOT_COKE_V",
      1014069
    },
    {
      "H4LOOT_GOLD_V",
      1352091
    },
    {
      "H4LOOT_PAINT_V",
      1014069
    },
    {
      "H4LOOT_WEED_V",
      811255
    },
    {
      "H4_PROGRESS",
      126823
    },
    {
      "H4CNF_BS_GEN",
      262143
    },
    {
      "H4CNF_BS_ENTR",
      63
    },
    {
      "H4CNF_BS_ABIL",
      63
    },
    {
      "H4CNF_WEP_DISRP",
      3
    },
    {
      "H4CNF_ARM_DISRP",
      3
    },
    {
      "H4CNF_HEL_DISRP",
      3
    },
    {
      "H4CNF_APPROACH",
      -1
    }
  }
  local AUTOMATED_3P_TARGET_5_A = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_BOLTCUT",
      4424
    },
    {
      "H4CNF_UNIFORM",
      5256
    },
    {
      "H4CNF_GRAPPEL",
      5156
    },
    {
      "H4_MISSIONS",
      -1
    },
    {
      "H4CNF_WEAPONS",
      4
    },
    {
      "H4CNF_TROJAN",
      5
    }
  }
  menu.add_feature("\231\140\142\232\177\185\233\155\149\229\131\143", "toggle", AUTOMATED_3P.id, function(AUTO_3_SAPH_var0)
    menu.notify("\230\175\143\228\189\141\231\142\169\229\174\182\231\154\132\233\162\132\232\174\161\229\136\134\231\186\162:\n $2,550,000\n\n\231\142\169\229\174\182\229\136\134\231\186\162\229\183\178\233\148\129\229\174\154", "\230\138\162\229\138\171\229\174\137\229\133\168\228\191\157\233\154\156", 7, 1344174080)
    menu.notify("\233\162\132\232\174\190\229\183\178\228\191\174\230\148\185\228\184\186\228\184\137\228\186\186\233\162\132\232\174\190\n\228\184\141\232\166\129\228\189\191\231\148\168\228\187\187\228\189\149\233\171\152\231\186\167\233\128\137\233\161\185\n\228\184\141\232\166\129\228\189\191\231\148\168\232\131\140\229\140\133\229\174\185\233\135\143\228\191\174\230\148\185\229\153\168\n\228\184\141\232\166\129\230\155\180\230\148\185\229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\n\230\138\138\232\131\140\229\140\133\232\163\133\230\187\161\n\n\232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\230\191\128\230\180\187,\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159", "\228\184\137\228\186\186|\231\140\142\232\177\185\233\155\149\229\131\143", 7, 1343503580)
    for i = 1, #AUTOMATED_3P_TARGET_5_A do
      stat_set_int(AUTOMATED_3P_TARGET_5_A[i][1], true, AUTOMATED_3P_TARGET_5_A[i][2])
    end
    while CAYO_3P_AUTO.on do
      for i = 1, #AUTOMATED_3P_TARGET_5 do
        stat_set_int(AUTOMATED_3P_TARGET_5[i][1], true, AUTOMATED_3P_TARGET_5[i][2])
      end
      script.set_global_f(291786, -0.1)
      script.set_global_f(291787, -0.02)
      script.set_global_i(291540, 1800)
      script.set_global_i(1974405, 35)
      script.set_global_i(1974406, 35)
      script.set_global_i(1974407, 35)
      system.yield(0)
    end
  end)
end
do
  local AUTOMATED_3P_TARGET_3 = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_TARGET",
      3
    },
    {
      "H4LOOT_CASH_I",
      63
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      63
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I",
      16769024
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      16769024
    },
    {
      "H4LOOT_COKE_C",
      22
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      22
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C",
      168
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      168
    },
    {
      "H4LOOT_WEED_I",
      8128
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      8128
    },
    {
      "H4LOOT_WEED_C",
      65
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      65
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    },
    {
      "H4LOOT_CASH_V",
      557034
    },
    {
      "H4LOOT_COKE_V",
      1114069
    },
    {
      "H4LOOT_GOLD_V",
      1485425
    },
    {
      "H4LOOT_PAINT_V",
      1114069
    },
    {
      "H4LOOT_WEED_V",
      891255
    },
    {
      "H4_PROGRESS",
      126823
    },
    {
      "H4CNF_BS_GEN",
      262143
    },
    {
      "H4CNF_BS_ENTR",
      63
    },
    {
      "H4CNF_BS_ABIL",
      63
    },
    {
      "H4CNF_WEP_DISRP",
      3
    },
    {
      "H4CNF_ARM_DISRP",
      3
    },
    {
      "H4CNF_HEL_DISRP",
      3
    },
    {
      "H4CNF_APPROACH",
      -1
    }
  }
  local AUTOMATED_3P_TARGET_3_A = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_BOLTCUT",
      4424
    },
    {
      "H4CNF_UNIFORM",
      5256
    },
    {
      "H4CNF_GRAPPEL",
      5156
    },
    {
      "H4_MISSIONS",
      -1
    },
    {
      "H4CNF_WEAPONS",
      4
    },
    {
      "H4CNF_TROJAN",
      5
    }
  }
  menu.add_feature("\231\178\137\233\146\187", "toggle", AUTOMATED_3P.id, function(PATCH_3)
    menu.notify("\230\175\143\228\189\141\231\142\169\229\174\182\231\154\132\233\162\132\232\174\161\229\136\134\231\186\162:\n $2,550,000\n\n\231\142\169\229\174\182\229\136\134\231\186\162\229\183\178\233\148\129\229\174\154", "\230\138\162\229\138\171\229\174\137\229\133\168\228\191\157\233\154\156", 7, 1344174080)
    menu.notify("\233\162\132\232\174\190\229\183\178\228\191\174\230\148\185\228\184\186\228\184\137\228\186\186\233\162\132\232\174\190\n\228\184\141\232\166\129\228\189\191\231\148\168\228\187\187\228\189\149\233\171\152\231\186\167\233\128\137\233\161\185\n\228\184\141\232\166\129\228\189\191\231\148\168\232\131\140\229\140\133\229\174\185\233\135\143\228\191\174\230\148\185\229\153\168\n\228\184\141\232\166\129\230\155\180\230\148\185\229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\n\230\138\138\232\131\140\229\140\133\232\163\133\230\187\161\n\n\232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\230\191\128\230\180\187,\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159", "\228\184\137\228\186\186|\231\178\137\233\146\187", 7, 1343503580)
    for i = 1, #AUTOMATED_3P_TARGET_3_A do
      stat_set_int(AUTOMATED_3P_TARGET_3_A[i][1], true, AUTOMATED_3P_TARGET_3_A[i][2])
    end
    while PATCH_3.on do
      for i = 2, #AUTOMATED_3P_TARGET_3 do
        stat_set_int(AUTOMATED_3P_TARGET_3[i][1], true, AUTOMATED_3P_TARGET_3[i][2])
      end
      script.set_global_f(291786, -0.1)
      script.set_global_f(291787, -0.02)
      script.set_global_i(291540, 1800)
      script.set_global_i(1974405, 35)
      script.set_global_i(1974406, 35)
      script.set_global_i(1974407, 35)
      system.yield(0)
    end
  end)
end
do
  local AUTOMATED_4P_TARGET_5 = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_TARGET",
      5
    },
    {
      "H4LOOT_CASH_I",
      8128
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      8128
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I",
      63
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      63
    },
    {
      "H4LOOT_COKE_C",
      22
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      22
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C",
      168
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      168
    },
    {
      "H4LOOT_WEED_I",
      16769024
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      16769024
    },
    {
      "H4LOOT_WEED_C",
      65
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      65
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    },
    {
      "H4LOOT_CASH_V",
      582386
    },
    {
      "H4LOOT_COKE_V",
      1164772
    },
    {
      "H4LOOT_GOLD_V",
      1553030
    },
    {
      "H4LOOT_PAINT_V",
      1164772
    },
    {
      "H4LOOT_WEED_V",
      931818
    },
    {
      "H4_PROGRESS",
      126823
    },
    {
      "H4CNF_BS_GEN",
      262143
    },
    {
      "H4CNF_BS_ENTR",
      63
    },
    {
      "H4CNF_BS_ABIL",
      63
    },
    {
      "H4CNF_WEP_DISRP",
      3
    },
    {
      "H4CNF_ARM_DISRP",
      3
    },
    {
      "H4CNF_HEL_DISRP",
      3
    },
    {
      "H4CNF_APPROACH",
      -1
    }
  }
  local AUTOMATED_4P_TARGET_5_A = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_BOLTCUT",
      4424
    },
    {
      "H4CNF_UNIFORM",
      5256
    },
    {
      "H4CNF_GRAPPEL",
      5156
    },
    {
      "H4_MISSIONS",
      -1
    },
    {
      "H4CNF_WEAPONS",
      4
    },
    {
      "H4CNF_TROJAN",
      5
    }
  }
  menu.add_feature("\231\140\142\232\177\185\233\155\149\229\131\143", "toggle", AUTOMATED_4P.id, function(AUTO_4_SAPH_var0)
    menu.notify("\230\175\143\228\189\141\231\142\169\229\174\182\231\154\132\233\162\132\232\174\161\229\136\134\231\186\162:\n $2,550,000\n\n\231\142\169\229\174\182\229\136\134\231\186\162\229\183\178\233\148\129\229\174\154", "\230\138\162\229\138\171\229\174\137\229\133\168\228\191\157\233\154\156", 7, 1344174080)
    menu.notify("\233\162\132\232\174\190\229\183\178\228\191\174\230\148\185\228\184\186\229\155\155\228\186\186\233\162\132\232\174\190\n\228\184\141\232\166\129\228\189\191\231\148\168\228\187\187\228\189\149\233\171\152\231\186\167\233\128\137\233\161\185\n\228\184\141\232\166\129\228\189\191\231\148\168\232\131\140\229\140\133\229\174\185\233\135\143\228\191\174\230\148\185\229\153\168\n\228\184\141\232\166\129\230\155\180\230\148\185\229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\n\230\138\138\232\131\140\229\140\133\232\163\133\230\187\161\n\n\232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\230\191\128\230\180\187,\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159", "\229\155\155\228\186\186|\231\140\142\232\177\185\233\155\149\229\131\143", 7, 1343503580)
    for i = 1, #AUTOMATED_4P_TARGET_5_A do
      stat_set_int(AUTOMATED_4P_TARGET_5_A[i][1], true, AUTOMATED_4P_TARGET_5_A[i][2])
    end
    while TARGET_5_A.on do
      for i = 1, #AUTOMATED_4P_TARGET_5 do
        stat_set_int(AUTOMATED_4P_TARGET_5[i][1], true, AUTOMATED_4P_TARGET_5[i][2])
      end
      script.set_global_f(291786, -0.1)
      script.set_global_f(291787, -0.02)
      script.set_global_i(291540, 1800)
      script.set_global_i(1974405, 25)
      script.set_global_i(1974406, 25)
      script.set_global_i(1974407, 25)
      script.set_global_i(1974408, 25)
      system.yield(0)
    end
  end)
end
do
  local AUTOMATED_4P_TARGET_3 = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_TARGET",
      3
    },
    {
      "H4LOOT_CASH_I",
      63
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      63
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I",
      16769024
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      16769024
    },
    {
      "H4LOOT_COKE_C",
      22
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      22
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C",
      168
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      168
    },
    {
      "H4LOOT_WEED_I",
      8128
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      8128
    },
    {
      "H4LOOT_WEED_C",
      65
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      65
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    },
    {
      "H4LOOT_CASH_V",
      619886
    },
    {
      "H4LOOT_COKE_V",
      1239772
    },
    {
      "H4LOOT_GOLD_V",
      1653030
    },
    {
      "H4LOOT_PAINT_V",
      1239772
    },
    {
      "H4LOOT_WEED_V",
      991818
    },
    {
      "H4_PROGRESS",
      126823
    },
    {
      "H4CNF_BS_GEN",
      262143
    },
    {
      "H4CNF_BS_ENTR",
      63
    },
    {
      "H4CNF_BS_ABIL",
      63
    },
    {
      "H4CNF_WEP_DISRP",
      3
    },
    {
      "H4CNF_ARM_DISRP",
      3
    },
    {
      "H4CNF_HEL_DISRP",
      3
    },
    {
      "H4CNF_APPROACH",
      -1
    }
  }
  local AUTOMATED_4P_TARGET_3_A = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_BOLTCUT",
      4424
    },
    {
      "H4CNF_UNIFORM",
      5256
    },
    {
      "H4CNF_GRAPPEL",
      5156
    },
    {
      "H4_MISSIONS",
      -1
    },
    {
      "H4CNF_WEAPONS",
      4
    },
    {
      "H4CNF_TROJAN",
      5
    }
  }
  menu.add_feature("\231\178\137\233\146\187", "toggle", AUTOMATED_4P.id, function(PATCH_4)
    menu.notify("\230\175\143\228\189\141\231\142\169\229\174\182\231\154\132\233\162\132\232\174\161\229\136\134\231\186\162:\n $2,550,000\n\n\231\142\169\229\174\182\229\136\134\231\186\162\229\183\178\233\148\129\229\174\154", "\230\138\162\229\138\171\229\174\137\229\133\168\228\191\157\233\154\156", 7, 1344174080)
    menu.notify("\233\162\132\232\174\190\229\183\178\228\191\174\230\148\185\228\184\186\229\155\155\228\186\186\233\162\132\232\174\190\n\228\184\141\232\166\129\228\189\191\231\148\168\228\187\187\228\189\149\233\171\152\231\186\167\233\128\137\233\161\185\n\228\184\141\232\166\129\228\189\191\231\148\168\232\131\140\229\140\133\229\174\185\233\135\143\228\191\174\230\148\185\229\153\168\n\228\184\141\232\166\129\230\155\180\230\148\185\229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\n\230\138\138\232\131\140\229\140\133\232\163\133\230\187\161\n\n\232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\230\191\128\230\180\187,\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159", "\229\155\155\228\186\186|\231\178\137\233\146\187", 7, 1343503580)
    for i = 1, #AUTOMATED_4P_TARGET_3_A do
      stat_set_int(AUTOMATED_4P_TARGET_3_A[i][1], true, AUTOMATED_4P_TARGET_3_A[i][2])
    end
    while PATCH_4.on do
      for i = 1, #AUTOMATED_4P_TARGET_3 do
        stat_set_int(AUTOMATED_4P_TARGET_3[i][1], true, AUTOMATED_4P_TARGET_3[i][2])
      end
      script.set_global_f(291786, -0.1)
      script.set_global_f(291787, -0.02)
      script.set_global_i(291540, 1800)
      script.set_global_i(1974405, 25)
      script.set_global_i(1974406, 25)
      script.set_global_i(1974407, 25)
      script.set_global_i(1974408, 25)
      system.yield(0)
    end
  end)
end
do
  local WKLY_SOLO_PANTHER = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_TARGET",
      5
    },
    {
      "H4LOOT_CASH_I",
      6490148
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      6490148
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I",
      8421904
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      8421904
    },
    {
      "H4LOOT_COKE_C",
      0
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C",
      255
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      255
    },
    {
      "H4LOOT_WEED_I",
      1311112
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      1311112
    },
    {
      "H4LOOT_WEED_C",
      0
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      0
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    },
    {
      "H4LOOT_CASH_V",
      670454
    },
    {
      "H4LOOT_COKE_V",
      1340909
    },
    {
      "H4LOOT_GOLD_V",
      1787878
    },
    {
      "H4LOOT_PAINT_V",
      1340909
    },
    {
      "H4LOOT_WEED_V",
      1072727
    },
    {
      "H4_PROGRESS",
      126823
    },
    {
      "H4CNF_BS_GEN",
      262143
    },
    {
      "H4CNF_BS_ENTR",
      63
    },
    {
      "H4CNF_BS_ABIL",
      63
    },
    {
      "H4CNF_WEP_DISRP",
      3
    },
    {
      "H4CNF_ARM_DISRP",
      3
    },
    {
      "H4CNF_HEL_DISRP",
      3
    },
    {
      "H4CNF_APPROACH",
      -1
    }
  }
  local USER_CAN_MDFY_WKLY_SOLO_PANTHER = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_BOLTCUT",
      4424
    },
    {
      "H4CNF_UNIFORM",
      5256
    },
    {
      "H4CNF_GRAPPEL",
      5156
    },
    {
      "H4_MISSIONS",
      -1
    },
    {
      "H4CNF_WEAPONS",
      4
    },
    {
      "H4CNF_TROJAN",
      5
    }
  }
  menu.add_feature("\231\140\142\232\177\185\233\155\149\229\131\143", "toggle", WEEKLY_SOLO.id, function(WEEKLY_SOLO_v0)
    menu.notify("\233\162\132\232\174\190\229\183\178\228\191\174\230\148\185\228\184\186\229\141\149\228\186\186\n\228\184\141\232\166\129\228\189\191\231\148\168\228\187\187\228\189\149\233\171\152\231\186\167\233\128\137\233\161\185\n\228\184\141\232\166\129\228\189\191\231\148\168\232\131\140\229\140\133\229\174\185\233\135\143\228\191\174\230\148\185\229\153\168\n\228\184\141\232\166\129\230\155\180\230\148\185\229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\n\230\138\138\232\131\140\229\140\133\232\163\133\230\187\161(\228\184\141\231\174\161\232\163\133\229\149\165\233\131\189\232\161\140)\n\n\232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\230\191\128\230\180\187,\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159", "\229\141\149\228\186\186|\231\140\142\232\177\185\233\155\149\229\131\143", 7, 1679094015)
    for i = 1, #USER_CAN_MDFY_WKLY_SOLO_PANTHER do
      stat_set_int(USER_CAN_MDFY_WKLY_SOLO_PANTHER[i][1], true, USER_CAN_MDFY_WKLY_SOLO_PANTHER[i][2])
    end
    while WEEKLY_SOLO_v0.on do
      for i = 1, #WKLY_SOLO_PANTHER do
        stat_set_int(WKLY_SOLO_PANTHER[i][1], true, WKLY_SOLO_PANTHER[i][2])
      end
      script.set_global_f(291786, -0.1)
      script.set_global_f(291787, -0.02)
      script.set_global_i(291540, 1800)
      script.set_global_i(1974405, 100)
      system.yield(0)
    end
  end)
end
do
  local WKLY_DUO_PANTHER = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_TARGET",
      5
    },
    {
      "H4LOOT_CASH_I",
      6490148
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      6490148
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I",
      8421904
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      8421904
    },
    {
      "H4LOOT_COKE_C",
      0
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C",
      255
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      255
    },
    {
      "H4LOOT_WEED_I",
      1311112
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      1311112
    },
    {
      "H4LOOT_WEED_C",
      0
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      0
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    },
    {
      "H4LOOT_CASH_V",
      920454
    },
    {
      "H4LOOT_COKE_V",
      1840909
    },
    {
      "H4LOOT_GOLD_V",
      2454545
    },
    {
      "H4LOOT_PAINT_V",
      1840909
    },
    {
      "H4LOOT_WEED_V",
      1472727
    },
    {
      "H4_PROGRESS",
      126823
    },
    {
      "H4CNF_BS_GEN",
      262143
    },
    {
      "H4CNF_BS_ENTR",
      63
    },
    {
      "H4CNF_BS_ABIL",
      63
    },
    {
      "H4CNF_WEP_DISRP",
      3
    },
    {
      "H4CNF_ARM_DISRP",
      3
    },
    {
      "H4CNF_HEL_DISRP",
      3
    },
    {
      "H4CNF_APPROACH",
      -1
    }
  }
  local USER_CAN_MDFY_WKLY_DUO_PANTHER = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_BOLTCUT",
      4424
    },
    {
      "H4CNF_UNIFORM",
      5256
    },
    {
      "H4CNF_GRAPPEL",
      5156
    },
    {
      "H4_MISSIONS",
      -1
    },
    {
      "H4CNF_WEAPONS",
      4
    },
    {
      "H4CNF_TROJAN",
      5
    }
  }
  menu.add_feature("\231\140\142\232\177\185\233\155\149\229\131\143", "toggle", WEEKLY_F2.id, function(WEEKLY_DUO_v0)
    menu.notify("\230\175\143\228\189\141\231\142\169\229\174\182\231\154\132\233\162\132\232\174\161\229\136\134\231\186\162:\n $4,100,000\n\n\231\142\169\229\174\182\229\136\134\231\186\162(\229\183\178\233\148\129\229\174\154)\n\229\133\168\228\184\186:50%", "\230\138\162\229\138\171\229\174\137\229\133\168\228\191\157\233\154\156", 10, 1690859760)
    menu.notify("\233\162\132\232\174\190\229\183\178\228\191\174\230\148\185\228\184\186\229\143\140\228\186\186\233\162\132\232\174\190\n\228\184\141\232\166\129\228\189\191\231\148\168\228\187\187\228\189\149\233\171\152\231\186\167\233\128\137\233\161\185\n\228\184\141\232\166\129\228\189\191\231\148\168\232\131\140\229\140\133\229\174\185\233\135\143\228\191\174\230\148\185\229\153\168\n\228\184\141\232\166\129\230\155\180\230\148\185\229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\n\230\138\138\232\131\140\229\140\133\232\163\133\230\187\161\n\n\232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\230\191\128\230\180\187,\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159", "\229\143\140\228\186\186|\231\140\142\232\177\185\233\155\149\229\131\143", 7, 1679094015)
    for i = 1, #USER_CAN_MDFY_WKLY_DUO_PANTHER do
      stat_set_int(USER_CAN_MDFY_WKLY_DUO_PANTHER[i][1], true, USER_CAN_MDFY_WKLY_DUO_PANTHER[i][2])
    end
    while WEEKLY_DUO_v0.on do
      for i = 1, #WKLY_DUO_PANTHER do
        stat_set_int(WKLY_DUO_PANTHER[i][1], true, WKLY_DUO_PANTHER[i][2])
      end
      script.set_global_f(291786, -0.1)
      script.set_global_f(291787, -0.02)
      script.set_global_i(291540, 1800)
      script.set_global_i(1974405, 50)
      script.set_global_i(1974406, 50)
      system.yield(0)
    end
  end)
end
do
  local WKLY_TRIO_PANTHER = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_TARGET",
      5
    },
    {
      "H4LOOT_CASH_I",
      6490148
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      6490148
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I",
      8421904
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      8421904
    },
    {
      "H4LOOT_COKE_C",
      0
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C",
      255
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      255
    },
    {
      "H4LOOT_WEED_I",
      1311112
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      1311112
    },
    {
      "H4LOOT_WEED_C",
      0
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      0
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    },
    {
      "H4LOOT_CASH_V",
      948051
    },
    {
      "H4LOOT_COKE_V",
      1896103
    },
    {
      "H4LOOT_GOLD_V",
      2528137
    },
    {
      "H4LOOT_PAINT_V",
      1896103
    },
    {
      "H4LOOT_WEED_V",
      1516882
    },
    {
      "H4_PROGRESS",
      126823
    },
    {
      "H4CNF_BS_GEN",
      262143
    },
    {
      "H4CNF_BS_ENTR",
      63
    },
    {
      "H4CNF_BS_ABIL",
      63
    },
    {
      "H4CNF_WEP_DISRP",
      3
    },
    {
      "H4CNF_ARM_DISRP",
      3
    },
    {
      "H4CNF_HEL_DISRP",
      3
    },
    {
      "H4CNF_APPROACH",
      -1
    }
  }
  local USER_CAN_MDFY_WKLY_TRIO_PANTHER = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_BOLTCUT",
      4424
    },
    {
      "H4CNF_UNIFORM",
      5256
    },
    {
      "H4CNF_GRAPPEL",
      5156
    },
    {
      "H4_MISSIONS",
      -1
    },
    {
      "H4CNF_WEAPONS",
      4
    },
    {
      "H4CNF_TROJAN",
      5
    }
  }
  menu.add_feature("\231\140\142\232\177\185\233\155\149\229\131\143", "toggle", WEEKLY_F3.id, function(WEEKLY_TRIO_v0)
    menu.notify("\230\175\143\228\189\141\231\142\169\229\174\182\231\154\132\233\162\132\232\174\161\229\136\134\231\186\162:\n $4,100,000\n\n\231\142\169\229\174\182\229\136\134\231\186\162(\229\183\178\233\148\129\229\174\154)\n\230\136\191\228\184\187: 30%\n\229\133\182\228\187\150\231\142\169\229\174\182: 35%", "\230\138\162\229\138\171\229\174\137\229\133\168\228\191\157\233\154\156", 10, 1690859760)
    menu.notify("\233\162\132\232\174\190\229\183\178\228\191\174\230\148\185\228\184\186\228\184\137\228\186\186\233\162\132\232\174\190\n\228\184\141\232\166\129\228\189\191\231\148\168\228\187\187\228\189\149\233\171\152\231\186\167\233\128\137\233\161\185\n\228\184\141\232\166\129\228\189\191\231\148\168\232\131\140\229\140\133\229\174\185\233\135\143\228\191\174\230\148\185\229\153\168\n\228\184\141\232\166\129\230\155\180\230\148\185\229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\n\231\155\180\230\142\165\229\188\128\231\142\169:)\n\n\232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\230\191\128\230\180\187,\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159", "\228\187\187\229\138\161\232\132\154\230\156\172", 7, 1679094015)
    for i = 1, #USER_CAN_MDFY_WKLY_TRIO_PANTHER do
      stat_set_int(USER_CAN_MDFY_WKLY_TRIO_PANTHER[i][1], true, USER_CAN_MDFY_WKLY_TRIO_PANTHER[i][2])
    end
    while WEEKLY_TRIO_v0.on do
      for i = 1, #WKLY_TRIO_PANTHER do
        stat_set_int(WKLY_TRIO_PANTHER[i][1], true, WKLY_TRIO_PANTHER[i][2])
      end
      script.set_global_f(291786, -0.1)
      script.set_global_f(291787, -0.02)
      script.set_global_i(291540, 1800)
      script.set_global_i(1974405, 30)
      script.set_global_i(1974406, 35)
      script.set_global_i(1974407, 35)
      system.yield(0)
    end
  end)
end
do
  local WKLY_FOUR_PANTHER = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_TARGET",
      5
    },
    {
      "H4LOOT_CASH_I",
      6490148
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      6490148
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I",
      8421904
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      8421904
    },
    {
      "H4LOOT_COKE_C",
      0
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C",
      255
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      255
    },
    {
      "H4LOOT_WEED_I",
      1311112
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      1311112
    },
    {
      "H4LOOT_WEED_C",
      0
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      0
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    },
    {
      "H4LOOT_CASH_V",
      1045454
    },
    {
      "H4LOOT_COKE_V",
      2090909
    },
    {
      "H4LOOT_GOLD_V",
      2787878
    },
    {
      "H4LOOT_PAINT_V",
      2090909
    },
    {
      "H4LOOT_WEED_V",
      1672727
    },
    {
      "H4_PROGRESS",
      126823
    },
    {
      "H4CNF_BS_GEN",
      262143
    },
    {
      "H4CNF_BS_ENTR",
      63
    },
    {
      "H4CNF_BS_ABIL",
      63
    },
    {
      "H4CNF_WEP_DISRP",
      3
    },
    {
      "H4CNF_ARM_DISRP",
      3
    },
    {
      "H4CNF_HEL_DISRP",
      3
    },
    {
      "H4CNF_APPROACH",
      -1
    }
  }
  local USER_CAN_MDFY_WKLY_FOUR_PANTHER = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4CNF_BOLTCUT",
      4424
    },
    {
      "H4CNF_UNIFORM",
      5256
    },
    {
      "H4CNF_GRAPPEL",
      5156
    },
    {
      "H4_MISSIONS",
      -1
    },
    {
      "H4CNF_WEAPONS",
      4
    },
    {
      "H4CNF_TROJAN",
      5
    }
  }
  menu.add_feature("\231\140\142\232\177\185\233\155\149\229\131\143", "toggle", WEEKLY_F4.id, function(WEEKLY_FOUR_v0)
    menu.notify("\230\175\143\228\189\141\231\142\169\229\174\182\231\154\132\233\162\132\232\174\161\229\136\134\231\186\162:\n $4,100,000\n\n\231\142\169\229\174\182\229\136\134\231\186\162(\229\183\178\233\148\129\229\174\154)\n\229\133\168\228\184\186:25%", "\230\138\162\229\138\171\229\174\137\229\133\168\228\191\157\233\154\156", 10, 1690859760)
    menu.notify("\233\162\132\232\174\190\229\183\178\228\191\174\230\148\185\228\184\186\229\155\155\228\186\186\233\162\132\232\174\190\n\228\184\141\232\166\129\228\189\191\231\148\168\228\187\187\228\189\149\233\171\152\231\186\167\233\128\137\233\161\185\n\228\184\141\232\166\129\228\189\191\231\148\168\232\131\140\229\140\133\229\174\185\233\135\143\228\191\174\230\148\185\229\153\168\n\228\184\141\232\166\129\230\155\180\230\148\185\229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\n\230\138\138\232\131\140\229\140\133\232\163\133\230\187\161\n\n\232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\230\191\128\230\180\187,\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159", "\229\155\155\228\186\186|\231\140\142\232\177\185\233\155\149\229\131\143", 7, 1679094015)
    for i = 1, #USER_CAN_MDFY_WKLY_FOUR_PANTHER do
      stat_set_int(USER_CAN_MDFY_WKLY_FOUR_PANTHER[i][1], true, USER_CAN_MDFY_WKLY_FOUR_PANTHER[i][2])
    end
    while WEEKLY_FOUR_v0.on do
      for i = 1, #WKLY_FOUR_PANTHER do
        stat_set_int(WKLY_FOUR_PANTHER[i][1], true, WKLY_FOUR_PANTHER[i][2])
      end
      script.set_global_f(291786, -0.1)
      script.set_global_f(291787, -0.02)
      script.set_global_i(291540, 1800)
      script.set_global_i(1974405, 25)
      script.set_global_i(1974406, 25)
      script.set_global_i(1974407, 25)
      script.set_global_i(1974408, 25)
      system.yield(0)
    end
  end)
end
menu.add_feature("\232\135\170\229\174\154\228\185\137\229\136\134\231\186\162", "action", PERICO_HOST_CUT.id, function(perico_host)
  local r, s = input.get("\228\184\141\229\187\186\232\174\174\232\190\147\229\133\165\229\164\170\229\164\167\230\149\176\229\128\188", "", 1000, 3)
  if 1 == r then
    return HANDLER_CONTINUE
  end
  if 2 == r then
    return HANDLER_POP
  end
  script.set_global_i(1974405, tonumber(s))
end)
menu.add_feature("0 %", "toggle", PERICO_HOST_CUT.id, function(prio)
  while prio.on do
    script.set_global_i(1974405, 0)
    system.yield(0)
  end
end)
menu.add_feature("50 %", "action", PERICO_HOST_CUT.id, function()
  script.set_global_i(1974405, 50)
end)
menu.add_feature("85 %", "action", PERICO_HOST_CUT.id, function()
  script.set_global_i(1974405, 85)
end)
menu.add_feature("100 %", "action", PERICO_HOST_CUT.id, function()
  script.set_global_i(1974405, 100)
end)
menu.add_feature("125 %", "action", PERICO_HOST_CUT.id, function()
  script.set_global_i(1974405, 125)
end)
menu.add_feature("150 %", "action", PERICO_HOST_CUT.id, function()
  script.set_global_i(1974405, 150)
end)
menu.add_feature("\232\135\170\229\174\154\228\185\137\229\136\134\231\186\162", "action", PERICO_P2_CUT.id, function(perico2)
  local r, s = input.get("\228\184\141\229\187\186\232\174\174\232\190\147\229\133\165\229\164\170\229\164\167\230\149\176\229\128\188", "", 1000, 3)
  if 1 == r then
    return HANDLER_CONTINUE
  end
  if 2 == r then
    return HANDLER_POP
  end
  script.set_global_i(1974406, tonumber(s))
end)
menu.add_feature("0 %", "action", PERICO_P2_CUT.id, function()
  script.set_global_i(1974406, 0)
end)
menu.add_feature("50 %", "action", PERICO_P2_CUT.id, function()
  script.set_global_i(1974406, 50)
end)
menu.add_feature("85 %", "action", PERICO_P2_CUT.id, function()
  script.set_global_i(1974406, 85)
end)
menu.add_feature("100 %", "action", PERICO_P2_CUT.id, function()
  script.set_global_i(1974406, 100)
end)
menu.add_feature("125 %", "action", PERICO_P2_CUT.id, function()
  script.set_global_i(1974406, 125)
end)
menu.add_feature("150 %", "action", PERICO_P2_CUT.id, function()
  script.set_global_i(1974406, 150)
end)
menu.add_feature("\232\135\170\229\174\154\228\185\137\229\136\134\231\186\162", "action", PERICO_P3_CUT.id, function(perico3)
  local r, s = input.get("\228\184\141\229\187\186\232\174\174\232\190\147\229\133\165\229\164\170\229\164\167\230\149\176\229\128\188", "", 1000, 3)
  if 1 == r then
    return HANDLER_CONTINUE
  end
  if 2 == r then
    return HANDLER_POP
  end
  script.set_global_i(1974407, tonumber(s))
end)
menu.add_feature("0 %", "action", PERICO_P3_CUT.id, function()
  script.set_global_i(1974407, 0)
end)
menu.add_feature("50 %", "action", PERICO_P3_CUT.id, function()
  script.set_global_i(1974407, 50)
end)
menu.add_feature("85 %", "action", PERICO_P3_CUT.id, function()
  script.set_global_i(1974407, 85)
end)
menu.add_feature("100 %", "action", PERICO_P3_CUT.id, function()
  script.set_global_i(1974407, 100)
end)
menu.add_feature("125 %", "action", PERICO_P3_CUT.id, function()
  script.set_global_i(1974407, 125)
end)
menu.add_feature("150 %", "action", PERICO_P3_CUT.id, function()
  script.set_global_i(1974407, 150)
end)
menu.add_feature("\232\135\170\229\174\154\228\185\137\229\136\134\231\186\162", "action", PERICO_P4_CUT.id, function(perico4)
  local r, s = input.get("\228\184\141\229\187\186\232\174\174\232\190\147\229\133\165\229\164\170\229\164\167\230\149\176\229\128\188", "", 1000, 3)
  if 1 == r then
    return HANDLER_CONTINUE
  end
  if 2 == r then
    return HANDLER_POP
  end
  script.set_global_i(1974408, tonumber(s))
end)
menu.add_feature("0 %", "action", PERICO_P4_CUT.id, function()
  script.set_global_i(1974408, 0)
end)
menu.add_feature("50 %", "action", PERICO_P4_CUT.id, function()
  script.set_global_i(1974408, 50)
end)
menu.add_feature("85 %", "action", PERICO_P4_CUT.id, function()
  script.set_global_i(1974408, 85)
end)
menu.add_feature("100 %", "action", PERICO_P4_CUT.id, function()
  script.set_global_i(1974408, 100)
end)
menu.add_feature("125 %", "action", PERICO_P4_CUT.id, function()
  script.set_global_i(1974408, 125)
end)
menu.add_feature("150 %", "action", PERICO_P4_CUT.id, function()
  script.set_global_i(1974408, 150)
end)
menu.add_feature("\230\173\163\229\184\184\232\131\140\229\140\133\229\174\185\233\135\143", "action", CAYO_BAG.id, function()
  script.set_global_i(291540, 1800)
  menu.notify("* \229\143\170\229\175\185\228\189\160\231\148\159\230\149\136\n* \230\173\164\229\138\159\232\131\189\229\146\140\229\191\171\233\128\159\233\162\132\232\174\190\228\184\141\229\133\188\229\174\185\n* \229\187\186\232\174\174\229\156\168\229\165\189\229\143\139/\233\154\143\230\156\186\230\138\162\229\138\171\228\184\173\228\189\191\231\148\168", "\232\131\140\229\140\133\230\129\162\229\164\141", 5, 1679093760)
end)
menu.add_feature("\229\143\140\229\128\141\232\131\140\229\140\133\229\174\185\233\135\143", "action", CAYO_BAG.id, function()
  script.set_global_i(291540, 3600)
  menu.notify("* \229\143\170\229\175\185\228\189\160\231\148\159\230\149\136\n* \230\173\164\229\138\159\232\131\189\229\146\140\229\191\171\233\128\159\233\162\132\232\174\190\228\184\141\229\133\188\229\174\185\n* \229\187\186\232\174\174\229\156\168\229\165\189\229\143\139/\233\154\143\230\156\186\230\138\162\229\138\171\228\184\173\228\189\191\231\148\168", "\229\143\140\229\128\141\229\174\185\233\135\143", 5, 1679093760)
end)
menu.add_feature("\228\184\137\229\128\141\232\131\140\229\140\133\229\174\185\233\135\143", "action", CAYO_BAG.id, function()
  script.set_global_i(291540, 5400)
  menu.notify("* \229\143\170\229\175\185\228\189\160\231\148\159\230\149\136\n* \230\173\164\229\138\159\232\131\189\229\146\140\229\191\171\233\128\159\233\162\132\232\174\190\228\184\141\229\133\188\229\174\185\n* \229\187\186\232\174\174\229\156\168\229\165\189\229\143\139/\233\154\143\230\156\186\230\138\162\229\138\171\228\184\173\228\189\191\231\148\168", "3\229\128\141\229\174\185\233\135\143", 5, 1679093760)
end)
menu.add_feature("\229\155\155\229\128\141\232\131\140\229\140\133\229\174\185\233\135\143", "action", CAYO_BAG.id, function()
  script.set_global_i(291540, 7200)
  menu.notify("* \229\143\170\229\175\185\228\189\160\231\148\159\230\149\136\n* \230\173\164\229\138\159\232\131\189\229\146\140\229\191\171\233\128\159\233\162\132\232\174\190\228\184\141\229\133\188\229\174\185\n* \229\187\186\232\174\174\229\156\168\229\165\189\229\143\139/\233\154\143\230\156\186\230\138\162\229\138\171\228\184\173\228\189\191\231\148\168", "4\229\128\141\229\174\185\233\135\143", 5, 1679093760)
end)
menu.add_feature("\230\151\160\233\153\144\232\131\140\229\140\133\229\174\185\233\135\143", "action", CAYO_BAG.id, function()
  script.set_global_i(291540, 9999999)
  menu.notify("* \229\143\170\229\175\185\228\189\160\231\148\159\230\149\136\n* \230\173\164\229\138\159\232\131\189\229\146\140\229\191\171\233\128\159\233\162\132\232\174\190\228\184\141\229\133\188\229\174\185\n* \229\187\186\232\174\174\229\156\168\229\165\189\229\143\139/\233\154\143\230\156\186\230\138\162\229\138\171\228\184\173\228\189\191\231\148\168", "\230\151\160\233\153\144\229\174\185\233\135\143", 5, 1679093760)
end)
menu.add_feature("\231\167\187\233\153\164\230\142\146\230\176\180\231\174\161\233\129\147\230\160\133\230\160\143", "action", PERICO_ADV.id, function()
  for k, DOORs in pairs(object.get_all_objects()) do
    local ENT_ENTRY = entity.get_entity_model_hash(DOORs)
    local prop_chem_grill_bit = 2997331308
    if ENT_ENTRY == prop_chem_grill_bit then
      network.request_control_of_entity(DOORs)
      local timer = utils.time_ms() + 500
      while not network.has_control_of_entity(DOORs) and timer > utils.time_ms() do
        system.wait(1500)
      end
      if network.has_control_of_entity(DOORs) then
        entity.set_entity_as_no_longer_needed(DOORs)
        entity.delete_entity(DOORs)
      end
    end
  end
  menu.notify("Drainage Pipe removed", "", 3, 1678701506)
end)
do
  local CP_VEH_KA = {
    {
      "H4_MISSIONS",
      65283
    }
  }
  menu.add_feature("\230\189\156\230\176\180\232\137\135\239\188\154\232\153\142\233\178\184", "action", CAYO_VEHICLES.id, function()
    menu.notify("\232\153\142\233\178\184\231\142\176\229\183\178\232\167\163\233\148\129", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #CP_VEH_KA do
      stat_set_int(CP_VEH_KA[i][1], true, CP_VEH_KA[i][2])
    end
  end)
end
do
  local CP_VEH_AT = {
    {
      "H4_MISSIONS",
      65413
    }
  }
  menu.add_feature("\233\163\158\230\156\186\239\188\154\233\152\191\229\176\148\231\167\145\232\175\186\230\150\175\231\137\185", "action", CAYO_VEHICLES.id, function()
    menu.notify("\233\152\191\229\176\148\231\167\145\232\175\186\230\150\175\231\137\185\231\142\176\229\183\178\232\167\163\233\148\129", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #CP_VEH_AT do
      stat_set_int(CP_VEH_AT[i][1], true, CP_VEH_AT[i][2])
    end
  end)
end
do
  local CP_VEH_VM = {
    {
      "H4_MISSIONS",
      65289
    }
  }
  menu.add_feature("\233\163\158\230\156\186\239\188\154\230\162\133\230\157\156\232\142\142", "action", CAYO_VEHICLES.id, function()
    menu.notify("\230\162\133\230\157\156\232\142\142\231\142\176\229\183\178\232\167\163\233\148\129", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #CP_VEH_VM do
      stat_set_int(CP_VEH_VM[i][1], true, CP_VEH_VM[i][2])
    end
  end)
end
do
  local CP_VEH_SA = {
    {
      "H4_MISSIONS",
      65425
    }
  }
  menu.add_feature("\231\155\180\229\141\135\230\156\186\239\188\154\233\154\144\229\189\162\230\173\188\231\129\173\232\128\133", "action", CAYO_VEHICLES.id, function()
    menu.notify("\233\154\144\229\189\162\230\173\188\231\129\173\232\128\133\231\142\176\229\183\178\232\167\163\233\148\129", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #CP_VEH_SA do
      stat_set_int(CP_VEH_SA[i][1], true, CP_VEH_SA[i][2])
    end
  end)
end
do
  local CP_VEH_PB = {
    {
      "H4_MISSIONS",
      65313
    }
  }
  menu.add_feature("\232\136\185\229\143\170\239\188\154\229\183\161\233\128\187\232\137\135", "action", CAYO_VEHICLES.id, function()
    menu.notify("\229\183\161\233\128\187\232\137\135\231\142\176\229\183\178\232\167\163\233\148\129", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #CP_VEH_PB do
      stat_set_int(CP_VEH_PB[i][1], true, CP_VEH_PB[i][2])
    end
  end)
end
do
  local CP_VEH_LN = {
    {
      "H4_MISSIONS",
      65345
    }
  }
  menu.add_feature("\232\136\185\229\143\170\239\188\154\233\149\191\233\179\141", "action", CAYO_VEHICLES.id, function()
    menu.notify("\233\149\191\233\179\141\231\142\176\229\183\178\232\167\163\233\148\129", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #CP_VEH_LN do
      stat_set_int(CP_VEH_LN[i][1], true, CP_VEH_LN[i][2])
    end
  end)
end
do
  local CP_VEH_ALL = {
    {
      "H4_MISSIONS",
      -1
    }
  }
  menu.add_feature("\232\167\163\233\148\129\230\137\128\230\156\137\230\142\165\232\191\145\232\189\189\229\133\183", "action", CAYO_VEHICLES.id, function()
    menu.notify("\231\142\176\229\143\175\228\189\191\231\148\168\230\137\128\230\156\137\230\142\165\232\191\145\232\189\189\229\133\183!", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #CP_VEH_ALL do
      stat_set_int(CP_VEH_ALL[i][1], true, CP_VEH_ALL[i][2])
    end
  end)
end
do
  local Target_SapphirePanther = {
    {
      "H4CNF_TARGET",
      5
    }
  }
  menu.add_feature("\231\140\142\232\177\185\233\155\149\229\131\143(190\228\184\135-209\228\184\135)", "action", CAYO_PRIMARY.id, function()
    menu.notify("\228\184\187\232\166\129\231\155\174\230\160\135\229\183\178\229\143\152\230\155\180\228\184\186:\231\140\142\232\177\185\233\155\149\229\131\143", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #Target_SapphirePanther do
      stat_set_int(Target_SapphirePanther[i][1], true, Target_SapphirePanther[i][2])
    end
  end)
end
do
  local Target_MadrazoF = {
    {
      "H4CNF_TARGET",
      4
    }
  }
  menu.add_feature("\231\142\155\229\190\183\230\139\137\231\180\162\230\150\135\228\187\182(110\228\184\135-121\228\184\135)", "action", CAYO_PRIMARY.id, function()
    menu.notify("\228\184\187\232\166\129\231\155\174\230\160\135\229\183\178\229\143\152\230\155\180\228\184\186:\231\142\155\229\190\183\230\139\137\231\180\162\230\150\135\228\187\182", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #Target_MadrazoF do
      stat_set_int(Target_MadrazoF[i][1], true, Target_MadrazoF[i][2])
    end
  end)
end
do
  local Target_PinkDiamond = {
    {
      "H4CNF_TARGET",
      3
    }
  }
  menu.add_feature("\231\178\137\233\146\187(130\228\184\135-143\228\184\135)", "action", CAYO_PRIMARY.id, function()
    menu.notify("\228\184\187\232\166\129\231\155\174\230\160\135\229\183\178\229\143\152\230\155\180\228\184\186:\231\178\137\233\146\187", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #Target_PinkDiamond do
      stat_set_int(Target_PinkDiamond[i][1], true, Target_PinkDiamond[i][2])
    end
  end)
end
do
  local Target_BearerBonds = {
    {
      "H4CNF_TARGET",
      2
    }
  }
  menu.add_feature("\228\184\141\232\174\176\229\144\141\229\128\186\229\136\184(110\228\184\135-121\228\184\135)", "action", CAYO_PRIMARY.id, function()
    menu.notify("\228\184\187\232\166\129\231\155\174\230\160\135\229\183\178\229\143\152\230\155\180\228\184\186:\228\184\141\232\174\176\229\144\141\229\128\186\229\136\184", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #Target_BearerBonds do
      stat_set_int(Target_BearerBonds[i][1], true, Target_BearerBonds[i][2])
    end
  end)
end
do
  local Target_Ruby = {
    {
      "H4CNF_TARGET",
      1
    }
  }
  menu.add_feature("\231\186\162\229\174\157\231\159\179\233\161\185\233\147\190(100\228\184\135-110\228\184\135)", "action", CAYO_PRIMARY.id, function()
    menu.notify("\228\184\187\232\166\129\231\155\174\230\160\135\229\183\178\229\143\152\230\155\180\228\184\186:\231\186\162\229\174\157\231\159\179\233\161\185\233\147\190", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #Target_Ruby do
      stat_set_int(Target_Ruby[i][1], true, Target_Ruby[i][2])
    end
  end)
end
do
  local Target_Tequila = {
    {
      "H4CNF_TARGET",
      0
    }
  }
  menu.add_feature("\232\165\191\232\165\191\231\177\179\230\137\152\233\190\153\232\136\140\229\133\176(90\228\184\135-99\228\184\135)", "action", CAYO_PRIMARY.id, function()
    menu.notify("\228\184\187\232\166\129\231\155\174\230\160\135\229\183\178\229\143\152\230\155\180\228\184\186: \232\165\191\232\165\191\231\177\179\230\137\152\233\190\153\232\136\140\229\133\176", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #Target_Tequila do
      stat_set_int(Target_Tequila[i][1], true, Target_Tequila[i][2])
    end
  end)
end
do
  local SecondaryT_RDM = {
    {
      "H4LOOT_CASH_I",
      1319624
    },
    {
      "H4LOOT_CASH_C",
      18
    },
    {
      "H4LOOT_CASH_V",
      89400
    },
    {
      "H4LOOT_WEED_I",
      2639108
    },
    {
      "H4LOOT_WEED_C",
      36
    },
    {
      "H4LOOT_WEED_V",
      149000
    },
    {
      "H4LOOT_COKE_I",
      4229122
    },
    {
      "H4LOOT_COKE_C",
      72
    },
    {
      "H4LOOT_COKE_V",
      221200
    },
    {
      "H4LOOT_GOLD_I",
      8589313
    },
    {
      "H4LOOT_GOLD_C",
      129
    },
    {
      "H4LOOT_GOLD_V",
      322600
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_V",
      186800
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      1319624
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      18
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      2639108
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      36
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      4229122
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      72
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      8589313
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      129
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    }
  }
  menu.add_feature("\230\183\183\229\144\136\231\155\174\230\160\135", "action", CAYO_SECONDARY.id, function()
    menu.notify("\230\172\161\232\166\129\231\155\174\230\160\135\229\183\178\232\174\190\228\184\186\230\183\183\229\144\136\231\155\174\230\160\135\n\n\228\189\191\231\148\168\230\173\164\233\128\137\233\161\185\230\151\182,\229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\228\187\165\229\143\138\230\156\128\231\187\136\233\135\145\233\162\157\228\184\186\233\154\143\230\156\186!", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #SecondaryT_RDM do
      stat_set_int(SecondaryT_RDM[i][1], true, SecondaryT_RDM[i][2])
    end
  end)
end
do
  local SecondaryT_FCash = {
    {
      "H4LOOT_CASH_I",
      -1
    },
    {
      "H4LOOT_CASH_C",
      -1
    },
    {
      "H4LOOT_CASH_V",
      90000
    },
    {
      "H4LOOT_WEED_I",
      0
    },
    {
      "H4LOOT_WEED_C",
      0
    },
    {
      "H4LOOT_WEED_V",
      0
    },
    {
      "H4LOOT_COKE_I",
      0
    },
    {
      "H4LOOT_COKE_C",
      0
    },
    {
      "H4LOOT_COKE_V",
      0
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_C",
      0
    },
    {
      "H4LOOT_GOLD_V",
      0
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_V",
      190000
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      -1
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      -1
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      0
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      0
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    }
  }
  menu.add_feature("\229\133\168\228\184\186\231\142\176\233\135\145", "action", CAYO_SECONDARY.id, function()
    menu.notify("\230\137\128\230\156\137\230\172\161\232\166\129\231\155\174\230\160\135\229\183\178\229\143\152\228\184\186\231\142\176\233\135\145\n\n\228\189\191\231\148\168\230\173\164\233\128\137\233\161\185\230\151\182,\229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\228\187\165\229\143\138\230\156\128\231\187\136\233\135\145\233\162\157\228\184\186\233\154\143\230\156\186!", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #SecondaryT_FCash do
      stat_set_int(SecondaryT_FCash[i][1], true, SecondaryT_FCash[i][2])
    end
  end)
end
do
  local SecondaryT_FWeed = {
    {
      "H4LOOT_CASH_I",
      0
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_V",
      0
    },
    {
      "H4LOOT_WEED_I",
      -1
    },
    {
      "H4LOOT_WEED_C",
      -1
    },
    {
      "H4LOOT_WEED_V",
      140000
    },
    {
      "H4LOOT_COKE_I",
      0
    },
    {
      "H4LOOT_COKE_C",
      0
    },
    {
      "H4LOOT_COKE_V",
      0
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_C",
      0
    },
    {
      "H4LOOT_GOLD_V",
      0
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_V",
      190000
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      -1
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      -1
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      0
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    }
  }
  menu.add_feature("\229\133\168\228\184\186\229\164\167\233\186\187", "action", CAYO_SECONDARY.id, function()
    menu.notify("\230\137\128\230\156\137\230\172\161\232\166\129\231\155\174\230\160\135\229\183\178\229\143\152\228\184\186\229\164\167\233\186\187\n\n\228\189\191\231\148\168\230\173\164\233\128\137\233\161\185\230\151\182,\229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\228\187\165\229\143\138\230\156\128\231\187\136\233\135\145\233\162\157\228\184\186\233\154\143\230\156\186!", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #SecondaryT_FWeed do
      stat_set_int(SecondaryT_FWeed[i][1], true, SecondaryT_FWeed[i][2])
    end
  end)
end
do
  local SecondaryT_FCoke = {
    {
      "H4LOOT_CASH_I",
      0
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_V",
      0
    },
    {
      "H4LOOT_WEED_I",
      0
    },
    {
      "H4LOOT_WEED_C",
      0
    },
    {
      "H4LOOT_WEED_V",
      0
    },
    {
      "H4LOOT_COKE_I",
      -1
    },
    {
      "H4LOOT_COKE_C",
      -1
    },
    {
      "H4LOOT_COKE_V",
      210000
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_C",
      0
    },
    {
      "H4LOOT_GOLD_V",
      0
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_V",
      190000
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      0
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      -1
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      -1
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      0
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    }
  }
  menu.add_feature("\229\133\168\228\184\186\229\143\175\229\141\161\229\155\160", "action", CAYO_SECONDARY.id, function()
    menu.notify("\230\137\128\230\156\137\230\172\161\232\166\129\231\155\174\230\160\135\229\183\178\229\143\152\228\184\186\229\143\175\229\141\161\229\155\160\n\n\228\189\191\231\148\168\230\173\164\233\128\137\233\161\185\230\151\182,\229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\228\187\165\229\143\138\230\156\128\231\187\136\233\135\145\233\162\157\228\184\186\233\154\143\230\156\186!", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #SecondaryT_FCoke do
      stat_set_int(SecondaryT_FCoke[i][1], true, SecondaryT_FCoke[i][2])
    end
  end)
end
do
  local SecondaryT_FGold = {
    {
      "H4LOOT_CASH_I",
      0
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_V",
      0
    },
    {
      "H4LOOT_WEED_I",
      0
    },
    {
      "H4LOOT_WEED_C",
      0
    },
    {
      "H4LOOT_WEED_V",
      0
    },
    {
      "H4LOOT_COKE_I",
      0
    },
    {
      "H4LOOT_COKE_C",
      0
    },
    {
      "H4LOOT_COKE_V",
      0
    },
    {
      "H4LOOT_GOLD_I",
      -1
    },
    {
      "H4LOOT_GOLD_C",
      -1
    },
    {
      "H4LOOT_GOLD_V",
      320000
    },
    {
      "H4LOOT_PAINT",
      -1
    },
    {
      "H4LOOT_PAINT_V",
      190000
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      0
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      -1
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      -1
    },
    {
      "H4LOOT_PAINT_SCOPED",
      -1
    }
  }
  menu.add_feature("\229\133\168\228\184\186\233\187\132\233\135\145", "action", CAYO_SECONDARY.id, function()
    menu.notify("\230\137\128\230\156\137\230\172\161\232\166\129\231\155\174\230\160\135\229\183\178\229\143\152\228\184\186\233\187\132\233\135\145\n\n\228\189\191\231\148\168\230\173\164\233\128\137\233\161\185\230\151\182,\229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\228\187\165\229\143\138\230\156\128\231\187\136\233\135\145\233\162\157\228\184\186\233\154\143\230\156\186!", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #SecondaryT_FGold do
      stat_set_int(SecondaryT_FGold[i][1], true, SecondaryT_FGold[i][2])
    end
  end)
end
do
  local SecondaryT_Remove = {
    {
      "H4LOOT_CASH_I",
      0
    },
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_V",
      0
    },
    {
      "H4LOOT_WEED_I",
      0
    },
    {
      "H4LOOT_WEED_C",
      0
    },
    {
      "H4LOOT_WEED_V",
      0
    },
    {
      "H4LOOT_COKE_I",
      0
    },
    {
      "H4LOOT_COKE_C",
      0
    },
    {
      "H4LOOT_COKE_V",
      0
    },
    {
      "H4LOOT_GOLD_I",
      0
    },
    {
      "H4LOOT_GOLD_C",
      0
    },
    {
      "H4LOOT_GOLD_V",
      0
    },
    {
      "H4LOOT_PAINT",
      0
    },
    {
      "H4LOOT_PAINT_V",
      0
    },
    {
      "H4LOOT_CASH_I_SCOPED",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_WEED_I_SCOPED",
      0
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_I_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_I_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      0
    },
    {
      "H4LOOT_PAINT_SCOPED",
      0
    }
  }
  menu.add_feature("\231\167\187\233\153\164\230\137\128\230\156\137\230\172\161\232\166\129\231\155\174\230\160\135", "action", CAYO_SECONDARY.id, function()
    menu.notify("\230\137\128\230\156\137\230\172\161\232\166\129\231\155\174\230\160\135\229\183\178\232\162\171\231\167\187\233\153\164", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #SecondaryT_Remove do
      stat_set_int(SecondaryT_Remove[i][1], true, SecondaryT_Remove[i][2])
    end
  end)
end
local CAH_2ND_TARGET_MDY = menu.add_feature("\230\155\180\230\148\185\230\136\152\229\136\169\229\147\129\228\187\183\229\128\188", "parent", CAYO_SECONDARY.id, function()
  menu.notify("\228\189\191\231\148\168\230\173\164\233\128\137\233\161\185\230\151\182,\229\191\133\233\161\187\230\155\180\230\150\176\230\138\162\229\138\171\233\157\162\230\157\191", "", 4, 1343549690)
end)
local valueToSet = menu.add_feature("\230\155\180\230\148\185\231\142\176\233\135\145\228\187\183\229\128\188", "action", CAH_2ND_TARGET_MDY.id, function()
  local Choose, ME = input.get("\232\175\183\229\143\170\232\190\147\229\133\165\230\149\176\229\173\151", "", 1000, 3)
  if 1 == Choose then
    return HANDLER_CONTINUE
  end
  if 2 == Choose then
    return HANDLER_POP
  end
  stats.stat_set_int(gameplay.get_hash_key(PlayerMP .. "_H4LOOT_CASH_V"), tonumber(ME), true)
  menu.notify("\230\149\176\229\128\188\230\155\180\230\148\185\228\184\186:\n" .. ME, "", 4, 1679093840)
end)
local valueToSet = menu.add_feature("\230\155\180\230\148\185\229\164\167\233\186\187\228\187\183\229\128\188", "action", CAH_2ND_TARGET_MDY.id, function()
  local Choose, ME = input.get("\232\175\183\229\143\170\232\190\147\229\133\165\230\149\176\229\173\151", "", 1000, 3)
  if 1 == Choose then
    return HANDLER_CONTINUE
  end
  if 2 == Choose then
    return HANDLER_POP
  end
  stats.stat_set_int(gameplay.get_hash_key(PlayerMP .. "_H4LOOT_WEED_V"), tonumber(ME), true)
  menu.notify("\230\149\176\229\128\188\230\155\180\230\148\185\228\184\186:\n" .. ME, "", 4, 1679093840)
end)
local valueToSet = menu.add_feature("\230\155\180\230\148\185\229\143\175\229\141\161\229\155\160\228\187\183\229\128\188", "action", CAH_2ND_TARGET_MDY.id, function()
  local Choose, ME = input.get("\232\175\183\229\143\170\232\190\147\229\133\165\230\149\176\229\173\151", "", 1000, 3)
  if 1 == Choose then
    return HANDLER_CONTINUE
  end
  if 2 == Choose then
    return HANDLER_POP
  end
  stats.stat_set_int(gameplay.get_hash_key(PlayerMP .. "_H4LOOT_COKE_V"), tonumber(ME), true)
  menu.notify("\230\149\176\229\128\188\230\155\180\230\148\185\228\184\186:\n" .. ME, "", 4, 1679093840)
end)
local valueToSet = menu.add_feature("\230\155\180\230\148\185\233\187\132\233\135\145\228\187\183\229\128\188", "action", CAH_2ND_TARGET_MDY.id, function()
  local Choose, ME = input.get("\232\175\183\229\143\170\232\190\147\229\133\165\230\149\176\229\173\151", "", 1000, 3)
  if 1 == Choose then
    return HANDLER_CONTINUE
  end
  if 2 == Choose then
    return HANDLER_POP
  end
  stats.stat_set_int(gameplay.get_hash_key(PlayerMP .. "_H4LOOT_GOLD_V"), tonumber(ME), true)
  menu.notify("\230\149\176\229\128\188\230\155\180\230\148\185\228\184\186:\n" .. ME, "", 4, 1679093840)
end)
local valueToSet = menu.add_feature("\230\155\180\230\148\185\231\148\187\231\154\132\228\187\183\229\128\188", "action", CAH_2ND_TARGET_MDY.id, function()
  local Choose, ME = input.get("\232\175\183\229\143\170\232\190\147\229\133\165\230\149\176\229\173\151", "", 1000, 3)
  if 1 == Choose then
    return HANDLER_CONTINUE
  end
  if 2 == Choose then
    return HANDLER_POP
  end
  stats.stat_set_int(gameplay.get_hash_key(PlayerMP .. "_H4LOOT_PAINT_V"), tonumber(ME), true)
  menu.notify("\230\149\176\229\128\188\230\155\180\230\148\185\228\184\186:\n" .. ME, "", 4, 1679093840)
end)
local CAYO_COMPOUND = menu.add_feature("\229\186\132\229\155\173\229\134\133\230\136\152\229\136\169\229\147\129", "parent", CAYO_SECONDARY.id)
do
  local Compound_LT_MIX = {
    {
      "H4LOOT_CASH_C",
      2
    },
    {
      "H4LOOT_CASH_V",
      474431
    },
    {
      "H4LOOT_WEED_C",
      17
    },
    {
      "H4LOOT_WEED_V",
      759090
    },
    {
      "H4LOOT_COKE_C",
      132
    },
    {
      "H4LOOT_COKE_V",
      948863
    },
    {
      "H4LOOT_GOLD_C",
      104
    },
    {
      "H4LOOT_GOLD_V",
      1265151
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_V",
      948863
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      2
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      17
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      132
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      104
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    }
  }
  menu.add_feature("\230\148\185\228\184\186\230\183\183\229\144\136\230\136\152\229\136\169\229\147\129", "action", CAYO_COMPOUND.id, function()
    menu.notify("\230\136\152\229\136\169\229\147\129\229\183\178\232\162\171\228\191\174\230\148\185", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #Compound_LT_MIX do
      stat_set_int(Compound_LT_MIX[i][1], true, Compound_LT_MIX[i][2])
    end
  end)
end
do
  local Compound_LT_CASH = {
    {
      "H4LOOT_CASH_C",
      -1
    },
    {
      "H4LOOT_CASH_V",
      90000
    },
    {
      "H4LOOT_WEED_C",
      0
    },
    {
      "H4LOOT_WEED_V",
      0
    },
    {
      "H4LOOT_COKE_C",
      0
    },
    {
      "H4LOOT_COKE_V",
      0
    },
    {
      "H4LOOT_GOLD_C",
      0
    },
    {
      "H4LOOT_GOLD_V",
      0
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_V",
      190000
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      -1
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      0
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    }
  }
  menu.add_feature("\229\133\168\228\184\186\231\142\176\233\135\145", "action", CAYO_COMPOUND.id, function()
    menu.notify("\230\136\152\229\136\169\229\147\129\229\183\178\230\148\185\228\184\186\231\142\176\233\135\145", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #Compound_LT_CASH do
      stat_set_int(Compound_LT_CASH[i][1], true, Compound_LT_CASH[i][2])
    end
  end)
end
do
  local Compound_LT_WEED = {
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_V",
      0
    },
    {
      "H4LOOT_WEED_C",
      -1
    },
    {
      "H4LOOT_WEED_V",
      140000
    },
    {
      "H4LOOT_COKE_C",
      0
    },
    {
      "H4LOOT_COKE_V",
      0
    },
    {
      "H4LOOT_GOLD_C",
      0
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_V",
      190000
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      -1
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      0
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      0
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    }
  }
  menu.add_feature("\229\133\168\228\184\186\229\164\167\233\186\187", "action", CAYO_COMPOUND.id, function()
    menu.notify("\230\136\152\229\136\169\229\147\129\229\183\178\230\148\185\228\184\186\229\164\167\233\186\187", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #Compound_LT_WEED do
      stat_set_int(Compound_LT_WEED[i][1], true, Compound_LT_WEED[i][2])
    end
  end)
end
do
  local Compound_LT_COKE = {
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_V",
      0
    },
    {
      "H4LOOT_WEED_C",
      0
    },
    {
      "H4LOOT_WEED_V",
      0
    },
    {
      "H4LOOT_COKE_C",
      -1
    },
    {
      "H4LOOT_COKE_V",
      210000
    },
    {
      "H4LOOT_GOLD_C",
      0
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_V",
      190000
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      -1
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      0
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    }
  }
  menu.add_feature("\229\133\168\228\184\186\229\143\175\229\141\161\229\155\160", "action", CAYO_COMPOUND.id, function()
    menu.notify("\230\136\152\229\136\169\229\147\129\229\183\178\230\148\185\228\184\186\229\143\175\229\141\161\229\155\160", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #Compound_LT_COKE do
      stat_set_int(Compound_LT_COKE[i][1], true, Compound_LT_COKE[i][2])
    end
  end)
end
do
  local Compound_LT_GOLD = {
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_V",
      0
    },
    {
      "H4LOOT_WEED_C",
      0
    },
    {
      "H4LOOT_WEED_V",
      0
    },
    {
      "H4LOOT_COKE_C",
      0
    },
    {
      "H4LOOT_COKE_V",
      0
    },
    {
      "H4LOOT_GOLD_C",
      -1
    },
    {
      "H4LOOT_GOLD_V",
      320000
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_V",
      190000
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      -1
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      0
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    }
  }
  menu.add_feature("\229\133\168\228\184\186\233\187\132\233\135\145", "action", CAYO_COMPOUND.id, function()
    menu.notify("\230\136\152\229\136\169\229\147\129\229\183\178\230\148\185\228\184\186\233\187\132\233\135\145", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #Compound_LT_GOLD do
      stat_set_int(Compound_LT_GOLD[i][1], true, Compound_LT_GOLD[i][2])
    end
  end)
end
do
  local Compound_LT_PAINT = {
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_CASH_V",
      0
    },
    {
      "H4LOOT_WEED_C",
      0
    },
    {
      "H4LOOT_WEED_V",
      0
    },
    {
      "H4LOOT_COKE_C",
      0
    },
    {
      "H4LOOT_COKE_V",
      0
    },
    {
      "H4LOOT_GOLD_C",
      0
    },
    {
      "H4LOOT_GOLD_V",
      0
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      0
    },
    {
      "H4LOOT_PAINT",
      127
    },
    {
      "H4LOOT_PAINT_V",
      190000
    },
    {
      "H4LOOT_PAINT_SCOPED",
      127
    }
  }
  menu.add_feature("\229\133\168\228\184\186\231\148\187", "action", CAYO_COMPOUND.id, function()
    menu.notify("\230\136\152\229\136\169\229\147\129\229\183\178\229\133\168\230\148\185\228\184\186\231\148\187", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #Compound_LT_PAINT do
      stat_set_int(Compound_LT_PAINT[i][1], true, Compound_LT_PAINT[i][2])
    end
  end)
end
do
  local Remove_Compound_Paint = {
    {
      "H4LOOT_PAINT",
      0
    },
    {
      "H4LOOT_PAINT_V",
      0
    },
    {
      "H4LOOT_PAINT_SCOPED",
      0
    }
  }
  menu.add_feature("\231\167\187\233\153\164\231\148\187", "action", CAYO_COMPOUND.id, function()
    menu.notify("\231\148\187\229\183\178\232\162\171\231\167\187\233\153\164", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #Remove_Compound_Paint do
      stat_set_int(Remove_Compound_Paint[i][1], true, Remove_Compound_Paint[i][2])
    end
  end)
end
do
  local Remove_ALL_Compound_LT = {
    {
      "H4LOOT_CASH_C",
      0
    },
    {
      "H4LOOT_WEED_C",
      0
    },
    {
      "H4LOOT_COKE_C",
      0
    },
    {
      "H4LOOT_GOLD_C",
      0
    },
    {
      "H4LOOT_GOLD_C_SCOPED",
      0
    },
    {
      "H4LOOT_CASH_C_SCOPED",
      0
    },
    {
      "H4LOOT_WEED_C_SCOPED",
      0
    },
    {
      "H4LOOT_COKE_C_SCOPED",
      0
    },
    {
      "H4LOOT_PAINT",
      0
    },
    {
      "H4LOOT_PAINT_SCOPED",
      0
    }
  }
  menu.add_feature("\231\167\187\233\153\164\230\137\128\230\156\137\229\186\132\229\155\173\229\134\133\230\136\152\229\136\169\229\147\129", "action", CAYO_COMPOUND.id, function()
    menu.notify("\230\137\128\230\156\137\229\186\132\229\155\173\229\134\133\230\136\152\229\136\169\229\147\129\229\183\178\232\162\171\231\167\187\233\153\164", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #Remove_ALL_Compound_LT do
      stat_set_int(Remove_ALL_Compound_LT[i][1], true, Remove_ALL_Compound_LT[i][2])
    end
  end)
end
do
  local Weapon_Aggressor = {
    {
      "H4CNF_WEAPONS",
      1
    }
  }
  menu.add_feature("\228\190\181\231\149\165\232\128\133\233\133\141\231\189\174", "action", CAYO_WEAPONS.id, function()
    menu.notify("\230\173\166\229\153\168\233\133\141\231\189\174\229\183\178\232\174\190\231\189\174\228\184\186\228\190\181\231\149\165\232\128\133\233\133\141\231\189\174(\231\170\129\229\135\187\233\156\176\229\188\185\230\158\170,\229\134\178\233\148\139\230\137\139\230\158\170,\230\137\139\230\166\180\229\188\185,\231\160\141\229\136\128)", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1688259860)
    for i = 1, #Weapon_Aggressor do
      stat_set_int(Weapon_Aggressor[i][1], true, Weapon_Aggressor[i][2])
    end
  end)
end
do
  local Weapon_Conspirator = {
    {
      "H4CNF_WEAPONS",
      2
    }
  }
  menu.add_feature("\233\152\180\232\176\139\232\128\133\233\133\141\231\189\174", "action", CAYO_WEAPONS.id, function()
    menu.notify("\230\173\166\229\153\168\233\133\141\231\189\174\229\183\178\232\174\190\231\189\174\228\184\186\233\152\180\232\176\139\232\128\133\232\128\133\233\133\141\231\189\174(\229\134\155\231\148\168\230\173\165\230\158\170,\231\169\191\231\148\178\230\137\139\230\158\170,\231\178\152\229\188\185,\230\140\135\232\153\142)", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1688259860)
    for i = 1, #Weapon_Conspirator do
      stat_set_int(Weapon_Conspirator[i][1], true, Weapon_Conspirator[i][2])
    end
  end)
end
do
  local Weapon_Crackshot = {
    {
      "H4CNF_WEAPONS",
      3
    }
  }
  menu.add_feature("\231\165\158\230\158\170\230\137\139\233\133\141\231\189\174", "action", CAYO_WEAPONS.id, function()
    menu.notify("\230\173\166\229\153\168\233\133\141\231\189\174\229\183\178\232\174\190\231\189\174\228\184\186\231\165\158\230\158\170\230\137\139\233\133\141\231\189\174(\231\139\153\229\135\187\230\173\165\230\158\170,\231\169\191\231\148\178\230\137\139\230\158\170,\230\177\189\230\178\185\231\147\182,\229\176\143\229\136\128)", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1688259860)
    for i = 1, #Weapon_Crackshot do
      stat_set_int(Weapon_Crackshot[i][1], true, Weapon_Crackshot[i][2])
    end
  end)
end
do
  local Weapon_Saboteur = {
    {
      "H4CNF_WEAPONS",
      4
    }
  }
  menu.add_feature("\231\160\180\229\157\143\232\128\133\233\133\141\231\189\174", "action", CAYO_WEAPONS.id, function()
    menu.notify("\230\173\166\229\153\168\233\133\141\231\189\174\229\183\178\232\174\190\231\189\174\228\184\186\231\160\180\229\157\143\232\128\133\233\133\141\231\189\174(mk2\229\134\178\233\148\139\230\158\170,mk2\229\138\163\232\180\168\230\137\139\230\158\170,\229\156\159\232\180\168\231\130\184\229\188\185,\229\176\143\229\136\128)", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1688259860)
    for i = 1, #Weapon_Saboteur do
      stat_set_int(Weapon_Saboteur[i][1], true, Weapon_Saboteur[i][2])
    end
  end)
end
do
  local Weapon_Marksman = {
    {
      "H4CNF_WEAPONS",
      5
    }
  }
  menu.add_feature("\231\165\158\229\176\132\230\137\139\233\133\141\231\189\174", "action", CAYO_WEAPONS.id, function()
    menu.notify("\230\173\166\229\153\168\233\133\141\231\189\174\229\183\178\232\174\190\231\189\174\228\184\186\231\165\158\229\176\132\230\137\139\233\133\141\231\189\174(\231\170\129\229\135\187\230\173\165\230\158\170,.50\230\137\139\230\158\170,\229\156\159\232\180\168\231\130\184\229\188\185,\229\188\128\229\177\177\229\136\128)", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1688259860)
    for i = 1, #Weapon_Marksman do
      stat_set_int(Weapon_Marksman[i][1], true, Weapon_Marksman[i][2])
    end
  end)
end
do
  local Supress_Removal = {
    {
      "H4CNF_BS_GEN",
      126975
    }
  }
  menu.add_feature("\231\167\187\233\153\164\230\182\136\233\159\179\229\153\168", "action", CAYO_WEAPONS.id, function()
    menu.notify("\232\175\183\229\156\168\232\191\156\231\166\187\232\153\142\233\178\184\230\151\182\228\189\191\231\148\168\228\187\165\231\148\159\230\149\136", "\230\182\136\233\159\179\229\153\168\229\183\178\231\167\187\233\153\164", 3, 1688259860)
    for i = 1, #Supress_Removal do
      stat_set_int(Supress_Removal[i][1], true, Supress_Removal[i][2])
    end
  end)
end
do
  local CP_Item_SpawnPlace_AIR = {
    {
      "H4CNF_GRAPPEL",
      2022
    },
    {
      "H4CNF_UNIFORM",
      12
    },
    {
      "H4CNF_BOLTCUT",
      4161
    },
    {
      "H4CNF_TROJAN",
      1
    }
  }
  menu.add_feature("\232\174\190\231\189\174\229\156\168\230\156\186\229\156\186\233\153\132\232\191\145", "action", CAYO_EQUIPM.id, function()
    menu.notify("\229\176\134\229\156\168\230\156\186\229\156\186\233\153\132\232\191\145\231\148\159\230\136\144:\n\n- \230\138\147\233\146\169\n- \228\191\157\229\174\137\230\156\141\232\163\133\n- \232\158\186\230\160\147\229\136\135\229\137\178\229\153\168", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #CP_Item_SpawnPlace_AIR do
      stat_set_int(CP_Item_SpawnPlace_AIR[i][1], true, CP_Item_SpawnPlace_AIR[i][2])
    end
  end)
end
do
  local CP_Item_SpawnPlace_DKS = {
    {
      "H4CNF_GRAPPEL",
      3671
    },
    {
      "H4CNF_UNIFORM",
      5256
    },
    {
      "H4CNF_BOLTCUT",
      4424
    },
    {
      "H4CNF_TROJAN",
      2
    }
  }
  menu.add_feature("\232\174\190\231\189\174\229\156\168\231\160\129\229\164\180\233\153\132\232\191\145", "action", CAYO_EQUIPM.id, function()
    menu.notify("\229\176\134\229\156\168\231\160\129\229\164\180\233\153\132\232\191\145\231\148\159\230\136\144:\n\n- \230\138\147\233\146\169\n- \228\191\157\229\174\137\230\156\141\232\163\133\n- \232\158\186\230\160\147\229\136\135\229\137\178\229\153\168", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #CP_Item_SpawnPlace_DKS do
      stat_set_int(CP_Item_SpawnPlace_DKS[i][1], true, CP_Item_SpawnPlace_DKS[i][2])
    end
  end)
end
do
  local CP_Item_SpawnPlace_CP = {
    {
      "H4CNF_GRAPPEL",
      85324
    },
    {
      "H4CNF_UNIFORM",
      61034
    },
    {
      "H4CNF_BOLTCUT",
      4612
    },
    {
      "H4CNF_TROJAN",
      5
    }
  }
  menu.add_feature("\232\174\190\231\189\174\229\156\168\229\186\132\229\155\173\233\153\132\232\191\145", "action", CAYO_EQUIPM.id, function()
    menu.notify("\229\176\134\229\156\168\229\186\132\229\155\173\233\153\132\232\191\145\231\148\159\230\136\144:\n\n- \230\138\147\233\146\169\n- \228\191\157\229\174\137\230\156\141\232\163\133\n- \232\158\186\230\160\147\229\136\135\229\137\178\229\153\168", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #CP_Item_SpawnPlace_CP do
      stat_set_int(CP_Item_SpawnPlace_CP[i][1], true, CP_Item_SpawnPlace_CP[i][2])
    end
  end)
end
do
  local CP_TRUCK_SPAWN_mov1 = {
    {
      "H4CNF_TROJAN",
      1
    }
  }
  menu.add_feature("\232\174\190\231\189\174\229\156\168\230\156\186\229\156\186\233\153\132\232\191\145", "action", CAYO_TRUCK.id, function()
    menu.notify("\232\161\165\231\187\153\232\189\166\229\176\134\229\156\168\230\156\186\229\156\186\233\153\132\232\191\145\231\148\159\230\136\144", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #CP_TRUCK_SPAWN_mov1 do
      stat_set_int(CP_TRUCK_SPAWN_mov1[i][1], true, CP_TRUCK_SPAWN_mov1[i][2])
    end
  end)
end
do
  local CP_TRUCK_SPAWN_mov2 = {
    {
      "H4CNF_TROJAN",
      2
    }
  }
  menu.add_feature("\232\174\190\231\189\174\229\156\168\229\140\151\231\160\129\229\164\180\233\153\132\232\191\145", "action", CAYO_TRUCK.id, function()
    menu.notify("\232\161\165\231\187\153\232\189\166\229\176\134\229\156\168\229\140\151\231\160\129\229\164\180\233\153\132\232\191\145\231\148\159\230\136\144", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #CP_TRUCK_SPAWN_mov2 do
      stat_set_int(CP_TRUCK_SPAWN_mov2[i][1], true, CP_TRUCK_SPAWN_mov2[i][2])
    end
  end)
end
do
  local CP_TRUCK_SPAWN_mov3 = {
    {
      "H4CNF_TROJAN",
      3
    }
  }
  menu.add_feature("\232\174\190\231\189\174\229\156\168\228\184\187\231\160\129\229\164\180(\228\184\156)\233\153\132\232\191\145", "action", CAYO_TRUCK.id, function()
    menu.notify("\232\161\165\231\187\153\232\189\166\229\176\134\229\156\168\228\184\187\231\160\129\229\164\180(\228\184\156)\233\153\132\232\191\145\231\148\159\230\136\144", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #CP_TRUCK_SPAWN_mov3 do
      stat_set_int(CP_TRUCK_SPAWN_mov3[i][1], true, CP_TRUCK_SPAWN_mov3[i][2])
    end
  end)
end
do
  local CP_TRUCK_SPAWN_mov4 = {
    {
      "H4CNF_TROJAN",
      4
    }
  }
  menu.add_feature("\232\174\190\231\189\174\229\156\168\228\184\187\231\160\129\229\164\180(\232\165\191)\233\153\132\232\191\145", "action", CAYO_TRUCK.id, function()
    menu.notify("\232\161\165\231\187\153\232\189\166\229\176\134\229\156\168\228\184\187\231\160\129\229\164\180(\232\165\191)\233\153\132\232\191\145\231\148\159\230\136\144", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #CP_TRUCK_SPAWN_mov4 do
      stat_set_int(CP_TRUCK_SPAWN_mov4[i][1], true, CP_TRUCK_SPAWN_mov4[i][2])
    end
  end)
end
do
  local CP_TRUCK_SPAWN_mov5 = {
    {
      "H4CNF_TROJAN",
      5
    }
  }
  menu.add_feature("\232\174\190\231\189\174\229\156\168\229\186\132\229\155\173\233\153\132\232\191\145", "action", CAYO_TRUCK.id, function()
    menu.notify("\232\161\165\231\187\153\232\189\166\229\176\134\229\156\168\229\186\132\229\155\173\233\153\132\232\191\145\231\148\159\230\136\144", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #CP_TRUCK_SPAWN_mov5 do
      stat_set_int(CP_TRUCK_SPAWN_mov5[i][1], true, CP_TRUCK_SPAWN_mov5[i][2])
    end
  end)
end
do
  local CAYO_NORMAL = {
    {
      "H4_PROGRESS",
      126823
    }
  }
  menu.add_feature("\232\174\190\231\189\174\233\154\190\229\186\166\228\184\186\230\173\163\229\184\184", "action", CAYO_DFFCTY.id, function()
    menu.notify("\233\154\190\229\186\166\229\183\178\232\174\190\231\189\174\228\184\186\230\173\163\229\184\184", "\233\154\190\229\186\166\231\188\150\232\190\145\229\153\168", 3, 4293876233)
    for i = 1, #CAYO_NORMAL do
      stat_set_int(CAYO_NORMAL[i][1], true, CAYO_NORMAL[i][2])
    end
  end)
end
do
  local CAYO_Hard = {
    {
      "H4_PROGRESS",
      131055
    }
  }
  menu.add_feature("\232\174\190\231\189\174\233\154\190\229\186\166\228\184\186\229\155\176\233\154\190", "action", CAYO_DFFCTY.id, function()
    menu.notify("\233\154\190\229\186\166\229\183\178\232\174\190\231\189\174\228\184\186\229\155\176\233\154\190", "\233\154\190\229\186\166\231\188\150\232\190\145\229\153\168", 3, 4293876233)
    for i = 1, #CAYO_Hard do
      stat_set_int(CAYO_Hard[i][1], true, CAYO_Hard[i][2])
    end
  end)
end
menu.add_feature("\232\167\163\233\148\129\228\189\169\233\135\140\231\167\145\229\178\155\229\165\150\233\161\185", "action", MORE_OPTIONS.id, function()
  local CP_AWRD_BL = {
    {
      "AWD_INTELGATHER",
      true
    },
    {
      "AWD_COMPOUNDINFILT",
      true
    },
    {
      "AWD_LOOT_FINDER",
      true
    },
    {
      "AWD_MAX_DISRUPT",
      true
    },
    {
      "AWD_THE_ISLAND_HEIST",
      true
    },
    {
      "AWD_GOING_ALONE",
      true
    },
    {
      "AWD_TEAM_WORK",
      true
    },
    {
      "AWD_MIXING_UP",
      true
    },
    {
      "AWD_PRO_THIEF",
      true
    },
    {
      "AWD_CAT_BURGLAR",
      true
    },
    {
      "AWD_ONE_OF_THEM",
      true
    },
    {
      "AWD_GOLDEN_GUN",
      true
    },
    {
      "AWD_ELITE_THIEF",
      true
    },
    {
      "AWD_PROFESSIONAL",
      true
    },
    {
      "AWD_HELPING_OUT",
      true
    },
    {
      "AWD_COURIER",
      true
    },
    {
      "AWD_PARTY_VIBES",
      true
    },
    {
      "AWD_HELPING_HAND",
      true
    },
    {
      "AWD_ELEVENELEVEN",
      true
    },
    {
      "COMPLETE_H4_F_USING_VETIR",
      true
    },
    {
      "COMPLETE_H4_F_USING_LONGFIN",
      true
    },
    {
      "COMPLETE_H4_F_USING_ANNIH",
      true
    },
    {
      "COMPLETE_H4_F_USING_ALKONOS",
      true
    },
    {
      "COMPLETE_H4_F_USING_PATROLB",
      true
    }
  }
  local CP_AWRD_IT = {
    {
      "AWD_LOSTANDFOUND",
      500000
    },
    {"AWD_SUNSET", 1800000},
    {
      "AWD_TREASURE_HUNTER",
      1000000
    },
    {
      "AWD_WRECK_DIVING",
      1000000
    },
    {
      "AWD_KEINEMUSIK",
      1800000
    },
    {
      "AWD_PALMS_TRAX",
      1800000
    },
    {
      "AWD_MOODYMANN",
      1800000
    },
    {
      "AWD_FILL_YOUR_BAGS",
      1000000000
    },
    {
      "AWD_WELL_PREPARED",
      80
    },
    {
      "H4_H4_DJ_MISSIONS",
      -1
    }
  }
  menu.notify("\229\183\178\232\167\163\233\148\129\228\189\169\233\135\140\231\167\145\229\178\155\229\165\150\233\161\185!", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
  for i = 1, #CP_AWRD_IT do
    stat_set_int(CP_AWRD_IT[i][1], true, CP_AWRD_IT[i][2])
  end
  for i = 1, #CP_AWRD_BL do
    stat_set_bool(CP_AWRD_BL[i][1], true, CP_AWRD_BL[i][2])
  end
  for i = 0, 192 do
    hash, mask = stats.stat_get_bool_hash_and_mask("_HISLANDPSTAT_BOOL", i, CharID)
    stats.stat_set_masked_bool(hash, true, mask, 1, true)
  end
end)
do
  local COMPLETE_CP_MISSIONS = {
    {
      "PROSTITUTES_FREQUENTE",
      100
    },
    {
      "H4_MISSIONS",
      -1
    },
    {
      "H4CNF_APPROACH",
      -1
    },
    {
      "H4CNF_BS_ENTR",
      63
    },
    {
      "H4CNF_BS_GEN",
      63
    },
    {
      "H4CNF_WEP_DISRP",
      3
    },
    {
      "H4CNF_ARM_DISRP",
      3
    },
    {
      "H4CNF_HEL_DISRP",
      3
    }
  }
  menu.add_feature("\229\174\140\230\136\144\230\137\128\230\156\137\229\135\134\229\164\135\228\187\187\229\138\161", "action", MORE_OPTIONS.id, function()
    menu.notify("\230\137\128\230\156\137\229\135\134\229\164\135\228\187\187\229\138\161\229\183\178\229\174\140\230\136\144!", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 4293876233)
    for i = 1, #COMPLETE_CP_MISSIONS do
      stat_set_int(COMPLETE_CP_MISSIONS[i][1], true, COMPLETE_CP_MISSIONS[i][2])
    end
  end)
end
do
  local CP_RST = {
    {
      "H4_MISSIONS",
      0
    },
    {
      "H4_PROGRESS",
      0
    },
    {
      "H4CNF_APPROACH",
      0
    },
    {
      "H4CNF_BS_ENTR",
      0
    },
    {
      "H4CNF_BS_GEN",
      0
    },
    {
      "H4_PLAYTHROUGH_STATUS",
      2
    }
  }
  menu.add_feature("\233\135\141\231\189\174\230\138\162\229\138\171", "action", MORE_OPTIONS.id, function()
    menu.notify("\230\138\162\229\138\171\229\183\178\233\135\141\231\189\174", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1694464180)
    for i = 1, #CP_RST do
      stat_set_int(CP_RST[i][1], true, CP_RST[i][2])
    end
  end)
end
do
  local RunOnce = {
    {
      "H3_COMPLETEDPOSIX",
      -1
    },
    {
      "H3OPT_MASKS",
      9
    },
    {
      "H3OPT_WEAPS",
      1
    },
    {"H3OPT_VEHS", 3}
  }
  local CAH_SILENT_SNEAKY_PRESET_ID_DMND = {
    {
      "CAS_HEIST_FLOW",
      -1
    },
    {
      "H3_LAST_APPROACH",
      0
    },
    {
      "H3OPT_APPROACH",
      1
    },
    {
      "H3_HARD_APPROACH",
      0
    },
    {
      "H3OPT_TARGET",
      3
    },
    {"H3OPT_POI", 1023},
    {
      "H3OPT_ACCESSPOINTS",
      2047
    },
    {
      "H3OPT_CREWWEAP",
      4
    },
    {
      "H3OPT_CREWDRIVER",
      3
    },
    {
      "H3OPT_CREWHACKER",
      4
    },
    {
      "H3OPT_DISRUPTSHIP",
      3
    },
    {
      "H3OPT_BODYARMORLVL",
      -1
    },
    {
      "H3OPT_KEYLEVELS",
      2
    },
    {
      "H3OPT_BITSET1",
      127
    },
    {
      "H3OPT_BITSET0",
      262270
    }
  }
  menu.add_feature("\233\154\144\232\191\185\230\189\156\232\184\170", "toggle", CAH_DIA_TARGET.id, function(DMND_1)
    menu.notify("\233\154\144\232\191\185\230\189\156\232\184\170\229\183\178\229\135\134\229\164\135\229\176\177\231\187\170\n\231\155\174\230\160\135:\233\146\187\231\159\179\n\231\142\169\229\174\182\229\136\134\231\186\162:350\228\184\135\n\n\t\229\138\161\229\191\133\232\174\176\228\189\143:\n* \233\128\137\230\139\169\231\187\153\228\187\183\230\156\128\228\189\142\231\154\132\228\185\176\229\174\182", "\233\154\144\232\191\185\230\189\156\232\184\170 (\233\146\187\231\159\179)", 10, 1343549670)
    for i = 1, #RunOnce do
      stat_set_int(RunOnce[i][1], true, RunOnce[i][2])
    end
    while DMND_1.on do
      for i = 1, #CAH_SILENT_SNEAKY_PRESET_ID_DMND do
        stat_set_int(CAH_SILENT_SNEAKY_PRESET_ID_DMND[i][1], true, CAH_SILENT_SNEAKY_PRESET_ID_DMND[i][2])
      end
      script.set_global_i(1969065, 60)
      script.set_global_i(1969066, 147)
      script.set_global_i(1969067, 147)
      script.set_global_i(1969068, 147)
      script.set_global_i(290617, 1410065408)
      system.yield(0)
    end
  end)
end
do
  local RunOnce = {
    {
      "H3_COMPLETEDPOSIX",
      -1
    },
    {
      "H3OPT_MASKS",
      9
    },
    {
      "H3OPT_WEAPS",
      1
    },
    {"H3OPT_VEHS", 3}
  }
  local CAH_BIGCON_PRESET_ID_DMND = {
    {
      "CAS_HEIST_FLOW",
      -1
    },
    {
      "H3_LAST_APPROACH",
      0
    },
    {
      "H3OPT_APPROACH",
      2
    },
    {
      "H3_HARD_APPROACH",
      0
    },
    {
      "H3OPT_TARGET",
      3
    },
    {"H3OPT_POI", 1023},
    {
      "H3OPT_ACCESSPOINTS",
      2047
    },
    {
      "H3OPT_CREWWEAP",
      4
    },
    {
      "H3OPT_CREWDRIVER",
      3
    },
    {
      "H3OPT_CREWHACKER",
      4
    },
    {
      "H3OPT_DISRUPTSHIP",
      3
    },
    {
      "H3OPT_BODYARMORLVL",
      -1
    },
    {
      "H3OPT_KEYLEVELS",
      2
    },
    {
      "H3OPT_BITSET1",
      159
    },
    {
      "H3OPT_BITSET0",
      524118
    }
  }
  menu.add_feature("\229\133\181\228\184\141\229\142\140\232\175\136", "toggle", CAH_DIA_TARGET.id, function(DMND_2)
    menu.notify("\229\133\181\228\184\141\229\142\140\232\175\136\229\183\178\229\135\134\229\164\135\229\176\177\231\187\170\n\231\155\174\230\160\135:\233\146\187\231\159\179\n\231\142\169\229\174\182\229\136\134\231\186\162:350\228\184\135\n\n\t\229\138\161\229\191\133\232\174\176\228\189\143:\n* \233\128\137\230\139\169\231\187\153\228\187\183\230\156\128\228\189\142\231\154\132\228\185\176\229\174\182", "\229\133\181\228\184\141\229\142\140\232\175\136 (\233\146\187\231\159\179)", 10, 1342208020)
    for i = 1, #RunOnce do
      stat_set_int(RunOnce[i][1], true, RunOnce[i][2])
    end
    while DMND_2.on do
      for i = 1, #CAH_BIGCON_PRESET_ID_DMND do
        stat_set_int(CAH_BIGCON_PRESET_ID_DMND[i][1], true, CAH_BIGCON_PRESET_ID_DMND[i][2])
      end
      script.set_global_i(1969065, 60)
      script.set_global_i(1969066, 147)
      script.set_global_i(1969067, 147)
      script.set_global_i(1969068, 147)
      script.set_global_i(290617, 1410065408)
      system.yield(0)
    end
  end)
end
do
  local RunOnce = {
    {
      "H3_COMPLETEDPOSIX",
      -1
    },
    {
      "H3OPT_MASKS",
      9
    },
    {
      "H3OPT_WEAPS",
      1
    },
    {"H3OPT_VEHS", 3}
  }
  local CAH_AGGRESS_PRESET_ID_DMND = {
    {
      "CAS_HEIST_FLOW",
      -1
    },
    {
      "H3_LAST_APPROACH",
      0
    },
    {
      "H3OPT_APPROACH",
      3
    },
    {
      "H3_HARD_APPROACH",
      0
    },
    {
      "H3OPT_TARGET",
      3
    },
    {"H3OPT_POI", 1023},
    {
      "H3OPT_ACCESSPOINTS",
      2047
    },
    {
      "H3OPT_CREWWEAP",
      4
    },
    {
      "H3OPT_CREWDRIVER",
      3
    },
    {
      "H3OPT_CREWHACKER",
      4
    },
    {
      "H3OPT_DISRUPTSHIP",
      3
    },
    {
      "H3OPT_BODYARMORLVL",
      -1
    },
    {
      "H3OPT_KEYLEVELS",
      2
    },
    {
      "H3OPT_BITSET1",
      799
    },
    {
      "H3OPT_BITSET0",
      3670102
    }
  }
  menu.add_feature("\230\176\148\229\138\191\230\177\185\230\177\185", "toggle", CAH_DIA_TARGET.id, function(DMND_3)
    menu.notify("\230\176\148\229\138\191\230\177\185\230\177\185\229\183\178\229\135\134\229\164\135\229\176\177\231\187\170\n\231\155\174\230\160\135:\233\146\187\231\159\179\n\231\142\169\229\174\182\229\136\134\231\186\162:350\228\184\135\n\n\t\229\138\161\229\191\133\232\174\176\228\189\143:\n* \233\128\137\230\139\169\231\187\153\228\187\183\230\156\128\228\189\142\231\154\132\228\185\176\229\174\182", "\230\176\148\229\138\191\230\177\185\230\177\185 (\233\146\187\231\159\179)", 10, 1693465620)
    for i = 1, #RunOnce do
      stat_set_int(RunOnce[i][1], true, RunOnce[i][2])
    end
    while DMND_3.on do
      for i = 1, #CAH_AGGRESS_PRESET_ID_DMND do
        stat_set_int(CAH_AGGRESS_PRESET_ID_DMND[i][1], true, CAH_AGGRESS_PRESET_ID_DMND[i][2])
      end
      script.set_global_i(1969065, 60)
      script.set_global_i(1969066, 147)
      script.set_global_i(1969067, 147)
      script.set_global_i(1969068, 147)
      script.set_global_i(290617, 1410065408)
      system.yield(0)
    end
  end)
end
do
  local RunOnce = {
    {
      "H3_COMPLETEDPOSIX",
      -1
    },
    {
      "H3OPT_MASKS",
      9
    },
    {
      "H3OPT_WEAPS",
      1
    },
    {"H3OPT_VEHS", 3}
  }
  local CAH_SILENT_GOLD_PRESET = {
    {
      "CAS_HEIST_FLOW",
      -1
    },
    {
      "H3_LAST_APPROACH",
      0
    },
    {
      "H3OPT_APPROACH",
      1
    },
    {
      "H3_HARD_APPROACH",
      0
    },
    {
      "H3OPT_TARGET",
      1
    },
    {"H3OPT_POI", 1023},
    {
      "H3OPT_ACCESSPOINTS",
      2047
    },
    {
      "H3OPT_CREWWEAP",
      4
    },
    {
      "H3OPT_CREWDRIVER",
      3
    },
    {
      "H3OPT_CREWHACKER",
      4
    },
    {
      "H3OPT_DISRUPTSHIP",
      3
    },
    {
      "H3OPT_BODYARMORLVL",
      -1
    },
    {
      "H3OPT_KEYLEVELS",
      2
    },
    {
      "H3OPT_BITSET1",
      127
    },
    {
      "H3OPT_BITSET0",
      262270
    }
  }
  menu.add_feature("\233\154\144\232\191\185\230\189\156\232\184\170", "toggle", CAH_GOLD_TARGET.id, function(GOLD_1)
    menu.notify("\233\154\144\232\191\185\230\189\156\232\184\170\229\183\178\229\135\134\229\164\135\229\176\177\231\187\170\n\231\155\174\230\160\135:\233\187\132\233\135\145\n\231\142\169\229\174\182\229\136\134\231\186\162:350\228\184\135\n\n\t\229\138\161\229\191\133\232\174\176\228\189\143:\n* \233\128\137\230\139\169\231\187\153\228\187\183\230\156\128\228\189\142\231\154\132\228\185\176\229\174\182", "\233\154\144\232\191\185\230\189\156\232\184\170 (\233\187\132\233\135\145)", 10, 1343549670)
    for i = 1, #RunOnce do
      stat_set_int(RunOnce[i][1], true, RunOnce[i][2])
    end
    while GOLD_1.on do
      for i = 1, #CAH_SILENT_GOLD_PRESET do
        stat_set_int(CAH_SILENT_GOLD_PRESET[i][1], true, CAH_SILENT_GOLD_PRESET[i][2])
      end
      script.set_global_i(1969065, 60)
      script.set_global_i(1969066, 177)
      script.set_global_i(1969067, 177)
      script.set_global_i(1969068, 177)
      script.set_global_i(290616, 1410065408)
      system.yield(0)
    end
  end)
end
do
  local RunOnce = {
    {
      "H3_COMPLETEDPOSIX",
      -1
    },
    {
      "H3OPT_MASKS",
      9
    },
    {
      "H3OPT_WEAPS",
      1
    },
    {"H3OPT_VEHS", 3}
  }
  local CAH_BIGCON_GOLD_PRESET = {
    {
      "CAS_HEIST_FLOW",
      -1
    },
    {
      "H3_LAST_APPROACH",
      0
    },
    {
      "H3OPT_APPROACH",
      2
    },
    {
      "H3_HARD_APPROACH",
      0
    },
    {
      "H3OPT_TARGET",
      1
    },
    {"H3OPT_POI", 1023},
    {
      "H3OPT_ACCESSPOINTS",
      2047
    },
    {
      "H3OPT_CREWWEAP",
      4
    },
    {
      "H3OPT_CREWDRIVER",
      3
    },
    {
      "H3OPT_CREWHACKER",
      4
    },
    {
      "H3OPT_DISRUPTSHIP",
      3
    },
    {
      "H3OPT_BODYARMORLVL",
      -1
    },
    {
      "H3OPT_KEYLEVELS",
      2
    },
    {
      "H3OPT_BITSET1",
      159
    },
    {
      "H3OPT_BITSET0",
      524118
    }
  }
  menu.add_feature("\229\133\181\228\184\141\229\142\140\232\175\136", "toggle", CAH_GOLD_TARGET.id, function(GOLD_2)
    menu.notify("\229\133\181\228\184\141\229\142\140\232\175\136\229\183\178\229\135\134\229\164\135\229\176\177\231\187\170\n\231\155\174\230\160\135:\233\187\132\233\135\145\n\231\142\169\229\174\182\229\136\134\231\186\162:350\228\184\135\n\n\t\229\138\161\229\191\133\232\174\176\228\189\143:\n* \233\128\137\230\139\169\231\187\153\228\187\183\230\156\128\228\189\142\231\154\132\228\185\176\229\174\182", "\229\133\181\228\184\141\229\142\140\232\175\136 (\233\187\132\233\135\145)", 10, 1342208020)
    for i = 1, #RunOnce do
      stat_set_int(RunOnce[i][1], true, RunOnce[i][2])
    end
    while GOLD_2.on do
      for i = 1, #CAH_BIGCON_GOLD_PRESET do
        stat_set_int(CAH_BIGCON_GOLD_PRESET[i][1], true, CAH_BIGCON_GOLD_PRESET[i][2])
      end
      script.set_global_i(1969065, 60)
      script.set_global_i(1969066, 177)
      script.set_global_i(1969067, 177)
      script.set_global_i(1969068, 177)
      script.set_global_i(290616, 1410065408)
      system.yield(0)
    end
  end)
end
do
  local RunOnce = {
    {
      "H3_COMPLETEDPOSIX",
      -1
    },
    {
      "H3OPT_MASKS",
      9
    },
    {
      "H3OPT_WEAPS",
      1
    },
    {"H3OPT_VEHS", 3}
  }
  local CAH_AGGRESSIV_GOLD_PRESET = {
    {
      "CAS_HEIST_FLOW",
      -1
    },
    {
      "H3OPT_APPROACH",
      3
    },
    {
      "H3OPT_TARGET",
      1
    },
    {"H3OPT_POI", 1023},
    {
      "H3OPT_ACCESSPOINTS",
      2047
    },
    {
      "H3OPT_DISRUPTSHIP",
      3
    },
    {
      "H3OPT_BODYARMORLVL",
      -1
    },
    {
      "H3OPT_KEYLEVELS",
      2
    },
    {
      "H3OPT_CREWWEAP",
      4
    },
    {
      "H3OPT_CREWDRIVER",
      3
    },
    {
      "H3OPT_CREWHACKER",
      4
    },
    {
      "H3OPT_BITSET1",
      799
    },
    {
      "H3OPT_BITSET0",
      3670102
    },
    {
      "H3_LAST_APPROACH",
      0
    },
    {
      "H3_HARD_APPROACH",
      0
    }
  }
  menu.add_feature("\230\176\148\229\138\191\230\177\185\230\177\185", "toggle", CAH_GOLD_TARGET.id, function(GOLD_3)
    menu.notify("\230\176\148\229\138\191\230\177\185\230\177\185\229\183\178\229\135\134\229\164\135\229\176\177\231\187\170\n\231\155\174\230\160\135:\233\187\132\233\135\145\n\231\142\169\229\174\182\229\136\134\231\186\162:350\228\184\135\n\n\t\229\138\161\229\191\133\232\174\176\228\189\143:\n* \233\128\137\230\139\169\231\187\153\228\187\183\230\156\128\228\189\142\231\154\132\228\185\176\229\174\182", "\230\176\148\229\138\191\230\177\185\230\177\185 (\233\187\132\233\135\145)", 10, 1693465620)
    for i = 1, #RunOnce do
      stat_set_int(RunOnce[i][1], true, RunOnce[i][2])
    end
    while GOLD_3.on do
      for i = 1, #CAH_AGGRESSIV_GOLD_PRESET do
        stat_set_int(CAH_AGGRESSIV_GOLD_PRESET[i][1], true, CAH_AGGRESSIV_GOLD_PRESET[i][2])
      end
      script.set_global_i(1969065, 60)
      script.set_global_i(1969066, 177)
      script.set_global_i(1969067, 177)
      script.set_global_i(1969068, 177)
      script.set_global_i(290616, 1410065408)
      system.yield(0)
    end
  end)
end
do
  local CH_UNLCK_PT = {
    {"H3OPT_POI", -1},
    {
      "H3OPT_ACCESSPOINTS",
      -1
    }
  }
  menu.add_feature("\232\167\163\233\148\129\230\137\128\230\156\137\229\133\180\232\182\163\231\130\185&\229\135\186\229\133\165\229\143\163", "action", CASINO_BOARD1.id, function()
    menu.notify("\229\183\178\232\167\163\233\148\129", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1694464000)
    for i = 1, #CH_UNLCK_PT do
      stat_set_int(CH_UNLCK_PT[i][1], true, CH_UNLCK_PT[i][2])
    end
  end)
end
do
  local CH_Target_Diamond = {
    {
      "H3OPT_TARGET",
      3
    }
  }
  menu.add_feature("\233\146\187\231\159\179(\230\156\128\229\128\188\233\146\177)", "action", CASINO_TARGET.id, function()
    menu.notify("\228\189\160\231\154\132\231\155\174\230\160\135\229\183\178\232\174\190\231\189\174\228\184\186\233\146\187\231\159\179", "\231\155\174\230\160\135\231\188\150\232\190\145\229\153\168", 3, 1693493780)
    for i = 1, #CH_Target_Diamond do
      stat_set_int(CH_Target_Diamond[i][1], true, CH_Target_Diamond[i][2])
    end
  end)
end
do
  local CH_Target_Gold = {
    {
      "H3OPT_TARGET",
      1
    }
  }
  menu.add_feature("\233\187\132\233\135\145", "action", CASINO_TARGET.id, function()
    menu.notify("\228\189\160\231\154\132\231\155\174\230\160\135\229\183\178\232\174\190\231\189\174\228\184\186\233\187\132\233\135\145", "\231\155\174\230\160\135\231\188\150\232\190\145\229\153\168", 3, 1693493780)
    for i = 1, #CH_Target_Gold do
      stat_set_int(CH_Target_Gold[i][1], true, CH_Target_Gold[i][2])
    end
  end)
end
do
  local CH_Target_Artwork = {
    {
      "H3OPT_TARGET",
      2
    }
  }
  menu.add_feature("\232\137\186\230\156\175\229\147\129", "action", CASINO_TARGET.id, function()
    menu.notify("\228\189\160\231\154\132\231\155\174\230\160\135\229\183\178\232\174\190\231\189\174\228\184\186\232\137\186\230\156\175\229\147\129", "\231\155\174\230\160\135\231\188\150\232\190\145\229\153\168", 3, 1693493780)
    for i = 1, #CH_Target_Artwork do
      stat_set_int(CH_Target_Artwork[i][1], true, CH_Target_Artwork[i][2])
    end
  end)
end
do
  local CH_Target_Cash = {
    {
      "H3OPT_TARGET",
      0
    }
  }
  menu.add_feature("\231\142\176\233\135\145", "action", CASINO_TARGET.id, function()
    menu.notify("\228\189\160\231\154\132\231\155\174\230\160\135\229\183\178\232\174\190\231\189\174\228\184\186\231\142\176\233\135\145", "\231\155\174\230\160\135\231\188\150\232\190\145\229\153\168", 3, 1693493780)
    for i = 1, #CH_Target_Cash do
      stat_set_int(CH_Target_Cash[i][1], true, CH_Target_Cash[i][2])
    end
  end)
end
local CAH_PLAYER_CUT = menu.add_feature("\231\142\169\229\174\182\229\136\134\231\186\162", "parent", CAH_ADVCED.id, function()
  menu.notify("\230\179\168\230\132\143\n\n- \229\136\134\231\186\162\231\153\190\229\136\134\230\175\148\232\191\135\233\171\152\229\143\175\232\131\189\229\175\188\232\135\180\228\184\141\229\136\176\232\180\166", "", 5, 1679094015)
end)
do
  local CAH_NON_HOSTCUT = menu.add_feature("\228\189\160\231\154\132\229\136\134\231\186\162(\228\189\160\228\184\141\230\152\175\230\136\191\228\184\187\230\151\182\228\189\191\231\148\168)", "parent", CAH_PLAYER_CUT.id)
  menu.add_feature("\232\135\170\229\174\154\228\185\137\229\136\134\231\186\162", "action", CAH_NON_HOSTCUT.id, function(cahnon)
    local r, s = input.get("\228\184\141\229\187\186\232\174\174\232\190\147\229\133\165\229\164\170\229\164\167\230\149\176\229\128\188", "", 1000, 3)
    if 1 == r then
      return HANDLER_CONTINUE
    end
    if 2 == r then
      return HANDLER_POP
    end
    script.set_global_i(2722097, tonumber(s))
  end)
  menu.add_feature("0 %", "toggle", CAH_NON_HOSTCUT.id, function(non1)
    while non1.on do
      script.set_global_i(2722097, 0)
      if not non1.on then
        return
      end
      system.wait(0)
    end
  end)
  menu.add_feature("50 %", "toggle", CAH_NON_HOSTCUT.id, function(non2)
    while non2.on do
      script.set_global_i(2722097, 50)
      if not non2.on then
        return
      end
      system.wait(0)
    end
  end)
  menu.add_feature("85 %", "toggle", CAH_NON_HOSTCUT.id, function(non2)
    while non2.on do
      script.set_global_i(2722097, 85)
      if not non2.on then
        return
      end
      system.wait(0)
    end
  end)
  menu.add_feature("100 %", "toggle", CAH_NON_HOSTCUT.id, function(non3)
    while non3.on do
      script.set_global_i(2722097, 100)
      if not non3.on then
        return
      end
      system.wait(0)
    end
  end)
  menu.add_feature("125 %", "toggle", CAH_NON_HOSTCUT.id, function(non4)
    while non4.on do
      script.set_global_i(2722097, 125)
      if not non4.on then
        return
      end
      system.wait(0)
    end
  end)
  menu.add_feature("150 %", "toggle", CAH_NON_HOSTCUT.id, function(non5)
    while non5.on do
      script.set_global_i(2722097, 150)
      if not non5.on then
        return
      end
      system.wait(0)
    end
  end)
  menu.add_feature("200 %", "toggle", CAH_NON_HOSTCUT.id, function(non6)
    while non6.on do
      script.set_global_i(2722097, 200)
      if not non6.on then
        return
      end
      system.wait(0)
    end
  end)
end
do
  local CAH_PLAYER_HOST = menu.add_feature("\228\189\160\231\154\132\229\136\134\231\186\162(\228\189\160\230\152\175\230\136\191\228\184\187\230\151\182\228\189\191\231\148\168)", "parent", CAH_PLAYER_CUT.id)
  menu.add_feature("\232\135\170\229\174\154\228\185\137\229\136\134\231\186\162", "action", CAH_PLAYER_HOST.id, function(cahhost)
    local r, s = input.get("\228\184\141\229\187\186\232\174\174\232\190\147\229\133\165\229\164\170\229\164\167\230\149\176\229\128\188", "", 1000, 3)
    if 1 == r then
      return HANDLER_CONTINUE
    end
    if 2 == r then
      return HANDLER_POP
    end
    script.set_global_i(1969065, tonumber(s))
  end)
  menu.add_feature("0 %", "toggle", CAH_PLAYER_HOST.id, function(cahhost)
    while cahhost.on do
      script.set_global_i(1969065, 0)
      if not cahhost.on then
        return
      end
      system.wait(0)
    end
  end)
  menu.add_feature("35 %", "action", CAH_PLAYER_HOST.id, function()
    script.set_global_i(1969065, 35)
  end)
  menu.add_feature("50 %", "action", CAH_PLAYER_HOST.id, function()
    script.set_global_i(1969065, 50)
  end)
  menu.add_feature("85 %", "action", CAH_PLAYER_HOST.id, function()
    script.set_global_i(1969065, 85)
  end)
  menu.add_feature("100 %", "action", CAH_PLAYER_HOST.id, function()
    script.set_global_i(1969065, 100)
  end)
  menu.add_feature("125 %", "action", CAH_PLAYER_HOST.id, function()
    script.set_global_i(1969065, 125)
  end)
  menu.add_feature("150 %", "action", CAH_PLAYER_HOST.id, function()
    script.set_global_i(1969065, 150)
  end)
  local CAH_PLAYER_TWO = menu.add_feature("\231\142\169\229\174\1822\229\136\134\231\186\162", "parent", CAH_PLAYER_CUT.id)
  menu.add_feature("\232\135\170\229\174\154\228\185\137\229\136\134\231\186\162", "action", CAH_PLAYER_TWO.id, function(cah2)
    local r, s = input.get("\228\184\141\229\187\186\232\174\174\232\190\147\229\133\165\229\164\170\229\164\167\230\149\176\229\128\188", "", 1000, 3)
    if 1 == r then
      return HANDLER_CONTINUE
    end
    if 2 == r then
      return HANDLER_POP
    end
    script.set_global_i(1969066, tonumber(s))
  end)
  menu.add_feature("0 %", "action", CAH_PLAYER_TWO.id, function()
    script.set_global_i(1969066, 0)
  end)
  menu.add_feature("50 %", "action", CAH_PLAYER_TWO.id, function()
    script.set_global_i(1969066, 50)
  end)
  menu.add_feature("85 %", "action", CAH_PLAYER_TWO.id, function()
    script.set_global_i(1969066, 85)
  end)
  menu.add_feature("100 %", "action", CAH_PLAYER_TWO.id, function()
    script.set_global_i(1969066, 100)
  end)
  menu.add_feature("125 %", "action", CAH_PLAYER_TWO.id, function()
    script.set_global_i(1969066, 125)
  end)
  menu.add_feature("150 %", "action", CAH_PLAYER_TWO.id, function()
    script.set_global_i(1969066, 150)
  end)
  local CAH_PLAYER_THREE = menu.add_feature("\231\142\169\229\174\1823\229\136\134\231\186\162", "parent", CAH_PLAYER_CUT.id)
  menu.add_feature("\232\135\170\229\174\154\228\185\137\229\136\134\231\186\162", "action", CAH_PLAYER_THREE.id, function(cah3)
    local r, s = input.get("\228\184\141\229\187\186\232\174\174\232\190\147\229\133\165\229\164\170\229\164\167\230\149\176\229\128\188", "", 1000, 3)
    if 1 == r then
      return HANDLER_CONTINUE
    end
    if 2 == r then
      return HANDLER_POP
    end
    script.set_global_i(1969067, tonumber(s))
  end)
  menu.add_feature("0 %", "action", CAH_PLAYER_THREE.id, function()
    script.set_global_i(1969067, 0)
  end)
  menu.add_feature("50 %", "action", CAH_PLAYER_THREE.id, function()
    script.set_global_i(1969067, 50)
  end)
  menu.add_feature("85 %", "action", CAH_PLAYER_THREE.id, function()
    script.set_global_i(1969067, 85)
  end)
  menu.add_feature("100 %", "action", CAH_PLAYER_THREE.id, function()
    script.set_global_i(1969067, 100)
  end)
  menu.add_feature("125 %", "action", CAH_PLAYER_THREE.id, function()
    script.set_global_i(1969067, 125)
  end)
  menu.add_feature("150 %", "action", CAH_PLAYER_THREE.id, function(g)
    script.set_global_i(1969067, 150)
  end)
  local CAH_PLAYER_FOUR = menu.add_feature("\231\142\169\229\174\1824\229\136\134\231\186\162", "parent", CAH_PLAYER_CUT.id)
  menu.add_feature("\232\135\170\229\174\154\228\185\137\229\136\134\231\186\162", "action", CAH_PLAYER_FOUR.id, function(cah4)
    local r, s = input.get("\228\184\141\229\187\186\232\174\174\232\190\147\229\133\165\229\164\170\229\164\167\230\149\176\229\128\188", "", 1000, 3)
    if 1 == r then
      return HANDLER_CONTINUE
    end
    if 2 == r then
      return HANDLER_POP
    end
    script.set_global_i(1969068, tonumber(s))
  end)
  menu.add_feature("0 %", "action", CAH_PLAYER_FOUR.id, function()
    script.set_global_i(1969068, 0)
  end)
  menu.add_feature("50 %", "action", CAH_PLAYER_FOUR.id, function()
    script.set_global_i(1969068, 50)
  end)
  menu.add_feature("85 %", "action", CAH_PLAYER_FOUR.id, function()
    script.set_global_i(1969068, 85)
  end)
  menu.add_feature("100 %", "action", CAH_PLAYER_FOUR.id, function()
    script.set_global_i(1969068, 100)
  end)
  menu.add_feature("125 %", "action", CAH_PLAYER_FOUR.id, function()
    script.set_global_i(1969068, 125)
  end)
  menu.add_feature("150 %", "action", CAH_PLAYER_FOUR.id, function()
    script.set_global_i(1969068, 150)
  end)
end
do
  local CH_Diff_Hard1 = {
    {
      "H3_LAST_APPROACH",
      0
    },
    {
      "H3OPT_APPROACH",
      1
    },
    {
      "H3_HARD_APPROACH",
      1
    }
  }
  menu.add_feature("\233\154\144\232\191\185\230\189\156\232\184\170(\229\155\176\233\154\190)", "action", BOARD1_APPROACH.id, function()
    menu.notify("\233\154\190\229\186\166\229\183\178\232\174\190\231\189\174\228\184\186\233\154\144\232\191\185\230\189\156\232\184\170(\229\155\176\233\154\190)", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1694464000)
    for i = 1, #CH_Diff_Hard1 do
      stat_set_int(CH_Diff_Hard1[i][1], true, CH_Diff_Hard1[i][2])
    end
  end)
end
do
  local CH_Diff_Normal1 = {
    {
      "H3_LAST_APPROACH",
      0
    },
    {
      "H3OPT_APPROACH",
      1
    },
    {
      "H3_HARD_APPROACH",
      0
    }
  }
  menu.add_feature("\233\154\144\232\191\185\230\189\156\232\184\170(\230\153\174\233\128\154)", "action", BOARD1_APPROACH.id, function()
    menu.notify("\233\154\190\229\186\166\229\183\178\232\174\190\231\189\174\228\184\186\233\154\144\232\191\185\230\189\156\232\184\170(\230\153\174\233\128\154)", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1694464000)
    for i = 1, #CH_Diff_Normal1 do
      stat_set_int(CH_Diff_Normal1[i][1], true, CH_Diff_Normal1[i][2])
    end
  end)
end
do
  local CH_Diff_Hard2 = {
    {
      "H3_LAST_APPROACH",
      0
    },
    {
      "H3OPT_APPROACH",
      2
    },
    {
      "H3_HARD_APPROACH",
      2
    }
  }
  menu.add_feature("\229\133\181\228\184\141\229\142\140\232\175\136(\229\155\176\233\154\190)", "action", BOARD1_APPROACH.id, function()
    menu.notify("\233\154\190\229\186\166\229\183\178\232\174\190\231\189\174\228\184\186\229\133\181\228\184\141\229\142\140\232\175\136(\229\155\176\233\154\190)", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1694464000)
    for i = 1, #CH_Diff_Hard2 do
      stat_set_int(CH_Diff_Hard2[i][1], true, CH_Diff_Hard2[i][2])
    end
  end)
end
do
  local CH_Diff_Normal2 = {
    {
      "H3_LAST_APPROACH",
      0
    },
    {
      "H3OPT_APPROACH",
      2
    },
    {
      "H3_HARD_APPROACH",
      0
    }
  }
  menu.add_feature("\229\133\181\228\184\141\229\142\140\232\175\136(\230\153\174\233\128\154)", "action", BOARD1_APPROACH.id, function()
    menu.notify("\233\154\190\229\186\166\229\183\178\232\174\190\231\189\174\228\184\186\229\133\181\228\184\141\229\142\140\232\175\136(\230\153\174\233\128\154)", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1694464000)
    for i = 1, #CH_Diff_Normal2 do
      stat_set_int(CH_Diff_Normal2[i][1], true, CH_Diff_Normal2[i][2])
    end
  end)
end
do
  local CH_Diff_Hard3 = {
    {
      "H3_LAST_APPROACH",
      0
    },
    {
      "H3OPT_APPROACH",
      3
    },
    {
      "H3_HARD_APPROACH",
      0
    }
  }
  menu.add_feature("\230\176\148\229\138\191\230\177\185\230\177\185(\229\155\176\233\154\190)", "action", BOARD1_APPROACH.id, function()
    menu.notify("\233\154\190\229\186\166\229\183\178\232\174\190\231\189\174\228\184\186\230\176\148\229\138\191\230\177\185\230\177\185(\229\155\176\233\154\190)", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1694464000)
    for i = 1, #CH_Diff_Hard3 do
      stat_set_int(CH_Diff_Hard3[i][1], true, CH_Diff_Hard3[i][2])
    end
  end)
end
do
  local CH_Diff_Normal3 = {
    {
      "H3_LAST_APPROACH",
      0
    },
    {
      "H3OPT_APPROACH",
      3
    },
    {
      "H3_HARD_APPROACH",
      0
    }
  }
  menu.add_feature("\230\176\148\229\138\191\230\177\185\230\177\185(\230\153\174\233\128\154)", "action", BOARD1_APPROACH.id, function()
    menu.notify("\233\154\190\229\186\166\229\183\178\232\174\190\231\189\174\228\184\186\230\176\148\229\138\191\230\177\185\230\177\185(\230\153\174\233\128\154)", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1694464000)
    for i = 1, #CH_Diff_Normal3 do
      stat_set_int(CH_Diff_Normal3[i][1], true, CH_Diff_Normal3[i][2])
    end
  end)
end
local CASINO_GUNMAN = menu.add_feature("\232\174\190\231\189\174\230\158\170\230\137\139", "parent", CASINO_BOARD2.id)
do
  local CH_GUNMAN_05 = {
    {
      "H3OPT_CREWWEAP",
      4
    }
  }
  menu.add_feature("\229\136\135\230\150\175\231\137\185\194\183\233\186\166\232\128\131\228\188\138(10%)", "action", CASINO_GUNMAN.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\230\158\170\230\137\139\228\184\186\229\136\135\230\150\175\231\137\185\194\183\233\186\166\232\128\131\228\188\138", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693493780)
    for i = 1, #CH_GUNMAN_05 do
      stat_set_int(CH_GUNMAN_05[i][1], true, CH_GUNMAN_05[i][2])
    end
  end)
end
do
  local CH_GUNMAN_04 = {
    {
      "H3OPT_CREWWEAP",
      2
    }
  }
  menu.add_feature("\229\143\164\230\150\175\229\161\148\230\178\131\194\183\232\142\171\229\161\148(9%)", "action", CASINO_GUNMAN.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\230\158\170\230\137\139\228\184\186\229\143\164\230\150\175\229\161\148\230\178\131\194\183\232\142\171\229\161\148", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693493780)
    for i = 1, #CH_GUNMAN_04 do
      stat_set_int(CH_GUNMAN_04[i][1], true, CH_GUNMAN_04[i][2])
    end
  end)
end
do
  local CH_GUNMAN_03 = {
    {
      "H3OPT_CREWWEAP",
      5
    }
  }
  menu.add_feature("\229\184\149\231\137\185\233\135\140\229\133\139\194\183\233\186\166\229\133\139\231\145\158\229\136\169(8%)", "action", CASINO_GUNMAN.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\230\158\170\230\137\139\228\184\186\229\184\149\233\135\140\229\133\139\194\183\233\186\166\229\133\139\231\145\158\229\136\169", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693493780)
    for i = 1, #CH_GUNMAN_03 do
      stat_set_int(CH_GUNMAN_03[i][1], true, CH_GUNMAN_03[i][2])
    end
  end)
end
do
  local CH_GUNMAN_02 = {
    {
      "H3OPT_CREWWEAP",
      3
    }
  }
  menu.add_feature("\230\159\165\231\144\134\194\183\233\135\140\229\190\183(7%)", "action", CASINO_GUNMAN.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\230\158\170\230\137\139\228\184\186\230\159\165\231\144\134\194\183\233\135\140\229\190\183", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693493780)
    for i = 1, #CH_GUNMAN_02 do
      stat_set_int(CH_GUNMAN_02[i][1], true, CH_GUNMAN_02[i][2])
    end
  end)
end
do
  local CH_GUNMAN_01 = {
    {
      "H3OPT_CREWWEAP",
      1
    }
  }
  menu.add_feature("\229\141\161\229\176\148\194\183\233\152\191\229\141\154\230\139\137\229\144\137(5%)", "action", CASINO_GUNMAN.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\230\158\170\230\137\139\228\184\186\229\141\161\229\176\148\194\183\233\152\191\229\141\154\230\139\137\229\144\137", "Heist Control", 3, 1693493780)
    for i = 1, #CH_GUNMAN_01 do
      stat_set_int(CH_GUNMAN_01[i][1], true, CH_GUNMAN_01[i][2])
    end
  end)
end
do
  local CH_GUNMAN_RND = {
    {
      "H3OPT_CREWWEAP",
      1,
      5,
      1,
      5
    }
  }
  menu.add_feature("\233\154\143\230\156\186\230\158\170\230\137\139(??%)", "action", CASINO_GUNMAN.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\233\154\143\230\156\186\230\158\170\230\137\139", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693493780)
    for i = 1, #CH_GUNMAN_RND do
      stat_set_int(CH_GUNMAN_RND[i][1], true, math.random(CH_GUNMAN_RND[i][4], CH_GUNMAN_RND[i][5]))
    end
  end)
end
do
  local CH_GUNMAN_00 = {
    {
      "H3OPT_CREWWEAP",
      6
    }
  }
  menu.add_feature("\231\167\187\233\153\164\230\158\170\230\137\139(0%\229\136\134\231\186\162)", "action", CASINO_GUNMAN.id, function()
    menu.notify("\230\158\170\230\137\139\229\183\178\231\167\187\233\153\164", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693493780)
    for i = 1, #CH_GUNMAN_00 do
      stat_set_int(CH_GUNMAN_00[i][1], true, CH_GUNMAN_00[i][2])
    end
  end)
end
local CASINO_GUNMAN_var = menu.add_feature("\230\173\166\229\153\168\232\174\190\231\189\174", "parent", CASINO_GUNMAN.id)
do
  local CH_Gunman_var_01 = {
    {
      "H3OPT_WEAPS",
      1
    }
  }
  menu.add_feature("\230\156\128\229\165\189\231\154\132\230\173\166\229\153\168", "action", CASINO_GUNMAN_var.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\230\156\128\229\165\189\231\154\132\230\173\166\229\153\168", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693493780)
    for i = 1, #CH_Gunman_var_01 do
      stat_set_int(CH_Gunman_var_01[i][1], true, CH_Gunman_var_01[i][2])
    end
  end)
end
do
  local CH_Gunman_var_00 = {
    {
      "H3OPT_WEAPS",
      0
    }
  }
  menu.add_feature("\230\156\128\229\183\174\231\154\132\230\173\166\229\153\168", "action", CASINO_GUNMAN_var.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\230\156\128\229\183\174\231\154\132\230\173\166\229\153\168", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693493780)
    for i = 1, #CH_Gunman_var_00 do
      stat_set_int(CH_Gunman_var_00[i][1], true, CH_Gunman_var_00[i][2])
    end
  end)
end
local CASINO_DRIVER_TEAM = menu.add_feature("\232\174\190\231\189\174\229\143\184\230\156\186", "parent", CASINO_BOARD2.id)
do
  local CH_DRV_MAN_05 = {
    {
      "H3OPT_CREWDRIVER",
      5
    }
  }
  menu.add_feature("\229\136\135\230\150\175\231\137\185\194\183\233\186\166\232\128\131\228\188\138(10%)", "action", CASINO_DRIVER_TEAM.id, function()
    menu.notify("\230\156\128\229\165\189\232\189\189\229\133\183:\n\229\141\161\230\158\151\194\183\229\159\131\229\188\151\228\188\166(4\229\186\167\228\189\141)\n\n\229\165\189\232\189\189\229\133\183:\n\233\149\191\229\180\142\194\183\228\184\141\230\179\149\228\185\139\229\190\146(2\229\186\167\228\189\141)\n\n\228\184\128\232\136\172\232\189\189\229\133\183:\n\233\186\166\230\150\175\229\168\129\229\176\148\194\183\230\181\129\230\181\170\232\128\133(2\229\186\167\228\189\141)\n\n\230\156\128\229\183\174\232\189\189\229\133\183:\n\231\130\184\229\144\167(4\229\186\167\228\189\141)", "\229\136\135\230\150\175\231\137\185\194\183\233\186\166\232\128\131\228\188\138|\231\180\162\229\143\150\229\136\134\231\186\162:10%", 5, 1693493780)
    for i = 1, #CH_DRV_MAN_05 do
      stat_set_int(CH_DRV_MAN_05[i][1], true, CH_DRV_MAN_05[i][2])
    end
  end)
end
do
  local CH_DRV_MAN_04 = {
    {
      "H3OPT_CREWDRIVER",
      3
    }
  }
  menu.add_feature("\233\153\182\232\137\190\232\191\170(9%)", "action", CASINO_DRIVER_TEAM.id, function()
    menu.notify("\230\156\128\229\165\189\232\189\189\229\133\183:\n\229\133\176\229\184\149\232\190\190\231\188\135\194\183\231\167\145\232\142\171\232\190\190(4\229\186\167\228\189\141)\n\n\229\165\189\232\189\189\229\133\183:\n\229\168\129\231\154\174\194\183\231\136\177\229\136\169(2\229\186\167\228\189\141)\n\n\228\184\128\232\136\172\232\189\189\229\133\183:\n\229\134\146\233\153\169\229\174\182\194\183\233\147\129\232\133\149\231\187\143\229\133\184\230\172\190(2\229\186\167\228\189\141)\n\n\230\156\128\229\183\174\231\154\132\232\189\189\229\133\183:\n\229\141\161\230\158\151\194\183\231\142\139\232\128\133\231\187\143\229\133\184\230\172\190(4\229\186\167\228\189\141)", "\233\153\182\232\137\190\232\191\170|\231\180\162\229\143\150\229\136\134\231\186\162:9%", 5, 1693493780)
    for i = 1, #CH_DRV_MAN_04 do
      stat_set_int(CH_DRV_MAN_04[i][1], true, CH_DRV_MAN_04[i][2])
    end
  end)
end
do
  local CH_DRV_MAN_03 = {
    {
      "H3OPT_CREWDRIVER",
      2
    }
  }
  menu.add_feature("\229\161\148\228\184\189\229\168\156\194\183\233\169\172\228\184\129\229\134\133\230\150\175(7%)", "action", CASINO_DRIVER_TEAM.id, function()
    menu.notify("\230\156\128\229\165\189\232\189\189\229\133\183:\n\230\172\167\230\150\175\230\180\155\194\183\230\137\188\229\150\137(4\229\186\167\228\189\141)\n\n\229\165\189\232\189\189\229\133\183:\n\228\184\129\229\141\161\194\183\230\150\175\229\155\189\228\184\128(4\229\186\167\228\189\141)\n\n\228\184\128\232\136\172\232\189\189\229\133\183:\n\231\187\157\232\135\180\194\183\230\188\130\231\167\187\231\186\166\229\161\158\231\177\179\232\146\130(2\229\186\167\228\189\141)\n\n\230\156\128\229\183\174\232\189\189\229\133\183\n\229\168\129\231\154\174\194\183\233\154\143\232\161\140\232\128\133MK2(2\228\189\141\231\142\169\229\174\182)", "\229\161\148\228\184\189\229\168\156\194\183\233\169\172\228\184\129\229\134\133\230\150\175|\231\180\162\229\143\150\229\136\134\231\186\162:7%", 5, 1693493780)
    for i = 1, #CH_DRV_MAN_03 do
      stat_set_int(CH_DRV_MAN_03[i][1], true, CH_DRV_MAN_03[i][2])
    end
  end)
end
do
  local CH_DRV_MAN_02 = {
    {
      "H3OPT_CREWDRIVER",
      4
    }
  }
  menu.add_feature("\230\137\142\229\133\139\194\183\229\176\188\229\176\148\230\163\174(6%)", "action", CASINO_DRIVER_TEAM.id, function()
    menu.notify("\230\156\128\229\165\189\232\189\189\229\133\183:\n\230\153\174\230\158\151\232\165\191\230\175\148\194\183\233\155\183\229\133\139\229\141\147(2\229\186\167\228\189\141)\n\n\229\165\189\232\189\189\229\133\183:\n\232\175\151\230\180\165\194\183\228\186\181\230\184\142\232\128\133(1\229\186\167\228\189\141)\n\n\228\184\128\232\136\172\232\189\189\229\133\183:\n\233\149\191\229\180\142\194\183\230\150\175\231\137\185\229\190\183(1\229\186\167\228\189\141)\n\n\230\156\128\229\183\174\232\189\189\229\133\183\n\233\186\166\233\156\184\229\173\144\194\183\230\155\188\229\136\135\229\133\185(2\229\186\167\228\189\141)", "\230\137\142\229\133\139\194\183\229\176\188\229\176\148\230\163\174|\231\180\162\229\143\150\229\136\134\231\186\162:6%", 5, 1693493780)
    for i = 1, #CH_DRV_MAN_02 do
      stat_set_int(CH_DRV_MAN_02[i][1], true, CH_DRV_MAN_02[i][2])
    end
  end)
end
do
  local CH_DRV_MAN_01 = {
    {
      "H3OPT_CREWDRIVER",
      1
    }
  }
  menu.add_feature("\229\141\161\233\135\140\229\167\134\194\183\231\153\187\232\140\168(5%)", "action", CASINO_DRIVER_TEAM.id, function()
    menu.notify("\230\156\128\229\165\189\232\189\189\229\133\183:\n\231\187\157\229\147\129\194\183\229\141\171\229\163\171\231\187\143\229\133\184\230\172\190(2\229\186\167\228\189\141)\n\n\229\165\189\232\189\189\229\133\183:\n\228\184\129\229\141\161\194\183\230\151\133\232\161\140\229\174\182\231\190\189\233\187\145(2\229\186\167\228\189\141)\n\n\228\184\128\232\136\172\232\189\189\229\133\183:\n\233\186\166\229\133\139\230\150\175\233\159\166\194\183\229\143\141\231\164\190\228\188\154(2\229\186\167\228\189\141)\n\n\230\156\128\229\183\174\232\189\189\229\133\183\n\229\168\129\229\176\188\194\183\229\164\169\229\168\129\231\187\143\229\133\184\230\172\190(2\229\186\167\228\189\141)", "\229\141\161\233\135\140\229\167\134\194\183\231\153\187\232\140\168|\231\180\162\229\143\150\229\136\134\231\186\162:5%", 5, 1693493780)
    for i = 1, #CH_DRV_MAN_01 do
      stat_set_int(CH_DRV_MAN_01[i][1], true, CH_DRV_MAN_01[i][2])
    end
  end)
end
do
  local CH_DRV_MAN_RND = {
    {
      "H3OPT_CREWDRIVER",
      1,
      5,
      1,
      5
    }
  }
  menu.add_feature("\233\154\143\230\156\186\229\143\184\230\156\186(??%)", "action", CASINO_DRIVER_TEAM.id, function()
    menu.notify("\229\143\184\230\156\186\229\183\178\230\148\185\228\184\186\233\154\143\230\156\186", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693493780)
    for i = 1, #CH_DRV_MAN_RND do
      stat_set_int(CH_DRV_MAN_RND[i][1], true, math.random(CH_DRV_MAN_RND[i][4], CH_DRV_MAN_RND[i][5]))
    end
  end)
end
do
  local CH_DRV_MAN_00 = {
    {
      "H3OPT_CREWDRIVER",
      6
    }
  }
  menu.add_feature("\231\167\187\233\153\164\229\143\184\230\156\186(0%\229\136\134\231\186\162)", "action", CASINO_DRIVER_TEAM.id, function()
    menu.notify("\229\143\184\230\156\186\229\183\178\231\167\187\233\153\164", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693493780)
    for i = 1, #CH_DRV_MAN_00 do
      stat_set_int(CH_DRV_MAN_00[i][1], true, CH_DRV_MAN_00[i][2])
    end
  end)
end
local CAH_DRIVER_TEAM_var = menu.add_feature("\232\189\166\232\190\134\232\174\190\231\189\174", "parent", CASINO_DRIVER_TEAM.id)
do
  local CH_DRV_MAN_var_03 = {
    {"H3OPT_VEHS", 3}
  }
  menu.add_feature("\230\156\128\229\165\189\231\154\132\232\189\166", "action", CAH_DRIVER_TEAM_var.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\230\156\128\229\165\189\231\154\132\232\189\166", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693493780)
    for i = 1, #CH_DRV_MAN_var_03 do
      stat_set_int(CH_DRV_MAN_var_03[i][1], true, CH_DRV_MAN_var_03[i][2])
    end
  end)
end
do
  local CH_DRV_MAN_var_02 = {
    {"H3OPT_VEHS", 2}
  }
  menu.add_feature("\229\165\189\232\189\166", "action", CAH_DRIVER_TEAM_var.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\229\165\189\232\189\166", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693493780)
    for i = 1, #CH_DRV_MAN_var_02 do
      stat_set_int(CH_DRV_MAN_var_02[i][1], true, CH_DRV_MAN_var_02[i][2])
    end
  end)
end
do
  local CH_DRV_MAN_var_01 = {
    {"H3OPT_VEHS", 1}
  }
  menu.add_feature("\228\184\128\232\136\172\231\154\132\232\189\166", "action", CAH_DRIVER_TEAM_var.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\228\184\128\232\136\172\231\154\132\232\189\166", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693493780)
    for i = 1, #CH_DRV_MAN_var_01 do
      stat_set_int(CH_DRV_MAN_var_01[i][1], true, CH_DRV_MAN_var_01[i][2])
    end
  end)
end
do
  local CH_DRV_MAN_var_00 = {
    {"H3OPT_VEHS", 0}
  }
  menu.add_feature("\230\156\128\229\183\174\231\154\132\232\189\166", "action", CAH_DRIVER_TEAM_var.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\230\156\128\229\183\174\231\154\132\232\189\166", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693493780)
    for i = 1, #CH_DRV_MAN_var_00 do
      stat_set_int(CH_DRV_MAN_var_00[i][1], true, CH_DRV_MAN_var_00[i][2])
    end
  end)
end
do
  local CH_DRV_MAN_var_RND = {
    {
      "H3OPT_VEHS",
      0,
      3,
      0,
      3
    }
  }
  menu.add_feature("\233\154\143\230\156\186\232\189\166\232\190\134", "action", CAH_DRIVER_TEAM_var.id, function()
    menu.notify("\229\183\178\230\148\185\228\184\186\233\154\143\230\156\186\232\189\166\232\190\134", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693493780)
    for i = 1, #CH_DRV_MAN_var_RND do
      stat_set_int(CH_DRV_MAN_var_RND[i][1], true, math.random(CH_DRV_MAN_var_RND[i][4], CH_DRV_MAN_var_RND[i][5]))
    end
  end)
end
local CASINO_HACKERs = menu.add_feature("\232\174\190\231\189\174\233\187\145\229\174\162", "parent", CASINO_BOARD2.id)
do
  local CH_HCK_MAN_04 = {
    {
      "H3OPT_CREWHACKER",
      4
    }
  }
  menu.add_feature("\233\152\191\231\187\180\194\183\230\150\189\231\147\166\232\140\168\230\155\188(10%)", "action", CASINO_HACKERs.id, function()
    menu.notify("\229\144\141\229\173\151:\233\152\191\231\187\180\194\183\230\150\189\231\147\166\232\140\168\230\155\188\n\230\138\128\230\156\175:\228\184\147\229\174\182\231\186\167\n\229\177\143\232\148\189\228\191\161\229\143\183\230\151\182\233\151\180 \230\156\170\230\154\180\233\156\178:3:30\n\229\177\143\232\148\189\228\191\161\229\143\183\230\151\182\233\151\180 \229\183\178\230\154\180\233\156\178:2:26\n\231\180\162\229\143\150\229\136\134\231\186\162:10%", "\228\187\187\229\138\161\232\132\154\230\156\172", 5, 1693493780)
    for i = 1, #CH_HCK_MAN_04 do
      stat_set_int(CH_HCK_MAN_04[i][1], true, CH_HCK_MAN_04[i][2])
    end
  end)
end
do
  local CH_HCK_MAN_05 = {
    {
      "H3OPT_CREWHACKER",
      5
    }
  }
  menu.add_feature("\228\189\169\229\165\135\194\183\229\147\136\233\135\140\230\150\175(9%)", "action", CASINO_HACKERs.id, function()
    menu.notify("\229\144\141\229\173\151:\228\189\169\229\165\135\194\183\229\147\136\233\135\140\230\150\175\n\230\138\128\230\156\175:\228\184\147\229\174\182\231\186\167\n\229\177\143\232\148\189\228\191\161\229\143\183\230\151\182\233\151\180 \230\156\170\230\154\180\233\156\178:3:25\n\229\177\143\232\148\189\228\191\161\229\143\183\230\151\182\233\151\180 \229\183\178\230\154\180\233\156\178:2:23\n\231\180\162\229\143\150\229\136\134\231\186\162:9%", "\228\187\187\229\138\161\232\132\154\230\156\172", 5, 1693493780)
    for i = 1, #CH_HCK_MAN_05 do
      stat_set_int(CH_HCK_MAN_05[i][1], true, CH_HCK_MAN_05[i][2])
    end
  end)
end
do
  local CH_HCK_MAN_03 = {
    {
      "H3OPT_CREWHACKER",
      2
    }
  }
  menu.add_feature("\229\133\139\233\135\140\230\150\175\230\177\128\194\183\232\180\185\229\176\148\229\133\185(7%)", "action", CASINO_HACKERs.id, function()
    menu.notify("\229\144\141\229\173\151:\229\133\139\233\135\140\230\150\175\230\177\128\194\183\232\180\185\229\176\148\229\133\185\n\230\138\128\230\156\175:\228\188\152\232\137\175\n\229\177\143\232\148\189\228\191\161\229\143\183\230\151\182\233\151\180 \230\156\170\230\154\180\233\156\178:2:59\n\229\177\143\232\148\189\228\191\161\229\143\183\230\151\182\233\151\180 \229\183\178\230\154\180\233\156\178:2:05\n\231\180\162\229\143\150\229\136\134\231\186\162:7%", "\228\187\187\229\138\161\232\132\154\230\156\172", 5, 1693493780)
    for i = 1, #CH_HCK_MAN_03 do
      stat_set_int(CH_HCK_MAN_03[i][1], true, CH_HCK_MAN_03[i][2])
    end
  end)
end
do
  local CH_HCK_MAN_02 = {
    {
      "H3OPT_CREWHACKER",
      3
    }
  }
  menu.add_feature("\229\176\164\230\177\151\194\183\229\184\131\232\142\177\229\176\148(5%)", "action", CASINO_HACKERs.id, function()
    menu.notify("\229\144\141\229\173\151:\229\176\164\230\177\151\194\183\229\184\131\232\142\177\229\176\148\n\230\138\128\230\156\175:\228\188\152\232\137\175\n\229\177\143\232\148\189\228\191\161\229\143\183\230\151\182\233\151\180 \230\156\170\230\154\180\233\156\178:2:52\n\229\177\143\232\148\189\228\191\161\229\143\183\230\151\182\233\151\180 \229\183\178\230\154\180\233\156\178:2:01\n\231\180\162\229\143\150\229\136\134\231\186\162:5%", "\228\187\187\229\138\161\232\132\154\230\156\172", 5, 1693493780)
    for i = 1, #CH_HCK_MAN_02 do
      stat_set_int(CH_HCK_MAN_02[i][1], true, CH_HCK_MAN_02[i][2])
    end
  end)
end
do
  local CH_HCK_MAN_01 = {
    {
      "H3OPT_CREWHACKER",
      1
    }
  }
  menu.add_feature("\233\135\140\229\165\135\194\183\229\141\162\232\130\175\230\150\175(3%)", "action", CASINO_HACKERs.id, function()
    menu.notify("\229\144\141\229\173\151:\233\135\140\229\165\135\194\183\229\141\162\232\130\175\230\150\175\n\230\138\128\230\156\175:\230\139\137\232\131\175\n\229\177\143\232\148\189\228\191\161\229\143\183\230\151\182\233\151\180 \230\156\170\230\154\180\233\156\178:2:26\n\229\177\143\232\148\189\228\191\161\229\143\183\230\151\182\233\151\180 \229\183\178\230\154\180\233\156\178:1:42\n\231\180\162\229\143\150\229\136\134\231\186\162:3%", "\228\187\187\229\138\161\232\132\154\230\156\172", 5, 1693493780)
    for i = 1, #CH_HCK_MAN_01 do
      stat_set_int(CH_HCK_MAN_01[i][1], true, CH_HCK_MAN_01[i][2])
    end
  end)
end
do
  local CH_HCK_MAN_RND = {
    {
      "H3OPT_CREWHACKER",
      0,
      5,
      1,
      5
    }
  }
  menu.add_feature("\233\154\143\230\156\186\233\187\145\229\174\162(??%)", "action", CASINO_HACKERs.id, function()
    menu.notify("\229\183\178\233\128\137\230\139\169\233\154\143\230\156\186\233\187\145\229\174\162", "\228\187\187\229\138\161\232\132\154\230\156\172", 4, 1693493780)
    for i = 1, #CH_HCK_MAN_RND do
      stat_set_int(CH_HCK_MAN_RND[i][1], true, math.random(CH_HCK_MAN_RND[i][4], CH_HCK_MAN_RND[i][5]))
    end
  end)
end
do
  local CH_HCK_MAN_00 = {
    {
      "H3OPT_CREWHACKER",
      6
    }
  }
  menu.add_feature("\231\167\187\233\153\164\233\187\145\229\174\162(0%\229\136\134\231\186\162)", "action", CASINO_HACKERs.id, function()
    menu.notify("\233\187\145\229\174\162\229\183\178\231\167\187\233\153\164", "\228\187\187\229\138\161\232\132\154\230\156\172", 4, 1693493780)
    for i = 1, #CH_HCK_MAN_00 do
      stat_set_int(CH_HCK_MAN_00[i][1], true, CH_HCK_MAN_00[i][2])
    end
  end)
end
local CASINO_MASK = menu.add_feature("\232\174\190\231\189\174\233\157\162\229\133\183", "parent", CASINO_BOARD2.id)
do
  local CH_MASK_00 = {
    {
      "H3OPT_MASKS",
      -1
    }
  }
  menu.add_feature("\231\167\187\233\153\164\233\157\162\229\133\183", "action", CASINO_MASK.id, function()
    menu.notify("\233\157\162\229\133\183\229\183\178\231\167\187\233\153\164", "\228\187\187\229\138\161\232\132\154\230\156\172", 2, 1693493780)
    for i = 1, #CH_MASK_00 do
      stat_set_int(CH_MASK_00[i][1], true, CH_MASK_00[i][2])
    end
  end)
end
do
  local CH_MASK_01 = {
    {
      "H3OPT_MASKS",
      1
    }
  }
  menu.add_feature("\229\135\160\228\189\149\231\179\187\229\136\151", "action", CASINO_MASK.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\229\135\160\228\189\149\231\179\187\229\136\151", "\228\187\187\229\138\161\232\132\154\230\156\172", 2, 1693493780)
    for i = 1, #CH_MASK_01 do
      stat_set_int(CH_MASK_01[i][1], true, CH_MASK_01[i][2])
    end
  end)
end
do
  local CH_MASK_02 = {
    {
      "H3OPT_MASKS",
      2
    }
  }
  menu.add_feature("\231\140\142\228\186\186\231\179\187\229\136\151", "action", CASINO_MASK.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\231\140\142\228\186\186\231\179\187\229\136\151", "\228\187\187\229\138\161\232\132\154\230\156\172", 2, 1693493780)
    for i = 1, #CH_MASK_02 do
      stat_set_int(CH_MASK_02[i][1], true, CH_MASK_02[i][2])
    end
  end)
end
do
  local CH_MASK_03 = {
    {
      "H3OPT_MASKS",
      3
    }
  }
  menu.add_feature("\229\141\138\233\172\188\233\157\162\231\179\187\229\136\151", "action", CASINO_MASK.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\229\141\138\233\172\188\233\157\162\231\179\187\229\136\151", "\228\187\187\229\138\161\232\132\154\230\156\172", 2, 1693493780)
    for i = 1, #CH_MASK_03 do
      stat_set_int(CH_MASK_03[i][1], true, CH_MASK_03[i][2])
    end
  end)
end
do
  local CH_MASK_04 = {
    {
      "H3OPT_MASKS",
      4
    }
  }
  menu.add_feature("\232\161\168\230\131\133\229\140\133\231\179\187\229\136\151", "action", CASINO_MASK.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\232\161\168\230\131\133\229\140\133\231\179\187\229\136\151", "\228\187\187\229\138\161\232\132\154\230\156\172", 2, 1693493780)
    for i = 1, #CH_MASK_04 do
      stat_set_int(CH_MASK_04[i][1], true, CH_MASK_04[i][2])
    end
  end)
end
do
  local CH_MASK_05 = {
    {
      "H3OPT_MASKS",
      5
    }
  }
  menu.add_feature("\229\141\142\228\184\189\231\186\185\233\165\176\233\170\183\233\171\133\229\164\180\231\179\187\229\136\151", "action", CASINO_MASK.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\229\141\142\228\184\189\231\186\185\233\165\176\233\170\183\233\171\133\229\164\180\231\179\187\229\136\151", "\228\187\187\229\138\161\232\132\154\230\156\172", 2, 1693493780)
    for i = 1, #CH_MASK_05 do
      stat_set_int(CH_MASK_05[i][1], true, CH_MASK_05[i][2])
    end
  end)
end
do
  local CH_MASK_06 = {
    {
      "H3OPT_MASKS",
      6
    }
  }
  menu.add_feature("\229\185\184\232\191\144\230\176\180\230\158\156\231\179\187\229\136\151", "action", CASINO_MASK.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\229\185\184\232\191\144\230\176\180\230\158\156\231\179\187\229\136\151", "\228\187\187\229\138\161\232\132\154\230\156\172", 2, 1693493780)
    for i = 1, #CH_MASK_06 do
      stat_set_int(CH_MASK_06[i][1], true, CH_MASK_06[i][2])
    end
  end)
end
do
  local CH_MASK_07 = {
    {
      "H3OPT_MASKS",
      7
    }
  }
  menu.add_feature("\230\184\184\229\135\187\233\152\159\231\179\187\229\136\151", "action", CASINO_MASK.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\230\184\184\229\135\187\233\152\159\231\179\187\229\136\151", "\228\187\187\229\138\161\232\132\154\230\156\172", 2, 1693493780)
    for i = 1, #CH_MASK_07 do
      stat_set_int(CH_MASK_07[i][1], true, CH_MASK_07[i][2])
    end
  end)
end
do
  local CH_MASK_08 = {
    {
      "H3OPT_MASKS",
      8
    }
  }
  menu.add_feature("\229\176\143\228\184\145\231\179\187\229\136\151", "action", CASINO_MASK.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\229\176\143\228\184\145\231\179\187\229\136\151", "\228\187\187\229\138\161\232\132\154\230\156\172", 2, 1693493780)
    for i = 1, #CH_MASK_08 do
      stat_set_int(CH_MASK_08[i][1], true, CH_MASK_08[i][2])
    end
  end)
end
do
  local CH_MASK_09 = {
    {
      "H3OPT_MASKS",
      9
    }
  }
  menu.add_feature("\229\138\168\231\137\169\231\179\187\229\136\151", "action", CASINO_MASK.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\229\138\168\231\137\169\231\179\187\229\136\151", "\228\187\187\229\138\161\232\132\154\230\156\172", 2, 1693493780)
    for i = 1, #CH_MASK_09 do
      stat_set_int(CH_MASK_09[i][1], true, CH_MASK_09[i][2])
    end
  end)
end
do
  local CH_MASK_10 = {
    {
      "H3OPT_MASKS",
      10
    }
  }
  menu.add_feature("\233\152\178\230\154\180\231\179\187\229\136\151", "action", CASINO_MASK.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\233\152\178\230\154\180\231\179\187\229\136\151", "\228\187\187\229\138\161\232\132\154\230\156\172", 2, 1693493780)
    for i = 1, #CH_MASK_10 do
      stat_set_int(CH_MASK_10[i][1], true, CH_MASK_10[i][2])
    end
  end)
end
do
  local CH_MASK_11 = {
    {
      "H3OPT_MASKS",
      11
    }
  }
  menu.add_feature("\233\172\188\233\157\162\231\179\187\229\136\151", "action", CASINO_MASK.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\233\172\188\233\157\162\231\179\187\229\136\151", "\228\187\187\229\138\161\232\132\154\230\156\172", 2, 1693493780)
    for i = 1, #CH_MASK_11 do
      stat_set_int(CH_MASK_11[i][1], true, CH_MASK_11[i][2])
    end
  end)
end
do
  local CH_MASK_12 = {
    {
      "H3OPT_MASKS",
      12
    }
  }
  menu.add_feature("\229\134\176\231\144\131\231\179\187\229\136\151", "action", CASINO_MASK.id, function()
    menu.notify("\229\183\178\232\174\190\231\189\174\228\184\186\229\134\176\231\144\131\231\179\187\229\136\151", "\228\187\187\229\138\161\232\132\154\230\156\172", 2, 1693493780)
    for i = 1, #CH_MASK_12 do
      stat_set_int(CH_MASK_12[i][1], true, CH_MASK_12[i][2])
    end
  end)
end
do
  local CH_DUGGAN = {
    {
      "H3OPT_DISRUPTSHIP",
      3
    }
  }
  local CH_SCANC_LVL = {
    {
      "H3OPT_KEYLEVELS",
      2
    }
  }
  menu.add_feature("\232\167\163\233\148\129\228\186\140\231\186\167\233\151\168\231\166\129\229\141\161", "action", CASINO_BOARD2.id, function()
    menu.notify("\229\183\178\232\167\163\233\148\129\228\186\140\231\186\167\233\151\168\231\166\129\229\141\161", "\228\187\187\229\138\161\232\132\154\230\156\172", 2, 1693493780)
    for i = 1, #CH_SCANC_LVL do
      stat_set_int(CH_SCANC_LVL[i][1], true, CH_SCANC_LVL[i][2])
    end
  end)
  menu.add_feature("\229\137\138\229\188\177\233\135\141\231\148\178\229\133\181\229\174\137\228\191\157", "action", CASINO_BOARD2.id, function()
    menu.notify("\229\183\178\229\174\140\230\136\144", "\228\187\187\229\138\161\232\132\154\230\156\172", 2, 1693493780)
    for i = 1, #CH_DUGGAN do
      stat_set_int(CH_DUGGAN[i][1], true, CH_DUGGAN[i][2])
    end
  end)
end
do
  local CH_UNLCK_3stboard_var1 = {
    {
      "H3OPT_BITSET0",
      -8849
    }
  }
  local CH_UNLCK_3stboard_var3bc = {
    {
      "H3OPT_BITSET0",
      -186
    }
  }
  menu.add_feature("\228\184\186\233\154\144\232\191\185\230\189\156\232\184\170\231\167\187\233\153\164\233\146\187\229\164\180", "action", CASINO_BOARD3.id, function()
    menu.notify("\229\183\178\229\174\140\230\136\144", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693475860)
    for i = 1, #CH_UNLCK_3stboard_var1 do
      stat_set_int(CH_UNLCK_3stboard_var1[i][1], true, CH_UNLCK_3stboard_var1[i][2])
    end
  end)
  menu.add_feature("\228\184\186\229\133\181\228\184\141\229\142\140\232\175\136\231\167\187\233\153\164\233\146\187\229\164\180", "action", CASINO_BOARD3.id, function()
    menu.notify("\229\183\178\229\174\140\230\136\144", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693475860)
    for i = 1, #CH_UNLCK_3stboard_var3bc do
      stat_set_int(CH_UNLCK_3stboard_var3bc[i][1], true, CH_UNLCK_3stboard_var3bc[i][2])
    end
  end)
end
do
  local CAH_RELOAD_BOARDS = {
    {
      "H3OPT_BITSET1",
      0
    },
    {
      "H3OPT_BITSET0",
      0
    },
    {
      "H3OPT_BITSET1",
      -1
    },
    {
      "H3OPT_BITSET0",
      -1
    }
  }
  menu.add_feature("\233\135\141\230\150\176\229\138\160\232\189\189\230\137\128\230\156\137\231\173\150\229\136\146\231\137\136", "action", CASINO_HEIST.id, function()
    menu.notify("\229\183\178\229\174\140\230\136\144", "", 3, 1677785620)
    for i = 1, #CAH_RELOAD_BOARDS do
      stat_set_int(CAH_RELOAD_BOARDS[i][1], true, CAH_RELOAD_BOARDS[i][2])
    end
  end)
end
do
  local CH_AWRD_BL = {
    {
      "AWD_FIRST_TIME1",
      true
    },
    {
      "AWD_FIRST_TIME2",
      true
    },
    {
      "AWD_FIRST_TIME3",
      true
    },
    {
      "AWD_FIRST_TIME4",
      true
    },
    {
      "AWD_FIRST_TIME5",
      true
    },
    {
      "AWD_FIRST_TIME6",
      true
    },
    {
      "AWD_ALL_IN_ORDER",
      true
    },
    {
      "AWD_SUPPORTING_ROLE",
      true
    },
    {"AWD_LEADER", true},
    {
      "AWD_ODD_JOBS",
      true
    },
    {
      "AWD_SURVIVALIST",
      true
    },
    {
      "AWD_SCOPEOUT",
      true
    },
    {
      "AWD_CREWEDUP",
      true
    },
    {
      "AWD_MOVINGON",
      true
    },
    {
      "AWD_PROMOCAMP",
      true
    },
    {"AWD_GUNMAN", true},
    {
      "AWD_SMASHNGRAB",
      true
    },
    {
      "AWD_INPLAINSI",
      true
    },
    {
      "AWD_UNDETECTED",
      true
    },
    {
      "AWD_ALLROUND",
      true
    },
    {
      "AWD_ELITETHEIF",
      true
    },
    {"AWD_PRO", true},
    {
      "AWD_SUPPORTACT",
      true
    },
    {
      "AWD_SHAFTED",
      true
    },
    {
      "AWD_COLLECTOR",
      true
    },
    {
      "AWD_DEADEYE",
      true
    },
    {
      "AWD_PISTOLSATDAWN",
      true
    },
    {
      "AWD_TRAFFICAVOI",
      true
    },
    {
      "AWD_CANTCATCHBRA",
      true
    },
    {
      "AWD_WIZHARD",
      true
    },
    {
      "AWD_APEESCAPE",
      true
    },
    {
      "AWD_MONKEYKIND",
      true
    },
    {
      "AWD_AQUAAPE",
      true
    },
    {
      "AWD_KEEPFAITH",
      true
    },
    {
      "AWD_TRUELOVE",
      true
    },
    {
      "AWD_NEMESIS",
      true
    },
    {
      "AWD_FRIENDZONED",
      true
    },
    {
      "VCM_FLOW_CS_RSC_SEEN",
      true
    },
    {
      "VCM_FLOW_CS_BWL_SEEN",
      true
    },
    {
      "VCM_FLOW_CS_MTG_SEEN",
      true
    },
    {
      "VCM_FLOW_CS_OIL_SEEN",
      true
    },
    {
      "VCM_FLOW_CS_DEF_SEEN",
      true
    },
    {
      "VCM_FLOW_CS_FIN_SEEN",
      true
    },
    {
      "CAS_VEHICLE_REWARD",
      false
    },
    {"HELP_FURIA", true},
    {
      "HELP_MINITAN",
      true
    },
    {
      "HELP_YOSEMITE2",
      true
    },
    {"HELP_ZHABA", true},
    {
      "HELP_IMORGEN",
      true
    },
    {
      "HELP_SULTAN2",
      true
    },
    {
      "HELP_VAGRANT",
      true
    },
    {"HELP_VSTR", true},
    {
      "HELP_STRYDER",
      true
    },
    {"HELP_SUGOI", true},
    {"HELP_KANJO", true},
    {
      "HELP_FORMULA",
      true
    },
    {
      "HELP_FORMULA2",
      true
    },
    {
      "HELP_JB7002",
      true
    }
  }
  local CH_AWRD_IT = {
    {
      "ARCADE_MAC_0",
      -1
    },
    {
      "ARCADE_MAC_1",
      -1
    },
    {
      "ARCADE_MAC_2",
      -1
    },
    {
      "ARCADE_MAC_3",
      -1
    },
    {
      "ARCADE_MAC_4",
      -1
    },
    {
      "ARCADE_MAC_5",
      -1
    },
    {
      "ARCADE_MAC_6",
      -1
    },
    {
      "ARCADE_MAC_7",
      -1
    },
    {
      "ARCADE_MAC_8",
      -1
    },
    {
      "ARCADE_MAC_9",
      -1
    },
    {
      "ARCADE_MAC_10",
      -1
    },
    {
      "ARCADE_MAC_11",
      -1
    },
    {
      "ARCADE_MAC_12",
      -1
    },
    {
      "ARCADE_MAC_13",
      -1
    },
    {
      "ARCADE_MAC_14",
      -1
    },
    {
      "ARCADE_MAC_15",
      -1
    },
    {
      "CAS_HEIST_NOTS",
      -1
    },
    {
      "CAS_HEIST_FLOW",
      -1
    },
    {
      "CH_ARC_CAB_CLAW_TROPHY",
      -1
    },
    {
      "CH_ARC_CAB_LOVE_TROPHY",
      -1
    },
    {
      "SIGNAL_JAMMERS_COLLECTED",
      50
    },
    {
      "AWD_ODD_JOBS",
      52
    },
    {
      "AWD_PREPARATION",
      40
    },
    {
      "AWD_ASLEEPONJOB",
      20
    },
    {
      "AWD_DAICASHCRAB",
      100000
    },
    {"AWD_BIGBRO", 40},
    {
      "AWD_SHARPSHOOTER",
      40
    },
    {
      "AWD_RACECHAMP",
      40
    },
    {
      "AWD_BATSWORD",
      1000000
    },
    {
      "AWD_COINPURSE",
      950000
    },
    {
      "AWD_ASTROCHIMP",
      3000000
    },
    {
      "AWD_MASTERFUL",
      40000
    },
    {
      "H3_BOARD_DIALOGUE0",
      -1
    },
    {
      "H3_BOARD_DIALOGUE1",
      -1
    },
    {
      "H3_BOARD_DIALOGUE2",
      -1
    },
    {
      "H3_VEHICLESUSED",
      -1
    },
    {
      "H3_CR_STEALTH_1A",
      100
    },
    {
      "H3_CR_STEALTH_2B_RAPP",
      100
    },
    {
      "H3_CR_STEALTH_2C_SIDE",
      100
    },
    {
      "H3_CR_STEALTH_3A",
      100
    },
    {
      "H3_CR_STEALTH_4A",
      100
    },
    {
      "H3_CR_STEALTH_5A",
      100
    },
    {
      "H3_CR_SUBTERFUGE_1A",
      100
    },
    {
      "H3_CR_SUBTERFUGE_2A",
      100
    },
    {
      "H3_CR_SUBTERFUGE_2B",
      100
    },
    {
      "H3_CR_SUBTERFUGE_3A",
      100
    },
    {
      "H3_CR_SUBTERFUGE_3B",
      100
    },
    {
      "H3_CR_SUBTERFUGE_4A",
      100
    },
    {
      "H3_CR_SUBTERFUGE_5A",
      100
    },
    {
      "H3_CR_DIRECT_1A",
      100
    },
    {
      "H3_CR_DIRECT_2A1",
      100
    },
    {
      "H3_CR_DIRECT_2A2",
      100
    },
    {
      "H3_CR_DIRECT_2BP",
      100
    },
    {
      "H3_CR_DIRECT_2C",
      100
    },
    {
      "H3_CR_DIRECT_3A",
      100
    },
    {
      "H3_CR_DIRECT_4A",
      100
    },
    {
      "H3_CR_DIRECT_5A",
      100
    },
    {"CR_ORDER", 100}
  }
  menu.add_feature("\232\167\163\233\148\129\232\181\140\229\156\186\232\177\170\229\138\171\229\165\150\233\161\185&\230\184\184\230\136\143\229\142\133\231\155\184\229\133\179", "action", CASINO_HEIST.id, function()
    for i = 1, #CH_AWRD_IT do
      stat_set_int(CH_AWRD_IT[i][1], true, CH_AWRD_IT[i][2])
    end
    for i = 1, #CH_AWRD_BL do
      stat_set_bool(CH_AWRD_BL[i][1], true, CH_AWRD_BL[i][2])
    end
    for i = 0, 128 do
      hash, mask = stats.stat_get_bool_hash_and_mask("_HEIST3TATTOOSTAT_BOOL", i, CharID)
      stats.stat_set_masked_bool(hash, true, mask, 1, true)
    end
    for i = 0, 256 do
      hash, mask = stats.stat_get_bool_hash_and_mask("_CASINOHSTPSTAT_BOOL", i, CharID)
      stats.stat_set_masked_bool(hash, true, mask, 1, true)
    end
    for i = 0, 448 do
      hash, mask = stats.stat_get_bool_hash_and_mask("_CASINOPSTAT_BOOL", i, CharID)
      stats.stat_set_masked_bool(hash, true, mask, 1, true)
    end
    menu.notify("\229\183\178\232\167\163\233\148\129", "", 3, 1358919920)
  end)
end
do
  local CAH_MISS_1 = {
    {
      "VCM_FLOW_PROGRESS",
      1048576
    },
    {
      "VCM_STORY_PROGRESS",
      0
    }
  }
  menu.add_feature("Loose Cheng", "action", CAH_MISSION_MANAGER.id, function()
    for i = 1, #CAH_MISS_1 do
      stat_set_int(CAH_MISS_1[i][1], true, CAH_MISS_1[i][2])
    end
    menu.notify("\229\136\176\229\164\150\232\190\185\229\142\187\231\132\182\229\144\142\229\155\158\230\157\165\228\187\165\230\155\180\230\150\176\228\187\187\229\138\161", "", 5, 1357934100)
  end)
  local CAH_MISS_2 = {
    {
      "VCM_FLOW_PROGRESS",
      1310785
    },
    {
      "VCM_STORY_PROGRESS",
      1
    }
  }
  menu.add_feature("House Keeping", "action", CAH_MISSION_MANAGER.id, function()
    for i = 1, #CAH_MISS_2 do
      stat_set_int(CAH_MISS_2[i][1], true, CAH_MISS_2[i][2])
    end
    menu.notify("\229\136\176\229\164\150\232\190\185\229\142\187\231\132\182\229\144\142\229\155\158\230\157\165\228\187\165\230\155\180\230\150\176\228\187\187\229\138\161", "", 5, 1357934100)
  end)
  local CAH_MISS_3 = {
    {
      "VCM_FLOW_PROGRESS",
      1310915
    },
    {
      "VCM_STORY_PROGRESS",
      2
    }
  }
  menu.add_feature("Strong Arm Tactics", "action", CAH_MISSION_MANAGER.id, function()
    for i = 1, #CAH_MISS_3 do
      stat_set_int(CAH_MISS_3[i][1], true, CAH_MISS_3[i][2])
    end
    menu.notify("\229\136\176\229\164\150\232\190\185\229\142\187\231\132\182\229\144\142\229\155\158\230\157\165\228\187\165\230\155\180\230\150\176\228\187\187\229\138\161", "", 5, 1357934100)
  end)
  local CAH_MISS_4 = {
    {
      "VCM_FLOW_PROGRESS",
      1311175
    },
    {
      "VCM_STORY_PROGRESS",
      3
    }
  }
  menu.add_feature("Play to Win", "action", CAH_MISSION_MANAGER.id, function()
    for i = 1, #CAH_MISS_4 do
      stat_set_int(CAH_MISS_4[i][1], true, CAH_MISS_4[i][2])
    end
    menu.notify("\229\136\176\229\164\150\232\190\185\229\142\187\231\132\182\229\144\142\229\155\158\230\157\165\228\187\165\230\155\180\230\150\176\228\187\187\229\138\161", "", 5, 1357934100)
  end)
  local CAH_MISS_5 = {
    {
      "VCM_FLOW_PROGRESS",
      1311695
    },
    {
      "VCM_STORY_PROGRESS",
      4
    }
  }
  menu.add_feature("Bad Beat", "action", CAH_MISSION_MANAGER.id, function()
    for i = 1, #CAH_MISS_5 do
      stat_set_int(CAH_MISS_5[i][1], true, CAH_MISS_5[i][2])
    end
    menu.notify("\229\136\176\229\164\150\232\190\185\229\142\187\231\132\182\229\144\142\229\155\158\230\157\165\228\187\165\230\155\180\230\150\176\228\187\187\229\138\161", "", 5, 1357934100)
  end)
  local CAH_MISS_6 = {
    {
      "VCM_FLOW_PROGRESS",
      1312735
    },
    {
      "VCM_STORY_PROGRESS",
      5
    }
  }
  menu.add_feature("Cashing Out", "action", CAH_MISSION_MANAGER.id, function()
    for i = 1, #CAH_MISS_6 do
      stat_set_int(CAH_MISS_6[i][1], true, CAH_MISS_6[i][2])
    end
    menu.notify("\229\136\176\229\164\150\232\190\185\229\142\187\231\132\182\229\144\142\229\155\158\230\157\165\228\187\165\230\155\180\230\150\176\228\187\187\229\138\161", "", 5, 1357934100)
  end)
end
do
  local CH_RST = {
    {
      "H3_LAST_APPROACH",
      0
    },
    {
      "H3OPT_APPROACH",
      0
    },
    {
      "H3_HARD_APPROACH",
      0
    },
    {
      "H3OPT_TARGET",
      0
    },
    {"H3OPT_POI", 0},
    {
      "H3OPT_ACCESSPOINTS",
      0
    },
    {
      "H3OPT_BITSET1",
      0
    },
    {
      "H3OPT_CREWWEAP",
      0
    },
    {
      "H3OPT_CREWDRIVER",
      0
    },
    {
      "H3OPT_CREWHACKER",
      0
    },
    {
      "H3OPT_WEAPS",
      0
    },
    {"H3OPT_VEHS", 0},
    {
      "H3OPT_DISRUPTSHIP",
      0
    },
    {
      "H3OPT_BODYARMORLVL",
      0
    },
    {
      "H3OPT_KEYLEVELS",
      0
    },
    {
      "H3OPT_MASKS",
      0
    },
    {
      "H3OPT_BITSET0",
      0
    }
  }
  menu.add_feature("\233\135\141\231\189\174\232\181\140\229\156\186\232\177\170\229\138\171", "action", CASINO_HEIST.id, function()
    menu.notify("\231\142\176\229\156\168\230\137\147\231\148\181\232\175\157\231\187\153\232\142\177\230\150\175\231\137\185\229\143\150\230\182\136\232\181\140\229\156\186\232\177\170\229\138\171", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1694464180)
    for i = 1, #CH_RST do
      stat_set_int(CH_RST[i][1], true, CH_RST[i][2])
    end
  end)
end
do
  local DD_H_ACT1 = {
    {
      "GANGOPS_FLOW_MISSION_PROG",
      503
    },
    {
      "GANGOPS_HEIST_STATUS",
      -229383
    },
    {
      "GANGOPS_FLOW_NOTIFICATIONS",
      1557
    }
  }
  menu.add_feature("\230\149\176\230\141\174\230\179\132\233\156\178[\230\137\128\230\156\137\231\142\169\229\174\182250\228\184\135]", "toggle", DOOMS_PRESETS.id, function(ACTI)
    menu.notify("* \230\138\162\229\138\171\229\183\178\229\176\177\231\187\170\n* \229\136\134\231\186\162\229\183\178\232\174\190\231\189\174\229\165\189,\232\175\183\229\139\191\230\155\180\230\148\185.\n* \230\138\162\229\138\171\229\174\140\230\136\144\229\144\142\229\134\141\229\133\179\233\151\173\230\173\164\233\128\137\233\161\185", "\230\149\176\230\141\174\230\179\132\233\156\178", 6, 1357962260)
    while ACTI.on do
      for i = 1, #DD_H_ACT1 do
        stat_set_int(DD_H_ACT1[i][1], true, DD_H_ACT1[i][2])
      end
      script.set_global_i(1963626, 313)
      script.set_global_i(1963627, 313)
      script.set_global_i(1963628, 313)
      script.set_global_i(1963629, 313)
      system.yield(0)
    end
  end)
end
do
  local DD_H_ACT2 = {
    {
      "GANGOPS_FLOW_MISSION_PROG",
      240
    },
    {
      "GANGOPS_HEIST_STATUS",
      -229378
    },
    {
      "GANGOPS_FLOW_NOTIFICATIONS",
      1557
    }
  }
  menu.add_feature("\230\179\162\230\160\188\228\184\185\229\141\177\230\156\186[\230\137\128\230\156\137\231\142\169\229\174\182250\228\184\135]", "toggle", DOOMS_PRESETS.id, function(ACTII)
    menu.notify("* \230\138\162\229\138\171\229\183\178\229\176\177\231\187\170\n* \229\136\134\231\186\162\229\183\178\232\174\190\231\189\174\229\165\189,\232\175\183\229\139\191\230\155\180\230\148\185.\n* \230\138\162\229\138\171\229\174\140\230\136\144\229\144\142\229\134\141\229\133\179\233\151\173\230\173\164\233\128\137\233\161\185", "\230\179\162\230\160\188\228\184\185\229\141\177\230\156\186", 6, 1357962260)
    while ACTII.on do
      for i = 1, #DD_H_ACT2 do
        stat_set_int(DD_H_ACT2[i][1], true, DD_H_ACT2[i][2])
      end
      script.set_global_i(1963626, 214)
      script.set_global_i(1963627, 214)
      script.set_global_i(1963628, 214)
      script.set_global_i(1963629, 214)
      system.yield(0)
    end
  end)
end
do
  local DD_H_ACT3 = {
    {
      "GANGOPS_FLOW_MISSION_PROG",
      16368
    },
    {
      "GANGOPS_HEIST_STATUS",
      -229380
    },
    {
      "GANGOPS_FLOW_NOTIFICATIONS",
      1557
    }
  }
  menu.add_feature("\230\156\171\230\151\165\229\176\134\232\135\179[\230\137\128\230\156\137\231\142\169\229\174\182250\228\184\135]", "toggle", DOOMS_PRESETS.id, function(ACTIII)
    menu.notify("* \230\138\162\229\138\171\229\183\178\229\176\177\231\187\170\n* \229\136\134\231\186\162\229\183\178\232\174\190\231\189\174\229\165\189,\232\175\183\229\139\191\230\155\180\230\148\185.\n* \230\138\162\229\138\171\229\174\140\230\136\144\229\144\142\229\134\141\229\133\179\233\151\173\230\173\164\233\128\137\233\161\185", "\230\156\171\230\151\165\229\176\134\232\135\179", 6, 1357962260)
    while ACTIII.on do
      for i = 1, #DD_H_ACT3 do
        stat_set_int(DD_H_ACT3[i][1], true, DD_H_ACT3[i][2])
      end
      script.set_global_i(1963626, 170)
      script.set_global_i(1963627, 170)
      script.set_global_i(1963628, 170)
      script.set_global_i(1963629, 170)
      system.yield(0)
    end
  end)
end
do
  local DDHEIST_HOST_MANAGER = menu.add_feature("\228\189\160\231\154\132\229\136\134\231\186\162", "parent", DDHEIST_PLYR_MANAGER.id)
  menu.add_feature("\232\135\170\229\174\154\228\185\137\229\136\134\231\186\162", "action", DDHEIST_HOST_MANAGER.id, function(domhost)
    local r, s = input.get("\228\184\141\229\187\186\232\174\174\232\190\147\229\133\165\229\164\170\229\164\167\230\149\176\229\128\188", "", 1000, 3)
    if 1 == r then
      return HANDLER_CONTINUE
    end
    if 2 == r then
      return HANDLER_POP
    end
    script.set_global_i(1963626, tonumber(s))
  end)
  menu.add_feature("0%", "toggle", DDHEIST_HOST_MANAGER.id, function(pay1_)
    while pay1_.on do
      script.set_global_i(1963626, 0)
      system.yield(0)
    end
  end)
  menu.add_feature("50%", "action", DDHEIST_HOST_MANAGER.id, function()
    script.set_global_i(1963626, 50)
  end)
  menu.add_feature("85%", "action", DDHEIST_HOST_MANAGER.id, function()
    script.set_global_i(1963626, 85)
  end)
  menu.add_feature("100%", "action", DDHEIST_HOST_MANAGER.id, function()
    script.set_global_i(1963626, 100)
  end)
  menu.add_feature("150%", "action", DDHEIST_HOST_MANAGER.id, function()
    script.set_global_i(1963626, 150)
  end)
  menu.add_feature("175%", "action", DDHEIST_HOST_MANAGER.id, function()
    script.set_global_i(1963626, 175)
  end)
  menu.add_feature("205%", "action", DDHEIST_HOST_MANAGER.id, function()
    script.set_global_i(1963626, 205)
  end)
end
do
  local DDHEIST_PLAYER2_MANAGER = menu.add_feature("\231\142\169\229\174\1822\229\136\134\231\186\162", "parent", DDHEIST_PLYR_MANAGER.id)
  menu.add_feature("\232\135\170\229\174\154\228\185\137\229\136\134\231\186\162", "action", DDHEIST_PLAYER2_MANAGER.id, function(dom2)
    local r, s = input.get("\228\184\141\229\187\186\232\174\174\232\190\147\229\133\165\229\164\170\229\164\167\230\149\176\229\128\188", "", 1000, 3)
    if 1 == r then
      return HANDLER_CONTINUE
    end
    if 2 == r then
      return HANDLER_POP
    end
    script.set_global_i(1963627, tonumber(s))
  end)
  menu.add_feature("0%", "toggle", DDHEIST_PLAYER2_MANAGER.id, function(pay2_)
    while pay2_.on do
      script.set_global_i(1963627, 0)
      system.yield(0)
    end
  end)
  menu.add_feature("50%", "action", DDHEIST_PLAYER2_MANAGER.id, function()
    script.set_global_i(1963627, 50)
  end)
  menu.add_feature("85%", "action", DDHEIST_PLAYER2_MANAGER.id, function()
    script.set_global_i(1963627, 85)
  end)
  menu.add_feature("100%", "action", DDHEIST_PLAYER2_MANAGER.id, function()
    script.set_global_i(1963627, 100)
  end)
  menu.add_feature("150%", "action", DDHEIST_PLAYER2_MANAGER.id, function()
    script.set_global_i(1963627, 150)
  end)
  menu.add_feature("175%", "action", DDHEIST_PLAYER2_MANAGER.id, function()
    script.set_global_i(1963627, 175)
  end)
  menu.add_feature("200%", "action", DDHEIST_PLAYER2_MANAGER.id, function()
    script.set_global_i(1963627, 200)
  end)
  menu.add_feature("205%", "action", DDHEIST_PLAYER2_MANAGER.id, function()
    script.set_global_i(1963627, 205)
  end)
end
do
  local DDHEIST_PLAYER3_MANAGER = menu.add_feature("\231\142\169\229\174\1823\229\136\134\231\186\162", "parent", DDHEIST_PLYR_MANAGER.id)
  menu.add_feature("\232\135\170\229\174\154\228\185\137\229\136\134\231\186\162", "action", DDHEIST_PLAYER3_MANAGER.id, function(dom3)
    local r, s = input.get("\228\184\141\229\187\186\232\174\174\232\190\147\229\133\165\229\164\170\229\164\167\230\149\176\229\128\188", "", 1000, 3)
    if 1 == r then
      return HANDLER_CONTINUE
    end
    if 2 == r then
      return HANDLER_POP
    end
    script.set_global_i(1963628, tonumber(s))
  end)
  menu.add_feature("0%", "toggle", DDHEIST_PLAYER3_MANAGER.id, function(pay3_)
    while pay3_.on do
      script.set_global_i(1963628, 0)
      system.yield(0)
    end
  end)
  menu.add_feature("50%", "action", DDHEIST_PLAYER3_MANAGER.id, function()
    script.set_global_i(1963628, 50)
  end)
  menu.add_feature("85%", "action", DDHEIST_PLAYER3_MANAGER.id, function()
    script.set_global_i(1963628, 85)
  end)
  menu.add_feature("100%", "action", DDHEIST_PLAYER3_MANAGER.id, function()
    script.set_global_i(1963628, 100)
  end)
  menu.add_feature("150%", "action", DDHEIST_PLAYER3_MANAGER.id, function()
    script.set_global_i(1963628, 150)
  end)
  menu.add_feature("175%", "action", DDHEIST_PLAYER3_MANAGER.id, function()
    script.set_global_i(1963628, 175)
  end)
  menu.add_feature("200%", "action", DDHEIST_PLAYER3_MANAGER.id, function()
    script.set_global_i(1963628, 200)
  end)
  menu.add_feature("205%", "action", DDHEIST_PLAYER3_MANAGER.id, function()
    script.set_global_i(1963628, 205)
  end)
end
do
  local DDHEIST_PLAYER4_MANAGER = menu.add_feature("\231\142\169\229\174\1824\229\136\134\231\186\162", "parent", DDHEIST_PLYR_MANAGER.id)
  menu.add_feature("\232\135\170\229\174\154\228\185\137\229\136\134\231\186\162", "action", DDHEIST_PLAYER4_MANAGER.id, function(dom4)
    local r, s = input.get("\228\184\141\229\187\186\232\174\174\232\190\147\229\133\165\229\164\170\229\164\167\230\149\176\229\128\188", "", 1000, 3)
    if 1 == r then
      return HANDLER_CONTINUE
    end
    if 2 == r then
      return HANDLER_POP
    end
    script.set_global_i(1963629, tonumber(s))
  end)
  menu.add_feature("0%", "toggle", DDHEIST_PLAYER4_MANAGER.id, function(pay4_)
    while pay4_.on do
      script.set_global_i(1963629, 0)
      system.yield(0)
    end
  end)
  menu.add_feature("50%", "action", DDHEIST_PLAYER4_MANAGER.id, function()
    script.set_global_i(1963629, 50)
  end)
  menu.add_feature("85%", "action", DDHEIST_PLAYER4_MANAGER.id, function()
    script.set_global_i(1963629, 85)
  end)
  menu.add_feature("100%", "action", DDHEIST_PLAYER4_MANAGER.id, function()
    script.set_global_i(1963629, 100)
  end)
  menu.add_feature("150%", "action", DDHEIST_PLAYER4_MANAGER.id, function()
    script.set_global_i(1963629, 150)
  end)
  menu.add_feature("175%", "action", DDHEIST_PLAYER4_MANAGER.id, function()
    script.set_global_i(1963629, 175)
  end)
  menu.add_feature("200%", "action", DDHEIST_PLAYER4_MANAGER.id, function()
    script.set_global_i(1963629, 200)
  end)
  menu.add_feature("205%", "action", DDHEIST_PLAYER4_MANAGER.id, function()
    script.set_global_i(1963629, 205)
  end)
end
do
  local DD_H_ULCK = {
    {
      "GANGOPS_HEIST_STATUS",
      -1
    },
    {
      "GANGOPS_HEIST_STATUS",
      -229384
    }
  }
  menu.add_feature("\232\167\163\233\148\129\230\137\128\230\156\137\230\156\171\230\151\165\232\177\170\229\138\171\233\128\137\233\161\185", "action", DOOMS_HEIST.id, function()
    menu.notify("\230\137\147\231\148\181\232\175\157\231\187\153\232\142\177\230\150\175\231\137\185\229\185\182\232\166\129\230\177\130\229\143\150\230\182\136\230\156\171\230\151\165\232\177\170\229\138\1713\230\172\161\n\230\173\164\233\128\137\233\161\185\229\143\170\232\131\189\230\140\137\228\184\128\230\172\161", "\228\187\187\229\138\161\232\132\154\230\156\172", 4, 1693475860)
    for i = 1, #DD_H_ULCK do
      stat_set_int(DD_H_ULCK[i][1], true, DD_H_ULCK[i][2])
    end
  end)
end
do
  local DD_PREPS_DONE = {
    {
      "GANGOPS_FM_MISSION_PROG",
      -1
    }
  }
  menu.add_feature("\229\174\140\230\136\144\230\137\128\230\156\137\229\135\134\229\164\135\228\187\187\229\138\161(\233\157\158\229\137\141\231\189\174)", "action", DOOMS_HEIST.id, function()
    menu.notify("\230\137\128\230\156\137\229\135\134\229\164\135\229\183\178\229\174\140\230\136\144", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693475860)
    for i = 1, #DD_PREPS_DONE do
      stat_set_int(DD_PREPS_DONE[i][1], true, DD_PREPS_DONE[i][2])
    end
  end)
end
do
  local DD_H_RST = {
    {
      "GANGOPS_FLOW_MISSION_PROG",
      240
    },
    {
      "GANGOPS_HEIST_STATUS",
      0
    },
    {
      "GANGOPS_FLOW_NOTIFICATIONS",
      1557
    }
  }
  menu.add_feature("\233\135\141\231\189\174\230\156\171\230\151\165\232\177\170\229\138\171", "action", DOOMS_HEIST.id, function()
    menu.notify("\230\156\171\230\151\165\232\177\170\229\138\171\229\183\178\233\135\141\231\189\174\n\232\175\183\229\136\135\230\141\162\230\136\152\229\177\128!!!", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693475860)
    for i = 1, #DD_H_RST do
      stat_set_int(DD_H_RST[i][1], true, DD_H_RST[i][2])
    end
  end)
end
do
  local DD_AWARDS_I = {
    {
      "GANGOPS_FM_MISSION_PROG",
      -1
    },
    {
      "GANGOPS_FLOW_MISSION_PROG",
      -1
    },
    {
      "MPPLY_GANGOPS_ALLINORDER",
      536870911
    },
    {
      "MPPLY_GANGOPS_LOYALTY",
      536870911
    },
    {
      "MPPLY_GANGOPS_CRIMMASMD",
      536870911
    },
    {
      "MPPLY_GANGOPS_LOYALTY2",
      536870911
    },
    {
      "MPPLY_GANGOPS_LOYALTY3",
      536870911
    },
    {
      "MPPLY_GANGOPS_CRIMMASMD2",
      536870911
    },
    {
      "MPPLY_GANGOPS_CRIMMASMD3",
      536870911
    },
    {
      "MPPLY_GANGOPS_SUPPORT",
      536870911
    },
    {
      "CR_GANGOP_MORGUE",
      10
    },
    {
      "CR_GANGOP_DELUXO",
      10
    },
    {
      "CR_GANGOP_SERVERFARM",
      10
    },
    {
      "CR_GANGOP_IAABASE_FIN",
      10
    },
    {
      "CR_GANGOP_STEALOSPREY",
      10
    },
    {
      "CR_GANGOP_FOUNDRY",
      10
    },
    {
      "CR_GANGOP_RIOTVAN",
      10
    },
    {
      "CR_GANGOP_SUBMARINECAR",
      10
    },
    {
      "CR_GANGOP_SUBMARINE_FIN",
      10
    },
    {
      "CR_GANGOP_PREDATOR",
      10
    },
    {
      "CR_GANGOP_BMLAUNCHER",
      10
    },
    {
      "CR_GANGOP_BCCUSTOM",
      10
    },
    {
      "CR_GANGOP_STEALTHTANKS",
      10
    },
    {
      "CR_GANGOP_SPYPLANE",
      10
    },
    {
      "CR_GANGOP_FINALE",
      10
    },
    {
      "CR_GANGOP_FINALE_P2",
      10
    },
    {
      "CR_GANGOP_FINALE_P3",
      10
    },
    {
      "WAM_FLOW_VEHICLE_BS",
      -1
    },
    {
      "GANGOPS_FLOW_IMPEXP_NUM",
      -1
    }
  }
  local DD_AWARDS_B = {
    {
      "MPPLY_AWD_GANGOPS_IAA",
      true
    },
    {
      "MPPLY_AWD_GANGOPS_SUBMARINE",
      true
    },
    {
      "MPPLY_AWD_GANGOPS_MISSILE",
      true
    },
    {
      "MPPLY_AWD_GANGOPS_ALLINORDER",
      true
    },
    {
      "MPPLY_AWD_GANGOPS_LOYALTY",
      true
    },
    {
      "MPPLY_AWD_GANGOPS_LOYALTY2",
      true
    },
    {
      "MPPLY_AWD_GANGOPS_LOYALTY3",
      true
    },
    {
      "MPPLY_AWD_GANGOPS_CRIMMASMD",
      true
    },
    {
      "MPPLY_AWD_GANGOPS_CRIMMASMD2",
      true
    },
    {
      "MPPLY_AWD_GANGOPS_CRIMMASMD3",
      true
    }
  }
  menu.add_feature("\232\167\163\233\148\129\230\156\171\230\151\165\232\177\170\229\138\171\229\165\150\230\157\175", "action", DOOMS_HEIST.id, function()
    for i = 1, #DD_AWARDS_I do
      stat_set_int(DD_AWARDS_I[i][1], true, DD_AWARDS_I[i][2])
      stat_set_int(DD_AWARDS_I[i][1], false, DD_AWARDS_I[i][2])
    end
    for i = 1, #DD_AWARDS_B do
      stat_set_bool(DD_AWARDS_B[i][1], true, DD_AWARDS_B[i][2])
      stat_set_bool(DD_AWARDS_B[i][1], false, DD_AWARDS_B[i][2])
    end
    for i = 0, 64 do
      hash, mask = stats.stat_get_bool_hash_and_mask("_GANGOPSPSTAT_BOOL", i, CharID)
      stats.stat_set_masked_bool(hash, true, mask, 1, true)
    end
    menu.notify("\229\183\178\232\167\163\233\148\129\230\156\171\230\151\165\232\177\170\229\138\171\229\165\150\230\157\175", "", 2, 1358919920)
  end)
end
menu.add_feature("\232\135\170\229\174\154\228\185\137\229\136\134\231\186\162", "action", CLASSIC_CUT.id, function(classic)
  local r, s = input.get("\228\184\141\229\187\186\232\174\174\232\190\147\229\133\165\229\164\170\229\164\167\230\149\176\229\128\188", "", 1000, 3)
  if 1 == r then
    return HANDLER_CONTINUE
  end
  if 2 == r then
    return HANDLER_POP
  end
  script.set_global_i(1937645, tonumber(s))
end)
menu.add_feature("0 %", "toggle", CLASSIC_CUT.id, function(a)
  while a.on do
    script.set_global_i(1937645, 0)
    if not a.on then
      return
    end
    system.wait(0)
  end
end)
menu.add_feature("25 %", "toggle", CLASSIC_CUT.id, function(a)
  while a.on do
    script.set_global_i(1937645, 25)
    if not a.on then
      return
    end
    system.wait(0)
  end
end)
menu.add_feature("50 %", "toggle", CLASSIC_CUT.id, function(a)
  while a.on do
    script.set_global_i(1937645, 50)
    if not a.on then
      return
    end
    system.wait(0)
  end
end)
menu.add_feature("75 %", "toggle", CLASSIC_CUT.id, function(a)
  while a.on do
    script.set_global_i(1937645, 75)
    if not a.on then
      return
    end
    system.wait(0)
  end
end)
menu.add_feature("85 %", "toggle", CLASSIC_CUT.id, function(a)
  while a.on do
    script.set_global_i(1937645, 85)
    if not a.on then
      return
    end
    system.wait(0)
  end
end)
menu.add_feature("100 %", "toggle", CLASSIC_CUT.id, function(a)
  while a.on do
    script.set_global_i(1937645, 100)
    if not a.on then
      return
    end
    system.wait(0)
  end
end)
menu.add_feature("125 %", "toggle", CLASSIC_CUT.id, function(a)
  while a.on do
    script.set_global_i(1937645, 125)
    if not a.on then
      return
    end
    system.wait(0)
  end
end)
menu.add_feature("150 %", "toggle", CLASSIC_CUT.id, function(a)
  while a.on do
    script.set_global_i(1937645, 150)
    if not a.on then
      return
    end
    system.wait(0)
  end
end)
menu.add_feature("175 %", "toggle", CLASSIC_CUT.id, function(a)
  while a.on do
    script.set_global_i(1937645, 175)
    if not a.on then
      return
    end
    system.wait(0)
  end
end)
menu.add_feature("200 %", "toggle", CLASSIC_CUT.id, function(a)
  while a.on do
    script.set_global_i(1937645, 200)
    if not a.on then
      return
    end
    system.wait(0)
  end
end)
menu.add_feature("\229\133\168\231\166\143\233\147\182\232\161\140: VLSI Circuit Breaker 2.0 ", "action", CLASSIC_M_GAME.id, function()
  script.set_local_i(gameplay.get_hash_key("fm_mission_controller"), 11731, 7)
end)
do
  local Apartment_AWD_B = {
    {
      "MPPLY_AWD_COMPLET_HEIST_MEM",
      true
    },
    {
      "MPPLY_AWD_COMPLET_HEIST_1STPER",
      true
    },
    {
      "MPPLY_AWD_FLEECA_FIN",
      true
    },
    {
      "MPPLY_AWD_HST_ORDER",
      true
    },
    {
      "MPPLY_AWD_HST_SAME_TEAM",
      true
    },
    {
      "MPPLY_AWD_HST_ULT_CHAL",
      true
    },
    {
      "MPPLY_AWD_HUMANE_FIN",
      true
    },
    {
      "MPPLY_AWD_PACIFIC_FIN",
      true
    },
    {
      "MPPLY_AWD_PRISON_FIN",
      true
    },
    {
      "MPPLY_AWD_SERIESA_FIN",
      true
    },
    {
      "AWD_FINISH_HEIST_NO_DAMAGE",
      true
    },
    {
      "AWD_SPLIT_HEIST_TAKE_EVENLY",
      true
    },
    {
      "AWD_ALL_ROLES_HEIST",
      true
    },
    {
      "AWD_MATCHING_OUTFIT_HEIST",
      true
    },
    {
      "HEIST_PLANNING_DONE_PRINT",
      true
    },
    {
      "HEIST_PLANNING_DONE_HELP_0",
      true
    },
    {
      "HEIST_PLANNING_DONE_HELP_1",
      true
    },
    {
      "HEIST_PRE_PLAN_DONE_HELP_0",
      true
    },
    {
      "HEIST_CUTS_DONE_FINALE",
      true
    },
    {
      "HEIST_IS_TUTORIAL",
      false
    },
    {
      "HEIST_STRAND_INTRO_DONE",
      true
    },
    {
      "HEIST_CUTS_DONE_ORNATE",
      true
    },
    {
      "HEIST_CUTS_DONE_PRISON",
      true
    },
    {
      "HEIST_CUTS_DONE_BIOLAB",
      true
    },
    {
      "HEIST_CUTS_DONE_NARCOTIC",
      true
    },
    {
      "HEIST_CUTS_DONE_TUTORIAL",
      true
    },
    {
      "HEIST_AWARD_DONE_PREP",
      true
    },
    {
      "HEIST_AWARD_BOUGHT_IN",
      true
    }
  }
  local Apartment_AWD_I = {
    {
      "AWD_FINISH_HEISTS",
      900
    },
    {
      "MPPLY_WIN_GOLD_MEDAL_HEISTS",
      900
    },
    {
      "AWD_DO_HEIST_AS_MEMBER",
      900
    },
    {
      "AWD_DO_HEIST_AS_THE_LEADER",
      900
    },
    {
      "AWD_FINISH_HEIST_SETUP_JOB",
      900
    },
    {
      "AWD_FINISH_HEIST",
      900
    },
    {
      "HEIST_COMPLETION",
      900
    },
    {
      "HEISTS_ORGANISED",
      900
    },
    {
      "AWD_CONTROL_CROWDS",
      900
    },
    {
      "AWD_WIN_GOLD_MEDAL_HEISTS",
      900
    },
    {
      "AWD_COMPLETE_HEIST_NOT_DIE",
      900
    },
    {
      "HEIST_START",
      900
    },
    {"HEIST_END", 900},
    {
      "CUTSCENE_MID_PRISON",
      900
    },
    {
      "CUTSCENE_MID_HUMANE",
      900
    },
    {
      "CUTSCENE_MID_NARC",
      900
    },
    {
      "CUTSCENE_MID_ORNATE",
      900
    },
    {
      "CR_FLEECA_PREP_1",
      5000
    },
    {
      "CR_FLEECA_PREP_2",
      5000
    },
    {
      "CR_FLEECA_FINALE",
      5000
    },
    {
      "CR_PRISON_PLANE",
      5000
    },
    {
      "CR_PRISON_BUS",
      5000
    },
    {
      "CR_PRISON_STATION",
      5000
    },
    {
      "CR_PRISON_UNFINISHED_BIZ",
      5000
    },
    {
      "CR_PRISON_FINALE",
      5000
    },
    {
      "CR_HUMANE_KEY_CODES",
      5000
    },
    {
      "CR_HUMANE_ARMORDILLOS",
      5000
    },
    {
      "CR_HUMANE_EMP",
      5000
    },
    {
      "CR_HUMANE_VALKYRIE",
      5000
    },
    {
      "CR_HUMANE_FINALE",
      5000
    },
    {
      "CR_NARC_COKE",
      5000
    },
    {
      "CR_NARC_TRASH_TRUCK",
      5000
    },
    {
      "CR_NARC_BIKERS",
      5000
    },
    {
      "CR_NARC_WEED",
      5000
    },
    {
      "CR_NARC_STEAL_METH",
      5000
    },
    {
      "CR_NARC_FINALE",
      5000
    },
    {
      "CR_PACIFIC_TRUCKS ",
      5000
    },
    {
      "CR_PACIFIC_WITSEC",
      5000
    },
    {
      "CR_PACIFIC_HACK",
      5000
    },
    {
      "CR_PACIFIC_BIKES",
      5000
    },
    {
      "CR_PACIFIC_CONVOY",
      5000
    },
    {
      "CR_PACIFIC_FINALE",
      5000
    },
    {
      "MPPLY_HEIST_ACH_TRACKER",
      -1
    }
  }
  menu.add_feature("\232\167\163\233\148\129\231\187\143\229\133\184\230\138\162\229\138\171\229\165\150\233\161\185", "action", CLASSIC_HEISTS.id, function()
    menu.notify("- \230\137\128\230\156\137\230\136\144\229\176\177\229\183\178\232\167\163\233\148\129\n\n- \230\137\128\230\156\137\231\187\143\229\133\184\230\138\162\229\138\171\229\183\178\232\167\163\233\148\129\n\n\229\136\135\230\141\162\230\136\152\229\177\128\230\136\150\233\135\141\229\144\175\230\184\184\230\136\143\231\148\159\230\149\136", "", 6, 1694464000)
    for i = 1, #Apartment_AWD_I do
      stat_set_int(Apartment_AWD_I[i][1], true, Apartment_AWD_I[i][2])
      stat_set_int(Apartment_AWD_I[i][1], false, Apartment_AWD_I[i][2])
      for i = 1, #Apartment_AWD_B do
        stat_set_bool(Apartment_AWD_B[i][1], true, Apartment_AWD_B[i][2])
        stat_set_bool(Apartment_AWD_B[i][1], false, Apartment_AWD_B[i][2])
      end
    end
  end)
end
do
  local Apartment_SetDone = {
    {
      "HEIST_PLANNING_STAGE",
      -1
    }
  }
  menu.add_feature("\229\174\140\230\136\144\230\137\128\230\156\137\229\137\141\231\189\174", "toggle", CLASSIC_HEISTS.id, function(checkin)
    menu.notify("\228\189\160\229\143\175\232\131\189\233\156\128\232\166\129\233\128\137\230\139\169\228\184\128\228\184\170\230\138\162\229\138\171,\231\132\182\229\144\142\229\174\140\230\136\144\231\172\172\228\184\128\230\172\161\229\137\141\231\189\174\n\n\232\175\183\228\184\128\231\155\180\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\230\191\128\230\180\187\229\136\176\233\130\163\228\184\170\230\151\182\229\128\153", "", 7, 1358919860)
    while checkin.on do
      for i = 1, #Apartment_SetDone do
        stat_set_int(Apartment_SetDone[i][1], true, Apartment_SetDone[i][2])
      end
      system.yield(0)
    end
  end)
end
menu.add_feature("\229\133\168\231\166\143\233\147\182\232\161\140\229\138\171\230\161\136\229\136\134\231\186\1621500\228\184\135(\229\143\170\229\175\185\228\189\160\231\148\159\230\149\136)", "toggle", CLASSIC_HEISTS.id, function(a)
  menu.notify("* \228\189\160\229\191\133\233\161\187\230\152\175\229\188\128\229\144\175\230\138\162\229\138\171\231\154\132\230\136\191\228\184\187\n* \229\175\185\229\133\182\228\187\150\231\142\169\229\174\182\230\151\160\230\149\136\n* \229\143\170\229\156\168\228\189\160\230\128\165\233\156\128\233\146\177\231\154\132\230\151\182\229\128\153\228\189\191\231\148\168\n* \232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\229\188\128\229\144\175\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159\n* \229\156\168\229\136\134\231\186\162\233\157\162\230\157\191\228\184\138\229\144\175\231\148\168\230\173\164\233\128\137\233\161\185", "\229\133\168\231\166\143\233\147\182\232\161\140\229\138\171\230\161\136\229\136\134\231\186\1621500\228\184\135", 10, 1684806225)
  while a.on do
    script.set_global_i(1937645, 10434)
    system.yield(0)
  end
end)
menu.add_feature("\229\133\168\231\166\143\233\147\182\232\161\140\229\138\171\230\161\136\229\136\134\231\186\1621000\228\184\135(\229\143\170\229\175\185\228\189\160\231\148\159\230\149\136)", "toggle", CLASSIC_HEISTS.id, function(ab)
  menu.notify("* \228\189\160\229\191\133\233\161\187\230\152\175\229\188\128\229\144\175\230\138\162\229\138\171\231\154\132\230\136\191\228\184\187\n* \229\175\185\229\133\182\228\187\150\231\142\169\229\174\182\230\151\160\230\149\136\n* \229\143\170\229\156\168\228\189\160\230\128\165\233\156\128\233\146\177\231\154\132\230\151\182\229\128\153\228\189\191\231\148\168\n* \232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\229\188\128\229\144\175\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159\n* \229\156\168\229\136\134\231\186\162\233\157\162\230\157\191\228\184\138\229\144\175\231\148\168\230\173\164\233\128\137\233\161\185", "\229\133\168\231\166\143\233\147\182\232\161\140\229\138\171\230\161\136\229\136\134\231\186\1621000\228\184\135", 10, 1684806225)
  while ab.on do
    script.set_global_i(1937645, 7000)
    system.yield(0)
  end
end)
menu.add_feature("\229\133\168\231\166\143\233\147\182\232\161\140\229\138\171\230\161\136\229\136\134\231\186\162500\228\184\135(\229\143\170\229\175\185\228\189\160\231\148\159\230\149\136)", "toggle", CLASSIC_HEISTS.id, function(ab)
  menu.notify("* \228\189\160\229\191\133\233\161\187\230\152\175\229\188\128\229\144\175\230\138\162\229\138\171\231\154\132\230\136\191\228\184\187\n* \229\175\185\229\133\182\228\187\150\231\142\169\229\174\182\230\151\160\230\149\136\n* \229\143\170\229\156\168\228\189\160\230\128\165\233\156\128\233\146\177\231\154\132\230\151\182\229\128\153\228\189\191\231\148\168\n* \232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\229\188\128\229\144\175\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159\n* \229\156\168\229\136\134\231\186\162\233\157\162\230\157\191\228\184\138\229\144\175\231\148\168\230\173\164\233\128\137\233\161\185", "\229\133\168\231\166\143\233\147\182\232\161\140\229\138\171\230\161\136\229\136\134\231\186\162500\228\184\135", 10, 1684806225)
  while ab.on do
    script.set_global_i(1937645, 3500)
    system.yield(0)
  end
end)
menu.add_feature("[\229\143\140\229\128\141\230\148\182\229\133\165\230\180\187\229\138\168]\229\133\168\231\166\143\233\147\182\232\161\140\229\138\171\230\161\136\229\136\134\231\186\1621500\228\184\135(\229\143\170\229\175\185\228\189\160\231\148\159\230\149\136)", "toggle", CLASSIC_HEISTS.id, function(eg)
  menu.notify("\230\173\164\233\128\137\233\161\185\229\186\148\228\187\133\229\156\168\229\144\175\231\148\168\230\175\143\229\145\168\230\180\187\229\138\168(\229\143\140\229\128\141\229\163\176\230\156\155\229\128\188\229\146\140GTA\230\184\184\230\136\143\229\184\129)\230\151\182\228\189\191\231\148\168!", "", 5, 1679807977)
  menu.notify("* \228\189\160\229\191\133\233\161\187\230\152\175\229\188\128\229\144\175\230\138\162\229\138\171\231\154\132\230\136\191\228\184\187\n* \229\175\185\229\133\182\228\187\150\231\142\169\229\174\182\230\151\160\230\149\136\n* \229\143\170\229\156\168\228\189\160\230\128\165\233\156\128\233\146\177\231\154\132\230\151\182\229\128\153\228\189\191\231\148\168\n* \232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\229\188\128\229\144\175\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159\n* \229\156\168\229\136\134\231\186\162\233\157\162\230\157\191\228\184\138\229\144\175\231\148\168\230\173\164\233\128\137\233\161\185", "\229\133\168\231\166\143\233\147\182\232\161\140\229\138\171\230\161\136\229\136\134\231\186\1621500\228\184\135", 10, 1684806225)
  while eg.on do
    script.set_global_i(1937645, 5217)
    system.yield(0)
  end
end)
menu.add_feature("[\229\143\140\229\128\141\230\148\182\229\133\165\230\180\187\229\138\168]\229\133\168\231\166\143\233\147\182\232\161\140\229\138\171\230\161\136\229\136\134\231\186\1621000\228\184\135(\229\143\170\229\175\185\228\189\160\231\148\159\230\149\136)", "toggle", CLASSIC_HEISTS.id, function(eg)
  menu.notify("\230\173\164\233\128\137\233\161\185\229\186\148\228\187\133\229\156\168\229\144\175\231\148\168\230\175\143\229\145\168\230\180\187\229\138\168(\229\143\140\229\128\141\229\163\176\230\156\155\229\128\188\229\146\140GTA\230\184\184\230\136\143\229\184\129)\230\151\182\228\189\191\231\148\168!", "", 5, 1679807977)
  menu.notify("* \228\189\160\229\191\133\233\161\187\230\152\175\229\188\128\229\144\175\230\138\162\229\138\171\231\154\132\230\136\191\228\184\187\n* \229\175\185\229\133\182\228\187\150\231\142\169\229\174\182\230\151\160\230\149\136\n* \229\143\170\229\156\168\228\189\160\230\128\165\233\156\128\233\146\177\231\154\132\230\151\182\229\128\153\228\189\191\231\148\168\n* \232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\229\188\128\229\144\175\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159\n* \229\156\168\229\136\134\231\186\162\233\157\162\230\157\191\228\184\138\229\144\175\231\148\168\230\173\164\233\128\137\233\161\185", "\229\133\168\231\166\143\233\147\182\232\161\140\229\138\171\230\161\136\229\136\134\231\186\1621000\228\184\135", 10, 1684806225)
  while eg.on do
    script.set_global_i(1937645, 3500)
    system.yield(0)
  end
end)
menu.add_feature("[\229\143\140\229\128\141\230\148\182\229\133\165\230\180\187\229\138\168]\229\133\168\231\166\143\233\147\182\232\161\140\229\138\171\230\161\136\229\136\134\231\186\162500\228\184\135(\229\143\170\229\175\185\228\189\160\231\148\159\230\149\136)", "toggle", CLASSIC_HEISTS.id, function(eg)
  menu.notify("\230\173\164\233\128\137\233\161\185\229\186\148\228\187\133\229\156\168\229\144\175\231\148\168\230\175\143\229\145\168\230\180\187\229\138\168(\229\143\140\229\128\141\229\163\176\230\156\155\229\128\188\229\146\140GTA\230\184\184\230\136\143\229\184\129)\230\151\182\228\189\191\231\148\168!", "", 5, 1679807977)
  menu.notify("* \228\189\160\229\191\133\233\161\187\230\152\175\229\188\128\229\144\175\230\138\162\229\138\171\231\154\132\230\136\191\228\184\187\n* \229\175\185\229\133\182\228\187\150\231\142\169\229\174\182\230\151\160\230\149\136\n* \229\143\170\229\156\168\228\189\160\230\128\165\233\156\128\233\146\177\231\154\132\230\151\182\229\128\153\228\189\191\231\148\168\n* \232\175\183\228\191\157\230\140\129\230\173\164\233\128\137\233\161\185\229\188\128\229\144\175\231\155\180\229\136\176\230\138\162\229\138\171\231\187\147\230\157\159\n* \229\156\168\229\136\134\231\186\162\233\157\162\230\157\191\228\184\138\229\144\175\231\148\168\230\173\164\233\128\137\233\161\185", "\229\133\168\231\166\143\233\147\182\232\161\140\229\138\171\230\161\136\229\136\134\231\186\162500\228\184\135", 10, 1684806225)
  while eg.on do
    script.set_global_i(1937645, 1750)
    system.yield(0)
  end
end)
menu.add_feature("\230\143\144\233\171\152\229\144\136\231\186\166\230\148\182\231\155\138(100\228\184\135)[\229\143\170\229\175\185\228\189\160\231\148\159\230\149\136]", "toggle", LS_ROBBERY.id, function(rob)
  menu.notify("\229\156\168\229\188\128\229\167\139\229\144\136\231\186\166\228\185\139\229\137\141\229\138\161\229\191\133\229\133\136\228\189\191\230\173\164\233\161\185\228\191\157\230\140\129\229\188\128\229\144\175\n\n\232\191\153\228\184\170\233\128\137\233\161\185\230\156\137\229\134\183\229\141\180\231\154\132,\229\166\130\230\158\156\228\189\160\230\131\179\229\188\128\229\167\139\228\184\139\228\184\128\229\156\186\229\144\136\231\186\166,\233\156\128\231\173\137\229\190\13315-20\229\136\134\233\146\159", "\228\187\187\229\138\161\232\132\154\230\156\172", 5, 1677785620)
  while rob.on do
    script.set_global_i(292836, 1000000)
    script.set_global_i(292837, 1000000)
    script.set_global_i(292838, 1000000)
    script.set_global_i(292839, 1000000)
    script.set_global_i(292840, 1000000)
    script.set_global_i(292841, 1000000)
    script.set_global_i(292842, 1000000)
    script.set_global_i(292843, 1000000)
    script.set_global_i(292835, 1000000)
    script.set_global_f(292832, 0)
    system.yield(0)
  end
end)
menu.add_feature("[\229\143\140\229\128\141\229\163\176\230\156\155\229\128\188\229\146\140\230\184\184\230\136\143\229\184\129\230\180\187\229\138\168]\230\143\144\233\171\152\229\144\136\231\186\166\230\148\182\231\155\138(100\228\184\135)", "toggle", LS_ROBBERY.id, function(rob0)
  menu.notify("\229\156\168\229\188\128\229\167\139\229\144\136\231\186\166\228\185\139\229\137\141\229\138\161\229\191\133\229\133\136\228\189\191\230\173\164\233\161\185\228\191\157\230\140\129\229\188\128\229\144\175\n\n\232\191\153\228\184\170\233\128\137\233\161\185\230\156\137\229\134\183\229\141\180,\229\166\130\230\158\156\228\189\160\230\131\179\229\188\128\229\167\139\228\184\139\228\184\128\229\156\186\229\144\136\231\186\166,\233\156\128\231\173\137\229\190\13315-20\229\136\134\233\146\159\n\n\229\143\170\229\175\185\228\189\160\232\135\170\229\183\177\231\148\159\230\149\136!", "\228\187\187\229\138\161\232\132\154\230\156\172", 7, 1677785620)
  menu.notify("\230\179\168\230\132\143:\232\191\153\228\184\170\233\128\137\233\161\185\229\186\148\232\175\165\229\143\170\229\156\168\229\143\140\229\128\141\230\180\187\229\138\168\228\186\139\228\187\182\229\144\175\231\148\168\230\151\182\228\189\191\231\148\168(\229\143\140\229\128\141\229\163\176\230\156\155\229\128\188\229\146\140\230\184\184\230\136\143\229\184\129)!\n\n\230\148\182\229\133\165\229\143\175\232\131\189\230\152\190\231\164\186\228\184\186 50\228\184\135\228\189\134\229\174\158\233\153\133\228\184\138\228\189\160\229\176\134\229\156\168\233\146\177\229\140\133\228\184\173\230\148\182\229\136\176100\228\184\135.", "", 7, 1677785620)
  while rob0.on do
    script.set_global_i(292836, 500000)
    script.set_global_i(292837, 500000)
    script.set_global_i(292838, 500000)
    script.set_global_i(292839, 500000)
    script.set_global_i(292840, 500000)
    script.set_global_i(292841, 500000)
    script.set_global_i(292842, 500000)
    script.set_global_i(292843, 500000)
    script.set_global_i(292835, 500000)
    script.set_global_f(292832, 0)
    system.yield(0)
  end
end)
do
  local LS_CONTRACT_0_UD = {
    {
      "TUNER_GEN_BS",
      12543
    },
    {
      "TUNER_CURRENT",
      0
    }
  }
  menu.add_feature("\232\129\148\229\144\136\229\130\168\232\147\132\233\147\182\232\161\140\229\144\136\231\186\166", "action", LS_ROBBERY.id, function()
    for i = 1, #LS_CONTRACT_0_UD do
      menu.notify("\229\189\147\228\189\160\229\164\132\228\186\142\228\189\160\231\154\132\230\148\185\232\163\133\229\186\151\229\164\150\230\151\182,\230\173\164\233\128\137\233\161\185\231\148\159\230\149\136!\n\n\n\232\129\148\229\144\136\229\130\168\232\147\132\233\147\182\232\161\140\229\144\136\231\186\166\231\142\176\229\143\175\230\184\184\231\142\169", "", 6, 1693475860)
      stat_set_int(LS_CONTRACT_0_UD[i][1], true, LS_CONTRACT_0_UD[i][2])
    end
  end)
end
do
  local LS_CONTRACT_1_SD = {
    {
      "TUNER_GEN_BS",
      4351
    },
    {
      "TUNER_CURRENT",
      1
    }
  }
  menu.add_feature("\229\164\167\233\146\158\228\186\164\230\152\147", "action", LS_ROBBERY.id, function()
    for i = 1, #LS_CONTRACT_1_SD do
      menu.notify("\229\189\147\228\189\160\229\164\132\228\186\142\228\189\160\231\154\132\230\148\185\232\163\133\229\186\151\229\164\150\230\151\182,\230\173\164\233\128\137\233\161\185\231\148\159\230\149\136!\n\n\n\229\164\167\233\146\158\228\186\164\230\152\147\231\142\176\229\143\175\230\184\184\231\142\169", "", 6, 1693475860)
      stat_set_int(LS_CONTRACT_1_SD[i][1], true, LS_CONTRACT_1_SD[i][2])
    end
  end)
end
do
  local LS_CONTRACT_2_BC = {
    {
      "TUNER_GEN_BS",
      12543
    },
    {
      "TUNER_CURRENT",
      2
    }
  }
  menu.add_feature("\233\147\182\232\161\140\229\144\136\231\186\166", "action", LS_ROBBERY.id, function()
    for i = 1, #LS_CONTRACT_2_BC do
      menu.notify("\229\189\147\228\189\160\229\164\132\228\186\142\228\189\160\231\154\132\230\148\185\232\163\133\229\186\151\229\164\150\230\151\182,\230\173\164\233\128\137\233\161\185\231\148\159\230\149\136!\n\n\n\233\147\182\232\161\140\229\144\136\231\186\166\231\142\176\229\143\175\230\184\184\231\142\169", "", 6, 1693475860)
      stat_set_int(LS_CONTRACT_2_BC[i][1], true, LS_CONTRACT_2_BC[i][2])
    end
  end)
end
do
  local LS_CONTRACT_3_ECU = {
    {
      "TUNER_GEN_BS",
      12543
    },
    {
      "TUNER_CURRENT",
      3
    }
  }
  menu.add_feature("\231\148\181\230\142\167\229\141\149\229\133\131\229\144\136\231\186\166", "action", LS_ROBBERY.id, function()
    for i = 1, #LS_CONTRACT_3_ECU do
      menu.notify("\229\189\147\228\189\160\229\164\132\228\186\142\228\189\160\231\154\132\230\148\185\232\163\133\229\186\151\229\164\150\230\151\182,\230\173\164\233\128\137\233\161\185\231\148\159\230\149\136!\n\n\n\231\148\181\230\142\167\229\141\149\229\133\131\229\144\136\231\186\166\231\142\176\229\143\175\230\184\184\231\142\169", "", 6, 1693475860)
      stat_set_int(LS_CONTRACT_3_ECU[i][1], true, LS_CONTRACT_3_ECU[i][2])
    end
  end)
end
do
  local LS_CONTRACT_4_PRSN = {
    {
      "TUNER_GEN_BS",
      12543
    },
    {
      "TUNER_CURRENT",
      4
    }
  }
  menu.add_feature("\231\155\145\231\139\177\229\144\136\231\186\166", "action", LS_ROBBERY.id, function()
    for i = 1, #LS_CONTRACT_4_PRSN do
      menu.notify("\229\189\147\228\189\160\229\164\132\228\186\142\228\189\160\231\154\132\230\148\185\232\163\133\229\186\151\229\164\150\230\151\182,\230\173\164\233\128\137\233\161\185\231\148\159\230\149\136!\n\n\n\231\155\145\231\139\177\229\144\136\231\186\166\231\142\176\229\143\175\230\184\184\231\142\169", "", 6, 1693475860)
      stat_set_int(LS_CONTRACT_4_PRSN[i][1], true, LS_CONTRACT_4_PRSN[i][2])
    end
  end)
end
do
  local LS_CONTRACT_5_AGC = {
    {
      "TUNER_GEN_BS",
      12543
    },
    {
      "TUNER_CURRENT",
      5
    }
  }
  menu.add_feature("IAA\228\186\164\230\152\147", "action", LS_ROBBERY.id, function()
    for i = 1, #LS_CONTRACT_5_AGC do
      menu.notify("\229\189\147\228\189\160\229\164\132\228\186\142\228\189\160\231\154\132\230\148\185\232\163\133\229\186\151\229\164\150\230\151\182,\230\173\164\233\128\137\233\161\185\231\148\159\230\149\136!\n\n\nIAA\228\186\164\230\152\147\231\142\176\229\143\175\230\184\184\231\142\169", "", 6, 1693475860)
      stat_set_int(LS_CONTRACT_5_AGC[i][1], true, LS_CONTRACT_5_AGC[i][2])
    end
  end)
end
do
  local LS_CONTRACT_6_LOST = {
    {
      "TUNER_GEN_BS",
      12543
    },
    {
      "TUNER_CURRENT",
      6
    }
  }
  menu.add_feature("\229\164\177\232\144\189\230\145\169\230\137\152\229\184\174\229\144\136\231\186\166", "action", LS_ROBBERY.id, function()
    for i = 1, #LS_CONTRACT_6_LOST do
      menu.notify("\229\189\147\228\189\160\229\164\132\228\186\142\228\189\160\231\154\132\230\148\185\232\163\133\229\186\151\229\164\150\230\151\182,\230\173\164\233\128\137\233\161\185\231\148\159\230\149\136!\n\n\n\229\164\177\232\144\189\230\145\169\230\137\152\229\184\174\229\144\136\231\186\166\231\142\176\229\143\175\230\184\184\231\142\169", "", 6, 1693475860)
      stat_set_int(LS_CONTRACT_6_LOST[i][1], true, LS_CONTRACT_6_LOST[i][2])
    end
  end)
end
do
  local LS_CONTRACT_7_DATA = {
    {
      "TUNER_GEN_BS",
      12543
    },
    {
      "TUNER_CURRENT",
      7
    }
  }
  menu.add_feature("\230\149\176\230\141\174\229\144\136\231\186\166", "action", LS_ROBBERY.id, function()
    for i = 1, #LS_CONTRACT_7_DATA do
      menu.notify("\229\189\147\228\189\160\229\164\132\228\186\142\228\189\160\231\154\132\230\148\185\232\163\133\229\186\151\229\164\150\230\151\182,\230\173\164\233\128\137\233\161\185\231\148\159\230\149\136!\n\n\n\230\149\176\230\141\174\229\144\136\231\186\166\231\142\176\229\143\175\230\184\184\231\142\169", "", 6, 1693475860)
      menu.notify("\229\191\189\231\149\165NPC\228\185\139\233\151\180\231\154\132\228\184\128\228\186\155\229\175\185\232\175\157\228\188\154\228\189\191\228\189\160\230\151\160\230\179\149\229\190\151\229\136\176\230\138\165\233\133\172,\232\175\183\229\139\191\233\162\145\231\185\129\232\183\179\232\191\135!", "\233\135\141\232\166\129\228\186\139\233\161\185", 6, 1679094015)
      stat_set_int(LS_CONTRACT_7_DATA[i][1], true, LS_CONTRACT_7_DATA[i][2])
    end
  end)
end
do
  local LS_CONTRACT_MSS_ONLY = {
    {
      "TUNER_GEN_BS",
      -1
    }
  }
  menu.add_feature("\229\174\140\230\136\144\230\137\128\230\156\137\229\137\141\231\189\174", "action", LS_ROBBERY.id, function()
    for i = 1, #LS_CONTRACT_MSS_ONLY do
      menu.notify("\229\189\147\228\189\160\229\164\132\228\186\142\228\189\160\231\154\132\230\148\185\232\163\133\229\186\151\229\164\150\230\151\182,\230\173\164\233\128\137\233\161\185\231\148\159\230\149\136\n\n\229\137\141\231\189\174\229\183\178\229\174\140\230\136\144", "\228\187\187\229\138\161\232\132\154\230\156\172", 6, 1693475860)
      stat_set_int(LS_CONTRACT_MSS_ONLY[i][1], true, LS_CONTRACT_MSS_ONLY[i][2])
    end
  end)
end
do
  local LS_TUNERS_DLC_BL = {
    {
      "AWD_CAR_CLUB",
      true
    },
    {
      "AWD_PRO_CAR_EXPORT",
      true
    },
    {
      "AWD_UNION_DEPOSITORY",
      true
    },
    {
      "AWD_MILITARY_CONVOY",
      true
    },
    {
      "AWD_FLEECA_BANK",
      true
    },
    {
      "AWD_FREIGHT_TRAIN",
      true
    },
    {
      "AWD_BOLINGBROKE_ASS",
      true
    },
    {
      "AWD_IAA_RAID",
      true
    },
    {
      "AWD_METH_JOB",
      true
    },
    {
      "AWD_BUNKER_RAID",
      true
    },
    {
      "AWD_STRAIGHT_TO_VIDEO",
      true
    },
    {
      "AWD_MONKEY_C_MONKEY_DO",
      true
    },
    {
      "AWD_TRAINED_TO_KILL",
      true
    },
    {
      "AWD_DIRECTOR",
      true
    }
  }
  local LS_TUNERS_DLC_IT = {
    {
      "AWD_CAR_CLUB_MEM",
      100
    },
    {
      "AWD_SPRINTRACER",
      50
    },
    {
      "AWD_STREETRACER",
      50
    },
    {
      "AWD_PURSUITRACER",
      50
    },
    {
      "AWD_TEST_CAR",
      240
    },
    {
      "AWD_AUTO_SHOP",
      50
    },
    {
      "AWD_CAR_EXPORT",
      100
    },
    {
      "AWD_GROUNDWORK",
      40
    },
    {
      "AWD_ROBBERY_CONTRACT",
      100
    },
    {
      "AWD_FACES_OF_DEATH",
      100
    }
  }
  menu.add_feature("\232\167\163\233\148\129\230\137\128\230\156\137\232\189\166\229\143\139\228\188\154\229\165\150\229\138\177", "action", LS_ROBBERY.id, function()
    for i = 1, #LS_TUNERS_DLC_IT do
      stat_set_int(LS_TUNERS_DLC_IT[i][1], true, LS_TUNERS_DLC_IT[i][2])
    end
    for i = 2, #LS_TUNERS_DLC_BL do
      stat_set_bool(LS_TUNERS_DLC_BL[i][1], true, LS_TUNERS_DLC_BL[i][2])
    end
    for i = 0, 576 do
      hash, mask = stats.stat_get_bool_hash_and_mask("_TUNERPSTAT_BOOL", i, CharID)
      stats.stat_set_masked_bool(hash, true, mask, 1, true)
    end
    script.set_global_i(292978, 1)
    menu.notify("\229\183\178\232\167\163\233\148\129", "", 3, 1358919920)
  end)
end
local ROBBERY_RESETER = menu.add_feature("\230\155\180\229\164\154\233\128\137\233\161\185", "parent", LS_ROBBERY.id)
do
  local LS_CONTRACT_MISSION_RST = {
    {
      "TUNER_GEN_BS",
      12467
    }
  }
  menu.add_feature("\233\135\141\231\189\174\229\137\141\231\189\174\228\187\187\229\138\161", "action", ROBBERY_RESETER.id, function()
    for i = 1, #LS_CONTRACT_MISSION_RST do
      menu.notify("\229\189\147\228\189\160\229\164\132\228\186\142\228\189\160\231\154\132\230\148\185\232\163\133\229\186\151\229\164\150\230\151\182,\230\173\164\233\128\137\233\161\185\231\148\159\230\149\136\n\n\229\137\141\231\189\174\228\187\187\229\138\161\229\183\178\233\135\141\231\189\174", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693475860)
      stat_set_int(LS_CONTRACT_MISSION_RST[i][1], true, LS_CONTRACT_MISSION_RST[i][2])
    end
  end)
end
do
  local LS_CONTRACT_RST = {
    {
      "TUNER_GEN_BS",
      8371
    },
    {
      "TUNER_CURRENT",
      -1
    }
  }
  menu.add_feature("\233\135\141\231\189\174\229\144\136\231\186\166", "action", ROBBERY_RESETER.id, function()
    for i = 1, #LS_CONTRACT_RST do
      menu.notify("\229\189\147\228\189\160\229\164\132\228\186\142\228\189\160\231\154\132\230\148\185\232\163\133\229\186\151\229\164\150\230\151\182,\230\173\164\233\128\137\233\161\185\231\148\159\230\149\136\n\n\229\144\136\231\186\166\229\183\178\233\135\141\231\189\174", "\228\187\187\229\138\161\232\132\154\230\156\172", 3, 1693475860)
      stat_set_int(LS_CONTRACT_RST[i][1], true, LS_CONTRACT_RST[i][2])
    end
  end)
end
do
  local RST_COUNT_TNR = {
    {
      "TUNER_COUNT",
      0
    },
    {
      "TUNER_EARNINGS",
      0
    }
  }
  menu.add_feature("\233\135\141\231\189\174\230\128\187\230\148\182\231\155\138&\229\183\178\229\174\140\230\136\144\231\154\132\228\187\187\229\138\161", "action", ROBBERY_RESETER.id, function()
    for i = 1, #RST_COUNT_TNR do
      menu.notify("\228\187\133\229\189\147\228\189\160\229\156\168\230\148\185\232\189\166\233\147\186\229\164\150\230\151\182\231\148\159\230\149\136\n\n\230\149\176\230\141\174\229\183\178\233\135\141\231\189\174", "", 4, 1694464120)
      stat_set_int(RST_COUNT_TNR[i][1], true, RST_COUNT_TNR[i][2])
    end
  end)
end
local CONTRACT_MANAGER = menu.add_feature("VIP\229\144\136\231\186\166:\229\190\183\231\145\158\229\141\154\229\163\171", "parent", TH_CONTRACT.id, function()
  menu.notify("\228\189\160\229\191\133\233\161\187\230\179\168\233\148\128\229\138\158\229\133\172\229\174\164\231\148\181\232\132\145\230\137\141\232\131\189\230\173\163\231\161\174\230\155\180\230\150\176\230\149\176\230\141\174")
end)
local CONTRACT_MANAGER_ = menu.add_feature("\229\164\156\231\148\159\230\180\187\230\179\132\229\175\134", "parent", CONTRACT_MANAGER.id)
local CONTRACT_MANAGER__ = menu.add_feature("\228\184\138\230\181\129\231\164\190\228\188\154\230\179\132\229\175\134", "parent", CONTRACT_MANAGER.id)
local CONTRACT_MANAGER___ = menu.add_feature("\229\141\151\228\184\173\229\191\131\229\140\186\230\179\132\229\175\134", "parent", CONTRACT_MANAGER.id)
do
  local LEAK_NIGHTCLUB = {
    {
      "FIXER_GENERAL_BS",
      -1
    },
    {
      "FIXER_COMPLETED_BS",
      -1
    },
    {
      "FIXER_STORY_BS",
      3
    },
    {
      "FIXER_STORY_COOLDOWN",
      -1
    }
  }
  menu.add_feature("\229\164\156\230\128\187\228\188\154(\229\137\141\231\189\174)", "action", CONTRACT_MANAGER_.id, function()
    for i = 1, #LEAK_NIGHTCLUB do
      stat_set_int(LEAK_NIGHTCLUB[i][1], true, LEAK_NIGHTCLUB[i][2])
    end
    menu.notify("\229\183\178\233\128\137\230\139\169\229\164\156\230\128\187\228\188\154\229\137\141\231\189\174")
  end)
end
do
  local LEAK_MARINA = {
    {
      "FIXER_GENERAL_BS",
      -1
    },
    {
      "FIXER_COMPLETED_BS",
      -1
    },
    {
      "FIXER_STORY_BS",
      4
    },
    {
      "FIXER_STORY_COOLDOWN",
      -1
    }
  }
  menu.add_feature("\232\136\185\229\157\158(\229\137\141\231\189\174)", "action", CONTRACT_MANAGER_.id, function()
    for i = 1, #LEAK_MARINA do
      stat_set_int(LEAK_MARINA[i][1], true, LEAK_MARINA[i][2])
    end
    menu.notify("\229\183\178\233\128\137\230\139\169\232\136\185\229\157\158\229\137\141\231\189\174")
  end)
end
do
  local LEAK_NIGHTLIFE = {
    {
      "FIXER_GENERAL_BS",
      -1
    },
    {
      "FIXER_COMPLETED_BS",
      -1
    },
    {
      "FIXER_STORY_BS",
      12
    },
    {
      "FIXER_STORY_COOLDOWN",
      -1
    }
  }
  menu.add_feature("\229\164\156\231\148\159\230\180\187\230\179\132\229\175\134(\228\187\187\229\138\161)", "action", CONTRACT_MANAGER_.id, function()
    for i = 1, #LEAK_NIGHTLIFE do
      stat_set_int(LEAK_NIGHTLIFE[i][1], true, LEAK_NIGHTLIFE[i][2])
    end
    menu.notify("\229\183\178\233\128\137\230\139\169\229\164\156\231\148\159\230\180\187\230\179\132\229\175\134\228\187\187\229\138\161")
  end)
end
do
  local LEAK_COUNTRYCLUB = {
    {
      "FIXER_GENERAL_BS",
      -1
    },
    {
      "FIXER_COMPLETED_BS",
      -1
    },
    {
      "FIXER_STORY_STRAND",
      -1
    },
    {
      "FIXER_STORY_BS",
      28
    },
    {
      "FIXER_STORY_COOLDOWN",
      -1
    }
  }
  menu.add_feature("\228\185\161\230\157\145\228\191\177\228\185\144\233\131\168(\229\137\141\231\189\174)", "action", CONTRACT_MANAGER__.id, function()
    for i = 1, #LEAK_COUNTRYCLUB do
      stat_set_int(LEAK_COUNTRYCLUB[i][1], true, LEAK_COUNTRYCLUB[i][2])
    end
    menu.notify("\229\183\178\233\128\137\230\139\169\228\185\161\230\157\145\228\191\177\228\185\144\233\131\168\229\137\141\231\189\174")
  end)
end
do
  local LEAK_GUESTLIST = {
    {
      "FIXER_GENERAL_BS",
      -1
    },
    {
      "FIXER_COMPLETED_BS",
      -1
    },
    {
      "FIXER_STORY_STRAND",
      -1
    },
    {
      "FIXER_STORY_BS",
      60
    },
    {
      "FIXER_STORY_COOLDOWN",
      -1
    }
  }
  menu.add_feature("\229\174\190\229\174\162\229\144\141\229\141\149(\229\137\141\231\189\174)", "action", CONTRACT_MANAGER__.id, function()
    for i = 1, #LEAK_GUESTLIST do
      stat_set_int(LEAK_GUESTLIST[i][1], true, LEAK_GUESTLIST[i][2])
    end
    menu.notify("\229\183\178\233\128\137\230\139\169\229\174\190\229\174\162\229\144\141\229\141\149\229\137\141\231\189\174")
  end)
end
do
  local LEAK_HIGHSOCIETY = {
    {
      "FIXER_GENERAL_BS",
      -1
    },
    {
      "FIXER_COMPLETED_BS",
      -1
    },
    {
      "FIXER_STORY_STRAND",
      -1
    },
    {
      "FIXER_STORY_BS",
      124
    },
    {
      "FIXER_STORY_COOLDOWN",
      -1
    }
  }
  menu.add_feature("\228\184\138\230\181\129\231\164\190\228\188\154\230\179\132\229\175\134(\228\187\187\229\138\161)", "action", CONTRACT_MANAGER__.id, function()
    for i = 1, #LEAK_HIGHSOCIETY do
      stat_set_int(LEAK_HIGHSOCIETY[i][1], true, LEAK_HIGHSOCIETY[i][2])
    end
    menu.notify("\229\183\178\233\128\137\230\139\169\228\184\138\230\181\129\231\164\190\228\188\154\230\179\132\229\175\134\228\187\187\229\138\161")
  end)
end
do
  local LEAK_DAVIS = {
    {
      "FIXER_GENERAL_BS",
      -1
    },
    {
      "FIXER_COMPLETED_BS",
      -1
    },
    {
      "FIXER_STORY_STRAND",
      -1
    },
    {
      "FIXER_STORY_BS",
      252
    },
    {
      "FIXER_STORY_COOLDOWN",
      -1
    }
  }
  menu.add_feature("\230\136\180\231\187\180\230\150\175(\229\137\141\231\189\174)", "action", CONTRACT_MANAGER___.id, function()
    for i = 1, #LEAK_DAVIS do
      stat_set_int(LEAK_DAVIS[i][1], true, LEAK_DAVIS[i][2])
    end
    menu.notify("\229\183\178\233\128\137\230\139\169\230\136\180\231\187\180\230\150\175\229\137\141\231\189\174")
  end)
end
do
  local LEAK_BALLAS = {
    {
      "FIXER_GENERAL_BS",
      -1
    },
    {
      "FIXER_COMPLETED_BS",
      -1
    },
    {
      "FIXER_STORY_STRAND",
      -1
    },
    {
      "FIXER_STORY_BS",
      508
    },
    {
      "FIXER_STORY_COOLDOWN",
      -1
    }
  }
  menu.add_feature("\229\183\180\230\139\137\230\150\175\229\184\174\228\188\154(\229\137\141\231\189\174)", "action", CONTRACT_MANAGER___.id, function()
    for i = 1, #LEAK_BALLAS do
      stat_set_int(LEAK_BALLAS[i][1], true, LEAK_BALLAS[i][2])
    end
    menu.notify("\229\183\178\233\128\137\230\139\169\229\183\180\230\139\137\230\150\175\229\184\174\228\188\154\229\137\141\231\189\174")
  end)
end
do
  local LEAK_STUDIO = {
    {
      "FIXER_GENERAL_BS",
      -1
    },
    {
      "FIXER_COMPLETED_BS",
      -1
    },
    {
      "FIXER_STORY_STRAND",
      -1
    },
    {
      "FIXER_STORY_BS",
      2044
    },
    {
      "FIXER_STORY_COOLDOWN",
      -1
    }
  }
  menu.add_feature("\228\186\139\229\138\161\230\137\128(\228\187\187\229\138\161)", "action", CONTRACT_MANAGER___.id, function()
    for i = 1, #LEAK_STUDIO do
      stat_set_int(LEAK_STUDIO[i][1], true, LEAK_STUDIO[i][2])
    end
    menu.notify("\229\183\178\233\128\137\230\139\169\228\186\139\229\138\161\230\137\128\228\187\187\229\138\161\n\n\232\175\183\231\166\187\229\188\128\229\133\172\229\175\147\230\136\150\230\155\180\230\141\162\230\136\152\229\177\128\228\187\165\231\148\159\230\149\136")
  end)
end
do
  local LEAK_FINAL = {
    {
      "FIXER_GENERAL_BS",
      -1
    },
    {
      "FIXER_COMPLETED_BS",
      -1
    },
    {
      "FIXER_STORY_STRAND",
      -1
    },
    {
      "FIXER_STORY_BS",
      4092
    },
    {
      "FIXER_STORY_COOLDOWN",
      -1
    }
  }
  menu.add_feature("\230\156\128\231\187\136\229\144\136\231\186\166: \229\136\171\230\131\185\229\190\183\231\145\158", "action", CONTRACT_MANAGER___.id, function()
    for i = 1, #LEAK_FINAL do
      stat_set_int(LEAK_FINAL[i][1], true, LEAK_FINAL[i][2])
    end
    menu.notify("\229\183\178\233\128\137\230\139\169\230\156\128\231\187\136\229\144\136\231\186\166\n\n\232\175\183\231\166\187\229\188\128\229\133\172\229\175\147\230\136\150\230\155\180\230\141\162\230\136\152\229\177\128\228\187\165\231\148\159\230\149\136")
  end)
end
menu.add_feature("\228\191\174\230\148\185\230\156\128\231\187\136\229\144\136\231\186\166\230\148\182\229\133\165(240\228\184\135|\229\143\170\229\175\185\228\189\160\231\148\159\230\149\136)", "toggle", TH_CONTRACT.id, function(MDFY_C_PAYOUT)
  menu.notify("\229\143\170\229\175\185\228\189\160\231\148\159\230\149\136", "", 5, 1343534320)
  while MDFY_C_PAYOUT.on do
    script.set_global_i(293534, 2400000)
    system.yield(0)
  end
end)
menu.add_feature("[\230\180\187\229\138\168]\228\191\174\230\148\185\230\156\128\231\187\136\229\144\136\231\186\166\230\148\182\229\133\165(240\228\184\135|\229\143\170\229\175\185\228\189\160\231\148\159\230\149\136)", "toggle", TH_CONTRACT.id, function(MDFY_CE_PAYOUT)
  menu.notify("* \229\143\170\229\175\185\228\189\160\231\148\159\230\149\136\n\n* \228\187\133\229\156\168\230\156\137\229\165\150\229\138\177\230\180\187\229\138\168\230\151\182\228\189\191\231\148\168\230\173\164\233\128\137\233\161\185", "", 5, 1343534320)
  while MDFY_CE_PAYOUT.on do
    script.set_global_i(293534, 1600000)
    system.yield(0)
  end
end)
menu.add_feature("\231\167\187\233\153\164\229\174\137\228\191\157/\229\133\172\231\148\168\231\148\181\232\175\157\228\186\173\228\187\187\229\138\161\229\134\183\229\141\180\230\151\182\233\151\180", "toggle", TH_CONTRACT.id, function(CONT_REM_CD)
  while CONT_REM_CD.on do
    script.set_global_i(293490, 0)
    script.set_global_i(293568, 0)
    script.set_global_i(2720311, 0)
    system.yield(0)
  end
end)
do
  local CONTRACT_COMPLETE = {
    {
      "FIXER_GENERAL_BS",
      -1
    },
    {
      "FIXER_COMPLETED_BS",
      -1
    },
    {
      "FIXER_STORY_BS",
      -1
    },
    {
      "FIXER_STORY_COOLDOWN",
      -1
    }
  }
  menu.add_feature("\229\174\140\230\136\144\230\137\128\230\156\137\228\187\187\229\138\161", "action", TH_CONTRACT.id, function()
    for i = 1, #CONTRACT_COMPLETE do
      stat_set_int(CONTRACT_COMPLETE[i][1], true, CONTRACT_COMPLETE[i][2])
    end
    menu.notify("\230\137\128\230\156\137\228\187\187\229\138\161\229\183\178\229\174\140\230\136\144")
  end)
end
do
  local TH_AWARDS_I = {
    {
      "AWD_CONTRACTOR",
      50
    },
    {
      "AWD_COLD_CALLER",
      50
    },
    {
      "AWD_PRODUCER",
      60
    },
    {
      "FIXERTELEPHONEHITSCOMPL",
      10
    },
    {
      "PAYPHONE_BONUS_KILL_METHOD",
      10
    },
    {
      "FIXER_COUNT",
      501
    },
    {
      "FIXER_SC_VEH_RECOVERED",
      501
    },
    {
      "FIXER_SC_VAL_RECOVERED",
      501
    },
    {
      "FIXER_SC_GANG_TERMINATED",
      501
    },
    {
      "FIXER_SC_VIP_RESCUED",
      501
    },
    {
      "FIXER_SC_ASSETS_PROTECTED",
      501
    },
    {
      "FIXER_SC_EQ_DESTROYED",
      501
    },
    {
      "FIXER_EARNINGS",
      300000
    }
  }
  local TH_AWARDS_B = {
    {
      "AWD_TEEING_OFF",
      true
    },
    {
      "AWD_PARTY_NIGHT",
      true
    },
    {
      "AWD_BILLIONAIRE_GAMES",
      true
    },
    {
      "AWD_HOOD_PASS",
      true
    },
    {
      "AWD_STUDIO_TOUR",
      true
    },
    {
      "AWD_DONT_MESS_DRE",
      true
    },
    {"AWD_BACKUP", true},
    {
      "AWD_SHORTFRANK_1",
      true
    },
    {
      "AWD_SHORTFRANK_2",
      true
    },
    {
      "AWD_SHORTFRANK_3",
      true
    },
    {
      "AWD_CONTR_KILLER",
      true
    },
    {
      "AWD_DOGS_BEST_FRIEND",
      true
    },
    {
      "AWD_MUSIC_STUDIO",
      true
    },
    {
      "AWD_SHORTLAMAR_1",
      true
    },
    {
      "AWD_SHORTLAMAR_2",
      true
    },
    {
      "AWD_SHORTLAMAR_3",
      true
    }
  }
  menu.add_feature("\232\167\163\233\148\129\229\165\150\229\138\177&\232\161\163\230\156\141", "action", TH_CONTRACT.id, function()
    local BL0 = gameplay.get_hash_key(PlayerMP .. "_FIXERPSTAT_BOOL0")
    local BL1 = gameplay.get_hash_key(PlayerMP .. "_FIXERPSTAT_BOOL1")
    for i = 0, 128 do
      stats.stat_set_masked_bool(BL0, true, i, 1, true)
      stats.stat_set_masked_bool(BL1, true, i, 1, true)
    end
    for i = 1, #TH_AWARDS_I do
      stat_set_int(TH_AWARDS_I[i][1], true, TH_AWARDS_I[i][2])
    end
    for i = 1, #TH_AWARDS_B do
      stat_set_bool(TH_AWARDS_B[i][1], true, TH_AWARDS_B[i][2])
    end
    menu.notify("\229\183\178\232\167\163\233\148\129", "", 5, 1343534320)
  end)
end
menu.add_feature("\232\137\175\229\165\189\233\128\159\229\186\166", "action", SPEED_MANIPULATOR.id, function()
  local veh = ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))
  if nil ~= veh then
    if not network.has_control_of_entity(veh) then
      network.request_control_of_entity(veh)
    end
    entity.set_entity_max_speed(veh, 35000)
    vehicle.modify_vehicle_top_speed(veh, 35)
    vehicle.set_vehicle_engine_torque_multiplier_this_frame(veh, 35)
    entity.get_entity_model_hash(ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id())))
    menu.notify("\232\189\189\229\133\183\233\128\159\229\186\166\229\183\178\230\148\185\228\184\186\232\137\175\229\165\189\233\128\159\229\186\166", "", 5, blue)
  end
end)
menu.add_feature("\231\139\130\230\154\180\233\128\159\229\186\166", "action", SPEED_MANIPULATOR.id, function()
  local veh = ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))
  if nil ~= veh then
    if not network.has_control_of_entity(veh) then
      network.request_control_of_entity(veh)
    end
    entity.set_entity_max_speed(veh, 75000)
    vehicle.modify_vehicle_top_speed(veh, 75)
    vehicle.set_vehicle_engine_torque_multiplier_this_frame(veh, 75)
    entity.get_entity_model_hash(ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id())))
    menu.notify("\232\189\189\229\133\183\233\128\159\229\186\166\229\183\178\230\148\185\228\184\186\231\139\130\230\154\180\233\128\159\229\186\166", "", 5, blue)
  end
end)
menu.add_feature("\232\182\133\233\159\179\233\128\159", "action", SPEED_MANIPULATOR.id, function()
  local veh = ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))
  if nil ~= veh then
    if not network.has_control_of_entity(veh) then
      network.request_control_of_entity(veh)
    end
    entity.set_entity_max_speed(veh, 1000000)
    vehicle.modify_vehicle_top_speed(veh, 1000)
    vehicle.set_vehicle_engine_torque_multiplier_this_frame(veh, 1000)
    entity.get_entity_model_hash(ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id())))
    menu.notify("\232\189\189\229\133\183\233\128\159\229\186\166\229\183\178\230\148\185\228\184\186\232\182\133\233\159\179\233\128\159", "", 5, blue)
  end
end)
menu.add_feature("\232\135\170\229\174\154\228\185\137\233\128\159\229\186\166", "action", SPEED_MANIPULATOR.id, function()
  local veh = ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))
  local r, s = input.get("\232\175\183\232\190\147\229\133\165\230\150\176\233\128\159\229\186\166", "", 9999999, 3)
  if 1 == r then
    return HANDLER_CONTINUE
  end
  if 2 == r then
    return HANDLER_POP
  end
  speed = s
  if nil ~= veh then
    if not network.has_control_of_entity(veh) then
      network.request_control_of_entity(veh)
    end
    entity.set_entity_max_speed(veh, speed * 1000)
    vehicle.modify_vehicle_top_speed(veh, speed)
    vehicle.set_vehicle_engine_torque_multiplier_this_frame(veh, speed)
    entity.get_entity_model_hash(ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id())))
  end
  menu.notify("\233\128\159\229\186\166\230\155\180\230\148\185\228\184\186\n" .. speed, "", 5, blue)
end)
mannie_w = "\233\146\177\229\140\133\n $"
mannie_b = "\n\n\233\147\182\232\161\140\n $"
menu.add_feature("\230\163\128\230\181\139\230\148\182\230\148\175", "action", MyWallet.id, function()
  valueW = stats.stat_get_i64(gameplay.get_hash_key(PlayerMP .. "_WALLET_BALANCE"), -1)
  valueB = stats.stat_get_i64(gameplay.get_hash_key("BANK_BALANCE"))
  menu.notify(mannie_w .. valueW .. mannie_b .. valueB .. "", "", 5, 1345466930)
end)
menu.add_feature("\229\176\134\233\146\177\229\140\133\229\134\133\231\142\176\233\135\145\231\167\187\229\138\168\229\136\176\233\147\182\232\161\140", "action", MyWallet.id, function()
  local WA_CASH = native.call(-6624904839212652363, ID):__tointeger()
  local BK_CASH = native.call(8570113532776560986):__tointeger()
  if WA_CASH > 0 then
    native.call(-4397766878515684227, ID, WA_CASH):__tostring()
    audio.play_sound_from_coord(-1, "ROBBERY_MONEY_TOTAL", player.get_player_coords(player.player_id()), "HUD_FRONTEND_CUSTOM_SOUNDSET", false, 0, true)
  end
end)
menu.add_feature("\229\176\134\233\147\182\232\161\140\229\134\133\229\173\152\230\172\190\231\167\187\229\138\168\229\136\176\233\146\177\229\140\133", "action", MyWallet.id, function()
  local WA_CASH = native.call(-6624904839212652363, ID):__tonumber()
  local BK_CASH = native.call(8570113532776560986):__tointeger()
  if BK_CASH > 0 then
    native.call(-3136145693331732707, ID, BK_CASH):__tostring()
    audio.play_sound_from_coord(-1, "ROBBERY_MONEY_TOTAL", player.get_player_coords(player.player_id()), "HUD_FRONTEND_CUSTOM_SOUNDSET", false, 0, true)
  end
end)
menu.add_feature("\232\142\183\229\143\150\233\153\132\232\191\145\229\143\175\230\139\190\229\143\150\231\137\169", "action", TOOLS.id, function()
  local OBJ = object.get_all_objects()
  for i = 1, #OBJ do
    if entity.get_entity_model_hash(OBJ[i]) == 2580434079 then
      network.request_control_of_entity(OBJ[i])
      entity.set_entity_as_no_longer_needed(OBJ[i])
      entity.delete_entity(OBJ[i])
    end
    local all_pickups = object.get_all_pickups()
    for i = 1, #all_pickups do
      network.request_control_of_entity(all_pickups[i])
      entity.set_entity_coords_no_offset(all_pickups[i], player.get_player_coords(player.player_id()) + v3(0, 0, 1))
    end
    local OBJ_GRAB = object.get_all_objects()
    for i = 1, #OBJ_GRAB do
      if entity.get_entity_model_hash(OBJ_GRAB[i]) == 2505062846 or entity.get_entity_model_hash(OBJ_GRAB[i]) == 3153005473 then
        network.request_control_of_entity(OBJ_GRAB[i])
        entity.set_entity_coords_no_offset(OBJ_GRAB[i], player.get_player_coords(player.player_id()))
      end
    end
  end
end)
menu.add_feature("\229\176\132\229\135\187\230\137\128\230\156\137NPC", "toggle", PED_MANIPULATOR.id, function(WK)
  while WK.on do
    local pid = native.call(5730343094349521110):__tointeger()
    local playerPed = native.call(4874702607714914752, pid):__tointeger()
    local NPC = ped.get_all_peds()
    for k = 1, #NPC do
      if not ped.is_ped_a_player(NPC[k]) and not entity.is_entity_dead(NPC[k]) then
        if 0 ~= ped.get_vehicle_ped_is_using(NPC[k]) then
          ped.clear_ped_tasks_immediately(NPC[k])
        end
        local PedCords = entity.get_entity_coords(NPC[k])
        gameplay.shoot_single_bullet_between_coords(PedCords + v3(0, 0, 1), PedCords, 1000, 205991906, playerPed, false, true, 1000)
      end
    end
    coroutine.yield(500)
  end
end)
menu.add_feature("\231\167\187\233\153\164\230\137\128\230\156\137NPC\230\173\166\229\153\168", "toggle", PED_MANIPULATOR.id, function(weaponsht)
  while weaponsht.on do
    for k, PedIA in pairs(ped.get_all_peds()) do
      if not ped.is_ped_a_player(PedIA) and not entity.is_entity_dead(PedIA) then
        weapon.remove_all_ped_weapons(PedIA)
        ped.set_ped_combat_movement(PedIA, 0)
      end
    end
    coroutine.yield(15000)
  end
end)
menu.add_feature("\228\188\170\232\163\133\230\136\144\232\173\166\229\175\159", "action", PED_MANIPULATOR.id, function()
  native.call(-4970914549772615683, player.get_player_ped(player.player_id()), true)
end)
menu.add_feature("\229\156\168\233\157\158\229\133\172\229\188\128\230\136\152\229\177\128\228\184\173\229\144\175\231\148\168\228\187\187\229\138\161", "toggle", TOOLS.id, function(_mi)
  while _mi.on do
    script.set_global_i(2715379, 0)
    system.yield(0)
  end
  menu.notify("\231\142\176\229\143\175\229\156\168\233\157\158\229\133\172\229\188\128\230\136\152\229\177\128\230\184\184\231\142\169\228\187\187\229\138\161", "", 5, 1343534320)
end)
menu.add_feature("\233\157\153\233\159\179\230\168\161\229\188\143(\230\151\160\228\187\187\228\189\1492T\233\128\154\231\159\165)", "toggle", TOOLS.id, function(quiet)
  while quiet.on do
    menu.clear_visible_notifications()
    menu.clear_all_notifications()
    system.yield(0)
  end
end)
menu.add_feature("\231\166\187\229\188\128\230\173\164\230\136\152\229\177\128(GTA\228\188\154\229\141\161\228\189\143\229\135\160\231\167\146)", "action", TOOLS.id, function()
  menu.notify("\229\183\178\229\174\140\230\136\144", "", 3, 1342231060)
  local time = utils.time_ms() + 8500
  while time > utils.time_ms() do
  end
end)
menu.add_feature("\228\189\169\233\135\140\231\167\145\229\178\155>\230\140\135\231\186\185\229\133\139\233\154\134\231\160\180\232\167\163", "action", MINI_GAME_TOOL.id, function()
  script.set_local_i(gameplay.get_hash_key("fm_mission_controller_2020"), 23177, 5)
end)
menu.add_feature("\228\189\169\233\135\140\231\167\145\229\178\155>\231\148\181\229\138\155\231\160\180\232\167\163", "toggle", MINI_GAME_TOOL.id, function(hax)
  menu.notify("\230\173\164\229\138\159\232\131\189\228\187\133\229\156\168\228\189\160\233\157\160\232\191\145\228\189\169\233\135\140\231\167\145\229\178\155\228\184\138\231\154\132VOLTlab\231\155\146\229\173\144\230\151\182\230\156\137\230\149\136,\229\144\166\229\136\153\228\189\160\229\176\134\230\148\182\229\136\176\233\148\153\232\175\175\230\182\136\230\129\175", "", 5, yellow)
  pedmy = player.get_player_ped(player.player_id())
  entity.set_entity_coords_no_offset(pedmy, v3(4372.792, -4578.357, 4.208))
  entity.set_entity_rotation(pedmy, v3(2))
  system.wait(1500)
  while hax.on do
    ResultScan = script.get_local_i(gameplay.get_hash_key("fm_mission_controller_2020"), 1777)
    script.set_local_i(gameplay.get_hash_key("fm_mission_controller_2020"), 1776, ResultScan)
    system.yield(0)
  end
end)
menu.add_feature("\228\189\169\233\135\140\231\167\145\229\178\155>\231\158\172\233\151\180\229\136\135\229\137\178\230\159\156\229\143\176\231\142\187\231\146\131", "toggle", MINI_GAME_TOOL.id, function(Plasm)
  while Plasm.on do
    script.set_local_f(gameplay.get_hash_key("fm_mission_controller_2020"), 28272, 999)
    system.wait(0)
  end
end)
menu.add_feature("\229\144\141\233\146\187\232\181\140\229\156\186>\230\140\135\231\186\185\229\133\139\233\154\134", "action", MINI_GAME_TOOL.id, function()
  script.set_local_i(gameplay.get_hash_key("fm_mission_controller"), 52899, 5)
end)
menu.add_feature("\229\144\141\233\146\187\232\181\140\229\156\186>\233\148\174\231\155\152\231\160\180\232\167\163(\228\184\128\231\186\167\233\151\168\231\166\129\229\141\161)", "action", MINI_GAME_TOOL.id, function()
  script.set_local_i(gameplay.get_hash_key("fm_mission_controller"), 53961, 5)
end)
menu.add_feature("\229\144\141\233\146\187\232\181\140\229\156\186>\228\191\157\233\153\169\229\186\147\233\146\187\229\164\180", "action", MINI_GAME_TOOL.id, function()
  script.set_local_i(gameplay.get_hash_key("fm_mission_controller"), 53729, 5)
  local Value = script.get_local_i(gameplay.get_hash_key("fm_mission_controller"), 10105)
  script.set_local_i(gameplay.get_hash_key("fm_mission_controller"), 10075, Value)
end)
menu.add_feature("\230\156\171\230\151\165\229\176\134\232\135\179>\230\156\141\229\138\161\229\153\168\231\160\180\232\167\163", "action", MINI_GAME_TOOL.id, function()
  script.set_local_i(gameplay.get_hash_key("fm_mission_controller"), 1460, 3)
end)
menu.add_feature("\230\149\176\230\141\174\230\179\132\233\156\178\229\137\141\231\189\174>\230\156\141\229\138\161\229\153\168\232\138\130\231\130\185", "action", MINI_GAME_TOOL.id, function()
  script.set_local_i(gameplay.get_hash_key("fm_mission_controller"), 1598, 2)
end)
