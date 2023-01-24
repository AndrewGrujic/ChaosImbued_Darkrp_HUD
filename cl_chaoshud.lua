-- Screenspace & offset init
    local screenW,screenH = 0,0
    local posOffset,sizeOffset = 5,10

-- Hud element co-ordinate init
    local hudMainX,hudMainY = 0,0
    local hudPicX,hudPicY = 0,0
    local hudNameX,hudNameY = 0,0
    local hudLicenceX,hudLicenceY = 0,0
    local hudMoneyX,hudMoneyY = 0,0
    local hudJobX,hudJobY = 0,0
    local hudHealthX,hudHealthY = 0,0

-- Hud element sizing init
    local hudMainW,hudMainH = 0,0
    local hudPicW,hudPicH = 0,0
    local hudNameW,hudNameH = 0,0
    local hudLicenceW,hudLicenceH = 0,0
    local hudMoneyW,hudMoneyH = 0,0
    local hudJobW,hudJobH = 0,0
    local hudHealthW,hudHealthH = 0,0

-- Data variable init

local hudPlayerName = "n/a"
local hudPlayerMoney = "n/a"
local hudPlayerJob = "n/a"
local hudPlayerHealth = "n/a"

-- Hud colour table
    local hudRGB = {

    --Main Element Colours
        White = Color(255,255,255),
        Black = Color(0,0,0,131),
        DarkGrey = Color(46,46,46),
        MidGrey = Color(58,58,58),
        Grey = Color(70,70,70),
        LightGrey = Color(90,90,90),

        --Misc Element Colours
        Accent = Color(0,0,0),
        Red = Color(255,72,72)
    }

-- Update of all HUD variables every frame
    hook.Add("Think", "varUpdate", function()

        screenW,screenH = ScrW(),ScrH()

        hudMainX,hudMainY = screenW / 2 - 350, screenH - 150
        hudMainW,hudMainH = 700, 140

        hudPicX,hudPicY = hudMainX + 10, hudMainY + 10
        hudPicW,hudPicH = 120,120

        hudNameX,hudNameY = hudPicX + hudPicW + 15, hudPicY + 15
        hudNameW,hudNameH = 200,35

        hudLicenceX,hudLicenceY = hudNameX + hudNameW + 15, hudNameY
        hudLicenceW,hudLicenceH = 35,35

        hudMoneyX,hudMoneyY = hudNameX, hudNameY + hudNameH + 15
        hudMoneyW,hudMoneyH = 250,35

        hudJobX,hudJobY = hudLicenceX + hudLicenceW + 55, hudLicenceY
        hudJobW,hudJobH = 200,35

        hudHealthX,hudHealthY = hudMoneyX + hudMoneyW + 15, hudMoneyY
        hudHealthW,hudHealthH = 275,35

        local thisPlayer = LocalPlayer()

        hudPlayerName = thisPlayer:getDarkRPVar("rpname")
        hudPlayerMoney = DarkRP.formatMoney(thisPlayer:getDarkRPVar("money"))
        hudPlayerJob = thisPlayer:getDarkRPVar("job")
        hudPlayerHealth = thisPlayer:Health()

        local teamColour = team.GetColor(thisPlayer:Team())
        hudRGB.Accent = teamColour

    end)

-- Main Painting Hook for the HUD
    hook.Add("HUDPaint", "ChaosHUD", function()

        draw.RoundedBox(5, hudMainX - posOffset - 2, hudMainY - posOffset - 2, hudMainW + sizeOffset + 4, hudMainH + sizeOffset + 4, hudRGB.Black)
        draw.RoundedBox(5, hudMainX - posOffset, hudMainY - posOffset, hudMainW + sizeOffset, hudMainH + sizeOffset, hudRGB.Accent)
        draw.RoundedBox(5, hudMainX, hudMainY, hudMainW, hudMainH, hudRGB.MidGrey)

        draw.RoundedBox(5,hudPicX - posOffset,hudPicY - posOffset,hudPicW + sizeOffset ,hudPicH + sizeOffset,hudRGB.DarkGrey)
        draw.RoundedBox(5,hudPicX,hudPicY,hudPicW,hudPicH,hudRGB.Grey)

        draw.RoundedBox(5,hudNameX - posOffset,hudNameY - posOffset,hudNameW + sizeOffset,hudNameH + sizeOffset,hudRGB.DarkGrey)
        draw.RoundedBox(5,hudNameX,hudNameY,hudNameW,hudNameH,hudRGB.Grey)

        draw.RoundedBox(5,hudLicenceX - posOffset,hudLicenceY - posOffset,hudLicenceW + sizeOffset,hudLicenceH + sizeOffset,hudRGB.DarkGrey)
        draw.RoundedBox(5,hudLicenceX,hudLicenceY,hudLicenceW,hudLicenceH,hudRGB.Grey)

        draw.RoundedBox(5,hudMoneyX - posOffset,hudMoneyY - posOffset,hudMoneyW + sizeOffset,hudMoneyH + sizeOffset,hudRGB.DarkGrey)
        draw.RoundedBox(5,hudMoneyX,hudMoneyY,hudMoneyW,hudMoneyH,hudRGB.Grey)

        draw.RoundedBox(5,hudHealthX - posOffset,hudHealthY - posOffset,hudHealthW + sizeOffset,hudHealthH + sizeOffset,hudRGB.DarkGrey)
        draw.RoundedBox(5,hudHealthX,hudHealthY,hudHealthW,hudHealthH,hudRGB.Grey)

        draw.RoundedBox(5,hudJobX - posOffset - 2,hudJobY - posOffset - 2,hudJobW + sizeOffset + 4,hudJobH + sizeOffset + 4,hudRGB.DarkGrey)
        draw.RoundedBox(5,hudJobX - posOffset,hudJobY - posOffset,hudJobW + sizeOffset,hudJobH + sizeOffset,hudRGB.Accent)
        draw.RoundedBox(5,hudJobX,hudJobY,hudJobW,hudJobH,hudRGB.Grey)

        draw.SimpleText(hudPlayerName,"ChatFont",hudNameX + 7,hudNameY + 8,hudRGB.White)
        draw.SimpleText(hudPlayerMoney,"ChatFont",hudMoneyX + 7,hudMoneyY + 8,hudRGB.White)
        draw.SimpleText(hudPlayerHealth,"ChatFont",hudHealthX + 7,hudHealthY + 8,hudRGB.White)
        draw.SimpleText(hudPlayerJob,"ChatFont", hudJobX + 7, hudJobY + 8, hudRGB.White)
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