include("vj_base/extensions/l4d_com_infected.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/cpthazama/l4d2/common/common_male_fallen_survivor.mdl" -- Model(s) to spawn with | Picks a random one if it's a table
ENT.StartHealth = 150
ENT.CanGib = false -- Can the NPC gib? | Makes "CreateGibEntity" fail and overrides "CanGibOnDeath" to false
ENT.DeathLootChance = 1 -- If set to 1, it will always drop loot
ENT.DeathLoot = {
    "item_healthvial",
    "item_battery",
    "item_ammo_smg1_grenade",
    "item_ammo_crossbow",
	"weapon_vj_l4d_pipebomb",
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetBodygroup(1, math.random(0, 2))
end
---------------------------------------------------------------------------------------------------------------------------------------------
local orgDmgFunc = ENT.OnDamaged
--
function ENT:OnDamaged(dmginfo, hitgroup, status)
	if status == "PreDamage" && hitgroup == HITGROUP_HEAD then
		dmginfo:ScaleDamage(0.75)
	end
	orgDmgFunc(self, dmginfo, hitgroup, status)
end