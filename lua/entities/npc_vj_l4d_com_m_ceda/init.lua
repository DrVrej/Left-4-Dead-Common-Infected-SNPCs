include("vj_base/extensions/l4d_com_infected.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/cpthazama/l4d2/common/common_male_ceda.mdl"
ENT.Immune_Fire = true
ENT.CanGib = false

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
local orgDmgFunc = ENT.OnDamaged
--
function ENT:OnDamaged(dmginfo, hitgroup, status)
	if status == "PostDamage" && self.Zombie_HazmatBroken == false then
		self.Zombie_HazmatBroken = true
		VJ.EmitSound(self, sdDeflate, self.PainSoundLevel, math.random(90, 100))
	end
	orgDmgFunc(self, dmginfo, hitgroup, status)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpseEnt)
	self.MaskModel:SetOwner(corpseEnt)
	self.MaskModel:SetParent(corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	//self.MaskModel:Remove()
end