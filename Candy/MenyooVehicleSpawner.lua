local Paths = {}
Paths.Root = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
Paths.LogFile = Paths.Root .. "\\MenyooVehicleSpawner.log"
Paths.Scripts = Paths.Root .. "\\scripts"
Paths.Lib = Paths.Scripts .. "\\lib"

local basePrint = print
local function print(...)
	local success, result = pcall(function(...)
		local currTime = os.date("*t")
		local file = io.open(Paths.LogFile, "a")
		
		local args = {...}
		for i=1,#args do
			file:write(string.format("[%02d-%02d-%02d %02d:%02d:%02d] ", currTime.year, currTime.month, currTime.day, currTime.hour, currTime.min, currTime.sec)..tostring(args[i]).."\n")
			basePrint(args[i])
		end
		
		file:close()
	end, ...)
	if not success then
		basePrint("Error writing log: " .. result)
	end
end
local function Trim(s)
   local n = s:find"%S"
   return n and s:match(".*%S", n) or ""
end
local notif = menu.notify
local function notify(msg, colour)
	notif(msg, "21Pro载具模组", nil, colour)
	print(msg)
end
local function DeleteFeature(Feat)
	if Feat.type == 2048 then
		for i=1,Feat.child_count do
			DeleteFeature(Feat.children[1])
		end
	end
	menu.delete_feature(Feat.id)
end
local function OffsetCoords(pos, heading, distance)
	heading = math.rad((heading - 180) * -1)
	return v3(pos.x + (math.sin(heading) * -distance), pos.y + (math.cos(heading) * -distance), pos.z)
end
local function RGBAToInt(R, G, B, A)
	A = A or 255
	return ((tonumber(R)&0x0ff)<<0x00)|((tonumber(G)&0x0ff)<<0x08)|((tonumber(B)&0x0ff)<<0x10)|((tonumber(A)&0x0ff)<<0x18)
end
local function RequestModel(Hash, Timeout)
	if streaming.has_model_loaded(Hash) then
		return true
	end
	Timeout = (Timeout or 1800) + utils.time_ms()
	streaming.request_model(Hash)
	while utils.time_ms() < Timeout do
		if streaming.has_model_loaded(Hash) then
			return true
		end
		system.wait(0)
	end
	return false
end
local function RequestAnimDict(Dict, Timeout)
	if streaming.has_anim_dict_loaded(Dict) then
		return true
	end
	Timeout = (Timeout or 1800) + utils.time_ms()
	streaming.request_anim_dict(Dict)
	while utils.time_ms() < Timeout do
		if streaming.has_anim_dict_loaded(Dict) then
			return true
		end
		system.wait(0)
	end
	return false
end
local function RequestAnimSet(Set, Timeout)
	if streaming.has_anim_set_loaded(Set) then
		return true
	end
	Timeout = (Timeout or 1800) + utils.time_ms()
	streaming.request_anim_set(Set)
	while utils.time_ms() < Timeout do
		if streaming.has_anim_set_loaded(Set) then
			return true
		end
		system.wait(0)
	end
	return false
end

if MenyooVehicleSpawner then
	notify("模组脚本已加载.", RGBAToInt(240, 200, 80, 255))
	return
end

--Check paths
if not utils.dir_exists(Paths.Lib) then
	notify("缺少库文件夹。尝试重新安装脚本.", RGBAToInt(255, 0, 0, 255))
	return
end
Paths.Vehicles = Paths.Scripts .. "\\21LUA_cfg\\Vehicles"
if not utils.dir_exists(Paths.Vehicles) then
	notify("Menyoo车辆文件夹丢失，请创建一个.")
	utils.make_dir(Paths.Vehicles)
end

--Check libraries
if not utils.file_exists(Paths.Lib .. "\\Settings.lua") then
	notify("缺少设置库。尝试重新安装脚本。", RGBAToInt(255, 0, 0, 255))
	return
end
if not utils.file_exists(Paths.Lib .. "\\xml2lua.lua") then
	notify("缺少xml2lua库。尝试重新安装脚本。", RGBAToInt(255, 0, 0, 255))
	return
end
if not utils.file_exists(Paths.Lib .. "\\XmlParser.lua") then
	notify("缺少xmllua库。尝试重新安装脚本。", RGBAToInt(255, 0, 0, 255))
	return
end
if not utils.file_exists(Paths.Lib .. "\\xmlhandler\\tree.lua") then
	notify("xmlhandler.tree库丢失。尝试重新安装脚本。", RGBAToInt(255, 0, 0, 255))
	return
end

-- Credit: https://github.com/manoelcampos/xml2lua
local Settings = require("Settings")
local xml2lua = require("xml2lua")
local handler = require("xmlhandler.tree")

local Spawning = nil

local function GetValue(Value)
	if Value == nil then return nil end
	if type(Value) == "table" then
		return Value[#Value]
	else
		return Value
	end
end

local function Spawn(Hash, Position, Heading)
	assert(streaming.is_model_valid(Hash), "无效模型")
	assert(RequestModel(Hash), "未能请求模型")
	if streaming.is_model_a_vehicle(Hash) then
		print("Spawning vehicle")
		local veh = vehicle.create_vehicle(Hash, Position, Heading, true, false)
		print("Setting MPBitset")
		decorator.decor_set_int(veh, "MPBitset", 1 << 10)
		--if script.get_host_of_this_script() == player.player_id() then
			print("Setting stolen")
			vehicle.set_vehicle_stolen(veh, false)
		--else
		--	print("Skipping setting stolen - not script host")
		--end
		return veh
	elseif streaming.is_model_a_ped(Hash) then
		print("Spawning ped")
		return ped.create_ped(26, Hash, Position, Heading, false, true)
	else--if streaming.is_model_an_object(Hash) then
		print("Spawning object")
		return object.create_object(Hash, Position, true, false)
	end
end
local function ApplyVehicleProperties(Handle, VehicleProperties)
	if VehicleProperties.Livery then
		print("Setting livery to: " .. VehicleProperties.Livery)
		vehicle.set_vehicle_livery(Handle, VehicleProperties.Livery)
	end
	
	if VehicleProperties.Colours then
		local Colours = VehicleProperties.Colours
		--TODO: Mod Colours
		if Colours.Primary and Colours.Secondary and Colours.Pearl and Colours.Rim then
			print("Setting colours to: " .. Colours.Primary .. "," .. Colours.Secondary .. "," .. Colours.Pearl .. "," .. Colours.Rim)
			vehicle.set_vehicle_color(Handle, Colours.Primary, Colours.Secondary, Colours.Pearl, Colours.Rim)
		end
		if Colours.IsPrimaryColourCustom then
			local isPrimaryCustom = Colours.IsPrimaryColourCustom == "true"
			if isPrimaryCustom and Colours.Cust1_R and Colours.Cust1_G and Colours.Cust1_B then
				local R = Colours.Cust1_R
				local G = Colours.Cust1_G
				local B = Colours.Cust1_B
				local col = RGBAToInt(R,G,B)
				print("Setting custom primary colour to: " .. col)
				vehicle.set_vehicle_custom_primary_colour(Handle, col)
			end
		end
		if Colours.IsSecondaryColourCustom then
			local isSecondaryCustom = Colours.IsSecondaryColourCustom == "true"
			if isSecondaryCustom and Colours.Cust2_R and Colours.Cust2_G and Colours.Cust2_B then
				local R = Colours.Cust2_R
				local G = Colours.Cust2_G
				local B = Colours.Cust2_B
				local col = RGBAToInt(R,G,B)
				print("Setting custom secondary colour to: " .. col)
				vehicle.set_vehicle_custom_secondary_colour(Handle, col)
			end
		end
		if Colours.tyreSmoke_R and Colours.tyreSmoke_G and Colours.tyreSmoke_B then
			print("Setting tire smoke colour to: " .. Colours.tyreSmoke_R .. "," .. Colours.tyreSmoke_G .. "," .. Colours.tyreSmoke_B)
			vehicle.set_vehicle_tire_smoke_color(Handle, Colours.tyreSmoke_R, Colours.tyreSmoke_G, Colours.tyreSmoke_B)
		end
		--TODO: Set Interior Colour
		--TODO: Set Dashboard Colour
		if Colours.LrXenonHeadlights then
			print("Setting vehicle headlight colour to: " .. Colours.LrXenonHeadlights)
			vehicle.set_vehicle_headlight_color(Handle, Colours.LrXenonHeadlights)
		end
	end
	
	local NumberPlateText = GetValue(VehicleProperties.NumberPlateText)
	if NumberPlateText then
		print("Setting number plate text to: " .. NumberPlateText)
		vehicle.set_vehicle_number_plate_text(Handle, NumberPlateText)
	end
	local NumberPlateIndex = GetValue(VehicleProperties.NumberPlateIndex)
	if NumberPlateIndex then
		print("Setting number plate index to: " .. NumberPlateIndex)
		vehicle.set_vehicle_number_plate_index(Handle, NumberPlateIndex)
	end
	local WheelType = GetValue(VehicleProperties.WheelType)
	if WheelType then
		print("Setting wheel type to: " .. WheelType)
		vehicle.set_vehicle_wheel_type(Handle, WheelType)
	end
	local WindowTint = GetValue(VehicleProperties.WindowTint)
	if WindowTint then
		print("Setting window tint to: " .. WindowTint)
		vehicle.set_vehicle_window_tint(Handle, WindowTint)
	end
	local BulletProofTyres = GetValue(VehicleProperties.BulletProofTyres)
	if BulletProofTyres then
		print("Setting bulletproof tires to: " .. BulletProofTyres)
		vehicle.set_vehicle_tires_can_burst(Handle, BulletProofTyres == "true")
	end
	--TODO: Set Dirt Level
	--TODO: Set Paint Fade
	--TODO: Set Roof State
	--TODO: Set Siren Active
	local EngineOn = GetValue(VehicleProperties.EngineOn)
	if EngineOn then
		print("Setting engine on to: " .. EngineOn)
		vehicle.set_vehicle_engine_on(Handle, EngineOn == "true", true, false)
	end
	local EngineHealth = VehicleProperties.EngineHealth
	if EngineHealth then
		print("Setting engine health to: " .. EngineHealth)
		vehicle.set_vehicle_engine_health(Handle, EngineHealth)
	end
	--TODO: Set Lights On
	--TODO: Set Radio Loud
	local LockStatus = VehicleProperties.LockStatus
	if LockStatus then
		print("Setting lock status to: " .. LockStatus)
		vehicle.set_vehicle_doors_locked(Handle, LockStatus)
	end
	
	if VehicleProperties.Neons then
		local Neons = VehicleProperties.Neons
		local Left = GetValue(Neons.Left)
		if Neons.Left then
			print("Setting neons left to: " .. Left)
			vehicle.set_vehicle_neon_light_enabled(Handle, 0, Left == "true")
		end
		local Right = GetValue(Neons.Right)
		if Right then
			print("Setting neons right to: " .. Right)
			vehicle.set_vehicle_neon_light_enabled(Handle, 1, Right == "true")
		end
		local Front = GetValue(Neons.Front)
		if Front then
			print("Setting neons front to: " .. Front)
			vehicle.set_vehicle_neon_light_enabled(Handle, 2, Front == "true")
		end
		local Back = GetValue(Neons.Back)
		if Back then
			print("Setting neons back to: " .. Back)
			vehicle.set_vehicle_neon_light_enabled(Handle, 3, Back == "true")
		end
		local R = GetValue(Neons.R)
		local G = GetValue(Neons.G)
		local B = GetValue(Neons.B)
		if R and G and B then
			local col = RGBAToInt(R,G,B)
			print("Setting neon lights to: " .. col)
			vehicle.set_vehicle_neon_lights_color(Handle, col)
		end
	end
	
	--[[if VehicleProperties.ModExtras then
		local Extras = VehicleProperties.ModExtras
		for k,v in pairs(Extras) do
			local id = tonumber(k:sub(2))
			vehicle.set_vehicle_extra(Handle, id, v ~= "true")
		end
	end]]
	
	if VehicleProperties.Mods then
		local Mods = VehicleProperties.Mods
		for k,v in pairs(Mods) do
			local id = tonumber(k:sub(2))
			local commaPos = v:find(",")
			print("Setting vehicle mod " .. id .. " to " .. v)
			if commaPos then
				vehicle.set_vehicle_mod(Handle, id, tonumber(v:sub(1,commaPos-1)), v:sub(commaPos + 1) == "1")
			else
				vehicle.toggle_vehicle_mod(Handle, id, v == "true")
			end
		end		
	end
	
	if VehicleProperties.DoorsOpen then
		local DoorsOpen = VehicleProperties.DoorsOpen
		local FrontLeftDoor = GetValue(DoorsOpen.FrontLeftDoor)
		if FrontLeftDoor == "true" then
			print("Setting front left door open")
			vehicle.set_vehicle_door_open(Handle, 0, false, true)
		end
		local FrontRightDoor = GetValue(DoorsOpen.FrontRightDoor)
		if FrontRightDoor == "true" then
			print("Setting front right door open")
			vehicle.set_vehicle_door_open(Handle, 1, false, true)
		end
		local BackLeftDoor = GetValue(DoorsOpen.BackLeftDoor)
		if BackLeftDoor == "true" then
			print("Setting back left door open")
			vehicle.set_vehicle_door_open(Handle, 2, false, true)
		end
		local BackRightDoor = GetValue(DoorsOpen.BackRightDoor)
		if BackRightDoor == "true" then
			print("Setting back right door open")
			vehicle.set_vehicle_door_open(Handle, 3, false, true)
		end
		local Hood = GetValue(DoorsOpen.Hood)
		if Hood == "true" then
			print("Setting hood open")
			vehicle.set_vehicle_door_open(Handle, 4, false, true)
		end
		local Trunk = GetValue(DoorsOpen.Trunk)
		if Trunk == "true" then
			print("Setting trunk open")
			vehicle.set_vehicle_door_open(Handle, 5, false, true)
		end
		local Trunk2 = GetValue(DoorsOpen.Trunk2)
		if Trunk2 == "true" then
			print("Setting trunk2 open")
			vehicle.set_vehicle_door_open(Handle, 6, false, true)
		end
	end
	local DoorsBroken = VehicleProperties.DoorsBroken
	--TODO: Set Doors Broken
	
	if VehicleProperties.TyresBursted then
		local TyresBursted = VehicleProperties.TyresBursted
		local FrontLeft = GetValue(TyresBursted.FrontLeft)
		if FrontLeft == "true" then
			print("Setting front left tire burst")
			vehicle.set_vehicle_tires_can_burst(Handle, true)
			vehicle.set_vehicle_tire_burst(Handle, 0, true, 0x447a0000)
		end
		local FrontRight = GetValue(TyresBursted.FrontRight)
		if FrontRight == "true" then
			print("Setting front right tire burst")
			vehicle.set_vehicle_tires_can_burst(Handle, true)
			vehicle.set_vehicle_tire_burst(Handle, 1, true, 0x447a0000)
		end
		local _2 = GetValue(TyresBursted._2)
		if _2 == "true" then
			print("Setting 2 tire burst")
			vehicle.set_vehicle_tires_can_burst(Handle, true)
			vehicle.set_vehicle_tire_burst(Handle, 2, true, 0x447a0000)
		end
		local _3 = GetValue(TyresBursted._3)
		if _3 == "true" then
			print("Setting 3 tire burst")
			vehicle.set_vehicle_tires_can_burst(Handle, true)
			vehicle.set_vehicle_tire_burst(Handle, 3, true, 0x447a0000)
		end
		local BackLeft = GetValue(TyresBursted.BackLeft)
		if BackLeft == "true" then
			print("Setting back left tire burst")
			vehicle.set_vehicle_tires_can_burst(Handle, true)
			vehicle.set_vehicle_tire_burst(Handle, 4, true, 0x447a0000)
		end
		local BackRight = GetValue(TyresBursted.BackRight)
		if BackRight == "true" then
			print("Setting back right tire burst")
			vehicle.set_vehicle_tires_can_burst(Handle, true)
			vehicle.set_vehicle_tire_burst(Handle, 5, true, 0x447a0000)
		end
		local _6 = GetValue(TyresBursted._6)
		if _6 == "true" then
			print("Setting 6 tire burst")
			vehicle.set_vehicle_tires_can_burst(Handle, true)
			vehicle.set_vehicle_tire_burst(Handle, 6, true, 0x447a0000)
		end
		local _7 = GetValue(TyresBursted._7)
		if _7 == "true" then
			print("Setting 7 tire burst")
			vehicle.set_vehicle_tires_can_burst(Handle, true)
			vehicle.set_vehicle_tire_burst(Handle, 7, true, 0x447a0000)
		end
		local _8 = GetValue(TyresBursted._8)
		if _8 == "true" then
			print("Setting 8 tire burst")
			vehicle.set_vehicle_tires_can_burst(Handle, true)
			vehicle.set_vehicle_tire_burst(Handle, 8, true, 0x447a0000)
		end
	end
end
local function SpawnAttachment(Attachment)
	local IsPtfxLopAdded = false
	local ModelHash = Attachment.ModelHash
	print("Attachment hash: " .. ModelHash .. " | 0x" .. string.format("%x", ModelHash))
	local AttachmentType = tonumber(Attachment.Type)
	local Dynamic = Attachment.Dynamic == "true"
	local FrozenPos = (Attachment.FrozenPos == "true") ~= Dynamic
	
	local PositionRotation = Attachment.PositionRotation
	local Position = v3()
	local Rotation = v3()
	Position.x = tonumber(PositionRotation.X)
	Position.y = tonumber(PositionRotation.Y)
	Position.z = tonumber(PositionRotation.Z)
	Rotation.x = tonumber(PositionRotation.Pitch)
	Rotation.y = tonumber(PositionRotation.Roll)
	Rotation.z = tonumber(PositionRotation.Yaw)
	
	local Handle
	
	if AttachmentType == 3 then --Prop/Object
		Handle = Spawn(ModelHash, Position)
		print("Setting attachment coords to: " .. tostring(Position))
		entity.set_entity_coords_no_offset(Handle, Position)
		print("Setting attachment rotation to: " .. tostring(Rotation))
		entity.set_entity_rotation(Handle, Rotation)
		print("Freezing attachment")
		entity.freeze_entity(Handle, true)
		
		if Attachment.HasGravity then
			print("Setting attachment gravity to: true")
			entity.set_entity_gravity(Handle, Attachment.HasGravity == "true")
		end
		
		if Attachment.ObjectProperties then
			local ObjectProperties = Attachment.ObjectProperties
			if ObjectProperties.TextureVariation then
				local TextureVariation = tonumber(ObjectProperties.TextureVariation)
				if TextureVariation ~= -1 then
					--TODO: Set Texture Variation
				end
			end
		end
	elseif AttachmentType == 1 then --Ped
		Handle = Spawn(ModelHash, Position, Rotation.z)
		print("Setting attachment coords to: " .. tostring(Position))
		entity.set_entity_coords_no_offset(Handle, Position)
		print("Setting attachment rotation to: " .. tostring(Rotation))
		entity.set_entity_rotation(Handle, Rotation)
		print("Freezing attachment")
		entity.freeze_entity(Handle, true)
		
		if Attachment.HasGravity then
			print("Setting attachment gravity to: true")
			entity.set_entity_gravity(Handle, Attachment.HasGravity == "true")
		end
		
		if Attachment.PedProperties then
			local PedProperties = Attachment.PedProperties
			
			local IsStill = true
			if PedProperties.IsStill then
				IsStill = PedProperties.IsStill == "true"
			end
			--TODO: Set Blocking of Non Temporary Events
			
			if PedProperties.CanRagdoll then
				print("Setting ped can ragdoll to: " .. PedProperties.CanRagdoll)
				ped.set_ped_can_ragdoll(Handle, PedProperties.CanRagdoll == "true")
			end
			
			if PedProperties.HasShortHeight and PedProperties.HasShortHeight == "true" then
				print("Setting ped has short height to: true")
				ped.set_ped_config_flag(Handle, 223, 1)
			end
			
			if PedProperties.Armour then
				--TODO: Set Ped Armour
			end
			if PedProperties.CurrentWeapon then
				if PedProperties.CurrentWeapon:sub(1, 2) == "0x" then PedProperties.CurrentWeapon = tonumber(PedProperties.CurrentWeapon:sub(3), 16) end
				print("Giving ped weapon: " .. PedProperties.CurrentWeapon)
				weapon.give_delayed_weapon_to_ped(Handle, PedProperties.CurrentWeapon, 9999, true)
			end
			print("Setting ped can switch weapons to: false")
			ped.set_ped_can_switch_weapons(Handle, false)
			--TODO: Set Ped Path Can Use Climbovers
			--TODO: Set Ped Path Can Use Ladders
			--TODO: Set Ped Path Can Drop From Height
			print("Setting ped combat ability to: 2")
			ped.set_ped_combat_ability(Handle, 2)
			print("Setting ped combat movement to: 2")
			ped.set_ped_combat_movement(Handle, 2)
			
			--TODO: Set Ped Can Play Ambient Anims
			--TODO: Set Ped Can Play Ambient Base Anims
			--TODO: Set Ped Can Play Gesture Anims
			--TODO: Set Ped Can Play Viseme Anims
			--TODO: Set Ped Can Play Injured Anims
			
			if PedProperties.PedProps then
				for k,v in pairs(PedProperties.PedProps) do
					local id = tonumber(k:sub(2))
					local commaPos = v:find(",")
					if commaPos then
						print("Setting ped component variation " .. id .. " to " .. v)
						ped.set_ped_component_variation(Handle, id, tonumber(v:sub(1,commaPos-1)), tonumber(v:sub(commaPos + 1)), 0)
					end
				end
			end
			if PedProperties.PedComps then
				for k,v in pairs(PedProperties.PedComps) do
					local id = tonumber(k:sub(2))
					local commaPos = v:find(",")
					if commaPos then
						print("Setting ped print index " .. id .. " to " .. v)
						ped.set_ped_prop_index(Handle, id, tonumber(v:sub(1,commaPos-1)), tonumber(v:sub(commaPos + 1)), 1)
					end
				end
			end
			
			if PedProperties.PedConfigFlags then
				for k,v in pairs(PedProperties.PedConfigFlags) do
					local id = tonumber(k:sub(2))
					print("Setting ped config flag " .. id .. " to " .. v)
					ped.set_ped_config_flag(Handle, id, v == "true" and 1 or 0)
				end
			end
			
			--TODO: Head Features
			
			--TODO: Tattoo Logo Decals
			
			--TODO: Damage Packs
			
			if PedProperties.RelationshipGroup then
				if PedProperties.RelationshipGroup:sub(1, 2) == "0x" then PedProperties.RelationshipGroup = tonumber(PedProperties.RelationshipGroup:sub(3), 16) end
				print("Setting ped relationship group to: " .. PedProperties.RelationshipGroup)
				ped.set_ped_relationship_group_hash(Handle,PedProperties.RelationshipGroup)
			end
			
			if PedProperties.MovementGroupName then
				RequestAnimSet(PedProperties.MovementGroupName)
				print("Setting ped movement group to: " .. PedProperties.MovementGroupName)
				ped.set_ped_movement_clipset(Handle, PedProperties.MovementGroupName)
			end
			
			--TODO: Set Weapon Movement Group Name
			
			local IsUsingScenario = PedProperties.ScenarioActive and PedProperties.ScenarioActive == "true"
			local IsUsingAnim = PedProperties.AnimActive and PedProperties.AnimActive == "true"
			if IsUsingScenario and PedProperties.ScenarioName then
				print("Starting ped scenario: " .. PedProperties.ScenarioName)
				ai.task_start_scenario_in_place(Handle, PedProperties.ScenarioName, -1, true)
			end
			if IsUsingAnim and PedProperties.AnimDict and PedProperties.AnimName then
				print("Requesting anim dict: " .. PedProperties.AnimDict)
				RequestAnimDict(PedProperties.AnimDict)
				print("Starting ped anim: " .. PedProperties.AnimDict .. " | " .. PedProperties.AnimName)
				ai.task_play_anim(Handle, PedProperties.AnimDict, PedProperties.AnimName, 4, -4, -1, 1, 0, false, false, false)
			end
		end
	elseif AttachmentType == 2 then --Vehicle
		Handle = Spawn(ModelHash, Position, Rotation.z)
		print("Setting attachment coords to: " .. tostring(Position))
		entity.set_entity_coords_no_offset(Handle, Position)
		print("Setting attachment rotation to: " .. tostring(Rotation))
		entity.set_entity_rotation(Handle, Rotation)
		print("Freezing attachment")
		entity.freeze_entity(Handle, true)
		
		if Attachment.HasGravity then
			print("Setting attachment gravity to: true")
			entity.set_entity_gravity(Handle, Attachment.HasGravity == "true")
		end
		
		if Attachment.VehicleProperties then
			ApplyVehicleProperties(Handle, Attachment.VehicleProperties)
		end
	end
	
	local Opacity = tonumber(Attachment.OpacityLevel)
	if Opacity < 255 then
		print("Setting attachment alpha to: " .. Attachment.OpacityLevel)
		entity.set_entity_alpha(Handle, Opacity, 0)
	end
	--TODO: Set Max Health
	--TODO: Set Health
	
	--TODO: Set On Fire
	if Attachment.IsInvincible then
		print("Setting attachment god mode to: " .. Attachment.IsInvincible)
		entity.set_entity_god_mode(Handle, Attachment.IsInvincible == "true")
	end
	--TODO: Set Bulletproof
	--TODO: Set Explosion Proof
	--TODO: Set Fire Proof
	--TODO: Set MeleeProof
	--TODO: Set Is Only Damaged By Player
	
	if Attachment.IsCollisionProof then
		print("Setting attachment collision to: " .. Attachment.IsCollisionProof)
		entity.set_entity_collision(Handle, Attachment.IsCollisionProof ~= "true", false, true)
	end
	--TODO: Set Wheels Invisible
	--TODO: Set Engine Sound Name
	
	--TODO: Set Rpm Multiplier
	--TODO: Set Torque Multiplier
	if Attachment.MaxSpeed then
		print("Setting attachment max speed to: " .. Attachment.MaxSpeed)
		entity.set_entity_max_speed(Handle, tonumber(Attachment.MaxSpeed))
	end
	--TODO: Set Headlight Intensity
	--TODO: Set Lod Distance
	
	if Attachment.IsVisible then
		print("Setting attachment visible to: " .. Attachment.IsVisible)
		entity.set_entity_visible(Handle, Attachment.IsVisible == "true")
	end
	
	print("Attachment handle: " .. Handle)
	return Handle
end
local RequiredRootElements = {"ModelHash","InitialHandle","VehicleProperties","OpacityLevel","LodDistance","IsVisible","MaxHealth","Health","HasGravity","IsOnFire","IsInvincible","IsBulletProof","IsExplosionProof","IsFireProof","IsMeleeProof","IsOnlyDamagedByPlayer"}
local RequiredPropertyElements = {"Colours","Livery","NumberPlateText","NumberPlateIndex","WheelType","WheelsInvisible","EngineSoundName","WindowTint","BulletProofTyres","DirtLevel","PaintFade","RoofState","SirenActive","EngineOn","EngineHealth","LightsOn","IsRadioLoud","LockStatus","Neons","ModExtras","Mods","DoorsOpen","DoorsBroken","TyresBursted"}
local function SpawnVehicleThread(Context)
	if Spawning ~= nil then
		notify("请稍等。正在生成: " .. Spawning, RGBAToInt(240, 200, 80, 255))
		return
	end
	local VehiclePath = Context.VehiclePath
	local Heading = Context.Heading
	local Position = Context.Position
	local OffsetZPlaneHeli = Context.OffsetZPlaneHeli
	local Freeze = Context.Freeze
	local PlaceInVehicle = Context.PlaceInVehicle
	
	if not utils.file_exists(VehiclePath) then
		notify("找不到: " .. VehiclePath, RGBAToInt(255, 0, 0, 255))
		return
	end
	
	local FileName = VehiclePath:sub(Paths.Vehicles:len() + 2)
	Spawning = FileName
	notify("正在生成: " .. FileName)
	
	local success, result = pcall(function()	
		print("Creating XML handler")
		local xmlHandler = handler:new()
		
		print("Creating XML parser")
		local xmlParser = xml2lua.parser(xmlHandler)
		
		print("Loading XML from: " .. VehiclePath)
		local loadedFile = xml2lua.loadFile(VehiclePath)
		
		print("Parsing XML")
		xmlParser:parse(loadedFile)
		
		local VehicleRoot = xmlHandler.root.Vehicle
		assert(VehicleRoot, "Could not find Vehicle element in XML.")
		assert(VehicleRoot.ModelHash, "Could not find ModelHash element in Vehicle node.")
		assert(VehicleRoot.InitialHandle, "Could not find InitialHandle element in Vehicle node.")
		--for i=1,#RequiredRootElements do
		--	assert(VehicleRoot[RequiredRootElements[i]], "Could not find " .. RequiredRootElements[i] .. " element in Vehicle node.")
		--end
		
		--local VehicleProperties = VehicleRoot.VehicleProperties
		--for i=1,#RequiredPropertyElements do
		--	assert(VehicleProperties[RequiredPropertyElements[i]], "Could not find " .. RequiredPropertyElements[i] .. " element in VehicleProperties node.")
		--end
		
		print("Loading model hashes")
		if VehicleRoot.ModelHash:sub(1,2) == "0x" then
			VehicleRoot.ModelHash = tonumber(VehicleRoot.ModelHash:sub(3), 16)
		end
		
		if streaming.is_model_a_plane(VehicleRoot.ModelHash) or streaming.is_model_a_heli(VehicleRoot.ModelHash) then
			Position.z = Position.z + OffsetZPlaneHeli
		end
		
		local ModelHashes = {}
		ModelHashes[VehicleRoot.ModelHash] = true
		
		local Attachments = {}
		if VehicleRoot.SpoonerAttachments and VehicleRoot.SpoonerAttachments.Attachment then
			if #VehicleRoot.SpoonerAttachments.Attachment == 0 then
				Attachments[1] = VehicleRoot.SpoonerAttachments.Attachment
			else
				Attachments = VehicleRoot.SpoonerAttachments.Attachment
			end
			for i=1,#Attachments do
				assert(Attachments[i].ModelHash, "Could not find ModelHash element in Attachment node.")
				if Attachments[i].ModelHash:sub(1,2) == "0x" then
					Attachments[i].ModelHash = tonumber(Attachments[i].ModelHash:sub(3), 16)
					assert(streaming.is_model_valid(Attachments[i].ModelHash), "Invalid model hash \"" .. Attachments[i].ModelHash .. "\" found in XML.")
					ModelHashes[Attachments[i].ModelHash] = true
				end
			end
		end
		
		--[[print("Requesting model hashes")
		for k in pairs(ModelHashes) do
			if not streaming.has_model_loaded(k) then
				streaming.request_model(k)
				system.wait(0)
			else
				ModelHashes[k] = false
			end
		end
		
		print("Checking model hashes")
		while true do
			local AllLoaded = true
			for k in pairs(ModelHashes) do
				if not streaming.has_model_loaded(k) then
					AllLoaded = false
					break
				end
			end
			system.wait(0)
			if AllLoaded then break end
		end]]
		
		print("Spawning InitialHandle")
		local Objects = {}
		Objects[VehicleRoot.InitialHandle] = Spawn(VehicleRoot.ModelHash, Position, Heading)
		assert(Objects[VehicleRoot.InitialHandle] > 0, "Failed to spawn root vehicle.")
		if PlaceInVehicle then
			print("Placing in vehicle")
			ped.set_ped_into_vehicle(player.get_player_ped(player.player_id()), Objects[VehicleRoot.InitialHandle], -1)
		end
		print("Setting mod kit type to 0")
		vehicle.set_vehicle_mod_kit_type(Objects[VehicleRoot.InitialHandle], 0)
		if Freeze then
			print("Freezing vehicle")
			entity.freeze_entity(Objects[VehicleRoot.InitialHandle], true)
		end
		
		system.wait(100)
		
		if VehicleRoot.HasGravity then
			print("Setting gravity to: " .. VehicleRoot.HasGravity)
			entity.set_entity_gravity(Objects[VehicleRoot.InitialHandle], VehicleRoot.HasGravity == "true")
		end
		
		if VehicleRoot.VehicleProperties then
			ApplyVehicleProperties(Objects[VehicleRoot.InitialHandle], VehicleRoot.VehicleProperties)
		end
		
		--TODO: Set Wheels Invisible
		--TODO: Set Engine Sound Name
		
		--TODO: Set Rpm Multiplier
		--TODO: Set Torque Multiplier
		if VehicleRoot.MaxSpeed then
			print("Setting max speed to: " .. VehicleRoot.MaxSpeed)
			entity.set_entity_max_speed(Objects[VehicleRoot.InitialHandle], tonumber(VehicleRoot.MaxSpeed))
		end
		--TODO: Set Headlight Intensity
		
		local Opacity = tonumber(VehicleRoot.OpacityLevel)
		if Opacity < 255 then
			print("Setting opacity to: " .. VehicleRoot.OpacityLevel)
			entity.set_entity_alpha(Objects[VehicleRoot.InitialHandle], Opacity, 0)
		end
		--TODO: Set Lod Distance
		
		print("Setting visible to: " .. VehicleRoot.IsVisible)
		entity.set_entity_visible(Objects[VehicleRoot.InitialHandle], VehicleRoot.IsVisible == "true")
		--TODO: Set Max Health
		--TODO: Set Health
		
		--TODO: Set On Fire
		print("Setting god mode to: " .. VehicleRoot.IsInvincible)
		entity.set_entity_god_mode(Objects[VehicleRoot.InitialHandle], VehicleRoot.IsInvincible == "true")
		--TODO: Set Bulletproof
		print("Setting collision to: true")
		entity.set_entity_collision(Objects[VehicleRoot.InitialHandle], true, false, true)
		--TODO: Set Explosion Proof
		--TODO: Set Fire Proof
		--TODO: Set MeleeProof
		--TODO: Set Is Only Damaged By Player
		
		if #Attachments > 0 then
			local StartTasks = VehicleRoot.SpoonerAttachments._attr.StartTaskSequencesOnLoad == "true"
			for i=1,#Attachments do
				local Attachment = Attachments[i]
				local handle = SpawnAttachment(Attachment)
				if handle > 0 then
					Objects[Attachment.InitialHandle] = handle
				else
					print("Failed to spawn attachment.")
				end
				system.wait(0)
			end
			
			system.wait(100)
			
			for i=1,#Attachments do
				local Attachment = Attachments[i].Attachment
				if Objects[Attachments[i].InitialHandle] then
					local AttachedTo
					if Attachment.AttachedTo == "PLAYER" then
						AttachedTo = player.player_id()
					elseif Attachment.AttachedTo == "VEHICLE" then
						AttachedTo = VehicleRoot.InitialHandle
					else
						AttachedTo = Objects[Attachment.AttachedTo]
					end
					if AttachedTo then
						print("Requesting control of: " .. Objects[Attachments[i].InitialHandle])
						network.request_control_of_entity(Objects[Attachments[i].InitialHandle])
						system.wait(0)
						print("Attaching " .. Objects[Attachments[i].InitialHandle] .. " to " .. AttachedTo)
						entity.attach_entity_to_entity(Objects[Attachments[i].InitialHandle], AttachedTo, tonumber(Attachment.BoneIndex), v3(tonumber(Attachment.X), tonumber(Attachment.Y), tonumber(Attachment.Z)), v3(tonumber(Attachment.Pitch), tonumber(Attachment.Roll), tonumber(Attachment.Yaw)), false, true, false, 2, true)
					end
				end
				system.wait(0)
			end
		end
		
		system.wait(100)
		
		if Freeze then
			print("Unfreezing root object")
			entity.freeze_entity(Objects[VehicleRoot.InitialHandle], false)
			system.wait(0)
			entity.set_entity_velocity(Objects[VehicleRoot.InitialHandle], v3(0, 0, 1))
		end
		
		print("Releasing models")
		for k,v in pairs(ModelHashes) do
			if v then
				streaming.set_model_as_no_longer_needed(k)
				system.wait(0)
			end
		end
	end)
	
	if not success then
		notify("生成错误: " .. FileName .. "\n" .. result, RGBAToInt(255, 0, 0, 255))
	else
		notify("生成失败: " .. FileName)
	end
	Spawning = nil
end

local SettingsTbl = {}
SettingsTbl.XYOffset = 5
SettingsTbl.ZOffset = 0
SettingsTbl.PlaneHeliZOffset = 20
SettingsTbl.Freeze = true
SettingsTbl.PlaceInVehicle = true
Settings.Load("MenyooVehicleSpawner", SettingsTbl)
notify("加载的初始设置", RGBAToInt(0, 255, 0, 255))

local ParentId = menu.add_feature("XML模组", "parent",veh_option.id).id
local VehicleId = menu.add_feature("模组载具", "parent", ParentId).id

local OffsetXYFeat = menu.add_feature("X/Y偏移", "action_value_i", ParentId, function(f)
	local r,s = input.get("输入X/Y偏移", f.value, 4, 3)
	if r == 1 then
		return HANDLER_CONTINUE
	end
	if r == 2 then
		return HANDLER_POP
	end
	f.value = tonumber(s)
end)
OffsetXYFeat.min = 0
OffsetXYFeat.max = 10
OffsetXYFeat.mod = 1
OffsetXYFeat.value = SettingsTbl.XYOffset

local OffsetZFeat = menu.add_feature("Z偏移", "action_value_i", ParentId, function(f)
	local r,s = input.get("输入Z偏移", f.value, 4, 3)
	if r == 1 then
		return HANDLER_CONTINUE
	end
	if r == 2 then
		return HANDLER_POP
	end
	f.value = tonumber(s)
end)
OffsetZFeat.min = 0
OffsetZFeat.max = 2000
OffsetZFeat.mod = 10
OffsetZFeat.value = SettingsTbl.ZOffset

local OffsetZPlaneHeliFeat = menu.add_feature("飞机/直升机Z偏移", "action_value_i", ParentId, function(f)
	local r,s = input.get("输入Z偏移", f.value, 4, 3)
	if r == 1 then
		return HANDLER_CONTINUE
	end
	if r == 2 then
		return HANDLER_POP
	end
	f.value = tonumber(s)
end)
OffsetZPlaneHeliFeat.min = 0
OffsetZPlaneHeliFeat.max = 2000
OffsetZPlaneHeliFeat.mod = 10
OffsetZPlaneHeliFeat.value = SettingsTbl.PlaneHeliZOffset

local FreezeFeat = menu.add_feature("生成后冻结", "toggle", ParentId)
FreezeFeat.on = SettingsTbl.Freeze

local PlaceInVehicleFeat = menu.add_feature("生成后进入车内", "toggle", ParentId)
PlaceInVehicleFeat.on = SettingsTbl.PlaceInVehicle

menu.add_feature("保存设置", "action", ParentId, function(f)
	SettingsTbl.XYOffset = OffsetXYFeat.value
	SettingsTbl.ZOffset = OffsetZFeat.value
	SettingsTbl.PlaneHeliZOffset = OffsetZPlaneHeliFeat.value
	SettingsTbl.Freeze = FreezeFeat.on
	SettingsTbl.PlaceInVehicle = PlaceInVehicleFeat.on
	Settings.Save("MenyooVehicleSpawner", SettingsTbl)
	notify("已保存设置", RGBAToInt(0, 255, 0, 255))
end)
menu.add_feature("加载设置", "action", ParentId, function(f)
	Settings.Load("MenyooVehicleSpawner", SettingsTbl)
	OffsetXYFeat.value = SettingsTbl.XYOffset
	OffsetZFeat.value = SettingsTbl.ZOffset
	OffsetZPlaneHeliFeat.value = SettingsTbl.PlaneHeliZOffset
	FreezeFeat.on = SettingsTbl.Freeze
	PlaceInVehicleFeat.on = SettingsTbl.PlaceInVehicle
	notify("已加载设置", RGBAToInt(0, 255, 0, 255))
end)

local function SpawnVehicle(feat)
	local p = player.player_id()
	local pos = player.get_player_coords(p)
	local head = player.get_player_heading(p)
	if OffsetXYFeat.value > 0 then
		pos = OffsetCoords(pos, head, OffsetXYFeat.value)
	end
	pos.z = pos.z + OffsetZFeat.value
	local context = {}
	context.VehiclePath = feat.data
	context.Heading = head
	context.Position = pos
	context.OffsetZPlaneHeli = OffsetZPlaneHeliFeat.value
	context.Freeze = FreezeFeat.on
	context.PlaceInVehicle = PlaceInVehicleFeat.on
	menu.create_thread(SpawnVehicleThread, context)
end

local function LoadVehicleDir(feat, dir, filter)
	local count = 0
	local dirs = utils.get_all_sub_directories_in_directory(dir)
	for i=1,#dirs do
		count = count + LoadVehicleDir(menu.add_feature(dirs[i], "parent", feat.id), dir .. "\\" .. dirs[i], filter)
	end
	local files = utils.get_all_files_in_directory(dir, "xml")
	for i=1,#files do
		if filter == nil or files[i]:lower():find(filter, 1, true) then
			menu.add_feature(files[i], "action", feat.id, SpawnVehicle).data = dir .. "\\" .. files[i]
			count = count + 1
		end
	end
	if feat.child_count == 0 then
		menu.create_thread(DeleteFeature, feat)
	end
	return count
end
local function LoadVehicles(feat, filter)
	if filter then
		filter = filter:lower()
	end
	for i=feat.parent.child_count,3,-1 do
		menu.create_thread(DeleteFeature, feat.parent.children[i])
	end
	while feat.parent.child_count > 2 do
		system.wait(0)
	end
	local count = LoadVehicleDir(feat.parent, Paths.Vehicles, filter)
	print("Loaded " .. count .. " vehicle files" .. (filter and " with filter: " .. filter or ""))
	return count
end

local RefreshFeat = menu.add_feature("更新载具", "action", VehicleId, function(f)
	LoadVehicles(f)
end)
menu.add_feature("过滤器: <无>", "action", VehicleId, function(f)
	local r,s = input.get("Enter search query", f.data, 64, 0)
	if r == 1 then
		return HANDLER_CONTINUE
	end
	if r == 2 then
		return HANDLER_POP
	end
	s = Trim(s)
	if s:len() > 0 then
		f.data = s
		local count = LoadVehicles(f, s)
		f.name = "Filter: " .. s .. " (" .. count .. ")"
	else
		f.data = ""
		f.name = "Filter: <None>"
		LoadVehicles(f)
	end
end).data = ""

menu.create_thread(LoadVehicles, RefreshFeat)

MenyooVehicleSpawner = true