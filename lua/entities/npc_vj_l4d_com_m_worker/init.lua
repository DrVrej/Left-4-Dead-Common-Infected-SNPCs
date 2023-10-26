AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cpthazama/l4d2/common/common_male_roadcrew.mdl","models/cpthazama/l4d2/common/common_male_roadcrew_rain.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.AllowedToGib = false -- Is it allowed to gib in general? This can be on death or when shot in a certain place

ENT.Zombie_CanHearPipe = false -- Can it hear the pipe bombs?
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetBodygroup(1,math.random(0,6))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup)
	if hitgroup == HITGROUP_HEAD then
		dmginfo:ScaleDamage(0.5)
	end
end