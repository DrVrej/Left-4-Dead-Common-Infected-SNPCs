/*--------------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base 			= "obj_vj_spawner_base"
ENT.Type 			= "anim"
ENT.PrintName 		= "Random Common Infected Spawner"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose 		= "Spawn it and fight with it!"
ENT.Instructions 	= "Click on the spawnicon to spawn it."
ENT.Category		= "VJ Base Spawners"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

local entsList = {
	"npc_vj_l4d_com_male",
	"npc_vj_l4d_com_female",
	"npc_vj_l4d_com_f_nurse:10",
	"npc_vj_l4d_com_m_hospital:10",
	"npc_vj_l4d_com_m_airport:10",
	"npc_vj_l4d_com_m_police:10",
	"npc_vj_l4d_com_m_soldier:10",
	"npc_vj_l4d_com_m_worker:13",
	"npc_vj_l4d_com_m_mudmen:13",
	"npc_vj_l4d_com_m_ceda:15",
	"npc_vj_l4d_com_m_fallsur:15",
	"npc_vj_l4d_com_m_clown:25",
	"npc_vj_l4d_com_m_riot:20",
	"npc_vj_l4d_com_m_jimmy:150"
}
ENT.EntitiesToSpawn = {
	{SpawnPosition = {vForward=50, vRight=0, vUp=0}, Entities = entsList},
	{SpawnPosition = {vForward=0, vRight=100, vUp=0}, Entities = entsList},
	{SpawnPosition = {vForward=100, vRight=100, vUp=0}, Entities = entsList},
	{SpawnPosition = {vForward=100, vRight=-100, vUp=0}, Entities = entsList},
	{SpawnPosition = {vForward=0, vRight=-100, vUp=0}, Entities = entsList},
}