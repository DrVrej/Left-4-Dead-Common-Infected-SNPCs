include("vj_base/extension/l4d_com_infected.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/cpthazama/l4d2/common/common_male_clown.mdl" -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.AllowedToGib = false -- Is it allowed to gib in general? This can be on death or when shot in a certain place

ENT.SoundTbl_FootStep = {"vj_l4d_com/footstep/clown/concrete1.wav", "vj_l4d_com/footstep/clown/concrete2.wav", "vj_l4d_com/footstep/clown/concrete3.wav", "vj_l4d_com/footstep/clown/concrete4.wav", "vj_l4d_com/footstep/clown/concrete5.wav", "vj_l4d_com/footstep/clown/concrete6.wav", "vj_l4d_com/footstep/clown/concrete7.wav", "vj_l4d_com/footstep/clown/concrete8.wav"}

ENT.FootStepSoundLevel = 80

local defPos = Vector(0, 0, 0)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_OnBleed(dmginfo, hitgroup)
	if math.random(1, 3) != 1 then return end
	local pos = dmginfo:GetDamagePosition()
	if pos == defPos then return end
	local clownBloodSpray = ents.Create("info_particle_system")
	clownBloodSpray:SetKeyValue("effect_name", "vj_l4d_blood_spray_clown")
	clownBloodSpray:SetPos(pos)
	clownBloodSpray:SetAngles(pos:Angle())
	clownBloodSpray:Spawn()
	clownBloodSpray:Activate()
	clownBloodSpray:Fire("Start")
	clownBloodSpray:Fire("Kill", "", 0.2)
end