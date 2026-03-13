--========================================================
-- 67 HUB XoSh — Update Notice Card
-- Compact floating card, not full screen
--========================================================

local Players      = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player       = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name           = "67HUB_Update"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn   = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent         = player:WaitForChild("PlayerGui")

-- ── SUBTLE OVERLAY (not full black, just dims the game a little) ──
local Overlay = Instance.new("Frame", ScreenGui)
Overlay.Size                   = UDim2.new(1,0,1,0)
Overlay.BackgroundColor3       = Color3.fromRGB(0,0,0)
Overlay.BackgroundTransparency = 0.55
Overlay.BorderSizePixel        = 0
Overlay.ZIndex                 = 1

-- ── FLOATING CARD ─────────────────────────────────────
local Card = Instance.new("Frame", ScreenGui)
Card.Size             = UDim2.new(0.78,0,0,300)
Card.Position         = UDim2.new(0.11,0,0.5,-150)
Card.BackgroundColor3 = Color3.fromRGB(5,10,20)
Card.BackgroundTransparency = 0.04
Card.BorderSizePixel  = 0
Card.ZIndex           = 2
Instance.new("UICorner", Card).CornerRadius = UDim.new(0,14)

-- Glowing border
local CardStroke = Instance.new("UIStroke", Card)
CardStroke.Thickness = 1.5
CardStroke.Color     = Color3.fromRGB(0,140,255)
task.spawn(function()
    while Card.Parent do
        TweenService:Create(CardStroke,TweenInfo.new(1.6,Enum.EasingStyle.Sine),
            {Color=Color3.fromRGB(0,230,255),Transparency=0}):Play()
        task.wait(1.6)
        TweenService:Create(CardStroke,TweenInfo.new(1.6,Enum.EasingStyle.Sine),
            {Color=Color3.fromRGB(0,60,180),Transparency=0.45}):Play()
        task.wait(1.6)
    end
end)

-- Corner brackets
local function mkBracket(parent, ax, ay)
    local f = Instance.new("Frame", parent)
    f.Size        = UDim2.new(0,14,0,14)
    f.AnchorPoint = Vector2.new(ax, ay)
    f.Position    = UDim2.new(ax, ax==0 and 9 or -9, ay, ay==0 and 9 or -9)
    f.BackgroundTransparency = 1
    f.BorderSizePixel = 0; f.ZIndex = 6
    local h = Instance.new("Frame", f)
    h.Size      = UDim2.new(1,0,0,2)
    h.Position  = UDim2.new(0,0, ay==0 and 0 or 1, ay==0 and 0 or -2)
    h.BackgroundColor3 = Color3.fromRGB(0,210,255)
    h.BorderSizePixel = 0; h.ZIndex = 6
    local v = Instance.new("Frame", f)
    v.Size      = UDim2.new(0,2,1,0)
    v.Position  = UDim2.new(ax==0 and 0 or 1, ax==0 and 0 or -2, 0, 0)
    v.BackgroundColor3 = Color3.fromRGB(0,210,255)
    v.BorderSizePixel = 0; v.ZIndex = 6
end
mkBracket(Card,0,0); mkBracket(Card,1,0)
mkBracket(Card,0,1); mkBracket(Card,1,1)

-- ── INNER CONTENT ─────────────────────────────────────
local C = Instance.new("Frame", Card)
C.Size             = UDim2.new(1,-44,1,-44)
C.Position         = UDim2.new(0,22,0,22)
C.BackgroundTransparency = 1
C.BorderSizePixel  = 0
C.ZIndex           = 3

-- SYS tag top
local SysTag = Instance.new("TextLabel", C)
SysTag.Size   = UDim2.new(1,0,0,13)
SysTag.Position = UDim2.new(0,0,0,0)
SysTag.BackgroundTransparency = 1
SysTag.Text   = "// 67HUB XoSh  —  SYSTEM NOTICE"
SysTag.Font   = Enum.Font.Code
SysTag.TextSize = 9
SysTag.TextColor3 = Color3.fromRGB(0,90,170)
SysTag.TextXAlignment = Enum.TextXAlignment.Left
SysTag.ZIndex = 3

-- ── LOGO ROW ──────────────────────────────────────────
local Logo67 = Instance.new("TextLabel", C)
Logo67.Size   = UDim2.new(0,150,0,88)
Logo67.Position = UDim2.new(0,0,0,18)
Logo67.BackgroundTransparency = 1
Logo67.Text   = "67"
Logo67.Font   = Enum.Font.GothamBold
Logo67.TextSize = 84
Logo67.TextColor3 = Color3.fromRGB(255,255,255)
Logo67.TextXAlignment = Enum.TextXAlignment.Left
Logo67.ZIndex = 3

local LogoHub = Instance.new("TextLabel", C)
LogoHub.Size   = UDim2.new(0,120,0,36)
LogoHub.Position = UDim2.new(0,116,0,66)
LogoHub.BackgroundTransparency = 1
LogoHub.Text   = "HUB"
LogoHub.Font   = Enum.Font.GothamBold
LogoHub.TextSize = 30
LogoHub.TextColor3 = Color3.fromRGB(0,170,255)
LogoHub.TextXAlignment = Enum.TextXAlignment.Left
LogoHub.ZIndex = 3

-- ON TOP badge (top right)
local Badge = Instance.new("Frame", C)
Badge.Size   = UDim2.new(0,78,0,22)
Badge.Position = UDim2.new(1,-78,0,18)
Badge.BackgroundColor3 = Color3.fromRGB(0,140,255)
Badge.BackgroundTransparency = 0.25
Badge.BorderSizePixel = 0
Badge.ZIndex = 4
Instance.new("UICorner", Badge).CornerRadius = UDim.new(0,6)
Instance.new("UIStroke", Badge).Color = Color3.fromRGB(0,220,255)

local BadgeLbl = Instance.new("TextLabel", Badge)
BadgeLbl.Size = UDim2.new(1,0,1,0)
BadgeLbl.BackgroundTransparency = 1
BadgeLbl.Text = "ON TOP 👑"
BadgeLbl.Font = Enum.Font.GothamBold
BadgeLbl.TextSize = 10
BadgeLbl.TextColor3 = Color3.fromRGB(255,255,255)
BadgeLbl.ZIndex = 5
task.spawn(function()
    while Badge.Parent do
        TweenService:Create(Badge,TweenInfo.new(1.1,Enum.EasingStyle.Sine),
            {BackgroundColor3=Color3.fromRGB(0,80,200),BackgroundTransparency=0.4}):Play()
        task.wait(1.1)
        TweenService:Create(Badge,TweenInfo.new(1.1,Enum.EasingStyle.Sine),
            {BackgroundColor3=Color3.fromRGB(0,190,255),BackgroundTransparency=0.1}):Play()
        task.wait(1.1)
    end
end)

-- XoSh vertical right side
local XoShLbl = Instance.new("TextLabel", C)
XoShLbl.Size   = UDim2.new(0,18,0,88)
XoShLbl.Position = UDim2.new(1,-18,0,18)
XoShLbl.BackgroundTransparency = 1
XoShLbl.Text   = "X\no\nS\nh"
XoShLbl.Font   = Enum.Font.Code
XoShLbl.TextSize = 9
XoShLbl.TextColor3 = Color3.fromRGB(0,60,120)
XoShLbl.TextXAlignment = Enum.TextXAlignment.Right
XoShLbl.LineHeight = 1.3
XoShLbl.ZIndex = 3

-- ── DIVIDER ───────────────────────────────────────────
local Div = Instance.new("Frame", C)
Div.Size   = UDim2.new(1,0,0,1)
Div.Position = UDim2.new(0,0,0,112)
Div.BackgroundColor3 = Color3.fromRGB(0,130,255)
Div.BackgroundTransparency = 0.5
Div.BorderSizePixel = 0; Div.ZIndex = 3

for i, xp in ipairs({0, 0.5, 1}) do
    local d = Instance.new("Frame", C)
    d.Size   = UDim2.new(0,5,0,5)
    d.Position = UDim2.new(xp,-2,0,110)
    d.BackgroundColor3 = Color3.fromRGB(0,200,255)
    d.BorderSizePixel = 0; d.ZIndex = 3
    Instance.new("UICorner",d).CornerRadius = UDim.new(1,0)
end

-- ── GEAR ICON + MESSAGE ───────────────────────────────
local GearBox = Instance.new("Frame", C)
GearBox.Size   = UDim2.new(0,42,0,42)
GearBox.Position = UDim2.new(0,0,0,122)
GearBox.BackgroundColor3 = Color3.fromRGB(0,70,170)
GearBox.BackgroundTransparency = 0.45
GearBox.BorderSizePixel = 0; GearBox.ZIndex = 3
Instance.new("UICorner",GearBox).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke",GearBox).Color = Color3.fromRGB(0,170,255)

local GearLbl = Instance.new("TextLabel", GearBox)
GearLbl.Size = UDim2.new(1,0,1,0)
GearLbl.BackgroundTransparency = 1
GearLbl.TextSize = 20; GearLbl.Font = Enum.Font.GothamBold; GearLbl.ZIndex = 4
task.spawn(function()
    local icons = {"⚙️","🔧","⚙️","🔩"}
    local i = 1
    while GearLbl.Parent do
        GearLbl.Text = icons[i]; i = i % #icons + 1; task.wait(0.65)
    end
end)

local MainMsg = Instance.new("TextLabel", C)
MainMsg.Size   = UDim2.new(1,-54,0,24)
MainMsg.Position = UDim2.new(0,52,0,122)
MainMsg.BackgroundTransparency = 1
MainMsg.Text   = "Updating Script"
MainMsg.Font   = Enum.Font.GothamBold
MainMsg.TextSize = 20
MainMsg.TextColor3 = Color3.fromRGB(255,255,255)
MainMsg.TextXAlignment = Enum.TextXAlignment.Left
MainMsg.ZIndex = 3

local SubMsg = Instance.new("TextLabel", C)
SubMsg.Size   = UDim2.new(1,-54,0,18)
SubMsg.Position = UDim2.new(0,52,0,148)
SubMsg.BackgroundTransparency = 1
SubMsg.Text   = "Please Use On Another 48 Hours Or More"
SubMsg.Font   = Enum.Font.GothamBold
SubMsg.TextSize = 11
SubMsg.TextColor3 = Color3.fromRGB(0,200,255)
SubMsg.TextXAlignment = Enum.TextXAlignment.Left
SubMsg.TextWrapped = true
SubMsg.ZIndex = 3
task.spawn(function()
    while SubMsg.Parent do
        TweenService:Create(SubMsg,TweenInfo.new(1.3,Enum.EasingStyle.Sine),{TextTransparency=0.45}):Play()
        task.wait(1.3)
        TweenService:Create(SubMsg,TweenInfo.new(1.3,Enum.EasingStyle.Sine),{TextTransparency=0}):Play()
        task.wait(1.3)
    end
end)

-- ── INFO ROWS ─────────────────────────────────────────
local function mkInfoRow(parent, ypos, icon, label, value, valColor)
    local row = Instance.new("Frame", parent)
    row.Size   = UDim2.new(1,0,0,22)
    row.Position = UDim2.new(0,0,0,ypos)
    row.BackgroundColor3 = Color3.fromRGB(0,50,110)
    row.BackgroundTransparency = 0.75
    row.BorderSizePixel = 0; row.ZIndex = 3
    Instance.new("UICorner",row).CornerRadius = UDim.new(0,6)

    local ic = Instance.new("TextLabel", row)
    ic.Size   = UDim2.new(0,22,1,0)
    ic.BackgroundTransparency = 1
    ic.Text   = icon; ic.TextSize = 12; ic.Font = Enum.Font.GothamBold; ic.ZIndex = 4

    local lbl = Instance.new("TextLabel", row)
    lbl.Size   = UDim2.new(0.45,0,1,0)
    lbl.Position = UDim2.new(0,22,0,0)
    lbl.BackgroundTransparency = 1
    lbl.Text   = label; lbl.Font = Enum.Font.Code
    lbl.TextSize = 9; lbl.TextColor3 = Color3.fromRGB(80,140,200)
    lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.ZIndex = 4

    local val = Instance.new("TextLabel", row)
    val.Size   = UDim2.new(0.5,0,1,0)
    val.Position = UDim2.new(0.5,0,0,0)
    val.BackgroundTransparency = 1
    val.Text   = value; val.Font = Enum.Font.GothamBold
    val.TextSize = 10; val.TextColor3 = valColor or Color3.fromRGB(255,255,255)
    val.TextXAlignment = Enum.TextXAlignment.Right; val.ZIndex = 4
end

mkInfoRow(C, 178, "🔄", "STATUS", "UPDATING", Color3.fromRGB(255,200,0))
mkInfoRow(C, 204, "⏳", "EST. DOWNTIME", "48H+", Color3.fromRGB(0,220,255))
mkInfoRow(C, 230, "🛡️", "VERSION", "v5.0 → v6.0", Color3.fromRGB(0,255,140))

-- ── BOTTOM CREDIT ─────────────────────────────────────
local CreditLbl = Instance.new("TextLabel", C)
CreditLbl.Size   = UDim2.new(1,0,0,14)
CreditLbl.Position = UDim2.new(0,0,1,-14)
CreditLbl.BackgroundTransparency = 1
CreditLbl.Text   = "67HUB XoSh  •  ON TOP  👑"
CreditLbl.Font   = Enum.Font.GothamBold
CreditLbl.TextSize = 10
CreditLbl.TextColor3 = Color3.fromRGB(0,110,190)
CreditLbl.TextXAlignment = Enum.TextXAlignment.Center
CreditLbl.ZIndex = 3
task.spawn(function()
    while CreditLbl.Parent do
        TweenService:Create(CreditLbl,TweenInfo.new(1.8,Enum.EasingStyle.Sine),{TextTransparency=0.65}):Play()
        task.wait(1.8)
        TweenService:Create(CreditLbl,TweenInfo.new(1.8,Enum.EasingStyle.Sine),{TextTransparency=0}):Play()
        task.wait(1.8)
    end
end)

-- ── ENTRANCE ──────────────────────────────────────────
Overlay.BackgroundTransparency = 1
Card.Size             = UDim2.new(0.78,0,0,0)
Card.BackgroundTransparency = 1

TweenService:Create(Overlay, TweenInfo.new(0.35), {BackgroundTransparency=0.55}):Play()
task.wait(0.25)
TweenService:Create(Card, TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out), {
    Size = UDim2.new(0.78,0,0,300),
    BackgroundTransparency = 0.04
}):Play()

