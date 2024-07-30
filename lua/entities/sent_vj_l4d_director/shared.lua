ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "AI Director"
ENT.Author			= "Cpt. Hazama"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose			= ""
ENT.Instructions	= ""
ENT.Category		= "Left 4 Dead"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false

if CLIENT then
	function ENT:Draw()
		return false
	end
end