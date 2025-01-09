--MADE BY KNUCKLES COMBINE
--FIXED BY A9UBUSOFT1REAL
--        _____       _                      __ _   __                 _ 
--       |  _  |     | |                    / _| | /  |               | |
--  __ _ | |_| |_   _| |__  _   _ ___  ___ | |_| |_`| | _ __ ___  __ _| |
-- / _` |\____ | | | | '_ \| | | / __|/ _ \|  _| __|| || '__/ _ \/ _` | |
--| (_| |.___/ / |_| | |_) | |_| \__ \ (_) | | | |__| || | |  __/ (_| | |
-- \__,_|\____/ \__,_|_.__/ \__,_|___/\___/|_|  \__\___/_|  \___|\__,_|_| Copyright 2025

include("shared.lua")

local isBrowserOpen = false

function ENT:Draw()
    self:DrawModel()
end

net.Receive("OpenGoogleBrowser", function()
    if isBrowserOpen then return end

    isBrowserOpen = true

    local frame = vgui.Create("DFrame")
    frame:SetTitle("Google Browser")
    frame:SetSize(ScrW(), ScrH())
    frame:Center()
    frame:MakePopup()
    frame:SetDraggable(false)
    frame:SetDeleteOnClose(true)

    local html = vgui.Create("DHTML", frame)
    html:Dock(FILL)
    html:OpenURL("https://www.google.com")

    --local closeButton = vgui.Create("DButton", frame)
    --closeButton:SetText("Close")
    --closeButton:SetSize(100, 50)
    --closeButton:SetPos(ScrW() - 110, 10)
    --closeButton.DoClick = function()
    --    frame:Close()
    --end
	--who needs that button anyway... heheheheh..

    frame.OnClose = function()
        isBrowserOpen = false
    end
end)
