include"sh_hud.lua"

hook.Add("HUDPaint", "ChaosHud", function()

    local scrW,scrH = ScrW(), ScrH()
    local boxW,boxH = scrW * 0.25, scrH * 0.1

    surface.SetDrawColor(0,0,0)
    surface.DrawRect(0, 0, boxW, boxH)

end)

local HUDHide = {

    ["CHudHealth"] = true,

}

hook.add("HUDShouldDraw", "HideHud", function (name)

    if (HUDHide[name]) then
        return false
    end

end)