include("vj_base/extensions/l4d_com_infected.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/cpthazama/l4d2/common/common_male_riot.mdl" -- Model(s) to spawn with | Picks a random one if it's a table
ENT.StartHealth = 250
ENT.AllowedToGib = false -- Is it allowed to gib in general? This can be on death or when shot in a certain place

ENT.SoundTbl_FootStep = {"vj_l4d_com/footstep/riot/tile1.wav", "vj_l4d_com/footstep/riot/tile2.wav", "vj_l4d_com/footstep/riot/tile3.wav", "vj_l4d_com/footstep/riot/tile4.wav"}

-- Custom
ENT.ZombieRiot_MaskHP = 80
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetBodygroup(1, math.random(0, 3))
	
	local mask = ents.Create("prop_vj_animatable")
	mask:SetModel("models/cpthazama/l4d2/common/cim_riot_faceplate.mdl")
	mask:SetLocalPos(self:GetPos())
	mask:SetOwner(self)
	mask:SetParent(self)
	mask:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	mask:Spawn()
	mask:Activate()
	mask:SetSolid(SOLID_NONE)
	mask:AddEffects(EF_BONEMERGE)
	self.MaskModel = mask
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup)
	-- Break the mask if it takes too much damage
	if hitgroup == HITGROUP_HEAD && IsValid(self.MaskModel) then
		self.ZombieRiot_MaskHP = self.ZombieRiot_MaskHP - dmginfo:GetDamage()
		if self.ZombieRiot_MaskHP <= 0 then -- Mask broke!
			self.MaskModel:Remove()
			VJ.EmitSound(self, "physics/glass/glass_impact_bullet"..math.random(1, 4)..".wav", 80)
		end
	end
	
	-- Only take FULL damage from the back side otherwise only 25%
	if hitgroup != 20 then
		dmginfo:ScaleDamage(0.25)
	end
	
	//local spark = EffectData()
	//spark:SetOrigin(dmginfo:GetDamagePosition())
	//spark:SetAngles(dmginfo:GetDamagePosition():Angle())
	//spark:SetScale(0.1)
	//util.Effect("StunstickImpact", spark)
	if self.HasSounds == true && self.HasImpactSounds == true then VJ.EmitSound(self, "vj_base/impact/armor"..math.random(1, 10)..".wav", 70) end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo, hitgroup, corpseEnt)
	if IsValid(self.MaskModel) then
		self.MaskModel:SetOwner(corpseEnt)
		self.MaskModel:SetParent(corpseEnt)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	-- If no corpse spawned, make sure to remove the mask!
	if !IsValid(self.Corpse) && IsValid(self.MaskModel) then
		self.MaskModel:Remove()
	end
end