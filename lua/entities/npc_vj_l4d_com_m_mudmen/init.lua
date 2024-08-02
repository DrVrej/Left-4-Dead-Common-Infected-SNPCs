include("vj_base/extension/l4d_com_infected.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/cpthazama/l4d2/common/common_male_mud.mdl" -- Model(s) to spawn with | Picks a random one if it's a table
ENT.AllowedToGib = false -- Is it allowed to gib in general? This can be on death or when shot in a certain place
ENT.Zombie_IsMudMen = true

ENT.SoundTbl_FootStep = {"vj_l4d_com/footstep/mud/concrete1.wav", "vj_l4d_com/footstep/mud/concrete2.wav", "vj_l4d_com/footstep/mud/concrete3.wav", "vj_l4d_com/footstep/mud/concrete4.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetBodygroup(1, 5)
end