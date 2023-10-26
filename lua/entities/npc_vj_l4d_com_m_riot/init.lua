AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cpthazama/l4d2/common/common_male_riot.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 250
ENT.AllowedToGib = false -- Is it allowed to gib in general? This can be on death or when shot in a certain place

ENT.SoundTbl_FootStep = {"vj_l4d_com/footstep/riot/tile1.wav","vj_l4d_com/footstep/riot/tile2.wav","vj_l4d_com/footstep/riot/tile3.wav","vj_l4d_com/footstep/riot/tile4.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetBodygroup(1, math.random(0, 3))
	
	self.MaskModel = ents.Create("prop_vj_animatable")
	self.MaskModel:SetModel("models/cpthazama/l4d2/common/cim_riot_faceplate.mdl")
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
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup)
	-- Only take damage from the back side!
	if hitgroup != 20 then
		dmginfo:ScaleDamage(0.25)
	end
    /*local spark = EffectData()
    spark:SetOrigin(dmginfo:GetDamagePosition())
    spark:SetAngles(dmginfo:GetDamagePosition():Angle())
    spark:SetScale(0.1)
    util.Effect("StunstickImpact",spark)*/
	if self.HasSounds == true && self.HasImpactSounds == true then VJ.EmitSound(self, "vj_impact_metal/bullet_metal/metalsolid"..math.random(1,10)..".wav", 70) end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo, hitgroup,GetCorpse)
	self.MaskModel:SetOwner(GetCorpse)
	self.MaskModel:SetParent(GetCorpse)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	-- If no corpse spawned, make sure to remove the mask!
	if !IsValid(self.Corpse) && IsValid(self.MaskModel) then
		self.MaskModel:Remove()
	end
end