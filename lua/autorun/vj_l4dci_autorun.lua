/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local AddonName = "Left 4 Dead Common Infected SNPCs"
local AddonType = "NPC"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua", "GAME")
if VJExists == true then
	include("autorun/vj_controls.lua")

	local spawnCategory = "Left 4 Dead"
	
	-- Male
	VJ.AddNPC("Male Infected", "npc_vj_l4d_com_male", spawnCategory)
	VJ.AddNPC("Soldier Infected", "npc_vj_l4d_com_m_soldier", spawnCategory)
	VJ.AddNPC("Police Infected", "npc_vj_l4d_com_m_police", spawnCategory)
	VJ.AddNPC("Hospital Infected", "npc_vj_l4d_com_m_hospital", spawnCategory)
	VJ.AddNPC("Airport Infected", "npc_vj_l4d_com_m_airport", spawnCategory)
		-- Uncommon
		VJ.AddNPC("CEDA Worker Infected", "npc_vj_l4d_com_m_ceda", spawnCategory)
		VJ.AddNPC("Jimmy Gibbs Junior", "npc_vj_l4d_com_m_jimmy", spawnCategory)
		VJ.AddNPC("Fallen Survivor Infected", "npc_vj_l4d_com_m_fallsur", spawnCategory)
		VJ.AddNPC("Clown Infected", "npc_vj_l4d_com_m_clown", spawnCategory)
		VJ.AddNPC("Mud Man Infected", "npc_vj_l4d_com_m_mudmen", spawnCategory)
		VJ.AddNPC("Worker Infected", "npc_vj_l4d_com_m_worker", spawnCategory)
		VJ.AddNPC("Riot Infected", "npc_vj_l4d_com_m_riot", spawnCategory)
	
	-- Female
	VJ.AddNPC("Female Infected", "npc_vj_l4d_com_female", spawnCategory)
	VJ.AddNPC("Nurse Infected", "npc_vj_l4d_com_f_nurse", spawnCategory)
	
	-- Spawners
	VJ.AddNPC("Random Common Infected", "sent_vj_l4d_cominf", spawnCategory)
	VJ.AddNPC("Random Common Infected Spawner", "sent_vj_l4d_cominf_sp", spawnCategory)
	VJ.AddNPC("AI Director", "sent_vj_l4d_director", spawnCategory, true)
	
	-- Entities
	VJ.AddEntity("Pipe Bomb", "obj_vj_l4d_pipebomb", "DrVrej", false, 0, true, "VJ Base")
	
	-- Weapons
	VJ.AddNPCWeapon("VJ_L4D_Pipe_Bomb", "weapon_vj_l4d_pipebomb")
	VJ.AddWeapon("Pipe Bomb", "weapon_vj_l4d_pipebomb", true, spawnCategory)
	
	game.AddAmmoType({name="pipebomb", dmgtype=DMG_BLAST})
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Decals ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	game.AddDecal("VJ_L4D_Blood", {"vj_l4d/decals/blood1", "vj_l4d/decals/blood2", "vj_l4d/decals/blood3", "vj_l4d/decals/blood4", "vj_l4d/decals/blood5", "vj_l4d/decals/blood6", "vj_l4d/decals/blood7", "vj_l4d/decals/blood8"})
	game.AddDecal("VJ_L4D_Puke", {"vj_l4d/decals/puke1", "vj_l4d/decals/puke2"})
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Particles ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	VJ.AddParticle("particles/vj_l4d_common.pcf", {
		//"vj_l4d_balloon",
		//"vj_l4d_balloon_body",
		//"vj_l4d_balloon_string",
		"vj_l4d_blood_spray_clown",
		//"vj_l4d_door_attack_dust",
		//"vj_l4d_door_hit_metal",
		//"vj_l4d_door_hit_metal_b",
		//"vj_l4d_door_hit_wood",
		//"vj_l4d_door_slash_metal",
		//"vj_l4d_door_slash_wood",
		"vj_l4d_drool",
		"vj_l4d_froth",
		"vj_l4d_froth2",
		//"vj_l4d_froth_b",
		//"vj_l4d_froth_c",
		//"vj_l4d_froth_d",
		//"vj_l4d_mudman_hit_right",
		"vj_l4d_vomit",
		//"vj_l4d_vomit_refract",
		//"vj_l4d_vomit_stream",
	})
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Precaches ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	util.PrecacheModel("models/cpthazama/l4d1/anim_common.mdl")
	util.PrecacheModel("models/cpthazama/l4d1/common/common_male_pilot.mdl")
	util.PrecacheModel("models/cpthazama/l4d1/common/common_male_rural01.mdl")
	util.PrecacheModel("models/cpthazama/l4d1/common/common_male_suit.mdl")
	util.PrecacheModel("models/cpthazama/l4d1/common/common_military_male01.mdl")
	util.PrecacheModel("models/cpthazama/l4d1/common/common_patient_male01.mdl")
	util.PrecacheModel("models/cpthazama/l4d1/common/common_police_male01.mdl")
	util.PrecacheModel("models/cpthazama/l4d1/common/common_surgeon_male01.mdl")
	util.PrecacheModel("models/cpthazama/l4d1/common/common_tsaagent_male01.mdl")
	util.PrecacheModel("models/cpthazama/l4d1/common/common_female01.mdl")
	util.PrecacheModel("models/cpthazama/l4d1/common/common_female_nurse01.mdl")
	util.PrecacheModel("models/cpthazama/l4d2/common/cim_faceplate.mdl")
	util.PrecacheModel("models/cpthazama/l4d2/common/cim_riot_faceplate.mdl")
	util.PrecacheModel("models/cpthazama/l4d2/common/common_male_ceda.mdl")
	util.PrecacheModel("models/cpthazama/l4d2/common/common_male_clown.mdl")
	util.PrecacheModel("models/cpthazama/l4d2/common/common_male_fallen_survivor.mdl")
	util.PrecacheModel("models/cpthazama/l4d2/common/common_male_jimmy.mdl")
	util.PrecacheModel("models/cpthazama/l4d2/common/common_male_mud.mdl")
	util.PrecacheModel("models/cpthazama/l4d2/common/common_male_riot.mdl")
	util.PrecacheModel("models/cpthazama/l4d2/common/common_male_roadcrew.mdl")
	util.PrecacheModel("models/cpthazama/l4d2/common/common_male_roadcrew_rain.mdl")
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Convars & Menu ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	VJ.AddConVar("vj_l4d_alllowclimbing", 0, {FCVAR_ARCHIVE})
	
	VJ.AddConVar("vj_l4d_director_enabled", 1)
	VJ.AddConVar("vj_l4d_director_maxci", 80)
	VJ.AddConVar("vj_l4d_director_mobcount", 35)
	VJ.AddConVar("vj_l4d_director_spawnmax", 2000)
	VJ.AddConVar("vj_l4d_director_spawnmin", 650)
	VJ.AddConVar("vj_l4d_director_mobchance", 100)
	VJ.AddConVar("vj_l4d_director_mobcooldownmin", 120)
	VJ.AddConVar("vj_l4d_director_mobcooldownmax", 180)
	VJ.AddConVar("vj_l4d_director_delaymin", 0.85)
	VJ.AddConVar("vj_l4d_director_delaymax", 3)
	VJ.AddClientConVar("vj_l4d_director_music", 1)
	VJ.AddClientConVar("vj_l4d_director_musicvolume", 0.1)
	
	if CLIENT then
		hook.Add("PopulateToolMenu", "VJ_ADDTOMENU_L4D", function()
			spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "Left 4 Dead - Director", "Left 4 Dead - Director", "", "", function(Panel)
				Panel:AddControl("Checkbox", {Label = "Enable Music?", Command = "vj_l4d_director_music"})
				Panel:AddControl("Slider", { Label = "Music Volume", Command = "vj_l4d_director_musicvolume", Type = "Float", Min = "0.1", Max = "0.9"})
				if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
					Panel:AddControl("Label", {Text = "#vjbase.menu.general.admin.not"})
					Panel:AddControl( "Label", {Text = "#vjbase.menu.general.admin.only"})
					return
				end
				Panel:AddControl( "Label", {Text = "#vjbase.menu.general.admin.only"})
				Panel:AddControl("Checkbox", {Label = "Enable AI Director processing?", Command = "vj_l4d_director_enabled"})
				Panel:AddControl("Slider", {Label = "Max Common Infected", Command = "vj_l4d_director_maxci", Type = "Float", Min = "5", Max = "400"})
				Panel:AddControl("Slider", {Label = "Min Distance they can spawn from players", Command = "vj_l4d_director_spawnmin", Type = "Float", Min = "150", Max = "30000"})
				Panel:AddControl("Slider", {Label = "Max Distance they can spawn from players", Command = "vj_l4d_director_spawnmax", Type = "Float", Min = "150", Max = "30000"})
				Panel:AddControl("Slider", {Label = "Min time between spawns", Command = "vj_l4d_director_delaymin", Type = "Float", Min = "0.1", Max = "15"})
				Panel:AddControl("Slider", {Label = "Max time between spawns", Command = "vj_l4d_director_delaymax", Type = "Float", Min = "0.2", Max = "15"})
				Panel:AddControl("Slider", {Label = "Max Mob Common Infected", Command = "vj_l4d_director_mobcount", Type = "Float", Min = "5", Max = "400"})
				Panel:AddControl("Slider", {Label = "Chance that a mob will appear", Command = "vj_l4d_director_mobchance", Type = "Float", Min = "1", Max = "500"})
				Panel:AddControl("Slider", {Label = "Min cooldown time for mob spawns", Command = "vj_l4d_director_mobcooldownmin", Type = "Float", Min = "1", Max = "800"})
				Panel:AddControl("Slider", {Label = "Max cooldown time for mob spawns", Command = "vj_l4d_director_mobcooldownmax", Type = "Float", Min = "1", Max = "800"})
			end)
		
			spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "Left 4 Dead", "Left 4 Dead", "", "", function(Panel)
				if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
					Panel:AddControl("Label", {Text = "#vjbase.menu.general.admin.not"})
					Panel:AddControl( "Label", {Text = "#vjbase.menu.general.admin.only"})
					return
				end
				Panel:AddControl( "Label", {Text = "#vjbase.menu.general.admin.only"})
				Panel:AddControl("Button", {Text = "#vjbase.menu.general.reset.everything", Command = "vj_l4d_alllowclimbing 0"})
				Panel:AddControl("Checkbox", {Label = "Enable Climbing (Experimental)", Command = "vj_l4d_alllowclimbing"})
				Panel:ControlHelp("WARNING: Enabling climbing can cause heavy performance drops!")
			end)
		end)
	end
	
	VJ_L4D_NODEPOS = {}
	hook.Add("EntityRemoved", "VJ_AddNodes_L4D", function(ent)
		if ent:GetClass() == "info_node" then
			table.insert(VJ_L4D_NODEPOS, ent:GetPos())
		end
	end)
	
-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile()
	VJ.AddAddonProperty(AddonName, AddonType)
else
	if CLIENT then
		chat.AddText(Color(0, 200, 200), AddonName, 
		Color(0, 255, 0), " was unable to install, you are missing ", 
		Color(255, 100, 0), "VJ Base!")
	end
	
	timer.Simple(1, function()
		if not VJBASE_ERROR_MISSING then
			VJBASE_ERROR_MISSING = true
			if CLIENT then
				// Get rid of old error messages from addons running on older code...
				if VJF && type(VJF) == "Panel" then
					VJF:Close()
				end
				VJF = true
				
				local frame = vgui.Create("DFrame")
				frame:SetSize(600, 160)
				frame:SetPos((ScrW() - frame:GetWide()) / 2, (ScrH() - frame:GetTall()) / 2)
				frame:SetTitle("Error: VJ Base is missing!")
				frame:SetBackgroundBlur(true)
				frame:MakePopup()
	
				local labelTitle = vgui.Create("DLabel", frame)
				labelTitle:SetPos(250, 30)
				labelTitle:SetText("VJ BASE IS MISSING!")
				labelTitle:SetTextColor(Color(255, 128, 128))
				labelTitle:SizeToContents()
				
				local label1 = vgui.Create("DLabel", frame)
				label1:SetPos(170, 50)
				label1:SetText("Garry's Mod was unable to find VJ Base in your files!")
				label1:SizeToContents()
				
				local label2 = vgui.Create("DLabel", frame)
				label2:SetPos(10, 70)
				label2:SetText("You have an addon installed that requires VJ Base but VJ Base is missing. To install VJ Base, click on the link below. Once\n                                                   installed, make sure it is enabled and then restart your game.")
				label2:SizeToContents()
				
				local link = vgui.Create("DLabelURL", frame)
				link:SetSize(300, 20)
				link:SetPos(195, 100)
				link:SetText("VJ_Base_Download_Link_(Steam_Workshop)")
				link:SetURL("https://steamcommunity.com/sharedfiles/filedetails/?id=131759821")
				
				local buttonClose = vgui.Create("DButton", frame)
				buttonClose:SetText("CLOSE")
				buttonClose:SetPos(260, 120)
				buttonClose:SetSize(80, 35)
				buttonClose.DoClick = function()
					frame:Close()
				end
			elseif (SERVER) then
				VJF = true
				timer.Remove("VJBASEMissing")
				timer.Create("VJBASE_ERROR_CONFLICT", 5, 0, function()
					print("VJ Base is missing! Download it from the Steam Workshop! Link: https://steamcommunity.com/sharedfiles/filedetails/?id=131759821")
				end)
			end
		end
	end)
end