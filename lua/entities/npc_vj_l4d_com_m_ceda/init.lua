include("vj_base/extension/l4d_com_infected.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/cpthazama/l4d2/common/common_male_ceda.mdl" -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.Immune_Fire = true -- Immune to fire-type damages
ENT.AllowedToGib = false -- Is it allowed to gib in general? This can be on death or when shot in a certain place

local sdDeflate = {"vj_l4d_com/ceda/ceda_suit_deflate.wav", "vj_l4d_com/ceda/ceda_suit_deflate_02.wav", "vj_l4d_com/ceda/ceda_suit_deflate_03.wav"}

-- Custom
ENT.Zombie_CanPuke = false
ENT.Zombie_HazmatBroken = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetBodygroup(1, math.random(0, 5))
	
	self.MaskModel = ents.Create("prop_vj_animatable")
	self.MaskModel:SetModel("models/cpthazama/l4d2/common/cim_faceplate.mdl")
	self.MaskModel:SetLocalPos(self:GetPos())
	self.MaskModel:SetOwner(self)
	self.MaskModel:SetParent(self)
	self.MaskModel:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	self.MaskModel:Spawn()
	self.MaskModel:Activate()
	self.MaskModel:SetSolid(SOLID_NONE)
	self.MaskModel:AddEffects(EF_BONEMERGE)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local orgFunc = ENT.CustomOnTakeDamage_AfterDamage
--
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo, hitgroup)
	orgFunc(self, dmginfo, hitgroup)
	if self.Zombie_HazmatBroken == false then
		self.Zombie_HazmatBroken = true
		VJ.EmitSound(self, sdDeflate, self.PainSoundLevel, math.random(90, 100))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo, hitgroup, corpseEnt)
	self.MaskModel:SetOwner(corpseEnt)
	self.MaskModel:SetParent(corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	//self.MaskModel:Remove()
end