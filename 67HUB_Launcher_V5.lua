--========================================================
-- 67 HUB XoSh — Script Launcher V5
-- Clean 5-script build, instant launch, no startup delay
--========================================================

local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService       = game:GetService("RunService")
local player           = Players.LocalPlayer

local openLauncher -- forward declaration, defined after GUI is built

local SCRIPTS = {}

table.insert(SCRIPTS, {
    name  = "Freeze Trade Legit",
    icon  = "❄️",
    desc  = "FREEZE • TRADE • LEGIT",
    isNew = true,
    kind  = "embed",
    code  = [[
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NexioHub"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local parentSuccess = pcall(function()
	screenGui.Parent = PlayerGui
end)
if not parentSuccess then
	screenGui.Parent = game:GetService("CoreGui")
end

local baseSize = isMobile and UDim2.new(0, 300, 0, 370) or UDim2.new(0, 340, 0, 400)
local basePos = UDim2.new(0.5, isMobile and -150 or -170, 0.5, isMobile and -185 or -200)

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.Position = basePos
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 5, 20)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 18)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(180, 60, 255)
mainStroke.Transparency = 0.3
mainStroke.Thickness = 1.5
mainStroke.Parent = mainFrame

local bgGradient = Instance.new("UIGradient")
bgGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 5, 50)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(15, 5, 35)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 8, 65))
})
bgGradient.Rotation = 135
bgGradient.Parent = mainFrame

local glowFrame = Instance.new("Frame")
glowFrame.Size = UDim2.new(1, 0, 0, 3)
glowFrame.Position = UDim2.new(0, 0, 0, 0)
glowFrame.BackgroundColor3 = Color3.fromRGB(180, 60, 255)
glowFrame.BorderSizePixel = 0
glowFrame.ZIndex = 5
glowFrame.Parent = mainFrame

local glowGrad = Instance.new("UIGradient")
glowGrad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 0, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(220, 80, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 0, 255))
})
glowGrad.Parent = glowFrame

local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, 55)
topBar.Position = UDim2.new(0, 0, 0, 3)
topBar.BackgroundTransparency = 1
topBar.ZIndex = 3
topBar.Parent = mainFrame

local logoContainer = Instance.new("Frame")
logoContainer.Size = UDim2.new(0, 36, 0, 36)
logoContainer.Position = UDim2.new(0, 14, 0.5, -18)
logoContainer.BackgroundColor3 = Color3.fromRGB(140, 40, 220)
logoContainer.BorderSizePixel = 0
logoContainer.ZIndex = 4
logoContainer.Parent = topBar

local logoCorner = Instance.new("UICorner")
logoCorner.CornerRadius = UDim.new(0, 8)
logoCorner.Parent = logoContainer

local logoGrad = Instance.new("UIGradient")
logoGrad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 60, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 0, 180))
})
logoGrad.Rotation = 135
logoGrad.Parent = logoContainer

local logoLabel = Instance.new("TextLabel")
logoLabel.Size = UDim2.new(1, 0, 1, 0)
logoLabel.BackgroundTransparency = 1
logoLabel.Text = "N"
logoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
logoLabel.TextScaled = true
logoLabel.Font = Enum.Font.GothamBold
logoLabel.ZIndex = 5
logoLabel.Parent = logoContainer

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 120, 0, 22)
titleLabel.Position = UDim2.new(0, 58, 0, 8)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "NEXIO HUB"
titleLabel.TextColor3 = Color3.fromRGB(220, 150, 255)
titleLabel.TextScaled = false
titleLabel.TextSize = isMobile and 14 or 15
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.ZIndex = 4
titleLabel.Parent = topBar

local titleGrad = Instance.new("UIGradient")
titleGrad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 180, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(160, 60, 255))
})
titleGrad.Parent = titleLabel

local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(0, 170, 0, 16)
subtitleLabel.Position = UDim2.new(0, 58, 0, 30)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "Trade Controller"
subtitleLabel.TextColor3 = Color3.fromRGB(150, 100, 200)
subtitleLabel.TextScaled = false
subtitleLabel.TextSize = isMobile and 10 or 11
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.ZIndex = 4
subtitleLabel.Parent = topBar

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 28, 0, 28)
minimizeBtn.Position = UDim2.new(1, -42, 0.5, -14)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(60, 20, 90)
minimizeBtn.Text = "−"
minimizeBtn.TextColor3 = Color3.fromRGB(200, 150, 255)
minimizeBtn.TextSize = 16
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.BorderSizePixel = 0
minimizeBtn.ZIndex = 6
minimizeBtn.Parent = topBar

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 7)
minCorner.Parent = minimizeBtn

local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, -28, 0, 1)
divider.Position = UDim2.new(0, 14, 0, 58)
divider.BackgroundColor3 = Color3.fromRGB(120, 40, 200)
divider.BackgroundTransparency = 0.5
divider.BorderSizePixel = 0
divider.Parent = mainFrame

local divGrad = Instance.new("UIGradient")
divGrad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0,0,0)),
	ColorSequenceKeypoint.new(0.3, Color3.fromRGB(180,60,255)),
	ColorSequenceKeypoint.new(0.7, Color3.fromRGB(180,60,255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))
})
divGrad.Parent = divider

local contentFrame = Instance.new("Frame")
contentFrame.Name = "Content"
contentFrame.Size = UDim2.new(1, 0, 1, -60)
contentFrame.Position = UDim2.new(0, 0, 0, 60)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

local contentLayout = Instance.new("UIListLayout")
contentLayout.Padding = UDim.new(0, 10)
contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
contentLayout.VerticalAlignment = Enum.VerticalAlignment.Top
contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
contentLayout.Parent = contentFrame

local contentPadding = Instance.new("UIPadding")
contentPadding.PaddingTop = UDim.new(0, 14)
contentPadding.PaddingLeft = UDim.new(0, 14)
contentPadding.PaddingRight = UDim.new(0, 14)
contentPadding.Parent = contentFrame

local function createToggleButton(name, icon, order)
	local btnHeight = isMobile and 52 or 58

	local container = Instance.new("Frame")
	container.Name = name .. "Container"
	container.Size = UDim2.new(1, 0, 0, btnHeight)
	container.BackgroundColor3 = Color3.fromRGB(20, 8, 40)
	container.BackgroundTransparency = 0.2
	container.BorderSizePixel = 0
	container.LayoutOrder = order
	container.Parent = contentFrame

	local containerCorner = Instance.new("UICorner")
	containerCorner.CornerRadius = UDim.new(0, 12)
	containerCorner.Parent = container

	local containerStroke = Instance.new("UIStroke")
	containerStroke.Color = Color3.fromRGB(120, 40, 200)
	containerStroke.Transparency = 0.6
	containerStroke.Thickness = 1
	containerStroke.Parent = container

	local containerGrad = Instance.new("UIGradient")
	containerGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 10, 65)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 5, 38))
	})
	containerGrad.Rotation = 135
	containerGrad.Parent = container

	local iconLabel = Instance.new("TextLabel")
	iconLabel.Size = UDim2.new(0, 32, 0, 32)
	iconLabel.Position = UDim2.new(0, 12, 0.5, -16)
	iconLabel.BackgroundColor3 = Color3.fromRGB(100, 30, 170)
	iconLabel.Text = icon
	iconLabel.TextColor3 = Color3.fromRGB(220, 150, 255)
	iconLabel.TextScaled = true
	iconLabel.Font = Enum.Font.GothamBold
	iconLabel.BorderSizePixel = 0
	iconLabel.ZIndex = 2
	iconLabel.Parent = container

	local iconCorner = Instance.new("UICorner")
	iconCorner.CornerRadius = UDim.new(0, 8)
	iconCorner.Parent = iconLabel

	local nameLabel = Instance.new("TextLabel")
	nameLabel.Name = "ButtonName"
	nameLabel.Size = UDim2.new(1, -110, 0, 20)
	nameLabel.Position = UDim2.new(0, 54, 0.5, -14)
	nameLabel.BackgroundTransparency = 1
	nameLabel.Text = name
	nameLabel.TextColor3 = Color3.fromRGB(230, 200, 255)
	nameLabel.TextScaled = false
	nameLabel.TextSize = isMobile and 12 or 13
	nameLabel.Font = Enum.Font.GothamBold
	nameLabel.TextXAlignment = Enum.TextXAlignment.Left
	nameLabel.ZIndex = 2
	nameLabel.Parent = container

	local statusLabel = Instance.new("TextLabel")
	statusLabel.Name = "StatusLabel"
	statusLabel.Size = UDim2.new(1, -110, 0, 14)
	statusLabel.Position = UDim2.new(0, 54, 0.5, 2)
	statusLabel.BackgroundTransparency = 1
	statusLabel.Text = "Inactive"
	statusLabel.TextColor3 = Color3.fromRGB(120, 80, 160)
	statusLabel.TextScaled = false
	statusLabel.TextSize = isMobile and 9 or 10
	statusLabel.Font = Enum.Font.Gotham
	statusLabel.TextXAlignment = Enum.TextXAlignment.Left
	statusLabel.ZIndex = 2
	statusLabel.Parent = container

	local toggleTrack = Instance.new("Frame")
	toggleTrack.Size = UDim2.new(0, 44, 0, 24)
	toggleTrack.Position = UDim2.new(1, -56, 0.5, -12)
	toggleTrack.BackgroundColor3 = Color3.fromRGB(40, 15, 70)
	toggleTrack.BorderSizePixel = 0
	toggleTrack.ZIndex = 2
	toggleTrack.Parent = container

	local trackCorner = Instance.new("UICorner")
	trackCorner.CornerRadius = UDim.new(1, 0)
	trackCorner.Parent = toggleTrack

	local trackStroke = Instance.new("UIStroke")
	trackStroke.Color = Color3.fromRGB(100, 30, 160)
	trackStroke.Transparency = 0.3
	trackStroke.Thickness = 1
	trackStroke.Parent = toggleTrack

	local toggleKnob = Instance.new("Frame")
	toggleKnob.Size = UDim2.new(0, 18, 0, 18)
	toggleKnob.Position = UDim2.new(0, 3, 0.5, -9)
	toggleKnob.BackgroundColor3 = Color3.fromRGB(160, 100, 220)
	toggleKnob.BorderSizePixel = 0
	toggleKnob.ZIndex = 3
	toggleKnob.Parent = toggleTrack

	local knobCorner = Instance.new("UICorner")
	knobCorner.CornerRadius = UDim.new(1, 0)
	knobCorner.Parent = toggleKnob

	local clickBtn = Instance.new("TextButton")
	clickBtn.Size = UDim2.new(1, 0, 1, 0)
	clickBtn.BackgroundTransparency = 1
	clickBtn.Text = ""
	clickBtn.ZIndex = 4
	clickBtn.Parent = container

	local isOn = false

	local function animateToggle(state)
		isOn = state
		local knobPos = state and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
		local trackColor = state and Color3.fromRGB(120, 40, 200) or Color3.fromRGB(40, 15, 70)
		local knobColor = state and Color3.fromRGB(220, 150, 255) or Color3.fromRGB(160, 100, 220)
		local strokeColor = state and Color3.fromRGB(180, 60, 255) or Color3.fromRGB(100, 30, 160)
		local containerStrokeColor = state and Color3.fromRGB(180, 60, 255) or Color3.fromRGB(120, 40, 200)
		local containerStrokeTransp = state and 0.2 or 0.6
		local statusText = state and "Active" or "Inactive"
		local statusColor = state and Color3.fromRGB(200, 130, 255) or Color3.fromRGB(120, 80, 160)
		local iconBg = state and Color3.fromRGB(140, 50, 210) or Color3.fromRGB(100, 30, 170)

		TweenService:Create(toggleKnob, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = knobPos, BackgroundColor3 = knobColor}):Play()
		TweenService:Create(toggleTrack, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = trackColor}):Play()
		TweenService:Create(trackStroke, TweenInfo.new(0.2), {Color = strokeColor}):Play()
		TweenService:Create(containerStroke, TweenInfo.new(0.2), {Color = containerStrokeColor, Transparency = containerStrokeTransp}):Play()
		TweenService:Create(iconLabel, TweenInfo.new(0.2), {BackgroundColor3 = iconBg}):Play()

		statusLabel.Text = statusText
		TweenService:Create(statusLabel, TweenInfo.new(0.2), {TextColor3 = statusColor}):Play()

		local punchTween = TweenService:Create(container, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0})
		punchTween:Play()
		punchTween.Completed:Connect(function()
			TweenService:Create(container, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.2}):Play()
		end)

		if state then
			local ripple = Instance.new("Frame")
			ripple.Size = UDim2.new(0, 0, 0, 0)
			ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
			ripple.BackgroundColor3 = Color3.fromRGB(180, 60, 255)
			ripple.BackgroundTransparency = 0.5
			ripple.BorderSizePixel = 0
			ripple.ZIndex = 5
			ripple.ClipsDescendants = false
			ripple.Parent = container
			local rippleCorner = Instance.new("UICorner")
			rippleCorner.CornerRadius = UDim.new(1, 0)
			rippleCorner.Parent = ripple
			TweenService:Create(ripple, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, 300, 0, 300),
				Position = UDim2.new(0.5, -150, 0.5, -150),
				BackgroundTransparency = 1
			}):Play()
			task.delay(0.5, function() ripple:Destroy() end)
		end

		print("[Nexio] " .. name .. " -> " .. (state and "ON" or "OFF"))
	end

	clickBtn.MouseButton1Click:Connect(function() animateToggle(not isOn) end)
	clickBtn.MouseEnter:Connect(function() TweenService:Create(container, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play() end)
	clickBtn.MouseLeave:Connect(function() TweenService:Create(container, TweenInfo.new(0.15), {BackgroundTransparency = 0.2}):Play() end)
end

createToggleButton("Freeze Trade", "❄", 1)
createToggleButton("Auto Accept", "✓", 2)
createToggleButton("Cancel Trade", "✕", 3)

local footerFrame = Instance.new("Frame")
footerFrame.Size = UDim2.new(1, 0, 0, 50)
footerFrame.BackgroundTransparency = 1
footerFrame.LayoutOrder = 4
footerFrame.Parent = contentFrame

local madeByLabel = Instance.new("TextLabel")
madeByLabel.Size = UDim2.new(1, 0, 0, 16)
madeByLabel.Position = UDim2.new(0, 0, 0, 4)
madeByLabel.BackgroundTransparency = 1
madeByLabel.Text = "Made By Nexio"
madeByLabel.TextColor3 = Color3.fromRGB(160, 100, 220)
madeByLabel.TextScaled = false
madeByLabel.TextSize = isMobile and 10 or 11
madeByLabel.Font = Enum.Font.GothamBold
madeByLabel.TextXAlignment = Enum.TextXAlignment.Center
madeByLabel.Parent = footerFrame

local socLabel = Instance.new("TextLabel")
socLabel.Size = UDim2.new(1, 0, 0, 14)
socLabel.Position = UDim2.new(0, 0, 0, 22)
socLabel.BackgroundTransparency = 1
socLabel.Text = "YT: ZeroScriptsOnTop • TT: nexioontopyt"
socLabel.TextColor3 = Color3.fromRGB(100, 60, 150)
socLabel.TextScaled = false
socLabel.TextSize = isMobile and 9 or 10
socLabel.Font = Enum.Font.Gotham
socLabel.TextXAlignment = Enum.TextXAlignment.Center
socLabel.Parent = footerFrame

local minimized = false
local fullSize = baseSize
local miniSize = UDim2.new(0, fullSize.X.Offset, 0, 58)

minimizeBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		minimizeBtn.Text = "+"
		TweenService:Create(mainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {Size = miniSize}):Play()
	else
		minimizeBtn.Text = "−"
		TweenService:Create(mainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = fullSize}):Play()
	end
end)

local dragging = false
local dragStart = nil
local startPos = nil

local function onDragBegan(input)
	dragging = true
	dragStart = input.Position
	startPos = mainFrame.Position
end

local function onDragChanged(input)
	if dragging then
		local delta = input.Position - dragStart
		mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end

local function onDragEnded()
	dragging = false
end

topBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		onDragBegan(input)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		onDragChanged(input)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		onDragEnded()
	end
end)

TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = fullSize}):Play()

local shimmerFrame = Instance.new("Frame")
shimmerFrame.Size = UDim2.new(0, 60, 1, 0)
shimmerFrame.Position = UDim2.new(-0.3, 0, 0, 0)
shimmerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
shimmerFrame.BackgroundTransparency = 0.92
shimmerFrame.BorderSizePixel = 0
shimmerFrame.ZIndex = 6
shimmerFrame.ClipsDescendants = false
shimmerFrame.Parent = mainFrame

local shimCorner = Instance.new("UICorner")
shimCorner.CornerRadius = UDim.new(0, 18)
shimCorner.Parent = shimmerFrame

local shimGrad = Instance.new("UIGradient")
shimGrad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0,0,0)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255,255,255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))
})
shimGrad.Rotation = 15
shimGrad.Parent = shimmerFrame

local function playShimmer()
	shimmerFrame.Position = UDim2.new(-0.3, 0, 0, 0)
	local t = TweenService:Create(shimmerFrame, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Position = UDim2.new(1.3, 0, 0, 0)})
	t:Play()
	t.Completed:Connect(function() task.delay(4, playShimmer) end)
end

task.delay(1, playShimmer)

RunService.Heartbeat:Connect(function()
	local t = tick()
	local alpha = (math.sin(t * 1.5) + 1) / 2
	mainStroke.Transparency = 0.2 + alpha * 0.4
end)
]],
})

table.insert(SCRIPTS, {
    name  = "67 Invisible",
    icon  = "👻",
    desc  = "INVISIBLE • SEMI-INVIS • STEAL",
    isNew = true,
    kind  = "embed",
    code  = [[
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local player = Players.LocalPlayer

local connections = {SemiInvisible = {}}
local isInvisible = false
local clone, oldRoot, hip, animTrack, connection, characterConnection

for _, gui in pairs(game.CoreGui:GetChildren()) do
    if gui.Name == "ok" then gui:Destroy() end
end
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "67Invisible"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = game.CoreGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 120, 0, 80)
mainFrame.Position = UDim2.new(0.5, -60, 0.7, -40)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 6)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(255, 50, 50)
mainStroke.Thickness = 1
mainStroke.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 20)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "67 Invisible"
titleLabel.TextColor3 = Color3.fromRGB(139, 0, 0)
titleLabel.TextSize = 12
titleLabel.Parent = mainFrame

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 18, 0, 18)
closeBtn.Position = UDim2.new(1, -20, 0, 1)
closeBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 10
closeBtn.Parent = mainFrame

local closeBtnCorner = Instance.new("UICorner")
closeBtnCorner.CornerRadius = UDim.new(0, 4)
closeBtnCorner.Parent = closeBtn

local closeBtnStroke = Instance.new("UIStroke")
closeBtnStroke.Color = Color3.fromRGB(255, 50, 50)
closeBtnStroke.Thickness = 1
closeBtnStroke.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(1, -10, 0, 30)
toggleBtn.Position = UDim2.new(0, 5, 0, 25)
toggleBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
toggleBtn.BorderSizePixel = 0
toggleBtn.Text = "invisible off"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.TextSize = 12
toggleBtn.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 6)
btnCorner.Parent = toggleBtn

local btnStroke = Instance.new("UIStroke")
btnStroke.Color = Color3.fromRGB(255, 50, 50)
btnStroke.Thickness = 1
btnStroke.Parent = toggleBtn

local function removeFolders()
    local playerName = player.Name
    local playerFolder = Workspace:FindFirstChild(playerName)
    if not playerFolder then return end
    local doubleRig = playerFolder:FindFirstChild("DoubleRig")
    if doubleRig then doubleRig:Destroy() end
    local constraints = playerFolder:FindFirstChild("Constraints")
    if constraints then constraints:Destroy() end
    local childAddedConn = playerFolder.ChildAdded:Connect(function(child)
        if child.Name == "DoubleRig" or child.Name == "Constraints" then
            child:Destroy()
        end
    end)
    table.insert(connections.SemiInvisible, childAddedConn)
end

local function doClone()
    if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
        hip = player.Character.Humanoid.HipHeight
        oldRoot = player.Character:FindFirstChild("HumanoidRootPart")
        if not oldRoot or not oldRoot.Parent then return false end
        local tempParent = Instance.new("Model")
        tempParent.Parent = game
        player.Character.Parent = tempParent
        clone = oldRoot:Clone()
        clone.Parent = player.Character
        oldRoot.Parent = game.Workspace.CurrentCamera
        clone.CFrame = oldRoot.CFrame
        player.Character.PrimaryPart = clone
        player.Character.Parent = game.Workspace
        for _, v in pairs(player.Character:GetDescendants()) do
            if v:IsA("Weld") or v:IsA("Motor6D") then
                if v.Part0 == oldRoot then v.Part0 = clone end
                if v.Part1 == oldRoot then v.Part1 = clone end
            end
        end
        tempParent:Destroy()
        return true
    end
    return false
end

local function revertClone()
    if not oldRoot or not oldRoot:IsDescendantOf(game.Workspace) or not player.Character or player.Character.Humanoid.Health <= 0 then
        return false
    end
    local tempParent = Instance.new("Model")
    tempParent.Parent = game
    player.Character.Parent = tempParent
    oldRoot.Parent = player.Character
    player.Character.PrimaryPart = oldRoot
    player.Character.Parent = game.Workspace
    oldRoot.CanCollide = true
    for _, v in pairs(player.Character:GetDescendants()) do
        if v:IsA("Weld") or v:IsA("Motor6D") then
            if v.Part0 == clone then v.Part0 = oldRoot end
            if v.Part1 == clone then v.Part1 = oldRoot end
        end
    end
    if clone then
        local oldPos = clone.CFrame
        clone:Destroy()
        clone = nil
        oldRoot.CFrame = oldPos
    end
    oldRoot = nil
    if player.Character and player.Character.Humanoid then
        player.Character.Humanoid.HipHeight = hip
    end
end

local function animationTrickery()
    if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
        local anim = Instance.new("Animation")
        anim.AnimationId = "http://www.roblox.com/asset/?id=18537363391"
        local humanoid = player.Character.Humanoid
        local animator = humanoid:FindFirstChild("Animator") or Instance.new("Animator", humanoid)
        animTrack = animator:LoadAnimation(anim)
        animTrack.Priority = Enum.AnimationPriority.Action4
        animTrack:Play(0, 1, 0)
        anim:Destroy()
        local animStoppedConn = animTrack.Stopped:Connect(function()
            if isInvisible then animationTrickery() end
        end)
        table.insert(connections.SemiInvisible, animStoppedConn)
        task.delay(0, function()
            animTrack.TimePosition = 0.7
            task.delay(1, function()
                animTrack:AdjustSpeed(math.huge)
            end)
        end)
    end
end

local function enableInvisibility()
    if not player.Character or player.Character.Humanoid.Health <= 0 then
        return false
    end
    removeFolders()
    local success = doClone()
    if success then
        task.wait(0.1)
        animationTrickery()
        connection = RunService.PreSimulation:Connect(function(dt)
            if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 and oldRoot then
                local root = player.Character.PrimaryPart or player.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    local cf = root.CFrame - Vector3.new(0, player.Character.Humanoid.HipHeight + (root.Size.Y / 2) - 1 + 0.09, 0)
                    oldRoot.CFrame = cf * CFrame.Angles(math.rad(180), 0, 0)
                    oldRoot.Velocity = root.Velocity
                    oldRoot.CanCollide = false
                end
            end
        end)
        table.insert(connections.SemiInvisible, connection)
        characterConnection = player.CharacterAdded:Connect(function(newChar)
            if isInvisible then
                if animTrack then
                    animTrack:Stop()
                    animTrack:Destroy()
                    animTrack = nil
                end
                if connection then connection:Disconnect() end
                revertClone()
                removeFolders()
                isInvisible = false
                for _, conn in ipairs(connections.SemiInvisible) do
                    if conn then conn:Disconnect() end
                end
                connections.SemiInvisible = {}
            end
        end)
        table.insert(connections.SemiInvisible, characterConnection)
        return true
    end
    return false
end

local function disableInvisibility()
    if animTrack then
        animTrack:Stop()
        animTrack:Destroy()
        animTrack = nil
    end
    if connection then connection:Disconnect() end
    if characterConnection then characterConnection:Disconnect() end
    revertClone()
    removeFolders()
end

local function setupGodmode()
    local char = player.Character or player.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid")
    local mt = getrawmetatable(game)
    local oldNC = mt.__namecall
    local oldNI = mt.__newindex
    setreadonly(mt, false)
    mt.__namecall = newcclosure(function(self, ...)
        local m = getnamecallmethod()
        if self == hum then
            if m == "ChangeState" and select(1, ...) == Enum.HumanoidStateType.Dead then
                return
            end
            if m == "SetStateEnabled" then
                local st, en = ...
                if st == Enum.HumanoidStateType.Dead and en == true then
                    return
                end
            end
            if m == "Destroy" then
                return
            end
        end
        if self == char and m == "BreakJoints" then
            return
        end
        return oldNC(self, ...)
    end)
    mt.__newindex = newcclosure(function(self, k, v)
        if self == hum then
            if k == "Health" and type(v) == "number" and v <= 0 then
                return
            end
            if k == "MaxHealth" and type(v) == "number" and v < hum.MaxHealth then
                return
            end
            if k == "BreakJointsOnDeath" and v == true then
                return
            end
            if k == "Parent" and v == nil then
                return
            end
        end
        return oldNI(self, k, v)
    end)
    setreadonly(mt, true)
end

toggleBtn.MouseButton1Click:Connect(function()
    isInvisible = not isInvisible
    
    if isInvisible then
        toggleBtn.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
        toggleBtn.Text = "invisible on"
        removeFolders()
        setupGodmode()
        enableInvisibility()
    else
        toggleBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
        toggleBtn.Text = "invisible off"
        disableInvisibility()
        for _, conn in ipairs(connections.SemiInvisible) do
            if conn then conn:Disconnect() end
        end
        connections.SemiInvisible = {}
    end
end)
]],
})

table.insert(SCRIPTS, {
    name  = "Best Pet ESP",
    icon  = "👁️",
    desc  = "ESP • PET TRACKER • OVERLAY",
    isNew = false,
    kind  = "embed",
    code  = [[
local CoreGui = game:GetService("CoreGui")

local Workspace = game:GetService("Workspace")

-- Estado global

getgenv().BestPetESP = getgenv().BestPetESP or {

    active = false,

    loop = nil,

    currentESP = nil

}

-- Parse valor (ex: "1.5K/s" -> 1500)

local function parseValue(text)

    text = tostring(text or ""):gsub("%s", "")

    local num, suffix = text:match("([%d%.]+)([KkMmBbTt]?)")

    if not num then return 0 end

    num = tonumber(num) or 0

    local multipliers = {K=1e3, M=1e6, B=1e9, T=1e12}

    local mult = multipliers[(suffix or ""):upper()] or 1

    return num * mult

end

-- Criar ESP Billboard

local function createESP(part, displayText, valueText)

    if getgenv().BestPetESP.currentESP then

        pcall(function() getgenv().BestPetESP.currentESP:Destroy() end)

    end

    

    if not part then 

        print("[ESP] âš ï¸ Part invÃ¡lido para criar ESP")

        return 

    end

    

    local bb = Instance.new("BillboardGui")

    bb.Name = "BestPetESP"

    bb.Size = UDim2.new(0, 200, 0, 50)

    bb.AlwaysOnTop = true

    bb.StudsOffset = Vector3.new(0, 3, 0)

    bb.Adornee = part

    bb.Parent = CoreGui

    

    local name = Instance.new("TextLabel", bb)

    name.Size = UDim2.new(1, 0, 0, 25)

    name.BackgroundTransparency = 1

    name.TextScaled = true

    name.Font = Enum.Font.GothamBold

    name.Text = displayText

    name.TextColor3 = Color3.fromRGB(255, 255, 0)

    name.TextStrokeTransparency = 0.5

    

    local value = Instance.new("TextLabel", bb)

    value.Size = UDim2.new(1, 0, 0, 25)

    value.Position = UDim2.new(0, 0, 0, 25)

    value.BackgroundTransparency = 1

    value.TextScaled = true

    value.Font = Enum.Font.GothamBold

    value.Text = valueText

    value.TextColor3 = Color3.fromRGB(0, 255, 100)

    value.TextStrokeTransparency = 0.5

    

    getgenv().BestPetESP.currentESP = bb

    print(string.format("[ESP] âœ… ESP criado: %s | %s", displayText, valueText))

end

-- Loop de detecÃ§Ã£o

local function startESP()

    if getgenv().BestPetESP.active then 

        print("[ESP] JÃ¡ estÃ¡ ativo!")

        return 

    end

    getgenv().BestPetESP.active = true

    print("[ESP] ðŸš€ Iniciado - Procurando todos FastOverheadTemplate em Debris")

    

    getgenv().BestPetESP.loop = task.spawn(function()

        while getgenv().BestPetESP.active do

            local debris = Workspace:FindFirstChild("Debris")

            if not debris then

                warn("[ESP] Debris nÃ£o encontrado no Workspace!")

                task.wait(0.5)

                continue

            end

            

            local bestPet = {value = -1, part = nil, text = "", display = "", template = nil}

            local templatesFound = 0

            

            -- Procura TODOS os FastOverheadTemplate dentro de Debris

            for _, template in ipairs(debris:GetChildren()) do

                if template.Name == "FastOverheadTemplate" then

                    templatesFound = templatesFound + 1

                    print(string.format("[ESP] ðŸ“¦ Template #%d encontrado", templatesFound))

                    

                    -- Procura SurfaceGui dentro do template

                    local surfaceGui = template:FindFirstChildOfClass("SurfaceGui")

                    if not surfaceGui then

                        print(string.format("[ESP] âš ï¸ Template #%d nÃ£o tem SurfaceGui", templatesFound))

                        continue

                    end

                    

                    print(string.format("[ESP] âœ… SurfaceGui encontrado no Template #%d", templatesFound))

                    

                    -- Procura Generation dentro do SurfaceGui (recursivo)

                    local genLabel = surfaceGui:FindFirstChild("Generation", true)

                    if not genLabel or not genLabel:IsA("TextLabel") then

                        print(string.format("[ESP] âš ï¸ Template #%d nÃ£o tem Generation TextLabel", templatesFound))

                        continue

                    end

                    

                    local text = genLabel.Text or ""

                    print(string.format("[ESP] ðŸ’° Template #%d | Generation: '%s'", templatesFound, text))

                    

                    -- Valida se tem valor

                    if text ~= "" and (text:find("/s") or text:find("K") or text:find("M") or text:find("B")) then

                        local val = parseValue(text)

                        print(string.format("[ESP] ðŸ“Š Template #%d | Valor: %.2f", templatesFound, val))

                        

                        if val > bestPet.value then

                            -- Pega o Adornee (parte 3D onde o GUI estÃ¡ anexado)

                            local targetPart = surfaceGui.Adornee

                            if targetPart and targetPart:IsA("BasePart") then

                                local displayName = surfaceGui:FindFirstChild("DisplayName", true)

                                bestPet = {

                                    part = targetPart,

                                    value = val,

                                    text = text,

                                    display = displayName and displayName.Text or "Pet",

                                    template = template

                                }

                                print(string.format("[ESP] ðŸŽ¯ NOVO BEST PET! Template #%d | %s | %.2f", templatesFound, bestPet.display, val))

                            else

                                print(string.format("[ESP] âš ï¸ Template #%d | SurfaceGui sem Adornee vÃ¡lido", templatesFound))

                            end

                        end

                    else

                        print(string.format("[ESP] âš ï¸ Template #%d | Generation sem formato vÃ¡lido", templatesFound))

                    end

                end

            end

            

            print(string.format("[ESP] ðŸ“‹ Scan completo: %d FastOverheadTemplate encontrados", templatesFound))

            

            -- Cria ESP no melhor pet

            if bestPet.part and bestPet.part.Parent then

                print(string.format("[ESP] ðŸ† MELHOR PET: %s (%s) com valor %.2f", bestPet.display, bestPet.text, bestPet.value))

                createESP(bestPet.part, bestPet.display, bestPet.text)

            else

                print("[ESP] âŒ Nenhum pet vÃ¡lido encontrado para ESP")

            end

            

            task.wait(0.5)

        end

        

        -- Limpa ESP ao parar

        if getgenv().BestPetESP.currentESP then

            pcall(function() getgenv().BestPetESP.currentESP:Destroy() end)

            getgenv().BestPetESP.currentESP = nil

        end

        print("[ESP] ðŸ›‘ Finalizado")

    end)

end

local function stopESP()

    getgenv().BestPetESP.active = false

    print("[ESP] ðŸ›‘ Parando...")

    

    if getgenv().BestPetESP.loop then

        task.cancel(getgenv().BestPetESP.loop)

    end

    if getgenv().BestPetESP.currentESP then

        pcall(function() getgenv().BestPetESP.currentESP:Destroy() end)

        getgenv().BestPetESP.currentESP = nil

    end

    

    print("[ESP] âœ… Desativado")

end

-- Remover GUI antiga

local old = CoreGui:FindFirstChild("SimplePetESP")

if old then old:Destroy() end

-- Criar GUI simples

local gui = Instance.new("ScreenGui")

gui.Name = "SimplePetESP"

gui.ResetOnSpawn = false

gui.Parent = CoreGui

local frame = Instance.new("Frame", gui)

frame.Size = UDim2.new(0, 200, 0, 80)

frame.Position = UDim2.new(0, 20, 0, 20)

frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

frame.BorderSizePixel = 0

frame.Active = true

-- Arrastar

local dragging, dragStart, startPos

frame.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1 then

        dragging = true

        dragStart = input.Position

        startPos = frame.Position

    end

end)

frame.InputChanged:Connect(function(input)

    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then

        local delta = input.Position - dragStart

        frame.Position = UDim2.new(

            startPos.X.Scale, startPos.X.Offset + delta.X,

            startPos.Y.Scale, startPos.Y.Offset + delta.Y

        )

    end

end)

frame.InputEnded:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1 then

        dragging = false

    end

end)

-- TÃ­tulo

local title = Instance.new("TextLabel", frame)

title.Size = UDim2.new(1, -10, 0, 25)

title.Position = UDim2.new(0, 5, 0, 5)

title.BackgroundTransparency = 1

title.Text = "Best Pet ESP"

title.TextColor3 = Color3.fromRGB(255, 255, 255)

title.Font = Enum.Font.GothamBold

title.TextSize = 16

-- BotÃ£o ON/OFF

local btn = Instance.new("TextButton", frame)

btn.Size = UDim2.new(1, -20, 0, 35)

btn.Position = UDim2.new(0, 10, 0, 35)

btn.Text = "LIGAR ESP"

btn.Font = Enum.Font.GothamBold

btn.TextSize = 18

btn.BackgroundColor3 = Color3.fromRGB(50, 180, 50)

btn.TextColor3 = Color3.fromRGB(0, 0, 0)

btn.BorderSizePixel = 0

local corner = Instance.new("UICorner", btn)

corner.CornerRadius = UDim.new(0, 6)

btn.MouseButton1Click:Connect(function()

    if getgenv().BestPetESP.active then

        stopESP()

        btn.Text = "LIGAR ESP"

        btn.BackgroundColor3 = Color3.fromRGB(50, 180, 50)

    else

        startESP()

        btn.Text = "DESLIGAR ESP"

        btn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)

    end

end)

-- Adicionar canto arredondado no frame

local frameCorner = Instance.new("UICorner", frame)

frameCorner.CornerRadius = UDim.new(0, 8)
]],
})

table.insert(SCRIPTS, {
    name  = "Insta Grab",
    icon  = "🎯",
    desc  = "INSTANT STEAL • AUTO GRAB",
    isNew = false,
    kind  = "embed",
    code  = [[
local CONFIG = {
    AUTO_STEAL_NEAREST = false,
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local AnimalsData = require(ReplicatedStorage:WaitForChild("Datas"):WaitForChild("Animals"))

local allAnimalsCache = {}
local PromptMemoryCache = {}
local InternalStealCache = {}
local LastTargetUID = nil
local LastPlayerPosition = nil
local PlayerVelocity = Vector3.zero

local AUTO_STEAL_PROX_RADIUS = 20
local IsStealing = false
local StealProgress = 0
local CurrentStealTarget = nil
local StealStartTime = 0

local CIRCLE_RADIUS = AUTO_STEAL_PROX_RADIUS
local PART_THICKNESS = 0.3
local PART_HEIGHT = 0.2
local PART_COLOR = Color3.fromRGB(0, 255, 255)
local PartsCount = 65
local circleParts = {}
local circleEnabled = true

local stealConnection = nil
local velocityConnection = nil

local function getHRP()
    local char = LocalPlayer.Character
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso")
end

local function isMyBase(plotName)
    local plot = workspace.Plots:FindFirstChild(plotName)
    if not plot then return false end
    
    local sign = plot:FindFirstChild("PlotSign")
    if sign then
        local yourBase = sign:FindFirstChild("YourBase")
        if yourBase and yourBase:IsA("BillboardGui") then
            return yourBase.Enabled == true
        end
    end
    return false
end

local function scanSinglePlot(plot)
    if not plot or not plot:IsA("Model") then return end
    if isMyBase(plot.Name) then return end
    
    local podiums = plot:FindFirstChild("AnimalPodiums")
    if not podiums then return end
    
    for _, podium in ipairs(podiums:GetChildren()) do
        if podium:IsA("Model") and podium:FindFirstChild("Base") then
            local animalName = "Unknown"
            local spawn = podium.Base:FindFirstChild("Spawn")
            if spawn then
                for _, child in ipairs(spawn:GetChildren()) do
                    if child:IsA("Model") and child.Name ~= "PromptAttachment" then
                        animalName = child.Name
                        local animalInfo = AnimalsData[animalName]
                        if animalInfo and animalInfo.DisplayName then
                            animalName = animalInfo.DisplayName
                        end
                        break
                    end
                end
            end
            
            table.insert(allAnimalsCache, {
                name = animalName,
                plot = plot.Name,
                slot = podium.Name,
                worldPosition = podium:GetPivot().Position,
                uid = plot.Name .. "_" .. podium.Name,
            })
        end
    end
end

local function initializeScanner()
    task.wait(2)
    
    local plots = workspace:WaitForChild("Plots", 10)
    if not plots then 
        return
    end
    
    for _, plot in ipairs(plots:GetChildren()) do
        if plot:IsA("Model") then
            scanSinglePlot(plot)
        end
    end
    
    plots.ChildAdded:Connect(function(plot)
        if plot:IsA("Model") then
            task.wait(0.5)
            scanSinglePlot(plot)
        end
    end)
    
    task.spawn(function()
        while task.wait(5) do
            allAnimalsCache = {}
            for _, plot in ipairs(plots:GetChildren()) do
                if plot:IsA("Model") then
                    scanSinglePlot(plot)
                end
            end
        end
    end)
end

local function findProximityPromptForAnimal(animalData)
    if not animalData then return nil end
    
    local cachedPrompt = PromptMemoryCache[animalData.uid]
    if cachedPrompt and cachedPrompt.Parent then
        return cachedPrompt
    end
    
    local plot = workspace.Plots:FindFirstChild(animalData.plot)
    if not plot then return nil end
    
    local podiums = plot:FindFirstChild("AnimalPodiums")
    if not podiums then return nil end
    
    local podium = podiums:FindFirstChild(animalData.slot)
    if not podium then return nil end
    
    local base = podium:FindFirstChild("Base")
    if not base then return nil end
    
    local spawn = base:FindFirstChild("Spawn")
    if not spawn then return nil end
    
    local attach = spawn:FindFirstChild("PromptAttachment")
    if not attach then return nil end
    
    for _, p in ipairs(attach:GetChildren()) do
        if p:IsA("ProximityPrompt") then
            PromptMemoryCache[animalData.uid] = p
            return p
        end
    end
    
    return nil
end

local function updatePlayerVelocity()
    local hrp = getHRP()
    if not hrp then return end
    
    local currentPos = hrp.Position
    
    if LastPlayerPosition then
        PlayerVelocity = (currentPos - LastPlayerPosition) / task.wait()
    end
    
    LastPlayerPosition = currentPos
end

local function shouldSteal(animalData)
    if not animalData or not animalData.worldPosition then return false end
    
    local hrp = getHRP()
    if not hrp then return false end
    
    local currentDistance = (hrp.Position - animalData.worldPosition).Magnitude
    
    return currentDistance <= AUTO_STEAL_PROX_RADIUS
end

local function buildStealCallbacks(prompt)
    if InternalStealCache[prompt] then return end
    
    local data = {
        holdCallbacks = {},
        triggerCallbacks = {},
        ready = true,
    }
    
    local ok1, conns1 = pcall(getconnections, prompt.PromptButtonHoldBegan)
    if ok1 and type(conns1) == "table" then
        for _, conn in ipairs(conns1) do
            if type(conn.Function) == "function" then
                table.insert(data.holdCallbacks, conn.Function)
            end
        end
    end
    
    local ok2, conns2 = pcall(getconnections, prompt.Triggered)
    if ok2 and type(conns2) == "table" then
        for _, conn in ipairs(conns2) do
            if type(conn.Function) == "function" then
                table.insert(data.triggerCallbacks, conn.Function)
            end
        end
    end
    
    if (#data.holdCallbacks > 0) or (#data.triggerCallbacks > 0) then
        InternalStealCache[prompt] = data
    end
end

local function executeInternalStealAsync(prompt, animalData)
    local data = InternalStealCache[prompt]
    if not data or not data.ready then return false end
    
    data.ready = false
    IsStealing = true
    StealProgress = 0
    CurrentStealTarget = animalData
    StealStartTime = tick()
    
    task.spawn(function()
        if #data.holdCallbacks > 0 then
            for _, fn in ipairs(data.holdCallbacks) do
                task.spawn(fn)
            end
        end
        
        local startTime = tick()
        while tick() - startTime < 1.3 do
            StealProgress = (tick() - startTime) / 1.3
            task.wait(0.05)
        end
        StealProgress = 1
        
        if #data.triggerCallbacks > 0 then
            for _, fn in ipairs(data.triggerCallbacks) do
                task.spawn(fn)
            end
        end
        
        task.wait(0.1)
        data.ready = true
        
        task.wait(0.3)
        IsStealing = false
        StealProgress = 0
        CurrentStealTarget = nil
    end)
    
    return true
end

local function attemptSteal(prompt, animalData)
    if not prompt or not prompt.Parent then return false end
    
    buildStealCallbacks(prompt)
    if not InternalStealCache[prompt] then return false end
    
    return executeInternalStealAsync(prompt, animalData)
end

local function getNearestAnimal()
    local hrp = getHRP()
    if not hrp then return nil end
    
    local nearest = nil
    local minDist = math.huge
    
    for _, animalData in ipairs(allAnimalsCache) do
        if isMyBase(animalData.plot) then continue end
        
        if animalData.worldPosition then
            local dist = (hrp.Position - animalData.worldPosition).Magnitude
            if dist < minDist then
                minDist = dist
                nearest = animalData
            end
        end
    end
    
    return nearest
end

local function autoStealLoop()
    if stealConnection then stealConnection:Disconnect() end
    if velocityConnection then velocityConnection:Disconnect() end
    
    velocityConnection = RunService.Heartbeat:Connect(updatePlayerVelocity)
    
    stealConnection = RunService.Heartbeat:Connect(function()
        if not CONFIG.AUTO_STEAL_NEAREST then return end
        if IsStealing then return end
        
        local targetAnimal = getNearestAnimal()
        if not targetAnimal then return end
        
        if not shouldSteal(targetAnimal) then return end
        
        if LastTargetUID ~= targetAnimal.uid then
            LastTargetUID = targetAnimal.uid
        end
        
        local prompt = PromptMemoryCache[targetAnimal.uid]
        if not prompt or not prompt.Parent then
            prompt = findProximityPromptForAnimal(targetAnimal)
        end
        
        if prompt then
            attemptSteal(prompt, targetAnimal)
        end
    end)
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoStealUI"
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 999999
screenGui.Parent = PlayerGui

local buttonFrame = Instance.new("Frame")
buttonFrame.Name = "ButtonFrame"
buttonFrame.Size = UDim2.new(0, 145, 0, 45)
buttonFrame.Position = UDim2.new(0, 10, 0, 10)
buttonFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
buttonFrame.BackgroundTransparency = 0
buttonFrame.BorderSizePixel = 0
buttonFrame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = buttonFrame

local frameStroke = Instance.new("UIStroke")
frameStroke.Thickness = 1.3
frameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
frameStroke.Color = Color3.fromRGB(255, 255, 255)
frameStroke.Parent = buttonFrame

local frameGradient = Instance.new("UIGradient")
frameGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 50, 50)),
    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 50, 50)),
    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 50, 50))
})
frameGradient.Parent = frameStroke

task.spawn(function()
    while true do
        frameGradient.Rotation = frameGradient.Rotation + 2
        task.wait(0.02)
    end
end)

local button = Instance.new("TextButton")
button.Name = "AutoStealButton"
button.Size = UDim2.new(0, 135, 0, 35)
button.AnchorPoint = Vector2.new(0.5, 0.5) 
button.Position = UDim2.new(0.5, 0, 0.5, 0) 

button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
button.Text = "INSTA GRAB: OFF"
button.Font = Enum.Font.GothamBold
button.TextSize = 13
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.BorderSizePixel = 0
button.Parent = buttonFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = button

button.MouseButton1Click:Connect(function()
    CONFIG.AUTO_STEAL_NEAREST = not CONFIG.AUTO_STEAL_NEAREST
    
    if CONFIG.AUTO_STEAL_NEAREST then
        button.Text = "INSTA GRAB: ON"
        button.BackgroundColor3 = Color3.fromRGB(60, 150, 60)
    else
        button.Text = "INSTA GRAB: OFF"
        button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    end
end)

local showbarFrame = Instance.new("Frame")
showbarFrame.Size = UDim2.new(0, 220, 0, 22)
showbarFrame.Position = UDim2.new(0.5, -110, 0, -52)
showbarFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
showbarFrame.BackgroundTransparency = 0.2
showbarFrame.BorderSizePixel = 0
showbarFrame.Visible = true
showbarFrame.Parent = screenGui

local showbarCorner = Instance.new("UICorner")
showbarCorner.CornerRadius = UDim.new(0, 6)
showbarCorner.Parent = showbarFrame

local uiStroke = Instance.new("UIStroke")
uiStroke.Thickness = 1.2
uiStroke.Transparency = 0
uiStroke.Color = Color3.fromRGB(255, 255, 255)
uiStroke.Parent = showbarFrame

local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 50, 50)),
    ColorSequenceKeypoint.new(0.20, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 50, 50)),
    ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 50, 50))
})
uiGradient.Parent = uiStroke

local progressBarBg = Instance.new("Frame")
progressBarBg.Size = UDim2.new(0.9, 0, 0, 8)
progressBarBg.Position = UDim2.new(0.05, 0, 0.5, -4)
progressBarBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
progressBarBg.BorderSizePixel = 0
progressBarBg.Parent = showbarFrame

local progressBarCorner = Instance.new("UICorner")
progressBarCorner.CornerRadius = UDim.new(1, 0)
progressBarCorner.Parent = progressBarBg

local progressBarFill = Instance.new("Frame")
progressBarFill.Size = UDim2.new(0, 0, 1, 0)
progressBarFill.Position = UDim2.new(0, 0, 0, 0)
progressBarFill.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
progressBarFill.BorderSizePixel = 0
progressBarFill.Parent = progressBarBg

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(1, 0)
fillCorner.Parent = progressBarFill

local fillGradient = Instance.new("UIGradient")
fillGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 50, 50)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 150, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 50, 50))
})
fillGradient.Parent = progressBarFill

local radiusFrame = Instance.new("Frame")
radiusFrame.Size = UDim2.new(0, 40, 0, 22)
radiusFrame.Position = UDim2.new(0.5, 115, 0, -52)
radiusFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
radiusFrame.BackgroundTransparency = 0.2
radiusFrame.BorderSizePixel = 0
radiusFrame.Visible = true
radiusFrame.Parent = screenGui

local radiusCorner = Instance.new("UICorner")
radiusCorner.CornerRadius = UDim.new(0, 6)
radiusCorner.Parent = radiusFrame

local radiusStroke = Instance.new("UIStroke")
radiusStroke.Thickness = 1.2
radiusStroke.Transparency = 0
radiusStroke.Color = Color3.fromRGB(255, 255, 255)
radiusStroke.Parent = radiusFrame

local radiusGradient = Instance.new("UIGradient")
radiusGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 50, 50)),
    ColorSequenceKeypoint.new(0.20, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 50, 50)),
    ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 50, 50))
})
radiusGradient.Parent = radiusStroke

local radiusText = Instance.new("TextButton")
radiusText.Size = UDim2.new(1, 0, 1, 0)
radiusText.Position = UDim2.new(0, 0, 0, 0)
radiusText.BackgroundTransparency = 1
radiusText.Text = AUTO_STEAL_PROX_RADIUS
radiusText.Font = Enum.Font.GothamBold
radiusText.TextSize = 13
radiusText.TextColor3 = Color3.fromRGB(255, 255, 255)
radiusText.Parent = radiusFrame

local typing = false
local inputConnection

local function createCircle(character)
    for _, part in ipairs(circleParts) do
        if part then part:Destroy() end
    end
    circleParts = {}
    
    CIRCLE_RADIUS = AUTO_STEAL_PROX_RADIUS
    local root = character:WaitForChild("HumanoidRootPart")
    
    local points = {}
    for i = 0, PartsCount - 1 do
        local angle = math.rad(i * 360 / PartsCount)
        table.insert(points, Vector3.new(math.cos(angle), 0, math.sin(angle)) * CIRCLE_RADIUS)
    end
    
    for i = 1, #points do
        local nextIndex = i % #points + 1
        local p1 = points[i]
        local p2 = points[nextIndex]
        
        local part = Instance.new("Part")
        part.Anchored = true
        part.CanCollide = false
        part.Size = Vector3.new((p2 - p1).Magnitude, PART_HEIGHT, PART_THICKNESS)
        part.Color = PART_COLOR
        part.Material = Enum.Material.Neon
        part.Transparency = 0.3
        part.TopSurface = Enum.SurfaceType.Smooth
        part.BottomSurface = Enum.SurfaceType.Smooth
        part.Parent = workspace
        table.insert(circleParts, part)
    end
end

local function updateCircle(character)
    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    local points = {}
    for i = 0, PartsCount - 1 do
        local angle = math.rad(i * 360 / PartsCount)
        table.insert(points, Vector3.new(math.cos(angle), 0, math.sin(angle)) * CIRCLE_RADIUS)
    end
    
    for i, part in ipairs(circleParts) do
        local nextIndex = i % #points + 1
        local p1 = points[i]
        local p2 = points[nextIndex]
        local center = (p1 + p2) / 2 + root.Position
        
        part.CFrame = CFrame.new(center, center + Vector3.new(p2.X - p1.X, 0, p2.Z - p1.Z)) * CFrame.Angles(0, math.pi/2, 0)
    end
end

local function onCharacterAdded(character)
    if circleEnabled then
        createCircle(character)
        RunService:BindToRenderStep("CircleFollow", Enum.RenderPriority.Camera.Value + 1, function()
            updateCircle(character)
        end)
    end
end

local function updateCircleRadius()
    CIRCLE_RADIUS = AUTO_STEAL_PROX_RADIUS
    local character = LocalPlayer.Character
    if character and circleEnabled then
        createCircle(character)
    end
end

radiusText.MouseButton1Click:Connect(function()
    if typing then return end
    
    typing = true
    local originalText = radiusText.Text
    
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(1, 0, 1, 0)
    textBox.Position = UDim2.new(0, 0, 0, 0)
    textBox.BackgroundTransparency = 1
    textBox.Text = AUTO_STEAL_PROX_RADIUS
    textBox.Font = Enum.Font.GothamBold
    textBox.TextSize = 13
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.ClearTextOnFocus = false
    textBox.Parent = radiusFrame
    
    textBox:CaptureFocus()
    
    inputConnection = textBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local num = tonumber(textBox.Text)
            if num and num >= 5 and num <= 200 then
                AUTO_STEAL_PROX_RADIUS = math.floor(num)
                updateCircleRadius()
            end
        end
        
        textBox:Destroy()
        radiusText.Text = AUTO_STEAL_PROX_RADIUS
        typing = false
        inputConnection:Disconnect()
    end)
end)

local progressTween = nil

task.spawn(function()
    while task.wait(0.03) do
        if not typing then
            radiusText.Text = AUTO_STEAL_PROX_RADIUS
        end
        
        if IsStealing then
            if progressTween then
                progressTween:Cancel()
            end
            
            progressTween = game:GetService("TweenService"):Create(
                progressBarFill,
                TweenInfo.new(0.1, Enum.EasingStyle.Linear),
                {Size = UDim2.new(StealProgress, 0, 1, 0)}
            )
            progressTween:Play()
        else
            if progressTween then
                progressTween:Cancel()
                progressTween = nil
            end
            
            if progressBarFill.Size.X.Scale > 0 then
                progressBarFill.Size = UDim2.new(
                    math.max(0, progressBarFill.Size.X.Scale - 0.03), 
                    0, 
                    1, 
                    0
                )
            end
        end
    end
end)

initializeScanner()
autoStealLoop()

if LocalPlayer.Character then
    onCharacterAdded(LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
]],
})

table.insert(SCRIPTS, {
    name  = "Nameless Hub",
    icon  = "🌐",
    desc  = "ALL-IN-ONE • HUB • TOOLS",
    isNew = false,
    kind  = "http",
    code  = "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/ily123950/Vulkan/refs/heads/main/Tr\"))()",
})


--========================================================
-- LOADING SCREEN (45 seconds) — runs before launcher
--========================================================

local DURATION = 45

local LoadGui = Instance.new("ScreenGui")
LoadGui.Name           = "67HUB_Loading"
LoadGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LoadGui.ResetOnSpawn   = false
LoadGui.IgnoreGuiInset = true
LoadGui.Parent         = player:WaitForChild("PlayerGui")

local LoadOverlay = Instance.new("Frame", LoadGui)
LoadOverlay.Size                   = UDim2.new(1,0,1,0)
LoadOverlay.BackgroundColor3       = Color3.fromRGB(0,0,0)
LoadOverlay.BackgroundTransparency = 0.65
LoadOverlay.BorderSizePixel        = 0
LoadOverlay.ZIndex                 = 1

-- Grid lines
for i = 1,10 do
    local l=Instance.new("Frame",LoadOverlay); l.Size=UDim2.new(1,0,0,1)
    l.Position=UDim2.new(0,0,i/11,0); l.BackgroundColor3=Color3.fromRGB(0,80,140)
    l.BackgroundTransparency=0.92; l.BorderSizePixel=0
end
for i = 1,16 do
    local l=Instance.new("Frame",LoadOverlay); l.Size=UDim2.new(0,1,1,0)
    l.Position=UDim2.new(i/17,0,0,0); l.BackgroundColor3=Color3.fromRGB(0,80,140)
    l.BackgroundTransparency=0.92; l.BorderSizePixel=0
end

local Card = Instance.new("Frame", LoadGui)
Card.Size                   = UDim2.new(0.72,0,0.72,0)
Card.Position               = UDim2.new(0.14,0,0.14,0)
Card.BackgroundColor3       = Color3.fromRGB(6,12,22)
Card.BackgroundTransparency = 0
Card.BorderSizePixel        = 0
Card.ZIndex                 = 2
Instance.new("UICorner",Card).CornerRadius = UDim.new(0,12)

local CardStroke = Instance.new("UIStroke",Card)
CardStroke.Thickness = 1.5; CardStroke.Color = Color3.fromRGB(0,150,255)
task.spawn(function()
    while Card.Parent do
        TweenService:Create(CardStroke,TweenInfo.new(1.2,Enum.EasingStyle.Sine),{Color=Color3.fromRGB(0,220,255)}):Play(); task.wait(1.2)
        TweenService:Create(CardStroke,TweenInfo.new(1.2,Enum.EasingStyle.Sine),{Color=Color3.fromRGB(0,80,180)}):Play();  task.wait(1.2)
    end
end)

-- Corner brackets
local function mkCorner(parent,ax,ay)
    local f=Instance.new("Frame",parent)
    f.Size=UDim2.new(0,14,0,14); f.AnchorPoint=Vector2.new(ax,ay)
    f.Position=UDim2.new(ax,ax==0 and 8 or -8,ay,ay==0 and 8 or -8)
    f.BackgroundTransparency=1; f.BorderSizePixel=0; f.ZIndex=5
    local h=Instance.new("Frame",f); h.Size=UDim2.new(1,0,0,2)
    h.Position=UDim2.new(0,0,ay==0 and 0 or 1,ay==0 and 0 or -2)
    h.BackgroundColor3=Color3.fromRGB(0,200,255); h.BorderSizePixel=0; h.ZIndex=5
    local v=Instance.new("Frame",f); v.Size=UDim2.new(0,2,1,0)
    v.Position=UDim2.new(ax==0 and 0 or 1,ax==0 and 0 or -2,0,0)
    v.BackgroundColor3=Color3.fromRGB(0,200,255); v.BorderSizePixel=0; v.ZIndex=5
end
mkCorner(Card,0,0); mkCorner(Card,1,0); mkCorner(Card,0,1); mkCorner(Card,1,1)

local LC = Instance.new("Frame",Card)
LC.Size=UDim2.new(1,-48,1,-44); LC.Position=UDim2.new(0,24,0,22)
LC.BackgroundTransparency=1; LC.BorderSizePixel=0; LC.ZIndex=3

-- Top tag
local TopTag=Instance.new("TextLabel",LC)
TopTag.Size=UDim2.new(1,0,0,12); TopTag.Position=UDim2.new(0,0,0,0)
TopTag.BackgroundTransparency=1; TopTag.Text="SYS_INIT  //  SECURE BOOT"
TopTag.Font=Enum.Font.Code; TopTag.TextSize=9
TopTag.TextColor3=Color3.fromRGB(0,100,180); TopTag.TextXAlignment=Enum.TextXAlignment.Left; TopTag.ZIndex=3

-- Logo
local Logo67=Instance.new("TextLabel",LC)
Logo67.Size=UDim2.new(0,140,0,80); Logo67.Position=UDim2.new(0,0,0,16)
Logo67.BackgroundTransparency=1; Logo67.Text="67"
Logo67.Font=Enum.Font.GothamBold; Logo67.TextSize=76
Logo67.TextColor3=Color3.fromRGB(255,255,255); Logo67.TextXAlignment=Enum.TextXAlignment.Left; Logo67.ZIndex=3

local LogoHub=Instance.new("TextLabel",LC)
LogoHub.Size=UDim2.new(0,120,0,36); LogoHub.Position=UDim2.new(0,108,0,48)
LogoHub.BackgroundTransparency=1; LogoHub.Text="HUB"
LogoHub.Font=Enum.Font.GothamBold; LogoHub.TextSize=28
LogoHub.TextColor3=Color3.fromRGB(0,170,255); LogoHub.TextXAlignment=Enum.TextXAlignment.Left; LogoHub.ZIndex=3

local XoSh=Instance.new("TextLabel",LC)
XoSh.Size=UDim2.new(0,60,0,80); XoSh.Position=UDim2.new(1,-56,0,16)
XoSh.BackgroundTransparency=1; XoSh.Text="X\no\nS\nh"
XoSh.Font=Enum.Font.Code; XoSh.TextSize=11
XoSh.TextColor3=Color3.fromRGB(0,80,140); XoSh.TextXAlignment=Enum.TextXAlignment.Right
XoSh.LineHeight=1.2; XoSh.ZIndex=3

-- Divider
local LDiv=Instance.new("Frame",LC)
LDiv.Size=UDim2.new(1,0,0,1); LDiv.Position=UDim2.new(0,0,0,102)
LDiv.BackgroundColor3=Color3.fromRGB(0,120,220); LDiv.BackgroundTransparency=0.6; LDiv.BorderSizePixel=0; LDiv.ZIndex=3
local DD1=Instance.new("Frame",LC); DD1.Size=UDim2.new(0,4,0,4); DD1.Position=UDim2.new(0,-2,0,100)
DD1.BackgroundColor3=Color3.fromRGB(0,170,255); DD1.BorderSizePixel=0; DD1.ZIndex=3; Instance.new("UICorner",DD1).CornerRadius=UDim.new(1,0)
local DD2=Instance.new("Frame",LC); DD2.Size=UDim2.new(0,4,0,4); DD2.Position=UDim2.new(1,-2,0,100)
DD2.BackgroundColor3=Color3.fromRGB(0,170,255); DD2.BorderSizePixel=0; DD2.ZIndex=3; Instance.new("UICorner",DD2).CornerRadius=UDim.new(1,0)

-- Status lines
local statuses = {
    {txt="INJECTING ENV",    state="done"},
    {txt="BYPASS ANTICHEAT", state="done"},
    {txt="LOAD MODULES",     state="active"},
    {txt="FINALIZE CONTEXT", state="wait"},
}
local sLabels,sDots={},{}
for i,s in ipairs(statuses) do
    local row=Instance.new("Frame",LC); row.Size=UDim2.new(1,0,0,16)
    row.Position=UDim2.new(0,0,0,112+(i-1)*20); row.BackgroundTransparency=1; row.BorderSizePixel=0; row.ZIndex=3
    local dot=Instance.new("Frame",row); dot.Size=UDim2.new(0,5,0,5)
    dot.Position=UDim2.new(0,0,0.5,-2.5); dot.BorderSizePixel=0; dot.ZIndex=4
    Instance.new("UICorner",dot).CornerRadius=UDim.new(1,0)
    local lbl=Instance.new("TextLabel",row); lbl.Size=UDim2.new(1,-14,1,0)
    lbl.Position=UDim2.new(0,14,0,0); lbl.BackgroundTransparency=1
    lbl.Font=Enum.Font.Code; lbl.TextSize=10; lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.ZIndex=4
    local suf=Instance.new("TextLabel",row); suf.Size=UDim2.new(0,50,1,0)
    suf.Position=UDim2.new(1,-50,0,0); suf.BackgroundTransparency=1
    suf.Font=Enum.Font.Code; suf.TextSize=10; suf.TextXAlignment=Enum.TextXAlignment.Right; suf.ZIndex=4
    if s.state=="done" then
        dot.BackgroundColor3=Color3.fromRGB(0,200,120); lbl.TextColor3=Color3.fromRGB(0,160,90); lbl.Text=s.txt
        suf.TextColor3=Color3.fromRGB(0,200,120); suf.Text="OK"
    elseif s.state=="active" then
        dot.BackgroundColor3=Color3.fromRGB(0,220,255); lbl.TextColor3=Color3.fromRGB(0,220,255); lbl.Text=s.txt
        suf.TextColor3=Color3.fromRGB(0,220,255); suf.Text="WAIT"
    else
        dot.BackgroundColor3=Color3.fromRGB(20,50,80); lbl.TextColor3=Color3.fromRGB(20,50,80); lbl.Text=s.txt
        suf.TextColor3=Color3.fromRGB(20,50,80); suf.Text="---"
    end
    sLabels[i]={lbl=lbl,suf=suf}; sDots[i]=dot
end

local blinkIdx=3
task.spawn(function()
    while Card.Parent do
        if sDots[blinkIdx] then
            TweenService:Create(sDots[blinkIdx],TweenInfo.new(0.5,Enum.EasingStyle.Sine),{BackgroundTransparency=0.85}):Play(); task.wait(0.5)
            TweenService:Create(sDots[blinkIdx],TweenInfo.new(0.5,Enum.EasingStyle.Sine),{BackgroundTransparency=0}):Play();    task.wait(0.5)
        else task.wait(0.5) end
    end
end)

-- Progress bar
local ProgY=112+4*20+10
local ProgTrack=Instance.new("Frame",LC); ProgTrack.Size=UDim2.new(1,0,0,2)
ProgTrack.Position=UDim2.new(0,0,0,ProgY); ProgTrack.BackgroundColor3=Color3.fromRGB(10,30,55)
ProgTrack.BorderSizePixel=0; ProgTrack.ZIndex=3
local ProgFill=Instance.new("Frame",ProgTrack); ProgFill.Size=UDim2.new(0,0,1,0)
ProgFill.BackgroundColor3=Color3.fromRGB(0,160,255); ProgFill.BorderSizePixel=0; ProgFill.ZIndex=4
local Shimmer=Instance.new("Frame",ProgFill); Shimmer.Size=UDim2.new(0,20,1,0)
Shimmer.AnchorPoint=Vector2.new(1,0); Shimmer.Position=UDim2.new(1,0,0,0)
Shimmer.BackgroundColor3=Color3.fromRGB(180,240,255); Shimmer.BackgroundTransparency=0.4; Shimmer.BorderSizePixel=0; Shimmer.ZIndex=5

local PctRow=Instance.new("Frame",LC); PctRow.Size=UDim2.new(1,0,0,14)
PctRow.Position=UDim2.new(0,0,0,ProgY+6); PctRow.BackgroundTransparency=1; PctRow.BorderSizePixel=0; PctRow.ZIndex=3
local PctLbl=Instance.new("TextLabel",PctRow); PctLbl.Size=UDim2.new(0.5,0,1,0)
PctLbl.BackgroundTransparency=1; PctLbl.Text="0%"; PctLbl.Font=Enum.Font.GothamBold
PctLbl.TextSize=10; PctLbl.TextColor3=Color3.fromRGB(0,170,255); PctLbl.TextXAlignment=Enum.TextXAlignment.Left; PctLbl.ZIndex=3
local TimeLbl=Instance.new("TextLabel",PctRow); TimeLbl.Size=UDim2.new(0.5,0,1,0)
TimeLbl.Position=UDim2.new(0.5,0,0,0); TimeLbl.BackgroundTransparency=1; TimeLbl.Text="45s"
TimeLbl.Font=Enum.Font.Code; TimeLbl.TextSize=9; TimeLbl.TextColor3=Color3.fromRGB(20,60,100)
TimeLbl.TextXAlignment=Enum.TextXAlignment.Right; TimeLbl.ZIndex=3

-- Bottom warning
local BotLbl=Instance.new("TextLabel",LC); BotLbl.Size=UDim2.new(1,0,0,12)
BotLbl.Position=UDim2.new(0,0,1,-12); BotLbl.BackgroundTransparency=1
BotLbl.Text="DO NOT CLOSE  //  SCRIPT LOADING"
BotLbl.Font=Enum.Font.Code; BotLbl.TextSize=9
BotLbl.TextColor3=Color3.fromRGB(100,50,0); BotLbl.TextXAlignment=Enum.TextXAlignment.Center; BotLbl.ZIndex=3
task.spawn(function()
    while Card.Parent do
        TweenService:Create(BotLbl,TweenInfo.new(0.9,Enum.EasingStyle.Sine),{TextTransparency=0.6}):Play(); task.wait(0.9)
        TweenService:Create(BotLbl,TweenInfo.new(0.9,Enum.EasingStyle.Sine),{TextTransparency=0}):Play();   task.wait(0.9)
    end
end)

-- Entrance
Card.BackgroundTransparency=1; Card.Position=UDim2.new(0.14,0,0.18,0)
LoadOverlay.BackgroundTransparency=1
TweenService:Create(LoadOverlay,TweenInfo.new(0.3),{BackgroundTransparency=0.65}):Play()
TweenService:Create(Card,TweenInfo.new(0.45,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
    BackgroundTransparency=0, Position=UDim2.new(0.14,0,0.14,0)
}):Play()

-- Status advance at 4s
task.delay(4,function()
    sDots[3].BackgroundColor3=Color3.fromRGB(0,200,120); sLabels[3].lbl.TextColor3=Color3.fromRGB(0,160,90)
    sLabels[3].suf.TextColor3=Color3.fromRGB(0,200,120); sLabels[3].suf.Text="OK"; blinkIdx=4
    sDots[4].BackgroundColor3=Color3.fromRGB(0,220,255); sLabels[4].lbl.TextColor3=Color3.fromRGB(0,220,255)
    sLabels[4].suf.TextColor3=Color3.fromRGB(0,220,255); sLabels[4].suf.Text="WAIT"
end)
task.delay(42,function()
    sDots[4].BackgroundColor3=Color3.fromRGB(0,200,120); sLabels[4].lbl.TextColor3=Color3.fromRGB(0,160,90)
    sLabels[4].suf.TextColor3=Color3.fromRGB(0,200,120); sLabels[4].suf.Text="OK"; blinkIdx=0
    PctLbl.TextColor3=Color3.fromRGB(0,200,120); ProgFill.BackgroundColor3=Color3.fromRGB(0,200,120)
end)

-- Progress loop — destroys itself and then opens launcher
local loadStart=tick()
local loadConn
loadConn = RunService.Heartbeat:Connect(function()
    local elapsed  = tick()-loadStart
    local progress = math.min(1, elapsed/DURATION)
    local pct      = math.floor(progress*100)
    local remaining= math.max(0, math.ceil(DURATION-elapsed))
    ProgFill.Size=UDim2.new(progress,0,1,0)
    PctLbl.Text=pct.."%"; TimeLbl.Text=remaining.."s"
    if progress>=1 then
        loadConn:Disconnect()
        PctLbl.Text="100%"; TimeLbl.Text="0s"
        task.wait(0.4)
        TweenService:Create(Card,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
            BackgroundTransparency=1, Position=UDim2.new(0.14,0,0.08,0)
        }):Play()
        TweenService:Create(LoadOverlay,TweenInfo.new(0.4),{BackgroundTransparency=1}):Play()
        task.wait(0.6)
        LoadGui:Destroy()
        -- ── LAUNCHER OPENS HERE ──
        openLauncher()
    end
end)

--========================================================
-- GUI — Sidebar Split Launcher
--========================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name            = "XoShLauncher"
ScreenGui.ZIndexBehavior  = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn    = false
ScreenGui.IgnoreGuiInset  = true
ScreenGui.Parent          = player:WaitForChild("PlayerGui")

local Overlay = Instance.new("Frame", ScreenGui)
Overlay.Size                   = UDim2.new(1,0,1,0)
Overlay.BackgroundColor3       = Color3.fromRGB(0,0,0)
Overlay.BackgroundTransparency = 0.5
Overlay.BorderSizePixel        = 0
Overlay.ZIndex                 = 1

local Panel = Instance.new("Frame", ScreenGui)
Panel.Name                   = "Panel"
Panel.Size                   = UDim2.new(0.88,0,0.62,0)
Panel.Position               = UDim2.new(0.06,0,0.19,0)
Panel.BackgroundColor3       = Color3.fromRGB(8,11,20)
Panel.BackgroundTransparency = 0.06
Panel.BorderSizePixel        = 0
Panel.Active                 = true
Panel.Draggable              = true
Panel.ZIndex                 = 2
Instance.new("UICorner", Panel).CornerRadius = UDim.new(0,14)

local panelStroke = Instance.new("UIStroke", Panel)
panelStroke.Thickness = 1.8
panelStroke.Color     = Color3.fromRGB(0,180,255)
task.spawn(function()
    while Panel.Parent do
        TweenService:Create(panelStroke,TweenInfo.new(0.7,Enum.EasingStyle.Sine),{Color=Color3.fromRGB(80,220,255)}):Play()
        task.wait(0.7)
        TweenService:Create(panelStroke,TweenInfo.new(0.7,Enum.EasingStyle.Sine),{Color=Color3.fromRGB(0,110,210)}):Play()
        task.wait(0.7)
    end
end)

-- ── SIDEBAR ────────────────────────────────────────────
local Sidebar = Instance.new("Frame", Panel)
Sidebar.Size                   = UDim2.new(0.32,0,1,0)
Sidebar.BackgroundColor3       = Color3.fromRGB(0,100,200)
Sidebar.BackgroundTransparency = 0.88
Sidebar.BorderSizePixel        = 0
Instance.new("UICorner",Sidebar).CornerRadius = UDim.new(0,14)

local sideDiv = Instance.new("Frame",Sidebar)
sideDiv.Size=UDim2.new(0,1,1,0); sideDiv.Position=UDim2.new(1,-1,0,0)
sideDiv.BackgroundColor3=Color3.fromRGB(0,160,255)
sideDiv.BackgroundTransparency=0.7; sideDiv.BorderSizePixel=0

-- Sidebar header
local SideHeader = Instance.new("Frame",Sidebar)
SideHeader.Size=UDim2.new(1,0,0,56)
SideHeader.BackgroundColor3=Color3.fromRGB(0,120,220)
SideHeader.BackgroundTransparency=0.82; SideHeader.BorderSizePixel=0
Instance.new("UICorner",SideHeader).CornerRadius=UDim.new(0,14)

local SHDiv=Instance.new("Frame",SideHeader)
SHDiv.Size=UDim2.new(0.85,0,0,1); SHDiv.Position=UDim2.new(0.075,0,1,-1)
SHDiv.BackgroundColor3=Color3.fromRGB(0,160,255)
SHDiv.BackgroundTransparency=0.65; SHDiv.BorderSizePixel=0

local LogoBg=Instance.new("Frame",SideHeader)
LogoBg.Size=UDim2.new(0,30,0,30); LogoBg.Position=UDim2.new(0,10,0.5,-15)
LogoBg.BackgroundColor3=Color3.fromRGB(0,150,255); LogoBg.BorderSizePixel=0
Instance.new("UICorner",LogoBg).CornerRadius=UDim.new(0,8)
local LogoLbl=Instance.new("TextLabel",LogoBg)
LogoLbl.Size=UDim2.new(1,0,1,0); LogoLbl.BackgroundTransparency=1
LogoLbl.Text="67"; LogoLbl.Font=Enum.Font.GothamBold
LogoLbl.TextSize=13; LogoLbl.TextColor3=Color3.fromRGB(255,255,255)
task.spawn(function()
    while LogoBg.Parent do
        TweenService:Create(LogoBg,TweenInfo.new(0.9,Enum.EasingStyle.Sine),{BackgroundColor3=Color3.fromRGB(0,80,200)}):Play(); task.wait(0.9)
        TweenService:Create(LogoBg,TweenInfo.new(0.9,Enum.EasingStyle.Sine),{BackgroundColor3=Color3.fromRGB(0,190,255)}):Play(); task.wait(0.9)
    end
end)

local HubTitle=Instance.new("TextLabel",SideHeader)
HubTitle.Size=UDim2.new(1,-50,0,18); HubTitle.Position=UDim2.new(0,48,0,9)
HubTitle.BackgroundTransparency=1; HubTitle.Text="67 HUB XoSh"
HubTitle.Font=Enum.Font.GothamBold; HubTitle.TextSize=13
HubTitle.TextColor3=Color3.fromRGB(190,235,255)
HubTitle.TextXAlignment=Enum.TextXAlignment.Left

local HubSub=Instance.new("TextLabel",SideHeader)
HubSub.Size=UDim2.new(1,-50,0,14); HubSub.Position=UDim2.new(0,48,0,29)
HubSub.BackgroundTransparency=1; HubSub.Text="SCRIPT LAUNCHER"
HubSub.Font=Enum.Font.GothamBold; HubSub.TextSize=9
HubSub.TextColor3=Color3.fromRGB(0,190,255); HubSub.TextTransparency=0.25
HubSub.TextXAlignment=Enum.TextXAlignment.Left

-- Nav scroll
local NavScroll=Instance.new("ScrollingFrame",Sidebar)
NavScroll.Size=UDim2.new(1,0,1,-62); NavScroll.Position=UDim2.new(0,0,0,60)
NavScroll.BackgroundTransparency=1; NavScroll.BorderSizePixel=0
NavScroll.ScrollBarThickness=2; NavScroll.ScrollBarImageColor3=Color3.fromRGB(0,160,255)
NavScroll.CanvasSize=UDim2.new(0,0,0,0); NavScroll.AutomaticCanvasSize=Enum.AutomaticSize.Y
local NavList=Instance.new("UIListLayout",NavScroll)
NavList.Padding=UDim.new(0,4)
local NavPad=Instance.new("UIPadding",NavScroll)
NavPad.PaddingTop=UDim.new(0,6); NavPad.PaddingBottom=UDim.new(0,6)
NavPad.PaddingLeft=UDim.new(0,7); NavPad.PaddingRight=UDim.new(0,7)

-- ── CONTENT PANEL ──────────────────────────────────────
local Content=Instance.new("Frame",Panel)
Content.Size=UDim2.new(0.68,-2,1,0); Content.Position=UDim2.new(0.32,2,0,0)
Content.BackgroundTransparency=1; Content.BorderSizePixel=0

local CloseBtn=Instance.new("TextButton",Content)
CloseBtn.Size=UDim2.new(0,28,0,28); CloseBtn.Position=UDim2.new(1,-36,0,10)
CloseBtn.BackgroundColor3=Color3.fromRGB(40,20,20); CloseBtn.BackgroundTransparency=0.3
CloseBtn.BorderSizePixel=0; CloseBtn.Text="✕"
CloseBtn.Font=Enum.Font.GothamBold; CloseBtn.TextSize=13
CloseBtn.TextColor3=Color3.fromRGB(255,160,160); CloseBtn.ZIndex=5
Instance.new("UICorner",CloseBtn).CornerRadius=UDim.new(1,0)

local CP=Instance.new("Frame",Content)
CP.Size=UDim2.new(1,-24,1,-24); CP.Position=UDim2.new(0,12,0,12)
CP.BackgroundTransparency=1; CP.BorderSizePixel=0

local IconBox=Instance.new("Frame",CP)
IconBox.Size=UDim2.new(0,52,0,52); IconBox.Position=UDim2.new(0,0,0,8)
IconBox.BackgroundColor3=Color3.fromRGB(0,100,200); IconBox.BackgroundTransparency=0.6
IconBox.BorderSizePixel=0
Instance.new("UICorner",IconBox).CornerRadius=UDim.new(0,13)
local IconStroke=Instance.new("UIStroke",IconBox)
IconStroke.Thickness=1; IconStroke.Color=Color3.fromRGB(0,180,255); IconStroke.Transparency=0.4

local IconLbl=Instance.new("TextLabel",IconBox)
IconLbl.Size=UDim2.new(1,0,1,0); IconLbl.BackgroundTransparency=1
IconLbl.TextSize=26; IconLbl.Font=Enum.Font.GothamBold

local CName=Instance.new("TextLabel",CP)
CName.Size=UDim2.new(1,-70,0,28); CName.Position=UDim2.new(0,64,0,10)
CName.BackgroundTransparency=1
CName.Font=Enum.Font.GothamBold; CName.TextSize=18
CName.TextColor3=Color3.fromRGB(210,240,255)
CName.TextXAlignment=Enum.TextXAlignment.Left
CName.TextTruncate=Enum.TextTruncate.AtEnd

local CDesc=Instance.new("TextLabel",CP)
CDesc.Size=UDim2.new(1,-70,0,18); CDesc.Position=UDim2.new(0,64,0,38)
CDesc.BackgroundTransparency=1
CDesc.Font=Enum.Font.GothamBold; CDesc.TextSize=10
CDesc.TextColor3=Color3.fromRGB(0,190,255); CDesc.TextTransparency=0.2
CDesc.TextXAlignment=Enum.TextXAlignment.Left

-- Online badge (HttpGet scripts)
local HttpBadge=Instance.new("TextLabel",CP)
HttpBadge.Size=UDim2.new(0,80,0,16); HttpBadge.Position=UDim2.new(0,64,0,58)
HttpBadge.BackgroundColor3=Color3.fromRGB(0,160,100); HttpBadge.BackgroundTransparency=0.3
HttpBadge.BorderSizePixel=0; HttpBadge.Text="🌐  ONLINE"
HttpBadge.Font=Enum.Font.GothamBold; HttpBadge.TextSize=9
HttpBadge.TextColor3=Color3.fromRGB(200,255,230); HttpBadge.Visible=false
Instance.new("UICorner",HttpBadge).CornerRadius=UDim.new(0,5)

local Div=Instance.new("Frame",CP)
Div.Size=UDim2.new(1,0,0,1); Div.Position=UDim2.new(0,0,0,72)
Div.BackgroundColor3=Color3.fromRGB(0,150,255); Div.BackgroundTransparency=0.7; Div.BorderSizePixel=0

-- Status row
local SRow=Instance.new("Frame",CP)
SRow.Size=UDim2.new(1,0,0,20); SRow.Position=UDim2.new(0,0,0,80)
SRow.BackgroundTransparency=1; SRow.BorderSizePixel=0

local SDot=Instance.new("Frame",SRow)
SDot.Size=UDim2.new(0,7,0,7); SDot.Position=UDim2.new(0,0,0.5,-3.5)
SDot.BackgroundColor3=Color3.fromRGB(0,255,140); SDot.BorderSizePixel=0
Instance.new("UICorner",SDot).CornerRadius=UDim.new(1,0)
task.spawn(function()
    while SDot.Parent do
        TweenService:Create(SDot,TweenInfo.new(0.8,Enum.EasingStyle.Sine),{BackgroundTransparency=0.5}):Play(); task.wait(0.8)
        TweenService:Create(SDot,TweenInfo.new(0.8,Enum.EasingStyle.Sine),{BackgroundTransparency=0}):Play(); task.wait(0.8)
    end
end)

local STxt=Instance.new("TextLabel",SRow)
STxt.Size=UDim2.new(0.5,0,1,0); STxt.Position=UDim2.new(0,13,0,0)
STxt.BackgroundTransparency=1; STxt.Text="READY TO LOAD"
STxt.Font=Enum.Font.GothamBold; STxt.TextSize=9
STxt.TextColor3=Color3.fromRGB(0,220,140); STxt.TextXAlignment=Enum.TextXAlignment.Left

local CTxt=Instance.new("TextLabel",SRow)
CTxt.Size=UDim2.new(0.5,0,1,0); CTxt.Position=UDim2.new(0.5,0,0,0)
CTxt.BackgroundTransparency=1; CTxt.Text=#SCRIPTS.." SCRIPTS LOADED"
CTxt.Font=Enum.Font.GothamBold; CTxt.TextSize=9
CTxt.TextColor3=Color3.fromRGB(0,160,220); CTxt.TextTransparency=0.3
CTxt.TextXAlignment=Enum.TextXAlignment.Right

-- Execute button
local ExecBtn=Instance.new("TextButton",CP)
ExecBtn.Size=UDim2.new(0.55,0,0,36); ExecBtn.Position=UDim2.new(0,0,1,-44)
ExecBtn.BackgroundColor3=Color3.fromRGB(0,130,255); ExecBtn.BackgroundTransparency=0.25
ExecBtn.BorderSizePixel=0; ExecBtn.Text="▶   EXECUTE SCRIPT"
ExecBtn.Font=Enum.Font.GothamBold; ExecBtn.TextSize=13
ExecBtn.TextColor3=Color3.fromRGB(220,245,255); ExecBtn.AutoButtonColor=false
Instance.new("UICorner",ExecBtn).CornerRadius=UDim.new(0,10)
local ExecStroke=Instance.new("UIStroke",ExecBtn)
ExecStroke.Thickness=1.2; ExecStroke.Color=Color3.fromRGB(0,200,255); ExecStroke.Transparency=0.3

ExecBtn.MouseEnter:Connect(function()
    TweenService:Create(ExecBtn,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(0,160,255),BackgroundTransparency=0.1}):Play()
end)
ExecBtn.MouseLeave:Connect(function()
    TweenService:Create(ExecBtn,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(0,130,255),BackgroundTransparency=0.25}):Play()
end)

-- ── REOPEN ORB ────────────────────────────────────────
local ReopenBtn=Instance.new("TextButton",ScreenGui)
ReopenBtn.Name="ReopenBtn"
ReopenBtn.Size=UDim2.new(0,44,0,44); ReopenBtn.Position=UDim2.new(1,-56,0,14)
ReopenBtn.BackgroundColor3=Color3.fromRGB(0,140,255); ReopenBtn.BackgroundTransparency=0.1
ReopenBtn.BorderSizePixel=0; ReopenBtn.Text="67"
ReopenBtn.Font=Enum.Font.GothamBold; ReopenBtn.TextSize=14
ReopenBtn.TextColor3=Color3.fromRGB(255,255,255)
ReopenBtn.ZIndex=20; ReopenBtn.Visible=false
Instance.new("UICorner",ReopenBtn).CornerRadius=UDim.new(1,0)
local orbStroke=Instance.new("UIStroke",ReopenBtn)
orbStroke.Thickness=2; orbStroke.Color=Color3.fromRGB(100,230,255)
task.spawn(function()
    while ReopenBtn.Parent do
        TweenService:Create(ReopenBtn,TweenInfo.new(0.8,Enum.EasingStyle.Sine),{BackgroundColor3=Color3.fromRGB(0,80,200)}):Play(); task.wait(0.8)
        TweenService:Create(ReopenBtn,TweenInfo.new(0.8,Enum.EasingStyle.Sine),{BackgroundColor3=Color3.fromRGB(0,200,255)}):Play(); task.wait(0.8)
    end
end)

do
    local dragging,dragStart,startPos=false,nil,nil
    ReopenBtn.InputBegan:Connect(function(inp)
        if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
            dragging=true; dragStart=inp.Position; startPos=ReopenBtn.Position
        end
    end)
    ReopenBtn.InputEnded:Connect(function(inp)
        if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then dragging=false end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if dragging and (inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch) then
            local d=inp.Position-dragStart
            ReopenBtn.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
        end
    end)
end

-- ── OPEN / CLOSE ──────────────────────────────────────
local panelOpen=true
local selectedIndex=1
local selectedScript=SCRIPTS[1]

local function closePanel()
    panelOpen=false
    TweenService:Create(Panel,TweenInfo.new(0.28,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
        Size=UDim2.new(0.88,0,0,0),Position=UDim2.new(0.06,0,0.5,0),BackgroundTransparency=1
    }):Play()
    TweenService:Create(Overlay,TweenInfo.new(0.22),{BackgroundTransparency=1}):Play()
    task.delay(0.3,function()
        Panel.Visible=false; Overlay.Visible=false
        ReopenBtn.Visible=true
        ReopenBtn.Size=UDim2.new(0,0,0,0); ReopenBtn.Position=UDim2.new(1,-28,0,38)
        TweenService:Create(ReopenBtn,TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
            Size=UDim2.new(0,44,0,44),Position=UDim2.new(1,-56,0,14)
        }):Play()
    end)
end

local function openPanel()
    panelOpen=true; Panel.Visible=true; Overlay.Visible=true
    Panel.Size=UDim2.new(0.88,0,0,0); Panel.Position=UDim2.new(0.06,0,0.5,0)
    Panel.BackgroundTransparency=1; Overlay.BackgroundTransparency=1
    TweenService:Create(Panel,TweenInfo.new(0.32,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
        Size=UDim2.new(0.88,0,0.62,0),Position=UDim2.new(0.06,0,0.19,0),BackgroundTransparency=0.06
    }):Play()
    TweenService:Create(Overlay,TweenInfo.new(0.22),{BackgroundTransparency=0.5}):Play()
    TweenService:Create(ReopenBtn,TweenInfo.new(0.15),{Size=UDim2.new(0,0,0,0)}):Play()
    task.delay(0.16,function() ReopenBtn.Visible=false end)
end

CloseBtn.MouseButton1Click:Connect(closePanel)
ReopenBtn.MouseButton1Click:Connect(openPanel)

-- ── CONTENT UPDATE ────────────────────────────────────
local navBtns={}

local function updateContent(idx)
    local s=SCRIPTS[idx]
    IconLbl.Text   = s.icon
    CName.Text     = s.name
    CDesc.Text     = s.desc
    HttpBadge.Visible = (s.kind=="http")
    selectedScript = s
    selectedIndex  = idx
    for i,btn in ipairs(navBtns) do
        if i==idx then
            TweenService:Create(btn,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(0,130,220),BackgroundTransparency=0.22}):Play()
            btn:FindFirstChild("NavStroke").Transparency=0
        else
            TweenService:Create(btn,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(0,80,160),BackgroundTransparency=0.88}):Play()
            btn:FindFirstChild("NavStroke").Transparency=0.7
        end
    end
end

-- ── BUILD NAV ITEMS ───────────────────────────────────
for i,s in ipairs(SCRIPTS) do
    local NavBtn=Instance.new("TextButton",NavScroll)
    NavBtn.Name="Nav_"..i
    NavBtn.Size=UDim2.new(1,0,0,38)
    NavBtn.BackgroundColor3=Color3.fromRGB(0,80,160); NavBtn.BackgroundTransparency=0.88
    NavBtn.BorderSizePixel=0; NavBtn.Text=""; NavBtn.AutoButtonColor=false
    Instance.new("UICorner",NavBtn).CornerRadius=UDim.new(0,9)
    local ns=Instance.new("UIStroke",NavBtn)
    ns.Name="NavStroke"; ns.Thickness=1
    ns.Color=Color3.fromRGB(0,180,255); ns.Transparency=0.7

    -- NEW badge — driven by isNew flag on each script, not hardcoded position
    if s.isNew then
        local nb=Instance.new("TextLabel",NavBtn)
        nb.Size=UDim2.new(0,28,0,14); nb.Position=UDim2.new(1,-32,0,4)
        nb.BackgroundColor3=Color3.fromRGB(0,200,120); nb.BackgroundTransparency=0.2
        nb.BorderSizePixel=0; nb.Text="NEW"
        nb.Font=Enum.Font.GothamBold; nb.TextSize=7
        nb.TextColor3=Color3.fromRGB(255,255,255); nb.ZIndex=3
        Instance.new("UICorner",nb).CornerRadius=UDim.new(0,4)
    end

    -- 🌐 badge for HttpGet scripts
    if s.kind=="http" then
        local wb=Instance.new("TextLabel",NavBtn)
        wb.Size=UDim2.new(0,16,0,16); wb.Position=UDim2.new(1,-20,0.5,-8)
        wb.BackgroundTransparency=1; wb.Text="🌐"
        wb.Font=Enum.Font.GothamBold; wb.TextSize=12; wb.ZIndex=3
    end

    local NIcon=Instance.new("TextLabel",NavBtn)
    NIcon.Size=UDim2.new(0,28,1,0); NIcon.Position=UDim2.new(0,5,0,0)
    NIcon.BackgroundTransparency=1; NIcon.Text=s.icon
    NIcon.TextSize=16; NIcon.Font=Enum.Font.GothamBold

    local NName=Instance.new("TextLabel",NavBtn)
    NName.Size=UDim2.new(1,-46,1,0); NName.Position=UDim2.new(0,36,0,0)
    NName.BackgroundTransparency=1; NName.Text=s.name
    NName.Font=Enum.Font.GothamBold; NName.TextSize=12
    NName.TextColor3=Color3.fromRGB(180,225,255)
    NName.TextXAlignment=Enum.TextXAlignment.Left
    NName.TextTruncate=Enum.TextTruncate.AtEnd

    NavBtn.MouseEnter:Connect(function()
        if i~=selectedIndex then TweenService:Create(NavBtn,TweenInfo.new(0.13),{BackgroundTransparency=0.7}):Play() end
    end)
    NavBtn.MouseLeave:Connect(function()
        if i~=selectedIndex then TweenService:Create(NavBtn,TweenInfo.new(0.13),{BackgroundTransparency=0.88}):Play() end
    end)
    NavBtn.MouseButton1Click:Connect(function() updateContent(i) end)
    table.insert(navBtns,NavBtn)
end

-- ── EXECUTE ───────────────────────────────────────────
ExecBtn.MouseButton1Click:Connect(function()
    TweenService:Create(ExecBtn,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(0,200,80),BackgroundTransparency=0.1}):Play()
    ExecBtn.Text="⏳   LOADING..."
    task.wait(0.2)
    closePanel()
    task.wait(0.1)
    local fn,err=loadstring(selectedScript.code)
    if fn then
        task.spawn(fn)
    else
        warn("[67 HUB XoSh] Load error: "..tostring(err))
    end
    task.delay(0.5,function()
        ExecBtn.Text="▶   EXECUTE SCRIPT"
        TweenService:Create(ExecBtn,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(0,130,255),BackgroundTransparency=0.25}):Play()
    end)
end)

-- ── LAUNCHER HIDDEN UNTIL LOADING SCREEN FINISHES ────
Panel.Visible=false; Overlay.Visible=false

function openLauncher()
    Panel.Visible=true; Overlay.Visible=true
    Panel.Size=UDim2.new(0.88,0,0,0); Panel.Position=UDim2.new(0.06,0,0.5,0)
    Panel.BackgroundTransparency=1; Overlay.BackgroundTransparency=1
    TweenService:Create(Overlay,TweenInfo.new(0.3),{BackgroundTransparency=0.5}):Play()
    TweenService:Create(Panel,TweenInfo.new(0.38,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
        Size=UDim2.new(0.88,0,0.62,0),Position=UDim2.new(0.06,0,0.19,0),BackgroundTransparency=0.06
    }):Play()
    task.delay(0.05,function() updateContent(1) end)
end
