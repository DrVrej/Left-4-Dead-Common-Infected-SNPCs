include("vj_base/extension/l4d_com_infected.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cpthazama/l4d1/common/common_male_baggagehandler_01.mdl", "models/cpthazama/l4d1/common/common_male_pilot.mdl", "models/cpthazama/l4d1/common/common_tsaagent_male01.mdl"} -- Model(s) to spawn with | Picks a random one if it's a table
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	if self:GetModel() == "models/cpthazama/l4d1/common/common_tsaagent_male01.mdl" then
		self:SetBodygroup(0, math.random(0, 4))
	else
		self:SetBodygroup(0, math.random(0, 3))
	end
	self:SetSkin(math.random(0, 15))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Gibs(gType)
	if gType == "h" then
		if self:GetModel() == "models/cpthazama/l4d1/common/common_tsaagent_male01.mdl" then
			self:SetBodygroup(0, 5)
		else
			self:SetBodygroup(0, 4)
		end
		self:SetBodygroup(1, 1)
	elseif gType == "la" then
		self:SetBodygroup(1, 3)
	elseif gType == "ra" then
		self:SetBodygroup(1, 2)
	elseif gType == "ll" then
		self:SetBodygroup(2, 2)
	elseif gType == "rl" then
		self:SetBodygroup(2, 1)
	end
end