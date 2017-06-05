-- author "Doctor Jew"
-- contact "http://steamcommunity.com/DoctorJew"

CreateConVar("ttt_clairvoyant_vision_duration", 2, {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "The duration for the clairvoyant vision in seconds.")
CreateConVar("ttt_clairvoyant_vision_camera_distance", 150, {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "The maximum allowed distance from the dead body and the camera when having a vision.")
CreateConVar("ttt_clairvoyant_vision", 1, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Should Detectives be able to buy the Clairvoyant Perk?")
CreateConVar("ttt_clairvoyant_vision_chance",0.5,{FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED},"Chance that the Detective will see an outline of the body (0.0 - 1.0).")


-- feel for to use this function for your own perk, but please credit me
local function getNextFreeID()
	local freeID, i = 1, 1
	while (freeID == 1) do
		if (!istable(GetEquipmentItem(ROLE_DETECTIVE, i))
			and !istable(GetEquipmentItem(ROLE_TRAITOR, i))) then
			freeID = i
		end
		i = i * 2
	end

	return freeID
end

EQUIP_CLAIRVOYANT = getNextFreeID()

local perk = {
	id = EQUIP_CLAIRVOYANT,
	loadout = false,
	type = "item_passive",
	material = "vgui/ttt/icon_brain",
	name = "clairvoyant_perk_name",
	desc = "clairvoyant_perk_desc",
	hud = true
}

if (GetConVar("ttt_clairvoyant_vision"):GetBool()) then
	table.insert(EquipmentItems[ROLE_DETECTIVE], perk)
end