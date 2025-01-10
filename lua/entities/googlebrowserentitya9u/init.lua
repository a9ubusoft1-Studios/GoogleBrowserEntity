--MADE BY KNUCKLES COMBINE
--FIXED BY A9UBUSOFT1REAL
--        _____       _                      __ _   __                 _ 
--       |  _  |     | |                    / _| | /  |               | |
--  __ _ | |_| |_   _| |__  _   _ ___  ___ | |_| |_`| | _ __ ___  __ _| |
-- / _` |\____ | | | | '_ \| | | / __|/ _ \|  _| __|| || '__/ _ \/ _` | |
--| (_| |.___/ / |_| | |_) | |_| \__ \ (_) | | | |__| || | |  __/ (_| | |
-- \__,_|\____/ \__,_|_.__/ \__,_|___/\___/|_|  \__\___/_|  \___|\__,_|_| Copyright 2024-2025

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

util.AddNetworkString("OpenGoogleBrowser")

function ENT:Initialize()
    self:SetModel("models/google.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:Wake()
    end
end

function ENT:Use(activator, caller)
    if IsValid(caller) and caller:IsPlayer() then
        net.Start("OpenGoogleBrowser")
        net.Send(caller)
    end
end
