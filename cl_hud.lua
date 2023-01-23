local screenW,screenH = 0,0


local hudMainX,hudMainY = 0,0

-- Update of all HUD variables every tick
    hook.Add("Think", "varUpdate", function()

        screenW,screenH = ScrW(),ScrH()
        hudMainX,hudMainY = screenW / 2 - 150, screenH / 2

    end)

-- Main Paiting Hook for the HUD
    hook.Add("HUDPaint", "ChaosHUD", function()

        draw.RoundedBox(5, hudMainX, hudMainY, 100, 100, Color(0,0,0,100))

    end)

-- Hides all unnecessary base HUD elements
    local HUDHide = {
        ["CHudHealth"] = true
    }
    hook.Add("HUDShouldDraw", "HideHud", function (name)
        if (HUDHide[name]) then
            return false
        end
    end)