include("vj_base/extensions/l4d_com_infected.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/cpthazama/l4d2/common/common_male_jimmy.mdl" -- Model(s) to spawn with | Picks a random one if it's a table
ENT.StartHealth = 1000
ENT.Immune_Fire = true -- Immune to fire-type damages
ENT.CanGib = false -- Can the NPC gib? | Makes "CreateGibEntity" fail and overrides "CanGibOnDeath" to false

ENT.Zombie_CanHearPipe = false -- Can it hear the pipe bombs?