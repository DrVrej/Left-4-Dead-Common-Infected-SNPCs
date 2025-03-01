SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Pipe Bomb"
SWEP.Author = "DrVrej"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Category = "Left 4 Dead"
	-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
	SWEP.Slot = 4
	SWEP.SlotPos = 4
	SWEP.SwayScale = 2
	SWEP.ViewModelFOV = 90
	SWEP.UseHands = true
end
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 10
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.ViewModel = "models/cpthazama/l4d1/weapons/v_pipebomb.mdl"
SWEP.WorldModel = "models/cpthazama/l4d1/weapons/pipebomb.mdl"
SWEP.HoldType = "grenade"
SWEP.Spawnable = true
SWEP.AdminOnly = true
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 0
SWEP.Primary.Force = 1
SWEP.Primary.ClipSize = 1
SWEP.Primary.Recoil = 2
SWEP.Primary.Delay = 10
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pipebomb"
SWEP.Primary.Sound = {}
SWEP.Primary.DistantSound = {}
SWEP.AnimTbl_PrimaryFire = ACT_VM_PRIMARYATTACK
//SWEP.Primary.DistantSoundVolume	= 0.25
SWEP.Primary.DisableBulletCode = true
SWEP.PrimaryEffects_MuzzleFlash = false
SWEP.PrimaryEffects_SpawnDynamicLight = false
SWEP.PrimaryEffects_SpawnShells = false
SWEP.Primary.TakeAmmo = 1
	-- Deployment Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DelayOnDeploy = 0.35
	-- Idle Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.HasIdleAnimation = true -- Does it have a idle animation?
SWEP.AnimTbl_Idle = ACT_VM_IDLE
SWEP.NextIdle_Deploy = 0.35 -- How much time until it plays the idle animation after the weapon gets deployed
SWEP.NextIdle_PrimaryAttack = 1.3 -- How much time until it plays the idle animation after attacking(Primary)
	-- Reload Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.AnimTbl_Reload = ACT_VM_DRAW
SWEP.Reload_TimeUntilAmmoIsSet = 1
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(0, 0, 180)
SWEP.WorldModel_CustomPositionOrigin = Vector(-1.5, 3, 2)

SWEP.ViewModelAdjust = {
	Pos = {Right = 0, Forward = 0, Up = -6},
	Ang = {Right = 0, Up = 0, Forward = 0}
}
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
	if CLIENT then
		local owner = self:GetOwner()
		if IsValid(owner) && owner:IsPlayer() then
			owner:ChatPrint("NOTE: Pipe bomb has a 10 second cooldown between throws!")
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnPrimaryAttack(status, statusData)
	if status == "Init" then
		if CLIENT then return end
		timer.Simple(1.3, function()
			local owner = self:GetOwner()
			if IsValid(self) && IsValid(owner) && owner:GetActiveWeapon() == self then
				local pipeBomb = ents.Create("obj_vj_l4d_pipebomb")
				pipeBomb:SetPos(owner:GetShootPos())
				pipeBomb:SetAngles(owner:GetAngles())
				pipeBomb:SetOwner(owner)
				pipeBomb:Activate()
				pipeBomb:Spawn()

				local phys = pipeBomb:GetPhysicsObject()
				if phys:IsValid() then
					phys:ApplyForceCenter(owner:GetAimVector()*5000 + owner:GetUp()*1500)
					phys:SetAngleVelocity(Vector(math.Rand(-160, 160), math.Rand(-160, 160), math.Rand(-160, 160)))
				end
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
	function SWEP:GetViewModelPosition(pos, ang)
		local vModelAdjust = self.ViewModelAdjust
		pos:Add(ang:Right() * vModelAdjust.Pos.Right)
		pos:Add(ang:Forward() * vModelAdjust.Pos.Forward)
		pos:Add(ang:Up() * vModelAdjust.Pos.Up)
		ang:RotateAroundAxis(ang:Right(), vModelAdjust.Ang.Right)
		ang:RotateAroundAxis(ang:Up(), vModelAdjust.Ang.Up)
		ang:RotateAroundAxis(ang:Forward(), vModelAdjust.Ang.Forward)
		return pos, ang
	end
end