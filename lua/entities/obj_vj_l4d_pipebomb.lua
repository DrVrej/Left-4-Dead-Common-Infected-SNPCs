/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_projectile_base"
ENT.PrintName		= "Pipe Bomb"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Category		= "VJ Base"

ENT.Spawnable = true
ENT.AdminOnly = false

ENT.VJ_ID_Attackable = true
ENT.VJ_ID_Grenade = true

if CLIENT then
	VJ.AddKillIcon("obj_vj_l4d_pipebomb", ENT.PrintName, VJ.KILLICON_GRENADE)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/cpthazama/l4d1/weapons/pipebomb.mdl"
ENT.ProjectileType = VJ.PROJ_TYPE_PROP
ENT.CollisionBehavior = VJ.PROJ_COLLISION_NONE
ENT.CollisionDecal = "Scorch"
ENT.SoundTbl_OnCollide = "weapons/hegrenade/he_bounce-1.wav"

local sdExplosion = {"vj_l4d_com/pipe_bomb/explode3.wav", "vj_l4d_com/pipe_bomb/explode5.wav"}

-- Custom
ENT.FuseTime = 7
ENT.Zombies = {}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetHealth(1)
	for _, v in pairs(ents.FindInSphere(self:GetPos(), 4000)) do
		if v:IsNPC() && v.IsVJL4DCommonInfected && v.Zombie_CanHearPipe && v.Zombie_NextPipBombT < CurTime() then
			v.Zombie_NextPipBombT = CurTime() + 6.9
			v:ForceSetEnemy(self, true)
			table.insert(self.Zombies, v)
		end
	end
	
	-- Explosion sequence (Manual)
	timer.Simple(self.FuseTime,function() if IsValid(self) then self:Destroy() end end)
	timer.Simple(0, function() if IsValid(self) then self:Beep(75) end end)
	timer.Simple(1, function() if IsValid(self) then self:Beep(75) end end)
	timer.Simple(2, function() if IsValid(self) then self:Beep(75) end end)
	timer.Simple(3, function() if IsValid(self) then self:Beep(75) end end)
	timer.Simple(3.5, function() if IsValid(self) then self:Beep(75) end end)
	timer.Simple(4, function() if IsValid(self) then self:Beep(75) end end)
	timer.Simple(4.4, function() if IsValid(self) then self:Beep(75) end end)
	timer.Simple(4.8, function() if IsValid(self) then self:Beep(78) end end)
	timer.Simple(5.2, function() if IsValid(self) then self:Beep(80) end end)
	timer.Simple(5.6, function() if IsValid(self) then self:Beep(80) end end)
	timer.Simple(6, function() if IsValid(self) then self:Beep(84) end end)
	timer.Simple(6.2, function() if IsValid(self) then self:Beep(84) end end)
	timer.Simple(6.3, function() if IsValid(self) then self:Beep(84) end end)
	timer.Simple(6.4, function() if IsValid(self) then self:Beep(84) end end)
	timer.Simple(6.5, function() if IsValid(self) then self:Beep(84) end end)
	timer.Simple(6.6, function() if IsValid(self) then self:Beep(88) end end)
	timer.Simple(6.7, function() if IsValid(self) then self:Beep(90) end end)
	timer.Simple(6.8, function() if IsValid(self) then self:Beep(90) end end)
	timer.Simple(6.9, function() if IsValid(self) then self:Beep(90) end end)
	
	local glowFuse = ents.Create("env_sprite")
	glowFuse:SetKeyValue("model","sprites/glow1.vmt")
	glowFuse:SetKeyValue("scale","0.1")
	glowFuse:SetKeyValue("rendermode","5")
	glowFuse:SetKeyValue("rendercolor","255 191 0")
	glowFuse:SetKeyValue("spawnflags","1")
	glowFuse:SetPos(self:GetPos())
	glowFuse:SetParent(self)
	glowFuse:Spawn()
	glowFuse:Activate()
	glowFuse:Fire("SetParentAttachment","fuse")
	self:DeleteOnRemove(glowFuse)
	
	local redGlow = ents.Create("env_sprite")
	redGlow:SetKeyValue("model", "sprites/redglow1.vmt")
	redGlow:SetKeyValue("scale", "0.1")
	redGlow:SetKeyValue("rendermode", "3") -- kRenderGlow
	redGlow:SetKeyValue("renderfx", "14") -- kRenderFxNoDissipation
	redGlow:SetKeyValue("renderamt", "200")
	redGlow:SetKeyValue("rendercolor", "255 255 255")
	redGlow:SetKeyValue("GlowProxySize", "4.0")
	redGlow:SetParent(self)
	redGlow:Fire("SetParentAttachment", "pipebomb_light")
	redGlow:Spawn()
	redGlow:Activate()
	self:DeleteOnRemove(redGlow)
	
	local redTrail = util.SpriteTrail(self, 1, Color(255, 0, 0), true, 8, 1, 0.5, 0.0555, "sprites/bluelaser1.vmt")
	redTrail:SetKeyValue("rendermode", "5") -- kRenderTransAdd
	redTrail:SetKeyValue("renderfx", "0") -- kRenderFxNone
	
	local redLight = ents.Create("light_dynamic")
	redLight:SetKeyValue("brightness", "0.5")
	redLight:SetKeyValue("distance", "35")
	redLight:SetLocalPos(self:GetPos())
	redLight:SetLocalAngles(self:GetAngles())
	redLight:Fire("Color", "255 50 0")
	redLight:SetParent(self)
	redLight:Spawn()
	redLight:Activate()
	redLight:Fire("TurnOn", "", 0)
	redLight:Fire("SetParentAttachment","fuse")
	self:DeleteOnRemove(redLight)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Beep(vol)
	self:EmitSound("vj_l4d_com/pipe_bomb/beep.wav", vol, 100)
	
	local glow = ents.Create("env_sprite")
	glow:SetKeyValue("model","sprites/glow1.vmt")
	glow:SetKeyValue("scale","0.115")
	glow:SetKeyValue("rendermode","5")
	glow:SetKeyValue("rendercolor","255 0 0")
	glow:SetKeyValue("spawnflags","1")
	glow:SetPos(self:GetPos())
	glow:SetParent(self)
	glow:Spawn()
	glow:Activate()
	glow:Fire("SetParentAttachment", "pipebomb_light")
	self:DeleteOnRemove(glow)
	
	timer.Simple(0.2, function()
		if IsValid(self) then
			glow:Remove()
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	for _,v in ipairs(self.Zombies) do
		if IsValid(v) then
			v:SetLastPosition(self:GetPos())
			v:SCHEDULE_GOTO_POSITION()
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo)
	self:GetPhysicsObject():AddVelocity(dmginfo:GetDamageForce() * 0.1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCollision(data, phys)
	local getVel = phys:GetVelocity()
	local curVelSpeed = getVel:Length()
	if curVelSpeed > 500 then -- Or else it will go flying!
		phys:SetVelocity(getVel * 1.2)
	end
	
	if curVelSpeed > 100 then -- If the grenade is going faster than 100, then play the touch sound
		self:PlaySound("OnCollide")
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local defAng = Angle(0, 0, 0)
local posUp100 = Vector(0, 0, 100)
--
function ENT:OnDestroy()
	util.ScreenShake(self:GetPos(), 100, 200, 1, 2500)
	util.BlastDamage(self, self:GetOwner() == NULL and self or self:GetOwner(), self:GetPos(), 450, 150)
	
	-- Particles & Effects
	ParticleEffect("vj_explosion2", self:GetPos(), defAng, nil)
	local effectData = EffectData()
	effectData:SetOrigin(self:GetPos())
	util.Effect("ThumperDust", effectData)
	util.Effect("Explosion", effectData)

	-- Explosion Light
	local expLight = ents.Create("light_dynamic")
	expLight:SetKeyValue("brightness", "4")
	expLight:SetKeyValue("distance", "300")
	expLight:SetLocalPos(self:GetPos())
	expLight:SetLocalAngles(self:GetAngles())
	expLight:Fire("Color", "255 150 0")
	expLight:SetParent(self)
	expLight:Spawn()
	expLight:Activate()
	expLight:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(expLight)
	
	-- Decal
	self:SetLocalPos(Vector(self:GetPos().x,self:GetPos().y,self:GetPos().z +4)) -- Because the entity is too close to the ground
	local tr = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() - posUp100,
		filter = self
	})
	util.Decal(VJ.PICK(self.CollisionDecal), tr.HitPos+tr.HitNormal, tr.HitPos-tr.HitNormal)
	
	-- Misc
	self:EmitSound(VJ.PICK(sdExplosion), 90, 100)
	self:DealDamage()
end