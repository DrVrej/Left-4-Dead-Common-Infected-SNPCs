/*--------------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_projectile_base"
ENT.PrintName		= "Pipe Bomb"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Information		= "Projectiles for my addons"
ENT.Category		= "VJ Base"

ENT.Spawnable = true
ENT.AdminOnly = false

ENT.VJTag_ID_Prop = true
ENT.VJTag_ID_Grenade = true

if CLIENT then
	local Name = "Pipe Bomb"
	local LangName = "obj_vj_l4d_pipebomb"
	language.Add(LangName, Name)
	killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
	language.Add("#"..LangName, Name)
	killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = {"models/cpthazama/l4d1/weapons/pipebomb.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.MoveCollideType = nil -- Move type | Some examples: MOVECOLLIDE_FLY_BOUNCE, MOVECOLLIDE_FLY_SLIDE
ENT.CollisionGroupType = nil -- Collision type, recommended to keep it as it is
ENT.SolidType = SOLID_VPHYSICS -- Solid type, recommended to keep it as it is
ENT.RemoveOnHit = false -- Should it remove itself when it touches something? | It will run the hit sound, place a decal, etc.
ENT.DecalTbl_DeathDecals = {"Scorch"}
ENT.SoundTbl_OnCollide = {"weapons/hegrenade/he_bounce-1.wav"}

local sdExplosion = {"vj_l4d_com/pipe_bomb/explode3.wav", "vj_l4d_com/pipe_bomb/explode5.wav"}

-- Custom
ENT.FuseTime = 7
ENT.Zombies = {}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:EnableGravity(true)
	phys:SetBuoyancyRatio(0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetHealth(1)
	for _, v in pairs(ents.FindInSphere(self:GetPos(), 4000)) do
		if v:IsNPC() && v.IsVJL4DCommonInfected && v.Zombie_CanHearPipe && v.Zombie_NextPipBombT < CurTime() then
			v.Zombie_NextPipBombT = CurTime() + 6.9
			v:VJ_DoSetEnemy(self, true)
			table.insert(self.Zombies, v)
		end
	end
	
	-- Explosion sequence (Manual)
	timer.Simple(self.FuseTime,function() if IsValid(self) then self:DeathEffects() end end)
	timer.Simple(0,function() if IsValid(self) then self:Beep(75) end end)
	timer.Simple(1,function() if IsValid(self) then self:Beep(75) end end)
	timer.Simple(2,function() if IsValid(self) then self:Beep(75) end end)
	timer.Simple(3,function() if IsValid(self) then self:Beep(75) end end)
	timer.Simple(3.5,function() if IsValid(self) then self:Beep(75) end end)
	timer.Simple(4,function() if IsValid(self) then self:Beep(75) end end)
	timer.Simple(4.4,function() if IsValid(self) then self:Beep(75) end end)
	timer.Simple(4.8,function() if IsValid(self) then self:Beep(78) end end)
	timer.Simple(5.2,function() if IsValid(self) then self:Beep(80) end end)
	timer.Simple(5.6,function() if IsValid(self) then self:Beep(80) end end)
	timer.Simple(6,function() if IsValid(self) then self:Beep(84) end end)
	timer.Simple(6.2,function() if IsValid(self) then self:Beep(84) end end)
	timer.Simple(6.3,function() if IsValid(self) then self:Beep(84) end end)
	timer.Simple(6.4,function() if IsValid(self) then self:Beep(84) end end)
	timer.Simple(6.5,function() if IsValid(self) then self:Beep(84) end end)
	timer.Simple(6.6,function() if IsValid(self) then self:Beep(88) end end)
	timer.Simple(6.7,function() if IsValid(self) then self:Beep(90) end end)
	timer.Simple(6.8,function() if IsValid(self) then self:Beep(90) end end)
	timer.Simple(6.9,function() if IsValid(self) then self:Beep(90) end end)
	
	local glow = ents.Create("env_sprite")
	glow:SetKeyValue("model","sprites/glow1.vmt")
	glow:SetKeyValue("scale","0.1")
	glow:SetKeyValue("rendermode","5")
	glow:SetKeyValue("rendercolor","255 191 0")
	glow:SetKeyValue("spawnflags","1")
	glow:SetPos(self:GetPos())
	glow:SetParent(self)
	glow:Spawn()
	glow:Activate()
	glow:Fire("SetParentAttachment","fuse")
	self:DeleteOnRemove(glow)
	
	glow = ents.Create("env_sprite")
	glow:SetKeyValue("model","sprites/glow1.vmt")
	glow:SetKeyValue("scale","0.05")
	glow:SetKeyValue("rendermode","5")
	glow:SetKeyValue("rendercolor","255 0 0")
	glow:SetKeyValue("spawnflags","1")
	glow:SetPos(self:GetPos())
	glow:SetParent(self)
	glow:Spawn()
	glow:Activate()
	glow:Fire("SetParentAttachment","pipebomb_light")
	self:DeleteOnRemove(glow)
	
	util.SpriteTrail(self, 2, Color(255,0,0,255), false, 15, 0.5, 0.2, 1/(10+1)*0.5, "VJ_Base/sprites/vj_trial1.vmt")
	
	local redLight = ents.Create("light_dynamic")
	redLight:SetKeyValue("brightness", "0.5")
	redLight:SetKeyValue("distance", "35")
	redLight:SetLocalPos(self:GetPos())
	redLight:SetLocalAngles( self:GetAngles() )
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
function ENT:CustomOnThink()
	for _,v in ipairs(self.Zombies) do
		if IsValid(v) then
			v:SetLastPosition(self:GetPos())
			v:VJ_TASK_GOTO_LASTPOS()
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage(dmginfo)
	self:GetPhysicsObject():AddVelocity(dmginfo:GetDamageForce() * 0.1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPhysicsCollide(data, phys)
	local getVel = phys:GetVelocity()
	local curVelSpeed = getVel:Length()
	if curVelSpeed > 500 then -- Or else it will go flying!
		phys:SetVelocity(getVel * 1.2)
	end
	
	if curVelSpeed > 100 then -- If the grenade is going faster than 100, then play the touch sound
		self:OnCollideSoundCode()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local defAng = Angle(0, 0, 0)
local posUp100 = Vector(0, 0, 100)
--
function ENT:DeathEffects()
	util.ScreenShake(self:GetPos(), 100, 200, 1, 2500)
	util.BlastDamage(self, self:GetOwner() == NULL and self or self:GetOwner(), self:GetPos(), 450, 150)
	
	-- Particles & Effects
	ParticleEffect("vj_explosion2", self:GetPos(), defAng, nil)
	local effectdata = EffectData()
	effectdata:SetOrigin(self:GetPos())
	util.Effect("ThumperDust", effectdata)
	util.Effect("Explosion", effectdata)

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
	util.Decal(VJ.PICK(self.DecalTbl_DeathDecals), tr.HitPos+tr.HitNormal, tr.HitPos-tr.HitNormal)
	
	-- Misc
	self:EmitSound(VJ.PICK(sdExplosion), 90, 100)
	self:DoDamageCode()
	self:SetDeathVariablesTrue(nil, nil, false)
	self:Remove()
end