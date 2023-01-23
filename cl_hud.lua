local screenW,screenH = 0,0
local posOffset,sizeOffset = 5,10

-- Hud element plotting co-ordinates
    local hudMainX,hudMainY = 0,0
    local hudPicX,hudPicY = 0,0

--
    local hudMainW,hudMainH = 0,0
    local hudPicW,hudPicH = 0,0

-- Hud colour table
    local hudRGB = {

    --Main Element Colours
        Black = Color(0,0,0,131),
        DarkGrey = Color(46,46,46),
        MidGrey = Color(58,58,58),
        Grey = Color(70,70,70),
        LightGrey = Color(90,90,90),
        Accent = Color(172,96,46),

    --Misc Element Colours
        Red = Color(255,72,72)
    }

-- Update of all HUD variables every tick
    hook.Add("Think", "varUpdate", function()

        screenW,screenH = ScrW(),ScrH()

        hudMainX,hudMainY = screenW / 2 - 350, screenH - 150
        hudMainW,hudMainH = 700, 140

        hudPicX,hudPicY = hudMainX + 10, hudMainY + 10
        hudPicW,hudPicH = 120,120

        hudNameX,hudNameY = hudPicX + hudPicW + 15, hudPicY
        hudNameW,hudNameH = 200,35

        hudLicenceX,hudLicenceY = hudNameX + hudNameW + 15, hudNameY
        hudLicenceW,hudLicenceH = 35,35

    end)

-- Main Paiting Hook for the HUD
    hook.Add("HUDPaint", "ChaosHUD", function()

        draw.RoundedBox(5, hudMainX - posOffset, hudMainY - posOffset, hudMainW + sizeOffset, hudMainH + sizeOffset, hudRGB.Black)
        draw.RoundedBox(5, hudMainX, hudMainY, hudMainW, hudMainH, hudRGB.MidGrey)

        draw.RoundedBox(5,hudPicX - posOffset,hudPicY - posOffset,hudPicW + sizeOffset ,hudPicH + sizeOffset,hudRGB.Accent)
        draw.RoundedBox(5,hudPicX,hudPicY,hudPicW,hudPicH,hudRGB.Grey)

        draw.RoundedBox(5,hudNameX - posOffset,hudNameY - posOffset,hudNameW + sizeOffset,hudNameH + sizeOffset,hudRGB.DarkGrey)
        draw.RoundedBox(5,hudNameX,hudNameY,hudNameW,hudNameH,hudRGB.Grey)

        draw.RoundedBox(5,hudLicenceX - posOffset,hudLicenceY - posOffset,hudLicenceW + sizeOffset,hudLicenceH + sizeOffset,hudRGB.DarkGrey)
        draw.RoundedBox(5,hudLicenceX,hudLicenceY,hudLicenceW,hudLicenceH,hudRGB.Grey)

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