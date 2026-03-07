--========================================================
-- 67 HUB XoSh — Script Launcher V4 (Landscape / Sidebar Split)
-- Scripts are lazy-loaded: only execute when clicked, no startup delay
--========================================================

local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player           = Players.LocalPlayer

-- ===================== SCRIPTS TABLE =====================
-- Each script is stored as a string and only run via loadstring() on click
-- This means NO blocking waits on startup — panel appears instantly
local SCRIPTS = {}

table.insert(SCRIPTS, {
    name = "Freeze Trade Legit",
    icon = "❄️",
    desc = "FREEZE • TRADE • LEGIT",
    kind = "embed",
    code = [[
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
    name = "Steal a Brainrot",
    icon = "🧠",
    desc = "AUTO STEAL • TELEPORT • NOCLIP",
    kind = "embed",
    code = [[
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local isTeleporting = false
local noclipEnabled = false
local noclipConn = nil

local fastStealOn = false
local fastStealLoop = nil
local fastStealConn = nil

local function getCharacter()
local char = LocalPlayer.Character
if not char or not char.Parent then
char = LocalPlayer.CharacterAdded:Wait()
end
return char
end

local function getMyPlot()
local plots = workspace:FindFirstChild("Plots")
if not plots then return nil end
for _, plot in ipairs(plots:GetChildren()) do
local label = plot:FindFirstChild("PlotSign")
and plot.PlotSign:FindFirstChild("SurfaceGui")
and plot.PlotSign.SurfaceGui:FindFirstChild("Frame")
and plot.PlotSign.SurfaceGui.Frame:FindFirstChild("TextLabel")
if label then
local t = (label.ContentText or label.Text or "")
if t:find(LocalPlayer.DisplayName) and t:find("Base") then
return plot
end
end
end
return nil
end

local function getDeliveryHitbox()
local myPlot = getMyPlot()
if not myPlot then return nil end
local delivery = myPlot:FindFirstChild("DeliveryHitbox") or myPlot:FindFirstChild("DeliveryHitbox", true)
if delivery and delivery:IsA("BasePart") then
return delivery
end
return nil
end

local function setNoclip(on)
noclipEnabled = on
if on then
if noclipConn then noclipConn:Disconnect() end
noclipConn = RunService.Stepped:Connect(function()
local char = LocalPlayer.Character
if not char then return end
for _, part in ipairs(char:GetDescendants()) do
if part:IsA("BasePart") then
part.CanCollide = false
end
end
end)
else
if noclipConn then
noclipConn:Disconnect()
noclipConn = nil
end
local char = LocalPlayer.Character
if char then
for _, part in ipairs(char:GetDescendants()) do
if part:IsA("BasePart") then
part.CanCollide = true
end
end
end
end
end

local function shortTeleportFreezeCamera(targetCF, duration)
if isTeleporting then return end
isTeleporting = true
duration = duration or 0.2
if duration < 0.1 then duration = 0.1 end
if duration > 0.5 then duration = 0.5 end
local character = getCharacter()
local hrp = character:FindFirstChild("HumanoidRootPart")
if not hrp then
isTeleporting = false
return
end
local camera = workspace.CurrentCamera
if not camera then
isTeleporting = false
return
end
local originalCF = hrp.CFrame
local originalCamType = camera.CameraType
local originalCamSub = camera.CameraSubject
local originalCamCFrame = camera.CFrame
local function restoreCamera()
local char = LocalPlayer.Character
local hum = char and char:FindFirstChildOfClass("Humanoid")
if hum then
camera.CameraSubject = hum
camera.CameraType = Enum.CameraType.Custom
else
camera.CameraType = originalCamType or Enum.CameraType.Custom
camera.CameraSubject = originalCamSub
end
camera.CFrame = originalCamCFrame
end
local ok = pcall(function()
camera.CameraType = Enum.CameraType.Scriptable
camera.CFrame = originalCamCFrame
hrp.CFrame = targetCF
task.wait(duration)
hrp.CFrame = originalCF
end)
restoreCamera()
isTeleporting = false
if not ok then
warn("[SAB UTILS] shortTeleport error")
end
end

local function doInstantSteal()
local character = getCharacter()
local hrp = character:FindFirstChild("HumanoidRootPart")
if not hrp then return end
local delivery = getDeliveryHitbox()
if not delivery then return end
local targetCF = delivery.CFrame + delivery.CFrame.LookVector * 3 + Vector3.new(0, 3, 0)
shortTeleportFreezeCamera(targetCF, 0.25)
end

local function doForwardTP()
local character = getCharacter()
local hrp = character:FindFirstChild("HumanoidRootPart")
if not hrp then return end
hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 8
end

local function patchPrompt(prompt)
if not prompt:IsA("ProximityPrompt") then return end
local ok = pcall(function()
if prompt.HoldDuration > 0.01 then
prompt.HoldDuration = 0.01
end
end)
if not ok then
end
end

local function setFastSteal(on)
fastStealOn = on
if on then
task.spawn(function()
for _, obj in ipairs(workspace:GetDescendants()) do
if obj:IsA("ProximityPrompt") then
patchPrompt(obj)
end
end
end)
if not fastStealLoop then
fastStealLoop = task.spawn(function()
while fastStealOn do
local ok, err = pcall(function()
for _, obj in ipairs(workspace:GetDescendants()) do
if obj:IsA("ProximityPrompt") then
patchPrompt(obj)
end
end
end)
if not ok then
warn("[SAB UTILS] FastSteal loop error:", err)
end
task.wait(0.08)
end
fastStealLoop = nil
end)
end
if fastStealConn then fastStealConn:Disconnect() end
fastStealConn = workspace.DescendantAdded:Connect(function(obj)
if fastStealOn and obj:IsA("ProximityPrompt") then
patchPrompt(obj)
end
end)
else
if fastStealConn then
fastStealConn:Disconnect()
fastStealConn = nil
end
end
end

local function createUI()
local guiParent = game:GetService("CoreGui")
pcall(function()
if gethui then
local h = gethui()
if h then guiParent = h end
end
end)
local old = guiParent:FindFirstChild("SAB_Utils_UI")
if old then old:Destroy() end
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SAB_Utils_UI"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
screenGui.Parent = guiParent
screenGui.AncestryChanged:Connect(function(_, parent)
if not parent then
setNoclip(false)
setFastSteal(false)
end
end)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 230, 0, 225)
mainFrame.Position = UDim2.new(0.68, -115, 0.55, -112)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 16, 24)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true
mainFrame.Parent = screenGui
local cardCorner = Instance.new("UICorner")
cardCorner.CornerRadius = UDim.new(0, 18)
cardCorner.Parent = mainFrame
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
ColorSequenceKeypoint.new(0.0, Color3.fromRGB(40, 45, 90)),
ColorSequenceKeypoint.new(0.5, Color3.fromRGB(25, 28, 55)),
ColorSequenceKeypoint.new(1.0, Color3.fromRGB(15, 16, 24))
}
gradient.Rotation = 90
gradient.Parent = mainFrame
local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(25, 26, 38)
header.BorderSizePixel = 0
header.Parent = mainFrame
local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 18)
headerCorner.Parent = header
local headerMask = Instance.new("Frame")
headerMask.Size = UDim2.new(1, 0, 0, 14)
headerMask.Position = UDim2.new(0, 0, 1, -14)
headerMask.BackgroundColor3 = header.BackgroundColor3
headerMask.BorderSizePixel = 0
headerMask.Parent = header
local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 12, 0, 0)
title.Font = Enum.Font.GothamBold
title.Text = "Steal a Brainrot"
title.TextSize = 15
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header
local subtitle = Instance.new("TextLabel")
subtitle.BackgroundTransparency = 1
subtitle.Size = UDim2.new(1, -40, 1, 0)
subtitle.Position = UDim2.new(0, 12, 0, 18)
subtitle.Font = Enum.Font.Gotham
subtitle.Text = "67OnTop"
subtitle.TextSize = 11
subtitle.TextColor3 = Color3.fromRGB(180, 190, 240)
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = header
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 22, 0, 22)
closeBtn.Position = UDim2.new(1, -30, 0.5, -11)
closeBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 80)
closeBtn.Text = "✕"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.TextColor3 = Color3.fromRGB(235, 235, 245)
closeBtn.Parent = header
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = closeBtn
closeBtn.MouseButton1Click:Connect(function()
screenGui:Destroy()
end)
do
local dragging = false
local dragInput, dragStart, startPos
local function update(input)
local delta = input.Position - dragStart
mainFrame.Position = UDim2.new(
startPos.X.Scale, startPos.X.Offset + delta.X,
startPos.Y.Scale, startPos.Y.Offset + delta.Y
)
end
header.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1
or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = input.Position
startPos = mainFrame.Position
dragInput = input
input.Changed:Connect(function(i)
if i.UserInputState == Enum.UserInputState.End then
dragging = false
end
end)
end
end)
header.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement
or input.UserInputType == Enum.UserInputType.Touch then
dragInput = input
end
end)
UserInputService.InputChanged:Connect(function(input)
if dragging and input == dragInput then
update(input)
end
end)
end
local body = Instance.new("Frame")
body.Size = UDim2.new(1, -20, 1, -58)
body.Position = UDim2.new(0, 10, 0, 46)
body.BackgroundTransparency = 1
body.Parent = mainFrame
local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 6)
padding.PaddingBottom = UDim.new(0, 6)
padding.PaddingLeft = UDim.new(0, 0)
padding.PaddingRight = UDim.new(0, 0)
padding.Parent = body
local list = Instance.new("UIListLayout")
list.FillDirection = Enum.FillDirection.Vertical
list.SortOrder = Enum.SortOrder.LayoutOrder
list.Padding = UDim.new(0, 6)
list.Parent = body
local function makeButton(text, color, textColor)
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(1, 0, 0, 34)
btn.BackgroundColor3 = color
btn.AutoButtonColor = true
btn.Font = Enum.Font.GothamBold
btn.Text = text
btn.TextSize = 14
btn.TextColor3 = textColor or Color3.fromRGB(255, 255, 255)
btn.Parent = body
local c = Instance.new("UICorner")
c.CornerRadius = UDim.new(0, 10)
c.Parent = btn
return btn
end
local instantBtn = makeButton("INSTANT STEAL", Color3.fromRGB(90, 155, 255))
local forwardBtn = makeButton("TP FORWARD", Color3.fromRGB(135, 215, 170), Color3.fromRGB(20, 25, 25))
local noclipBtn = makeButton("NOCLIP: OFF", Color3.fromRGB(110, 95, 170), Color3.fromRGB(235, 235, 245))
local fastBtn = makeButton("FAST STEAL: OFF", Color3.fromRGB(140, 130, 150), Color3.fromRGB(240, 240, 245))
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "ToggleButton"
toggleBtn.Size = UDim2.new(0, 34, 0, 34)
toggleBtn.Position = UDim2.new(0.02, 0, 0.5, -17)
toggleBtn.BackgroundColor3 = Color3.fromRGB(35, 36, 50)
toggleBtn.Text = "≡"
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 16
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Parent = screenGui
local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(1, 0)
toggleCorner.Parent = toggleBtn
toggleBtn.MouseButton1Click:Connect(function()
mainFrame.Visible = not mainFrame.Visible
toggleBtn.Text = mainFrame.Visible and "≡" or "▶"
end)
local uiScale = Instance.new("UIScale")
uiScale.Scale = 1
uiScale.Parent = mainFrame
local function updateScale()
local cam = workspace.CurrentCamera
if not cam then return end
local vp = cam.ViewportSize
local minSide = math.min(vp.X, vp.Y)
uiScale.Scale = (minSide <= 720) and 0.9 or 1
end
updateScale()
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(updateScale)
instantBtn.MouseButton1Click:Connect(doInstantSteal)
forwardBtn.MouseButton1Click:Connect(doForwardTP)
noclipBtn.MouseButton1Click:Connect(function()
setNoclip(not noclipEnabled)
if noclipEnabled then
noclipBtn.BackgroundColor3 = Color3.fromRGB(210, 135, 255)
noclipBtn.Text = "NOCLIP: ON"
else
noclipBtn.BackgroundColor3 = Color3.fromRGB(110, 95, 170)
noclipBtn.Text = "NOCLIP: OFF"
end
end)
fastBtn.MouseButton1Click:Connect(function()
setFastSteal(not fastStealOn)
if fastStealOn then
fastBtn.BackgroundColor3 = Color3.fromRGB(245, 175, 100)
fastBtn.TextColor3 = Color3.fromRGB(35, 25, 15)
fastBtn.Text = "FAST STEAL: ON"
else
fastBtn.BackgroundColor3 = Color3.fromRGB(140, 130, 150)
fastBtn.TextColor3 = Color3.fromRGB(240, 240, 245)
fastBtn.Text = "FAST STEAL: OFF"
end
end)
end

createUI()
]],
})

table.insert(SCRIPTS, {
    name = "67 Invisible",
    icon = "👻",
    desc = "INVISIBLE • SEMI-INVIS • STEAL",
    kind = "embed",
    code = [[
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
    name = "22S Duels",
    icon = "⚔️",
    desc = "AIMBOT • AUTO BAT • COMBAT",
    kind = "embed",
    code = [[
repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Player = Players.LocalPlayer

-- Safe character wait - don't force anything
local function waitForCharacter()
    local char = Player.Character
    if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid") then
        return char
    end
    return Player.CharacterAdded:Wait()
end

-- Wait for character without forcing reset
task.spawn(function()
    waitForCharacter()
end)

if not getgenv then
    getgenv = function() return _G end
end

local ConfigFileName = "22s_DUELS_Config.json"

local Enabled = {
    SpeedBoost = false,
    AntiRagdoll = false,
    SpinBot = false,
    SpeedWhileStealing = false,
    AutoSteal = false,
    Unwalk = false,
    Optimizer = false,
    Galaxy = false,
    SpamBat = false,
    BatAimbot = false,
    AutoDisableSpeed = true,
    GalaxySkyBright = false,
    AutoWalkEnabled = false,
    AutoRightEnabled = false,
    ScriptUserESP = true
}

local Values = {
    BoostSpeed = 30,
    SpinSpeed = 30,
    StealingSpeedValue = 29,
    STEAL_RADIUS = 20,
    STEAL_DURATION = 1.3,
    DEFAULT_GRAVITY = 196.2,
    GalaxyGravityPercent = 70,
    HOP_POWER = 35,
    HOP_COOLDOWN = 0.08
}

local KEYBINDS = {
    SPEED = Enum.KeyCode.V,
    SPIN = Enum.KeyCode.N,
    GALAXY = Enum.KeyCode.M,
    BATAIMBOT = Enum.KeyCode.X,
    NUKE = Enum.KeyCode.Q,
    AUTOLEFT = Enum.KeyCode.Z,
    AUTORIGHT = Enum.KeyCode.C
}

-- Load Config FIRST before anything else
local configLoaded = false
pcall(function()
    if readfile and isfile and isfile(ConfigFileName) then
        local data = HttpService:JSONDecode(readfile(ConfigFileName))
        if data then
            for k, v in pairs(data) do
                if Enabled[k] ~= nil then
                    Enabled[k] = v
                end
            end
            for k, v in pairs(data) do
                if Values[k] ~= nil then
                    Values[k] = v
                end
            end
            if data.KEY_SPEED then KEYBINDS.SPEED = Enum.KeyCode[data.KEY_SPEED] end
            if data.KEY_SPIN then KEYBINDS.SPIN = Enum.KeyCode[data.KEY_SPIN] end
            if data.KEY_GALAXY then KEYBINDS.GALAXY = Enum.KeyCode[data.KEY_GALAXY] end
            if data.KEY_BATAIMBOT then KEYBINDS.BATAIMBOT = Enum.KeyCode[data.KEY_BATAIMBOT] end
            if data.KEY_AUTOLEFT then KEYBINDS.AUTOLEFT = Enum.KeyCode[data.KEY_AUTOLEFT] end
            if data.KEY_AUTORIGHT then KEYBINDS.AUTORIGHT = Enum.KeyCode[data.KEY_AUTORIGHT] end
            configLoaded = true
        end
    end
end)

-- Save Config
local function SaveConfig()
    local data = {}
    for k, v in pairs(Enabled) do
        data[k] = v
    end
    for k, v in pairs(Values) do
        data[k] = v
    end
    data.KEY_SPEED = KEYBINDS.SPEED.Name
    data.KEY_SPIN = KEYBINDS.SPIN.Name
    data.KEY_GALAXY = KEYBINDS.GALAXY.Name
    data.KEY_BATAIMBOT = KEYBINDS.BATAIMBOT.Name
    data.KEY_AUTOLEFT = KEYBINDS.AUTOLEFT.Name
    data.KEY_AUTORIGHT = KEYBINDS.AUTORIGHT.Name
    
    local success = false
    if writefile then
        pcall(function()
            writefile(ConfigFileName, HttpService:JSONEncode(data))
            success = true
        end)
    end
    return success
end

local Connections = {}
local isStealing = false
local lastBatSwing = 0
local BAT_SWING_COOLDOWN = 0.12

local SlapList = {
    {1, "Bat"}, {2, "Slap"}, {3, "Iron Slap"}, {4, "Gold Slap"},
    {5, "Diamond Slap"}, {6, "Emerald Slap"}, {7, "Ruby Slap"},
    {8, "Dark Matter Slap"}, {9, "Flame Slap"}, {10, "Nuclear Slap"},
    {11, "Galaxy Slap"}, {12, "Glitched Slap"}
}

local ADMIN_KEY = "78a772b6-9e1c-4827-ab8b-04a07838f298"
local REMOTE_EVENT_ID = "352aad58-c786-4998-886b-3e4fa390721e"
local BALLOON_REMOTE = ReplicatedStorage:FindFirstChild(REMOTE_EVENT_ID, true)

local function INSTANT_NUKE(target)
    if not BALLOON_REMOTE or not target then return end
    for _, p in ipairs({"balloon", "ragdoll", "jumpscare", "morph", "tiny", "rocket", "inverse", "jail"}) do
        BALLOON_REMOTE:FireServer(ADMIN_KEY, target, p)
    end
end

local function getNearestPlayer()
    local c = Player.Character
    if not c then return nil end
    local h = c:FindFirstChild("HumanoidRootPart")
    if not h then return nil end
    local pos = h.Position
    local nearest = nil
    local dist = math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= Player and p.Character then
            local oh = p.Character:FindFirstChild("HumanoidRootPart")
            if oh then
                local d = (pos - oh.Position).Magnitude
                if d < dist then
                    dist = d
                    nearest = p
                end
            end
        end
    end
    return nearest
end

local function findBat()
    local c = Player.Character
    if not c then return nil end
    local bp = Player:FindFirstChildOfClass("Backpack")
    for _, ch in ipairs(c:GetChildren()) do
        if ch:IsA("Tool") and ch.Name:lower():find("bat") then
            return ch
        end
    end
    if bp then
        for _, ch in ipairs(bp:GetChildren()) do
            if ch:IsA("Tool") and ch.Name:lower():find("bat") then
                return ch
            end
        end
    end
    for _, i in ipairs(SlapList) do
        local t = c:FindFirstChild(i[2]) or (bp and bp:FindFirstChild(i[2]))
        if t then return t end
    end
    return nil
end

local function startSpamBat()
    if Connections.spamBat then return end
    Connections.spamBat = RunService.Heartbeat:Connect(function()
        if not Enabled.SpamBat then return end
        local c = Player.Character
        if not c then return end
        local bat = findBat()
        if not bat then return end
        if bat.Parent ~= c then
            bat.Parent = c
        end
        local now = tick()
        if now - lastBatSwing < BAT_SWING_COOLDOWN then return end
        lastBatSwing = now
        pcall(function() bat:Activate() end)
    end)
end

local function stopSpamBat()
    if Connections.spamBat then
        Connections.spamBat:Disconnect()
        Connections.spamBat = nil
    end
end

local spinBAV = nil

local function startSpinBot()
    local c = Player.Character
    if not c then return end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if spinBAV then spinBAV:Destroy() spinBAV = nil end
    for _, v in pairs(hrp:GetChildren()) do
        if v.Name == "SpinBAV" then v:Destroy() end
    end
    spinBAV = Instance.new("BodyAngularVelocity")
    spinBAV.Name = "SpinBAV"
    spinBAV.MaxTorque = Vector3.new(0, math.huge, 0)
    spinBAV.AngularVelocity = Vector3.new(0, Values.SpinSpeed, 0)
    spinBAV.Parent = hrp
end

local function stopSpinBot()
    if spinBAV then spinBAV:Destroy() spinBAV = nil end
    local c = Player.Character
    if c then
        local hrp = c:FindFirstChild("HumanoidRootPart")
        if hrp then
            for _, v in pairs(hrp:GetChildren()) do
                if v.Name == "SpinBAV" then v:Destroy() end
            end
        end
    end
end

-- ================================================================
-- ================================================================
local AutoWalkEnabled = false
local AutoRightEnabled = false

RunService.Heartbeat:Connect(function()
    if Enabled.SpinBot and spinBAV then
        if Player:GetAttribute("Stealing") then
            spinBAV.AngularVelocity = Vector3.new(0, 0, 0)
        else
            spinBAV.AngularVelocity = Vector3.new(0, Values.SpinSpeed, 0)
        end
    end
end)

-- Bat Aimbot (no radius limit, NO auto swing, purple line, smooth movement)
local aimbotTarget = nil

local function findNearestEnemy(myHRP)
    local nearest = nil
    local nearestDist = math.huge
    local nearestTorso = nil
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= Player and p.Character then
            local eh = p.Character:FindFirstChild("HumanoidRootPart")
            local torso = p.Character:FindFirstChild("UpperTorso") or p.Character:FindFirstChild("Torso")
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            if eh and hum and hum.Health > 0 then
                local d = (eh.Position - myHRP.Position).Magnitude
                if d < nearestDist then
                    nearestDist = d
                    nearest = eh
                    nearestTorso = torso or eh
                end
            end
        end
    end
    return nearest, nearestDist, nearestTorso
end

local function startBatAimbot()
    if Connections.batAimbot then return end
    
    Connections.batAimbot = RunService.Heartbeat:Connect(function(dt)
        if not Enabled.BatAimbot then return end
        local c = Player.Character
        if not c then return end
        local h = c:FindFirstChild("HumanoidRootPart")
        local hum = c:FindFirstChildOfClass("Humanoid")
        if not h or not hum then return end
        
        -- Equip bat if not equipped (no swinging)
        local bat = findBat()
        if bat and bat.Parent ~= c then
            hum:EquipTool(bat)
        end
        
        -- Find target
        local target, dist, torso = findNearestEnemy(h)
        aimbotTarget = torso or target
        
        if target and torso then
            local dir = (torso.Position - h.Position)
            local flatDir = Vector3.new(dir.X, 0, dir.Z)
            local flatDist = flatDir.Magnitude
            local spd = 55 -- Fixed aimbot speed
            
            if flatDist > 1.5 then
                local moveDir = flatDir.Unit
                h.AssemblyLinearVelocity = Vector3.new(moveDir.X * spd, h.AssemblyLinearVelocity.Y, moveDir.Z * spd)
            else
                local tv = target.AssemblyLinearVelocity
                h.AssemblyLinearVelocity = Vector3.new(tv.X, h.AssemblyLinearVelocity.Y, tv.Z)
            end
        end
    end)
end

local function stopBatAimbot()
    if Connections.batAimbot then
        Connections.batAimbot:Disconnect()
        Connections.batAimbot = nil
    end
    aimbotTarget = nil
end



-- Galaxy Mode
local galaxyVectorForce = nil
local galaxyAttachment = nil
local galaxyEnabled = false
local hopsEnabled = false
local lastHopTime = 0
local spaceHeld = false
local originalJumpPower = 50

-- Capture original jump power safely when character is ready
local function captureJumpPower()
    local c = Player.Character
    if c then
        local hum = c:FindFirstChildOfClass("Humanoid")
        if hum and hum.JumpPower > 0 then
            originalJumpPower = hum.JumpPower
        end
    end
end

-- Capture on current character
task.spawn(function()
    task.wait(1)
    captureJumpPower()
end)

-- Recapture when character respawns
Player.CharacterAdded:Connect(function(char)
    task.wait(1)
    captureJumpPower()
end)

local function setupGalaxyForce()
    pcall(function()
        local c = Player.Character
        if not c then return end
        local h = c:FindFirstChild("HumanoidRootPart")
        if not h then return end
        if galaxyVectorForce then galaxyVectorForce:Destroy() end
        if galaxyAttachment then galaxyAttachment:Destroy() end
        galaxyAttachment = Instance.new("Attachment")
        galaxyAttachment.Parent = h
        galaxyVectorForce = Instance.new("VectorForce")
        galaxyVectorForce.Attachment0 = galaxyAttachment
        galaxyVectorForce.ApplyAtCenterOfMass = true
        galaxyVectorForce.RelativeTo = Enum.ActuatorRelativeTo.World
        galaxyVectorForce.Force = Vector3.new(0, 0, 0)
        galaxyVectorForce.Parent = h
    end)
end

local function updateGalaxyForce()
    if not galaxyEnabled or not galaxyVectorForce then return end
    local c = Player.Character
    if not c then return end
    local mass = 0
    for _, p in ipairs(c:GetDescendants()) do
        if p:IsA("BasePart") then
            mass = mass + p:GetMass()
        end
    end
    local tg = Values.DEFAULT_GRAVITY * (Values.GalaxyGravityPercent / 100)
    galaxyVectorForce.Force = Vector3.new(0, mass * (Values.DEFAULT_GRAVITY - tg) * 0.95, 0)
end

local function adjustGalaxyJump()
    pcall(function()
        local c = Player.Character
        if not c then return end
        local hum = c:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        if not galaxyEnabled then
            hum.JumpPower = originalJumpPower
            return
        end
        local ratio = math.sqrt((Values.DEFAULT_GRAVITY * (Values.GalaxyGravityPercent / 100)) / Values.DEFAULT_GRAVITY)
        hum.JumpPower = originalJumpPower * ratio
    end)
end

local function doMiniHop()
    if not hopsEnabled then return end
    pcall(function()
        local c = Player.Character
        if not c then return end
        local h = c:FindFirstChild("HumanoidRootPart")
        local hum = c:FindFirstChildOfClass("Humanoid")
        if not h or not hum then return end
        if tick() - lastHopTime < Values.HOP_COOLDOWN then return end
        lastHopTime = tick()
        if hum.FloorMaterial == Enum.Material.Air then
            h.AssemblyLinearVelocity = Vector3.new(h.AssemblyLinearVelocity.X, Values.HOP_POWER, h.AssemblyLinearVelocity.Z)
        end
    end)
end

local function startGalaxy()
    galaxyEnabled = true
    hopsEnabled = true
    setupGalaxyForce()
    adjustGalaxyJump()
end

local function stopGalaxy()
    galaxyEnabled = false
    hopsEnabled = false
    if galaxyVectorForce then
        galaxyVectorForce:Destroy()
        galaxyVectorForce = nil
    end
    if galaxyAttachment then
        galaxyAttachment:Destroy()
        galaxyAttachment = nil
    end
    adjustGalaxyJump()
end

RunService.Heartbeat:Connect(function()
    if hopsEnabled and spaceHeld then
        doMiniHop()
    end
    if galaxyEnabled then
        updateGalaxyForce()
    end
end)

local function getMovementDirection()
    local c = Player.Character
    if not c then return Vector3.zero end
    local hum = c:FindFirstChildOfClass("Humanoid")
    return hum and hum.MoveDirection or Vector3.zero
end

local function isOnEnemyPlot()
    local character = Player.Character
    if not character then return false end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    local playerPos = hrp.Position
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return false end
    
    for _, plot in ipairs(plots:GetChildren()) do
        local isMyPlot = false
        local sign = plot:FindFirstChild("PlotSign")
        if sign then
            local yourBase = sign:FindFirstChild("YourBase")
            if yourBase and yourBase:IsA("BillboardGui") then 
                isMyPlot = yourBase.Enabled == true 
            end
        end
        
        if not isMyPlot then
            local plotPart = plot:FindFirstChild("Plot") or plot:FindFirstChildWhichIsA("BasePart")
            if plotPart and plotPart:IsA("BasePart") then
                local plotPos, plotSize = plotPart.Position, plotPart.Size
                if math.abs(playerPos.X - plotPos.X) <= plotSize.X/2 + 5 and 
                   math.abs(playerPos.Z - plotPos.Z) <= plotSize.Z/2 + 5 then 
                    return true 
                end
            end
            
            local podiums = plot:FindFirstChild("AnimalPodiums")
            if podiums then
                for _, podium in ipairs(podiums:GetChildren()) do
                    local base = podium:FindFirstChild("Base")
                    if base then
                        local spawn = base:FindFirstChild("Spawn")
                        if spawn and (spawn.Position - playerPos).Magnitude <= 25 then 
                            return true 
                        end
                    end
                end
            end
        end
    end
    return false
end

-- Auto walk/right destination coordinates (forward declared for speed boost check)
local POSITION_2 = Vector3.new(-483.12, -4.95, 94.80)
local POSITION_R2 = Vector3.new(-483.04, -5.09, 23.14)
local autoWalkPhase = 1
local autoRightPhase = 1

local function startSpeedBoost()
    if Connections.speed then return end
    Connections.speed = RunService.Heartbeat:Connect(function()
        if not Enabled.SpeedBoost then return end
        pcall(function()
            local c = Player.Character
            if not c then return end
            local h = c:FindFirstChild("HumanoidRootPart")
            if not h then return end
            local md = getMovementDirection()
            if md.Magnitude > 0.1 then
                h.AssemblyLinearVelocity = Vector3.new(md.X * Values.BoostSpeed, h.AssemblyLinearVelocity.Y, md.Z * Values.BoostSpeed)
            end
        end)
    end)
end

local function stopSpeedBoost()
    if Connections.speed then
        Connections.speed:Disconnect()
        Connections.speed = nil
    end
end

-- ============================================
-- AUTO LEFT / AUTO RIGHT COORDINATE ESP
-- Small precise markers at exact positions
-- ============================================
local coordESPFolder = Instance.new("Folder", workspace)
coordESPFolder.Name = "22s_CoordESP"

local function createCoordMarker(position, labelText, color)
    -- Small dot at exact position
    local dot = Instance.new("Part", coordESPFolder)
    dot.Name = "CoordMarker_" .. labelText
    dot.Anchored = true
    dot.CanCollide = false
    dot.CastShadow = false
    dot.Material = Enum.Material.Neon
    dot.Color = color
    dot.Shape = Enum.PartType.Ball
    dot.Size = Vector3.new(1, 1, 1)
    dot.Position = position
    dot.Transparency = 0.2

    -- Small billboard label
    local bb = Instance.new("BillboardGui", dot)
    bb.AlwaysOnTop = true
    bb.Size = UDim2.new(0, 100, 0, 20)
    bb.StudsOffset = Vector3.new(0, 2, 0)
    bb.MaxDistance = 300

    local text = Instance.new("TextLabel", bb)
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = labelText
    text.TextColor3 = color
    text.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    text.TextStrokeTransparency = 0
    text.Font = Enum.Font.GothamBold
    text.TextSize = 12
    text.TextScaled = false

    return dot
end

-- Create markers at exact coordinates
createCoordMarker(Vector3.new(-476.48, -6.28, 92.73), "L1", Color3.fromRGB(100, 150, 255))
createCoordMarker(Vector3.new(-483.12, -4.95, 94.80), "L END", Color3.fromRGB(60, 130, 255))
createCoordMarker(Vector3.new(-476.16, -6.52, 25.62), "R1", Color3.fromRGB(100, 220, 180))
createCoordMarker(Vector3.new(-483.04, -5.09, 23.14), "R END", Color3.fromRGB(50, 200, 150))

-- Auto Walk
local autoWalkConnection = nil
local POSITION_1 = Vector3.new(-476.48, -6.28, 92.73)

local autoRightConnection = nil
local POSITION_R1 = Vector3.new(-476.16, -6.52, 25.62)

local function faceSouth()
    local c = Player.Character
    if not c then return end
    local h = c:FindFirstChild("HumanoidRootPart")
    if not h then return end
    h.CFrame = CFrame.new(h.Position) * CFrame.Angles(0, 0, 0)
    local camera = workspace.CurrentCamera
    if camera then
        local camDistance = 12
        local camHeight = 5
        local charPos = h.Position
        camera.CFrame = CFrame.new(charPos.X, charPos.Y + camHeight, charPos.Z - camDistance) * CFrame.Angles(math.rad(-15), 0, 0)
    end
end

local function faceNorth()
    local c = Player.Character
    if not c then return end
    local h = c:FindFirstChild("HumanoidRootPart")
    if not h then return end
    h.CFrame = CFrame.new(h.Position) * CFrame.Angles(0, math.rad(180), 0)
    local camera = workspace.CurrentCamera
    if camera then
        local camDistance = 12
        local charPos = h.Position
        camera.CFrame = CFrame.new(charPos.X, charPos.Y + 2, charPos.Z + camDistance) * CFrame.Angles(0, math.rad(180), 0)
    end
end

local function startAutoWalk()
    if autoWalkConnection then autoWalkConnection:Disconnect() end
    autoWalkPhase = 1
    
    autoWalkConnection = RunService.Heartbeat:Connect(function()
        if not AutoWalkEnabled then return end
        local c = Player.Character
        if not c then return end
        local h = c:FindFirstChild("HumanoidRootPart")
        local hum = c:FindFirstChildOfClass("Humanoid")
        if not h or not hum then return end
        
        if autoWalkPhase == 1 then
            local targetPos = Vector3.new(POSITION_1.X, h.Position.Y, POSITION_1.Z)
            local dist = (targetPos - h.Position).Magnitude
            if dist < 1 then
                autoWalkPhase = 2
                -- Immediately start moving to coord 2 this same frame
                local dir = (POSITION_2 - h.Position)
                local moveDir = Vector3.new(dir.X, 0, dir.Z).Unit
                hum:Move(moveDir, false)
                h.AssemblyLinearVelocity = Vector3.new(moveDir.X * Values.BoostSpeed, h.AssemblyLinearVelocity.Y, moveDir.Z * Values.BoostSpeed)
                return
            end
            local dir = (POSITION_1 - h.Position)
            local moveDir = Vector3.new(dir.X, 0, dir.Z).Unit
            hum:Move(moveDir, false)
            h.AssemblyLinearVelocity = Vector3.new(moveDir.X * Values.BoostSpeed, h.AssemblyLinearVelocity.Y, moveDir.Z * Values.BoostSpeed)
            
        elseif autoWalkPhase == 2 then
            local targetPos = Vector3.new(POSITION_2.X, h.Position.Y, POSITION_2.Z)
            local dist = (targetPos - h.Position).Magnitude
            if dist < 1 then
                hum:Move(Vector3.zero, false)
                h.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                AutoWalkEnabled = false
                Enabled.AutoWalkEnabled = false

                if _G.setAutoLeftVisual then _G.setAutoLeftVisual(false) end
                if VisualSetters and VisualSetters.AutoWalkEnabled then VisualSetters.AutoWalkEnabled(false, true) end
                if autoWalkConnection then autoWalkConnection:Disconnect() autoWalkConnection = nil end
                faceSouth()
                return
            end
            local dir = (POSITION_2 - h.Position)
            local moveDir = Vector3.new(dir.X, 0, dir.Z).Unit
            hum:Move(moveDir, false)
            h.AssemblyLinearVelocity = Vector3.new(moveDir.X * Values.BoostSpeed, h.AssemblyLinearVelocity.Y, moveDir.Z * Values.BoostSpeed)
        end
    end)
end

local function stopAutoWalk()
    if autoWalkConnection then autoWalkConnection:Disconnect() autoWalkConnection = nil end
    autoWalkPhase = 1
    local c = Player.Character
    if c then
        local hum = c:FindFirstChildOfClass("Humanoid")
        if hum then hum:Move(Vector3.zero, false) end
    end
end

local function startAutoRight()
    if autoRightConnection then autoRightConnection:Disconnect() end
    autoRightPhase = 1
    
    autoRightConnection = RunService.Heartbeat:Connect(function()
        if not AutoRightEnabled then return end
        local c = Player.Character
        if not c then return end
        local h = c:FindFirstChild("HumanoidRootPart")
        local hum = c:FindFirstChildOfClass("Humanoid")
        if not h or not hum then return end
        
        if autoRightPhase == 1 then
            local targetPos = Vector3.new(POSITION_R1.X, h.Position.Y, POSITION_R1.Z)
            local dist = (targetPos - h.Position).Magnitude
            if dist < 1 then
                autoRightPhase = 2
                local dir = (POSITION_R2 - h.Position)
                local moveDir = Vector3.new(dir.X, 0, dir.Z).Unit
                hum:Move(moveDir, false)
                h.AssemblyLinearVelocity = Vector3.new(moveDir.X * Values.BoostSpeed, h.AssemblyLinearVelocity.Y, moveDir.Z * Values.BoostSpeed)
                return
            end
            local dir = (POSITION_R1 - h.Position)
            local moveDir = Vector3.new(dir.X, 0, dir.Z).Unit
            hum:Move(moveDir, false)
            h.AssemblyLinearVelocity = Vector3.new(moveDir.X * Values.BoostSpeed, h.AssemblyLinearVelocity.Y, moveDir.Z * Values.BoostSpeed)
            
        elseif autoRightPhase == 2 then
            local targetPos = Vector3.new(POSITION_R2.X, h.Position.Y, POSITION_R2.Z)
            local dist = (targetPos - h.Position).Magnitude
            if dist < 1 then
                hum:Move(Vector3.zero, false)
                h.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                AutoRightEnabled = false
                Enabled.AutoRightEnabled = false

                if _G.setAutoRightVisual then _G.setAutoRightVisual(false) end
                if VisualSetters and VisualSetters.AutoRightEnabled then VisualSetters.AutoRightEnabled(false, true) end
                if autoRightConnection then autoRightConnection:Disconnect() autoRightConnection = nil end
                faceNorth()
                return
            end
            local dir = (POSITION_R2 - h.Position)
            local moveDir = Vector3.new(dir.X, 0, dir.Z).Unit
            hum:Move(moveDir, false)
            h.AssemblyLinearVelocity = Vector3.new(moveDir.X * Values.BoostSpeed, h.AssemblyLinearVelocity.Y, moveDir.Z * Values.BoostSpeed)
        end
    end)
end

local function stopAutoRight()
    if autoRightConnection then autoRightConnection:Disconnect() autoRightConnection = nil end
    autoRightPhase = 1
    local c = Player.Character
    if c then
        local hum = c:FindFirstChildOfClass("Humanoid")
        if hum then hum:Move(Vector3.zero, false) end
    end
end

local function startAntiRagdoll()
    if Connections.antiRagdoll then return end
    Connections.antiRagdoll = RunService.Heartbeat:Connect(function()
        if not Enabled.AntiRagdoll then return end
        local char = Player.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            local humState = hum:GetState()
            if humState == Enum.HumanoidStateType.Physics or humState == Enum.HumanoidStateType.Ragdoll or humState == Enum.HumanoidStateType.FallingDown then
                hum:ChangeState(Enum.HumanoidStateType.Running)
                workspace.CurrentCamera.CameraSubject = hum
                pcall(function()
                    if Player.Character then
                        local PlayerModule = Player.PlayerScripts:FindFirstChild("PlayerModule")
                        if PlayerModule then
                            local Controls = require(PlayerModule:FindFirstChild("ControlModule"))
                            Controls:Enable()
                        end
                    end
                end)
                if root then
                    root.Velocity = Vector3.new(0, 0, 0)
                    root.RotVelocity = Vector3.new(0, 0, 0)
                end
            end
        end
        for _, obj in ipairs(char:GetDescendants()) do
            if obj:IsA("Motor6D") and obj.Enabled == false then obj.Enabled = true end
        end
    end)
end

local function stopAntiRagdoll()
    if Connections.antiRagdoll then
        Connections.antiRagdoll:Disconnect()
        Connections.antiRagdoll = nil
    end
end

local function startSpeedWhileStealing()
    if Connections.speedWhileStealing then return end
    Connections.speedWhileStealing = RunService.Heartbeat:Connect(function()
        if not Enabled.SpeedWhileStealing or not Player:GetAttribute("Stealing") then return end
        local c = Player.Character
        if not c then return end
        local h = c:FindFirstChild("HumanoidRootPart")
        if not h then return end
        local md = getMovementDirection()
        if md.Magnitude > 0.1 then
            h.AssemblyLinearVelocity = Vector3.new(md.X * Values.StealingSpeedValue, h.AssemblyLinearVelocity.Y, md.Z * Values.StealingSpeedValue)
        end
    end)
end

local function stopSpeedWhileStealing()
    if Connections.speedWhileStealing then
        Connections.speedWhileStealing:Disconnect()
        Connections.speedWhileStealing = nil
    end
end

-- Auto Steal
local ProgressBarFill, ProgressLabel, ProgressPercentLabel, RadiusInput
local stealStartTime = nil
local progressConnection = nil
local StealData = {}

-- Discord text for progress bar
local DISCORD_TEXT = "discord.gg/22s"

local function getDiscordProgress(percent)
    local totalChars = #DISCORD_TEXT
    -- Speed up the text reveal - complete by 70% progress so it's visible longer
    local adjustedPercent = math.min(percent * 1.5, 100)
    local charsToShow = math.floor((adjustedPercent / 100) * totalChars)
    return string.sub(DISCORD_TEXT, 1, charsToShow)
end

local function isMyPlotByName(pn)
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return false end
    local plot = plots:FindFirstChild(pn)
    if not plot then return false end
    local sign = plot:FindFirstChild("PlotSign")
    if sign then
        local yb = sign:FindFirstChild("YourBase")
        if yb and yb:IsA("BillboardGui") then
            return yb.Enabled == true
        end
    end
    return false
end

local function findNearestPrompt()
    local h = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if not h then return nil end
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return nil end
    local np, nd, nn = nil, math.huge, nil
    for _, plot in ipairs(plots:GetChildren()) do
        if isMyPlotByName(plot.Name) then continue end
        local podiums = plot:FindFirstChild("AnimalPodiums")
        if not podiums then continue end
        for _, pod in ipairs(podiums:GetChildren()) do
            pcall(function()
                local base = pod:FindFirstChild("Base")
                local spawn = base and base:FindFirstChild("Spawn")
                if spawn then
                    local dist = (spawn.Position - h.Position).Magnitude
                    if dist < nd and dist <= Values.STEAL_RADIUS then
                        local att = spawn:FindFirstChild("PromptAttachment")
                        if att then
                            for _, ch in ipairs(att:GetChildren()) do
                                if ch:IsA("ProximityPrompt") then
                                    np, nd, nn = ch, dist, pod.Name
                                    break
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
    return np, nd, nn
end

local function ResetProgressBar()
    if ProgressLabel then ProgressLabel.Text = "READY" end
    if ProgressPercentLabel then ProgressPercentLabel.Text = "" end
    if ProgressBarFill then ProgressBarFill.Size = UDim2.new(0, 0, 1, 0) end
end

local function executeSteal(prompt, name)
    if isStealing then return end
    if not StealData[prompt] then
        StealData[prompt] = {hold = {}, trigger = {}, ready = true}
        pcall(function()
            if getconnections then
                for _, c in ipairs(getconnections(prompt.PromptButtonHoldBegan)) do
                    if c.Function then table.insert(StealData[prompt].hold, c.Function) end
                end
                for _, c in ipairs(getconnections(prompt.Triggered)) do
                    if c.Function then table.insert(StealData[prompt].trigger, c.Function) end
                end
            end
        end)
    end
    local data = StealData[prompt]
    if not data.ready then return end
    data.ready = false
    isStealing = true
    stealStartTime = tick()
    if ProgressLabel then ProgressLabel.Text = name or "STEALING..." end
    if progressConnection then progressConnection:Disconnect() end
    progressConnection = RunService.Heartbeat:Connect(function()
        if not isStealing then progressConnection:Disconnect() return end
        local prog = math.clamp((tick() - stealStartTime) / Values.STEAL_DURATION, 0, 1)
        if ProgressBarFill then ProgressBarFill.Size = UDim2.new(prog, 0, 1, 0) end
        if ProgressPercentLabel then 
            local percent = math.floor(prog * 100)
            ProgressPercentLabel.Text = getDiscordProgress(percent)
        end
    end)
    task.spawn(function()
        for _, f in ipairs(data.hold) do task.spawn(f) end
        task.wait(Values.STEAL_DURATION)
        for _, f in ipairs(data.trigger) do task.spawn(f) end
        if progressConnection then progressConnection:Disconnect() end
        ResetProgressBar()
        data.ready = true
        isStealing = false
    end)
end

local function startAutoSteal()
    if Connections.autoSteal then return end
    Connections.autoSteal = RunService.Heartbeat:Connect(function()
        if not Enabled.AutoSteal or isStealing then return end
        local p, _, n = findNearestPrompt()
        if p then executeSteal(p, n) end
    end)
end

local function stopAutoSteal()
    if Connections.autoSteal then
        Connections.autoSteal:Disconnect()
        Connections.autoSteal = nil
    end
    isStealing = false
    ResetProgressBar()
end

-- Unwalk
local savedAnimations = {}

local function startUnwalk()
    local c = Player.Character
    if not c then return end
    local hum = c:FindFirstChildOfClass("Humanoid")
    if hum then
        for _, t in ipairs(hum:GetPlayingAnimationTracks()) do
            t:Stop()
        end
    end
    local anim = c:FindFirstChild("Animate")
    if anim then
        savedAnimations.Animate = anim:Clone()
        anim:Destroy()
    end
end

local function stopUnwalk()
    local c = Player.Character
    if c and savedAnimations.Animate then
        savedAnimations.Animate:Clone().Parent = c
        savedAnimations.Animate = nil
    end
end

-- Optimizer
local originalTransparency = {}
local xrayEnabled = false

local function enableOptimizer()
    if getgenv and getgenv().OPTIMIZER_ACTIVE then return end
    if getgenv then getgenv().OPTIMIZER_ACTIVE = true end
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        Lighting.GlobalShadows = false
        Lighting.Brightness = 3
        Lighting.FogEnd = 9e9
    end)
    pcall(function()
        for _, obj in ipairs(workspace:GetDescendants()) do
            pcall(function()
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
                    obj:Destroy()
                elseif obj:IsA("BasePart") then
                    obj.CastShadow = false
                    obj.Material = Enum.Material.Plastic
                end
            end)
        end
    end)
    xrayEnabled = true
    pcall(function()
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Anchored and (obj.Name:lower():find("base") or (obj.Parent and obj.Parent.Name:lower():find("base"))) then
                originalTransparency[obj] = obj.LocalTransparencyModifier
                obj.LocalTransparencyModifier = 0.85
            end
        end
    end)
end

local function disableOptimizer()
    if getgenv then getgenv().OPTIMIZER_ACTIVE = false end
    if xrayEnabled then
        for part, value in pairs(originalTransparency) do
            if part then part.LocalTransparencyModifier = value end
        end
        originalTransparency = {}
        xrayEnabled = false
    end
end

-- Galaxy Sky Bright
local originalSkybox = nil
local galaxySkyBright = nil
local galaxySkyBrightConn = nil
local galaxyPlanets = {}
local galaxyBloom = nil
local galaxyCC = nil

local function enableGalaxySkyBright()
    if galaxySkyBright then return end
    
    originalSkybox = Lighting:FindFirstChildOfClass("Sky")
    if originalSkybox then originalSkybox.Parent = nil end
    
    galaxySkyBright = Instance.new("Sky")
    galaxySkyBright.SkyboxBk = "rbxassetid://1534951537"
    galaxySkyBright.SkyboxDn = "rbxassetid://1534951537"
    galaxySkyBright.SkyboxFt = "rbxassetid://1534951537"
    galaxySkyBright.SkyboxLf = "rbxassetid://1534951537"
    galaxySkyBright.SkyboxRt = "rbxassetid://1534951537"
    galaxySkyBright.SkyboxUp = "rbxassetid://1534951537"
    galaxySkyBright.StarCount = 10000
    galaxySkyBright.CelestialBodiesShown = false
    galaxySkyBright.Parent = Lighting
    
    galaxyBloom = Instance.new("BloomEffect")
    galaxyBloom.Intensity = 1.5
    galaxyBloom.Size = 40
    galaxyBloom.Threshold = 0.8
    galaxyBloom.Parent = Lighting
    
    galaxyCC = Instance.new("ColorCorrectionEffect")
    galaxyCC.Saturation = 0.8
    galaxyCC.Contrast = 0.3
    galaxyCC.TintColor = Color3.fromRGB(200, 150, 255)
    galaxyCC.Parent = Lighting
    
    Lighting.Ambient = Color3.fromRGB(120, 60, 180)
    Lighting.Brightness = 3
    Lighting.ClockTime = 0
    
    for i = 1, 2 do
        local p = Instance.new("Part")
        p.Shape = Enum.PartType.Ball
        p.Size = Vector3.new(800 + i * 200, 800 + i * 200, 800 + i * 200)
        p.Anchored = true
        p.CanCollide = false
        p.CastShadow = false
        p.Material = Enum.Material.Neon
        p.Color = Color3.fromRGB(140 + i * 20, 60 + i * 10, 200 + i * 15)
        p.Transparency = 0.3
        p.Position = Vector3.new(math.cos(i * 2) * (3000 + i * 500), 1500 + i * 300, math.sin(i * 2) * (3000 + i * 500))
        p.Parent = workspace
        table.insert(galaxyPlanets, p)
    end
    
    galaxySkyBrightConn = RunService.Heartbeat:Connect(function()
        if not Enabled.GalaxySkyBright then return end
        local t = tick() * 0.5
        Lighting.Ambient = Color3.fromRGB(120 + math.sin(t) * 60, 50 + math.sin(t * 0.8) * 40, 180 + math.sin(t * 1.2) * 50)
        if galaxyBloom then
            galaxyBloom.Intensity = 1.2 + math.sin(t * 2) * 0.4
        end
    end)
end

local function disableGalaxySkyBright()
    if galaxySkyBrightConn then galaxySkyBrightConn:Disconnect() galaxySkyBrightConn = nil end
    if galaxySkyBright then galaxySkyBright:Destroy() galaxySkyBright = nil end
    if originalSkybox then originalSkybox.Parent = Lighting end
    if galaxyBloom then galaxyBloom:Destroy() galaxyBloom = nil end
    if galaxyCC then galaxyCC:Destroy() galaxyCC = nil end
    for _, obj in ipairs(galaxyPlanets) do
        if obj then obj:Destroy() end
    end
    galaxyPlanets = {}
    Lighting.Ambient = Color3.fromRGB(127, 127, 127)
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
end

-- ============================================
-- GUI - CLEAN NO BOXES - MORE BLACK
-- ============================================
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local guiScale = isMobile and 0.4 or 1

local C = {
    bg = Color3.fromRGB(2, 2, 4),
    purple = Color3.fromRGB(60, 130, 255),
    purpleLight = Color3.fromRGB(100, 170, 255),
    purpleDark = Color3.fromRGB(30, 80, 200),
    purpleGlow = Color3.fromRGB(80, 150, 255),
    accent = Color3.fromRGB(60, 130, 255),
    text = Color3.fromRGB(255, 255, 255),
    textDim = Color3.fromRGB(100, 170, 255),
    success = Color3.fromRGB(34, 197, 94),
    danger = Color3.fromRGB(239, 68, 68),
    border = Color3.fromRGB(30, 60, 120)
}

local sg = Instance.new("ScreenGui")
sg.Name = "22S_BLUE"
sg.ResetOnSpawn = false
sg.Parent = Player.PlayerGui

local function playSound(id, vol, spd)
    pcall(function()
        local s = Instance.new("Sound", SoundService)
        s.SoundId = id
        s.Volume = vol or 0.3
        s.PlaybackSpeed = spd or 1
        s:Play()
        game:GetService("Debris"):AddItem(s, 1)
    end)
end

-- Progress Bar
local progressBar = Instance.new("Frame", sg)
progressBar.Size = UDim2.new(0, 420 * guiScale, 0, 56 * guiScale)
progressBar.Position = UDim2.new(0.5, -210 * guiScale, 1, -168 * guiScale)
progressBar.BackgroundColor3 = Color3.fromRGB(2, 2, 4)
progressBar.BorderSizePixel = 0
progressBar.ClipsDescendants = true
Instance.new("UICorner", progressBar).CornerRadius = UDim.new(0, 14 * guiScale)

local pStroke = Instance.new("UIStroke", progressBar)
pStroke.Thickness = 2
local pGrad = Instance.new("UIGradient", pStroke)
pGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 170, 255)),
    ColorSequenceKeypoint.new(0.3, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(60, 130, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
})

task.spawn(function()
    local r = 0
    while progressBar.Parent do
        r = (r + 3) % 360
        pGrad.Rotation = r
        task.wait(0.02)
    end
end)

for i = 1, 12 do
    local ball = Instance.new("Frame", progressBar)
    ball.Size = UDim2.new(0, math.random(2, 3), 0, math.random(2, 3))
    ball.Position = UDim2.new(math.random(3, 97) / 100, 0, math.random(15, 85) / 100, 0)
    ball.BackgroundColor3 = Color3.fromRGB(100, 170, 255)
    ball.BackgroundTransparency = math.random(20, 50) / 100
    ball.BorderSizePixel = 0
    ball.ZIndex = 1
    Instance.new("UICorner", ball).CornerRadius = UDim.new(1, 0)
    
    task.spawn(function()
        local startX = ball.Position.X.Scale
        local startY = ball.Position.Y.Scale
        local phase = math.random() * math.pi * 2
        while ball.Parent do
            local t = tick() + phase
            local newX = startX + math.sin(t * (0.5 + i * 0.1)) * 0.03
            local newY = startY + math.cos(t * (0.4 + i * 0.08)) * 0.05
            ball.Position = UDim2.new(math.clamp(newX, 0.02, 0.98), 0, math.clamp(newY, 0.1, 0.9), 0)
            ball.BackgroundTransparency = 0.3 + math.sin(t * 2) * 0.2
            task.wait(0.03)
        end
    end)
end

ProgressLabel = Instance.new("TextLabel", progressBar)
ProgressLabel.Size = UDim2.new(0.35, 0, 0.5, 0)
ProgressLabel.Position = UDim2.new(0, 10 * guiScale, 0, 0)
ProgressLabel.BackgroundTransparency = 1
ProgressLabel.Text = "READY"
ProgressLabel.TextColor3 = C.text
ProgressLabel.Font = Enum.Font.GothamBold
ProgressLabel.TextSize = 14 * guiScale
ProgressLabel.TextXAlignment = Enum.TextXAlignment.Left
ProgressLabel.ZIndex = 3

ProgressPercentLabel = Instance.new("TextLabel", progressBar)
ProgressPercentLabel.Size = UDim2.new(1, 0, 0.5, 0)
ProgressPercentLabel.BackgroundTransparency = 1
ProgressPercentLabel.Text = ""
ProgressPercentLabel.TextColor3 = C.purpleLight
ProgressPercentLabel.Font = Enum.Font.GothamBlack
ProgressPercentLabel.TextSize = 18 * guiScale
ProgressPercentLabel.TextXAlignment = Enum.TextXAlignment.Center
ProgressPercentLabel.ZIndex = 3

RadiusInput = Instance.new("TextBox", progressBar)
RadiusInput.Size = UDim2.new(0, 40 * guiScale, 0, 22 * guiScale)
RadiusInput.Position = UDim2.new(1, -50 * guiScale, 0, 2 * guiScale)
RadiusInput.BackgroundColor3 = Color3.fromRGB(5, 5, 8)
RadiusInput.Text = tostring(Values.STEAL_RADIUS)
RadiusInput.TextColor3 = C.purpleLight
RadiusInput.Font = Enum.Font.GothamBold
RadiusInput.TextSize = 12 * guiScale
RadiusInput.ZIndex = 3
Instance.new("UICorner", RadiusInput).CornerRadius = UDim.new(0, 6 * guiScale)

RadiusInput.FocusLost:Connect(function()
    local n = tonumber(RadiusInput.Text)
    if n then
        Values.STEAL_RADIUS = math.clamp(math.floor(n), 5, 100)
        RadiusInput.Text = tostring(Values.STEAL_RADIUS)
    end
end)

local pTrack = Instance.new("Frame", progressBar)
pTrack.Size = UDim2.new(0.94, 0, 0, 8 * guiScale)
pTrack.Position = UDim2.new(0.03, 0, 1, -15 * guiScale)
pTrack.BackgroundColor3 = Color3.fromRGB(5, 5, 8)
pTrack.ZIndex = 2
Instance.new("UICorner", pTrack).CornerRadius = UDim.new(1, 0)

ProgressBarFill = Instance.new("Frame", pTrack)
ProgressBarFill.Size = UDim2.new(0, 0, 1, 0)
ProgressBarFill.BackgroundColor3 = C.purple
ProgressBarFill.ZIndex = 2
Instance.new("UICorner", ProgressBarFill).CornerRadius = UDim.new(1, 0)

-- Main Window
local main = Instance.new("Frame", sg)
main.Name = "Main"
main.Size = UDim2.new(0, 560 * guiScale, 0, 740 * guiScale)
main.Position = isMobile and UDim2.new(0.5, -280 * guiScale, 0.5, -370 * guiScale) or UDim2.new(1, -580, 0, 20)
main.BackgroundColor3 = Color3.fromRGB(2, 2, 4)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.ClipsDescendants = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 18 * guiScale)

local mainStroke = Instance.new("UIStroke", main)
mainStroke.Thickness = 2
local strokeGrad = Instance.new("UIGradient", mainStroke)
strokeGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 170, 255)),
    ColorSequenceKeypoint.new(0.2, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(60, 130, 255)),
    ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 170, 255))
})

task.spawn(function()
    local r = 0
    while main.Parent do
        r = (r + 3) % 360
        strokeGrad.Rotation = r
        task.wait(0.02)
    end
end)

for i = 1, 60 do
    local ball = Instance.new("Frame", main)
    ball.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
    ball.Position = UDim2.new(math.random(2, 98) / 100, 0, math.random(2, 98) / 100, 0)
    ball.BackgroundColor3 = Color3.fromRGB(100, 170, 255)
    ball.BackgroundTransparency = math.random(10, 40) / 100
    ball.BorderSizePixel = 0
    ball.ZIndex = 2
    Instance.new("UICorner", ball).CornerRadius = UDim.new(1, 0)
    
    task.spawn(function()
        local startX = ball.Position.X.Scale
        local startY = ball.Position.Y.Scale
        local phase = math.random() * math.pi * 2
        local speedMult = 0.3 + math.random() * 0.4
        while ball.Parent do
            local t = tick() + phase
            local newX = startX + math.sin(t * speedMult) * 0.02
            local newY = startY + math.cos(t * speedMult * 0.8) * 0.015
            ball.Position = UDim2.new(math.clamp(newX, 0.01, 0.99), 0, math.clamp(newY, 0.01, 0.99), 0)
            ball.BackgroundTransparency = 0.2 + math.sin(t * 1.5 + phase) * 0.25
            task.wait(0.03)
        end
    end)
end

-- Header
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 70 * guiScale)
header.BackgroundTransparency = 1
header.BorderSizePixel = 0
header.ZIndex = 0

local titleLabel = Instance.new("TextLabel", header)
titleLabel.Size = UDim2.new(1, 0, 0, 32 * guiScale)
titleLabel.Position = UDim2.new(0, 0, 0, 10 * guiScale)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "22S DUELS"
titleLabel.TextColor3 = C.text
titleLabel.Font = Enum.Font.GothamBlack
titleLabel.TextSize = 28 * guiScale
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.ZIndex = 5

local subtitleLabel = Instance.new("TextLabel", header)
subtitleLabel.Size = UDim2.new(1, 0, 0, 24 * guiScale)
subtitleLabel.Position = UDim2.new(0, 0, 0, 40 * guiScale)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "discord.gg/22s"
subtitleLabel.TextColor3 = C.purpleLight
subtitleLabel.Font = Enum.Font.GothamBold
subtitleLabel.TextSize = 16 * guiScale
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Center
subtitleLabel.ZIndex = 5

local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0, 36 * guiScale, 0, 36 * guiScale)
closeBtn.Position = UDim2.new(1, -46 * guiScale, 0.5, -18 * guiScale)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "×"
closeBtn.TextColor3 = C.textDim
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 24 * guiScale
closeBtn.ZIndex = 5

closeBtn.MouseButton1Click:Connect(function() sg:Destroy() end)
closeBtn.MouseEnter:Connect(function() closeBtn.TextColor3 = C.danger end)
closeBtn.MouseLeave:Connect(function() closeBtn.TextColor3 = C.textDim end)

local leftSide = Instance.new("Frame", main)
leftSide.Size = UDim2.new(0.48, 0, 0, 650 * guiScale)
leftSide.Position = UDim2.new(0.01, 0, 0, 75 * guiScale)
leftSide.BackgroundTransparency = 1
leftSide.BorderSizePixel = 0
leftSide.ClipsDescendants = true
leftSide.ZIndex = 2

local rightSide = Instance.new("Frame", main)
rightSide.Size = UDim2.new(0.48, 0, 0, 650 * guiScale)
rightSide.Position = UDim2.new(0.51, 0, 0, 75 * guiScale)
rightSide.BackgroundTransparency = 1
rightSide.BorderSizePixel = 0
rightSide.ClipsDescendants = true
rightSide.ZIndex = 2

VisualSetters = {}
local SliderSetters = {}
local KeyButtons = {}
local waitingForKeybind = nil

-- CLEAN TOGGLE WITH KEYBIND - No box, just text, key button and switch - SPACED OUT
local function createToggleWithKey(parent, yPos, labelText, keybindKey, enabledKey, callback, specialColor)
    local row = Instance.new("Frame", parent)
    row.Size = UDim2.new(1, -10 * guiScale, 0, 48 * guiScale)
    row.Position = UDim2.new(0, 5 * guiScale, 0, yPos * guiScale)
    row.BackgroundTransparency = 1
    row.BorderSizePixel = 0
    row.ZIndex = 3
    
    local keyBtn = Instance.new("TextButton", row)
    keyBtn.Size = UDim2.new(0, 36 * guiScale, 0, 28 * guiScale)
    keyBtn.Position = UDim2.new(0, 3 * guiScale, 0.5, -14 * guiScale)
    keyBtn.BackgroundColor3 = C.purple
    keyBtn.Text = KEYBINDS[keybindKey].Name
    keyBtn.TextColor3 = Color3.new(1, 1, 1)
    keyBtn.Font = Enum.Font.GothamBold
    keyBtn.TextSize = 11 * guiScale
    keyBtn.ZIndex = 4
    Instance.new("UICorner", keyBtn).CornerRadius = UDim.new(0, 8 * guiScale)
    
    KeyButtons[keybindKey] = keyBtn
    
    local label = Instance.new("TextLabel", row)
    label.Size = UDim2.new(0.55, 0, 1, 0)
    label.Position = UDim2.new(0, 45 * guiScale, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = labelText
    label.TextColor3 = C.text
    label.Font = Enum.Font.GothamSemibold
    label.TextSize = 14 * guiScale
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 4
    
    local onColor = specialColor or C.purple
    local defaultOn = Enabled[enabledKey]
    
    local toggleBg = Instance.new("Frame", row)
    toggleBg.Size = UDim2.new(0, 50 * guiScale, 0, 26 * guiScale)
    toggleBg.Position = UDim2.new(1, -58 * guiScale, 0.5, -13 * guiScale)
    toggleBg.BackgroundColor3 = defaultOn and onColor or Color3.fromRGB(25, 20, 35)
    toggleBg.ZIndex = 4
    Instance.new("UICorner", toggleBg).CornerRadius = UDim.new(1, 0)
    
    local toggleCircle = Instance.new("Frame", toggleBg)
    toggleCircle.Size = UDim2.new(0, 20 * guiScale, 0, 20 * guiScale)
    toggleCircle.Position = defaultOn and UDim2.new(1, -23 * guiScale, 0.5, -10 * guiScale) or UDim2.new(0, 3 * guiScale, 0.5, -10 * guiScale)
    toggleCircle.BackgroundColor3 = Color3.new(1, 1, 1)
    toggleCircle.ZIndex = 5
    Instance.new("UICorner", toggleCircle).CornerRadius = UDim.new(1, 0)
    
    local clickBtn = Instance.new("TextButton", row)
    clickBtn.Size = UDim2.new(0.6, 0, 1, 0)
    clickBtn.Position = UDim2.new(0.4, 0, 0, 0)
    clickBtn.BackgroundTransparency = 1
    clickBtn.Text = ""
    clickBtn.ZIndex = 6
    
    local isOn = defaultOn
    
    local function setVisual(state, skipCallback)
        isOn = state
        TweenService:Create(toggleBg, TweenInfo.new(0.3), {BackgroundColor3 = isOn and onColor or Color3.fromRGB(25, 20, 35)}):Play()
        TweenService:Create(toggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Position = isOn and UDim2.new(1, -23 * guiScale, 0.5, -10 * guiScale) or UDim2.new(0, 3 * guiScale, 0.5, -10 * guiScale)}):Play()
        if not skipCallback then
            callback(isOn)
        end
    end
    
    VisualSetters[enabledKey] = setVisual
    
    clickBtn.MouseButton1Click:Connect(function()
        isOn = not isOn
        Enabled[enabledKey] = isOn
        setVisual(isOn)
        playSound("rbxassetid://6895079813", 0.4, 1)
    end)
    
    keyBtn.MouseButton1Click:Connect(function()
        waitingForKeybind = keybindKey
        keyBtn.Text = "..."
        playSound("rbxassetid://6895079813", 0.3, 1.5)
    end)
    
    return row, enabledKey, function() return isOn end, setVisual, keyBtn
end

-- CLEAN TOGGLE - No box, just text and switch - SPACED OUT
local function createToggle(parent, yPos, labelText, enabledKey, callback, specialColor)
    local row = Instance.new("Frame", parent)
    row.Size = UDim2.new(1, -10 * guiScale, 0, 48 * guiScale)
    row.Position = UDim2.new(0, 5 * guiScale, 0, yPos * guiScale)
    row.BackgroundTransparency = 1
    row.BorderSizePixel = 0
    row.ZIndex = 3
    
    local label = Instance.new("TextLabel", row)
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 10 * guiScale, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = labelText
    label.TextColor3 = C.text
    label.Font = Enum.Font.GothamSemibold
    label.TextSize = 14 * guiScale
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 4
    
    local onColor = specialColor or C.purple
    local defaultOn = Enabled[enabledKey]
    
    local toggleBg = Instance.new("Frame", row)
    toggleBg.Size = UDim2.new(0, 50 * guiScale, 0, 26 * guiScale)
    toggleBg.Position = UDim2.new(1, -58 * guiScale, 0.5, -13 * guiScale)
    toggleBg.BackgroundColor3 = defaultOn and onColor or Color3.fromRGB(25, 20, 35)
    toggleBg.ZIndex = 4
    Instance.new("UICorner", toggleBg).CornerRadius = UDim.new(1, 0)
    
    local toggleCircle = Instance.new("Frame", toggleBg)
    toggleCircle.Size = UDim2.new(0, 20 * guiScale, 0, 20 * guiScale)
    toggleCircle.Position = defaultOn and UDim2.new(1, -23 * guiScale, 0.5, -10 * guiScale) or UDim2.new(0, 3 * guiScale, 0.5, -10 * guiScale)
    toggleCircle.BackgroundColor3 = Color3.new(1, 1, 1)
    toggleCircle.ZIndex = 5
    Instance.new("UICorner", toggleCircle).CornerRadius = UDim.new(1, 0)
    
    local clickBtn = Instance.new("TextButton", row)
    clickBtn.Size = UDim2.new(1, 0, 1, 0)
    clickBtn.BackgroundTransparency = 1
    clickBtn.Text = ""
    clickBtn.ZIndex = 6
    
    local isOn = defaultOn
    
    local function setVisual(state, skipCallback)
        isOn = state
        TweenService:Create(toggleBg, TweenInfo.new(0.3), {BackgroundColor3 = isOn and onColor or Color3.fromRGB(25, 20, 35)}):Play()
        TweenService:Create(toggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Position = isOn and UDim2.new(1, -23 * guiScale, 0.5, -10 * guiScale) or UDim2.new(0, 3 * guiScale, 0.5, -10 * guiScale)}):Play()
        if not skipCallback then
            callback(isOn)
        end
    end
    
    VisualSetters[enabledKey] = setVisual
    
    clickBtn.MouseButton1Click:Connect(function()
        isOn = not isOn
        Enabled[enabledKey] = isOn
        setVisual(isOn)
        playSound("rbxassetid://6895079813", 0.4, 1)
    end)
    
    return row, enabledKey, function() return isOn end, setVisual
end

-- CLEAN SLIDER - No box - SPACED OUT
local function createSlider(parent, yPos, labelText, minVal, maxVal, valueKey, callback)
    local container = Instance.new("Frame", parent)
    container.Size = UDim2.new(1, -10 * guiScale, 0, 56 * guiScale)
    container.Position = UDim2.new(0, 5 * guiScale, 0, yPos * guiScale)
    container.BackgroundTransparency = 1
    container.BorderSizePixel = 0
    container.ZIndex = 3
    
    local label = Instance.new("TextLabel", container)
    label.Size = UDim2.new(0.6, 0, 0, 20 * guiScale)
    label.Position = UDim2.new(0, 10 * guiScale, 0, 4 * guiScale)
    label.BackgroundTransparency = 1
    label.Text = labelText
    label.TextColor3 = C.textDim
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 12 * guiScale
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 4
    
    local defaultVal = Values[valueKey]
    
    local valueInput = Instance.new("TextBox", container)
    valueInput.Size = UDim2.new(0, 50 * guiScale, 0, 22 * guiScale)
    valueInput.Position = UDim2.new(1, -58 * guiScale, 0, 2 * guiScale)
    valueInput.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
    valueInput.Text = tostring(defaultVal)
    valueInput.TextColor3 = C.purpleLight
    valueInput.Font = Enum.Font.GothamBold
    valueInput.TextSize = 12 * guiScale
    valueInput.ClearTextOnFocus = false
    valueInput.ZIndex = 4
    Instance.new("UICorner", valueInput).CornerRadius = UDim.new(0, 6 * guiScale)
    
    local sliderBg = Instance.new("Frame", container)
    sliderBg.Size = UDim2.new(0.92, 0, 0, 10 * guiScale)
    sliderBg.Position = UDim2.new(0.04, 0, 0, 32 * guiScale)
    sliderBg.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
    sliderBg.ZIndex = 4
    Instance.new("UICorner", sliderBg).CornerRadius = UDim.new(1, 0)
    
    local pct = (defaultVal - minVal) / (maxVal - minVal)
    
    local sliderFill = Instance.new("Frame", sliderBg)
    sliderFill.Size = UDim2.new(pct, 0, 1, 0)
    sliderFill.BackgroundColor3 = C.purple
    sliderFill.ZIndex = 5
    Instance.new("UICorner", sliderFill).CornerRadius = UDim.new(1, 0)
    
    local thumb = Instance.new("Frame", sliderBg)
    thumb.Size = UDim2.new(0, 16 * guiScale, 0, 16 * guiScale)
    thumb.Position = UDim2.new(pct, -8 * guiScale, 0.5, -8 * guiScale)
    thumb.BackgroundColor3 = Color3.new(1, 1, 1)
    thumb.ZIndex = 6
    Instance.new("UICorner", thumb).CornerRadius = UDim.new(1, 0)
    
    local sliderBtn = Instance.new("TextButton", sliderBg)
    sliderBtn.Size = UDim2.new(1, 0, 3, 0)
    sliderBtn.Position = UDim2.new(0, 0, -1, 0)
    sliderBtn.BackgroundTransparency = 1
    sliderBtn.Text = ""
    sliderBtn.ZIndex = 7
    
    local dragging = false
    
    local function updateSlider(rel, skipCallback)
        rel = math.clamp(rel, 0, 1)
        sliderFill.Size = UDim2.new(rel, 0, 1, 0)
        thumb.Position = UDim2.new(rel, -8 * guiScale, 0.5, -8 * guiScale)
        local val = math.floor(minVal + (maxVal - minVal) * rel)
        valueInput.Text = tostring(val)
        Values[valueKey] = val
        if not skipCallback then
            callback(val)
        end
    end
    
    local function setSliderValue(val)
        val = math.clamp(val, minVal, maxVal)
        local rel = (val - minVal) / (maxVal - minVal)
        sliderFill.Size = UDim2.new(rel, 0, 1, 0)
        thumb.Position = UDim2.new(rel, -8 * guiScale, 0.5, -8 * guiScale)
        valueInput.Text = tostring(val)
        Values[valueKey] = val
    end
    
    SliderSetters[valueKey] = setSliderValue
    
    sliderBtn.MouseButton1Down:Connect(function() dragging = true end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider((input.Position.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X)
        end
    end)
    
    valueInput.FocusLost:Connect(function()
        local n = tonumber(valueInput.Text)
        if n then
            n = math.clamp(math.floor(n), minVal, maxVal)
            valueInput.Text = tostring(n)
            local r = (n - minVal) / (maxVal - minVal)
            sliderFill.Size = UDim2.new(r, 0, 1, 0)
            thumb.Position = UDim2.new(r, -8 * guiScale, 0.5, -8 * guiScale)
            Values[valueKey] = n
            callback(n)
        end
    end)
    
    return container, setSliderValue
end

-- Left side toggles - SPACED OUT LIKE BEFORE
createToggleWithKey(leftSide, 0, "Speed Boost", "SPEED", "SpeedBoost", function(s)
    Enabled.SpeedBoost = s
    if s then startSpeedBoost() else stopSpeedBoost() end
end)
_G.setSpeedVisual = VisualSetters.SpeedBoost

createSlider(leftSide, 52, "Boost Speed", 1, 70, "BoostSpeed", function(v) Values.BoostSpeed = v end)

createToggle(leftSide, 112, "Anti Ragdoll", "AntiRagdoll", function(s)
    Enabled.AntiRagdoll = s
    if s then startAntiRagdoll() else stopAntiRagdoll() end
end)

createToggleWithKey(leftSide, 216, "Spin Bot", "SPIN", "SpinBot", function(s)
    Enabled.SpinBot = s
    if s then startSpinBot() else stopSpinBot() end
end)

createSlider(leftSide, 268, "Spin Speed", 5, 50, "SpinSpeed", function(v) Values.SpinSpeed = v end)

createToggle(leftSide, 328, "Spam Bat", "SpamBat", function(s)
    Enabled.SpamBat = s
    if s then startSpamBat() else stopSpamBat() end
end)

createToggle(leftSide, 380, "Auto Steal", "AutoSteal", function(s)
    Enabled.AutoSteal = s
    if s then startAutoSteal() else stopAutoSteal() end
end)

createToggleWithKey(leftSide, 432, "Bat Aimbot", "BATAIMBOT", "BatAimbot", function(s)
    Enabled.BatAimbot = s
    if s then startBatAimbot() else stopBatAimbot() end
end, C.danger)

createToggle(leftSide, 484, "Galaxy Sky Bright", "GalaxySkyBright", function(s)
    Enabled.GalaxySkyBright = s
    if s then enableGalaxySkyBright() else disableGalaxySkyBright() end
end, Color3.fromRGB(180, 80, 255))

-- Right side toggles - SPACED OUT LIKE BEFORE
createToggleWithKey(rightSide, 0, "Galaxy Mode", "GALAXY", "Galaxy", function(s)
    Enabled.Galaxy = s
    if s then startGalaxy() else stopGalaxy() end
end, Color3.fromRGB(60, 130, 255))
_G.setGalaxyVisual = VisualSetters.Galaxy

createSlider(rightSide, 52, "Gravity %", 25, 130, "GalaxyGravityPercent", function(v)
    Values.GalaxyGravityPercent = v
    if galaxyEnabled then adjustGalaxyJump() end
end)

createSlider(rightSide, 112, "Hop Power", 10, 80, "HOP_POWER", function(v) Values.HOP_POWER = v end)

createToggle(rightSide, 172, "Speed While Stealing", "SpeedWhileStealing", function(s)
    Enabled.SpeedWhileStealing = s
    if s then startSpeedWhileStealing() else stopSpeedWhileStealing() end
end)

createSlider(rightSide, 224, "Steal Speed", 10, 35, "StealingSpeedValue", function(v) Values.StealingSpeedValue = v end)

createToggle(rightSide, 284, "Unwalk", "Unwalk", function(s)
    Enabled.Unwalk = s
    if s then startUnwalk() else stopUnwalk() end
end)

createToggle(rightSide, 336, "Optimizer + XRay", "Optimizer", function(s)
    Enabled.Optimizer = s
    if s then enableOptimizer() else disableOptimizer() end
end)

createToggleWithKey(rightSide, 388, "Auto Left", "AUTOLEFT", "AutoWalkEnabled", function(s)
    AutoWalkEnabled = s
    Enabled.AutoWalkEnabled = s
    if s then startAutoWalk() else stopAutoWalk() end
end, Color3.fromRGB(100, 150, 255))
_G.setAutoLeftVisual = VisualSetters.AutoWalkEnabled

createToggleWithKey(rightSide, 440, "Auto Right", "AUTORIGHT", "AutoRightEnabled", function(s)
    AutoRightEnabled = s
    Enabled.AutoRightEnabled = s
    if s then startAutoRight() else stopAutoRight() end
end, Color3.fromRGB(100, 220, 180))
_G.setAutoRightVisual = VisualSetters.AutoRightEnabled

-- Save Button
local SaveBtn = Instance.new("TextButton", rightSide)
SaveBtn.Size = UDim2.new(1, -10 * guiScale, 0, 50 * guiScale)
SaveBtn.Position = UDim2.new(0, 5 * guiScale, 0, 503 * guiScale)
SaveBtn.BackgroundColor3 = C.purple
SaveBtn.Text = "SAVE CONFIG"
SaveBtn.TextColor3 = Color3.new(1, 1, 1)
SaveBtn.Font = Enum.Font.GothamBold
SaveBtn.TextSize = 15 * guiScale
SaveBtn.ZIndex = 3
Instance.new("UICorner", SaveBtn).CornerRadius = UDim.new(0, 12 * guiScale)

SaveBtn.MouseButton1Click:Connect(function()
    local success = SaveConfig()
    if success then
        SaveBtn.Text = "SAVED!"
        SaveBtn.BackgroundColor3 = C.success
    else
        SaveBtn.Text = "FAILED"
        SaveBtn.BackgroundColor3 = C.danger
    end
    task.delay(1.5, function()
        SaveBtn.Text = "SAVE CONFIG"
        SaveBtn.BackgroundColor3 = C.purple
    end)
end)

local infoLabel = Instance.new("TextLabel", leftSide)
infoLabel.Size = UDim2.new(1, 0, 0, 40 * guiScale)
infoLabel.Position = UDim2.new(0, 0, 0, 600 * guiScale)
infoLabel.BackgroundTransparency = 1
infoLabel.Text = "V=Speed | N=Spin | M=Galaxy | X=Aimbot\nZ=AutoLeft | C=AutoRight | Q=Nuke | U=GUI"
infoLabel.TextColor3 = C.textDim
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = 9 * guiScale
infoLabel.ZIndex = 3

local guiVisible = true

-- Apply loaded config (delayed to prevent character reset)
task.spawn(function()
    task.wait(3) -- Wait longer to ensure character is fully loaded and physics settled
    
    -- Make sure character exists
    local c = Player.Character
    if not c or not c:FindFirstChild("HumanoidRootPart") then
        c = Player.CharacterAdded:Wait()
        task.wait(1)
    end
    
    -- Update keybind buttons
    for key, btn in pairs(KeyButtons) do
        if btn and KEYBINDS[key] then
            btn.Text = KEYBINDS[key].Name
        end
    end
    
    for key, setter in pairs(VisualSetters) do
        if Enabled[key] then
            setter(true, true)
        end
    end
    
    for key, setter in pairs(SliderSetters) do
        if Values[key] then
            setter(Values[key])
        end
    end
    
    -- Start features that don't affect physics first
    if Enabled.AntiRagdoll then startAntiRagdoll() end
    if Enabled.AutoSteal then startAutoSteal() end
    if Enabled.Optimizer then enableOptimizer() end
    if Enabled.GalaxySkyBright then enableGalaxySkyBright() end
    
    task.wait(0.5)
    
    -- Then start physics features
    if Enabled.SpeedBoost then startSpeedBoost() end
    if Enabled.SpinBot then startSpinBot() end
    if Enabled.SpamBat then startSpamBat() end
    if Enabled.BatAimbot then startBatAimbot() end
    if Enabled.Galaxy then startGalaxy() end
    if Enabled.SpeedWhileStealing then startSpeedWhileStealing() end
    if Enabled.Unwalk then startUnwalk() end
    if Enabled.AutoWalkEnabled then AutoWalkEnabled = true startAutoWalk() end
    if Enabled.AutoRightEnabled then AutoRightEnabled = true startAutoRight() end
    
    if configLoaded then
        -- Config loaded silently
    end
end)

-- Input handling
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    
    -- Handle keybind changes
    if waitingForKeybind and input.KeyCode ~= Enum.KeyCode.Unknown then
        local k = input.KeyCode
        KEYBINDS[waitingForKeybind] = k
        if KeyButtons[waitingForKeybind] then
            KeyButtons[waitingForKeybind].Text = k.Name
        end
        waitingForKeybind = nil
        return
    end
    
    if input.KeyCode == Enum.KeyCode.U then
        guiVisible = not guiVisible
        main.Visible = guiVisible
        return
    end
    
    if input.KeyCode == Enum.KeyCode.Space then
        spaceHeld = true
        return
    end
    
    if input.KeyCode == KEYBINDS.SPEED then
        Enabled.SpeedBoost = not Enabled.SpeedBoost
        if VisualSetters.SpeedBoost then VisualSetters.SpeedBoost(Enabled.SpeedBoost) end
        if Enabled.SpeedBoost then startSpeedBoost() else stopSpeedBoost() end
    end
    
    if input.KeyCode == KEYBINDS.SPIN then
        Enabled.SpinBot = not Enabled.SpinBot
        if VisualSetters.SpinBot then VisualSetters.SpinBot(Enabled.SpinBot) end
        if Enabled.SpinBot then startSpinBot() else stopSpinBot() end
    end
    
    if input.KeyCode == KEYBINDS.GALAXY then
        Enabled.Galaxy = not Enabled.Galaxy
        if VisualSetters.Galaxy then VisualSetters.Galaxy(Enabled.Galaxy) end
        if Enabled.Galaxy then startGalaxy() else stopGalaxy() end
    end
    
    if input.KeyCode == KEYBINDS.BATAIMBOT then
        Enabled.BatAimbot = not Enabled.BatAimbot
        if VisualSetters.BatAimbot then VisualSetters.BatAimbot(Enabled.BatAimbot) end
        if Enabled.BatAimbot then startBatAimbot() else stopBatAimbot() end
    end
    
    if input.KeyCode == KEYBINDS.NUKE then
        local n = getNearestPlayer()
        if n then INSTANT_NUKE(n) end
    end
    
    if input.KeyCode == KEYBINDS.AUTOLEFT then
        AutoWalkEnabled = not AutoWalkEnabled
        Enabled.AutoWalkEnabled = AutoWalkEnabled
        if VisualSetters.AutoWalkEnabled then VisualSetters.AutoWalkEnabled(AutoWalkEnabled) end
        if AutoWalkEnabled then startAutoWalk() else stopAutoWalk() end
    end
    
    if input.KeyCode == KEYBINDS.AUTORIGHT then
        AutoRightEnabled = not AutoRightEnabled
        Enabled.AutoRightEnabled = AutoRightEnabled
        if VisualSetters.AutoRightEnabled then VisualSetters.AutoRightEnabled(AutoRightEnabled) end
        if AutoRightEnabled then startAutoRight() else stopAutoRight() end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space then
        spaceHeld = false
    end
end)

Player.CharacterAdded:Connect(function()
    task.wait(1)
    if Enabled.SpinBot then stopSpinBot() task.wait(0.1) startSpinBot() end
    if Enabled.Galaxy then setupGalaxyForce() adjustGalaxyJump() end
    if Enabled.SpamBat then stopSpamBat() task.wait(0.1) startSpamBat() end
    if Enabled.BatAimbot then stopBatAimbot() task.wait(0.1) startBatAimbot() end
    if Enabled.Unwalk then startUnwalk() end
end)
]],
})

table.insert(SCRIPTS, {
    name = "Chilli Hub",
    icon = "🌶️",
    desc = "FLY TO BEST • TP • BOOSTER",
    kind = "embed",
    code = [[
-- This Code Published By Crusty Hub
-- discord.gg/crustyhub
-- Fenv Log + AI Beatifully Coded This Script
-- Thanks To Claude Opus 


if _G.ChilliMainLoaded then
    warn("[Chilli Hub] Already loaded!")
    return
end
_G.ChilliMainLoaded = true
_G.FlyToBestState = _G.FlyToBestState or {}
_G.TpToBestState = _G.TpToBestState or {}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local PathfindingService = game:GetService("PathfindingService")
local VirtualUser = game:GetService("VirtualUser")
local ContextActionService = game:GetService("ContextActionService")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Camera = workspace.CurrentCamera
local cloneref = cloneref or function(instance) return instance end
local gethui = gethui or function() return game:GetService("CoreGui") end
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local function getCharacter()
    return LocalPlayer.Character
end
local function getHumanoid()
    local char = getCharacter()
    return char and char:FindFirstChildOfClass("Humanoid")
end
local function getHRP()
    local char = getCharacter()
    return char and char:FindFirstChild("HumanoidRootPart")
end
local function waitForCharacter()
    Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    if Character then
        Character:WaitForChild("HumanoidRootPart", 10)
        Character:WaitForChild("Humanoid", 10)
    end
    return Character
end
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    waitForCharacter()
end)
local function parsePrice(text)
    if not text then return 0 end
    local num, suffix = text:match("%$?([%d%.]+)%s*([KMB]?)")
    if not num then return 0 end
    local value = tonumber(num) or 0
    if suffix == "K" then value = value * 1000
    elseif suffix == "M" then value = value * 1000000
    elseif suffix == "B" then value = value * 1000000000
    end
    return value
end
local function trim(str)
    if not str then return "" end
    return str:match("^%s*(.-)%s*$") or str
end
local function getBrainrotDisplayName(spawn)
    if not spawn or not spawn.Parent then return "" end
    local displayLabel = spawn.Parent:FindFirstChild("DisplayName")
    if not displayLabel or not displayLabel:IsA("TextLabel") then return "" end
    if displayLabel.Text == "" or displayLabel.Text == "DisplayName" then return "" end
    local rawText = trim(displayLabel.Text)
    local name = rawText:match("([^%(%[]+)")
    return trim(name) or rawText
end
local function getLocationDescription(part)
    if not part then return "[Unknown]" end
    if part:IsDescendantOf(workspace:FindFirstChild("Debris")) then
        return "[Debris / Dropped Item]"
    end
    local ancestor = part:FindFirstAncestorOfClass("Model")
    if ancestor and ancestor.Parent == workspace:FindFirstChild("Plots") then
        return "[Plot: " .. ancestor.Name .. "]"
    end
    return "[World]"
end
local function isNearLosMatteos(position)
    if not position then return false end
    local events = workspace:FindFirstChild("Events")
    if not events then return false end
    local losMatteos = events:FindFirstChild("Los Matteos")
    if not losMatteos then return false end
    local part = losMatteos:IsA("BasePart") and losMatteos or losMatteos:FindFirstChildWhichIsA("BasePart")
    if not part then return false end
    return (part.Position - position).Magnitude < 50
end
local function getPlayerCount()
    return #Players:GetPlayers()
end
local function isGrappleTool(tool)
    if not tool or not tool:IsA("Tool") then return false end
    local name = string.lower(tool.Name)
    return name:find("grapple") or name:find("hook") or name:find("rope")
end
local CONFIG_FOLDER = "Chilli Hub Brainot"
local CONFIG_FILE = CONFIG_FOLDER .. "/" .. LocalPlayer.Name .. ".json"
local DefaultConfig = {
    SpeedBoost = false,
    SpeedBoost_Speed = 45,
    SpeedBoost_Key = "Q",
    SpeedBoostUIEnabled = false,
    InfinityJump = false,
    CB_Enabled = false,
    CB_Visible = true,
    CB_Speed = "16",
    CB_JumpBoost = "50",
    CB_FallIndex = 1,
    ESPHighestNPC_All = false,
    TimerESP = false,
    PlayerBox = false,
    YourBaseESP = false,
    XRayPlots = false,
    AutoCollect = false,
    CollectDelay = 0.1,
    AutoFish = false,
    AutoBuyRod = false,
    SellBrainrots = false,
    SellThresholdText = "1M",
    AutoBuyBrainrot = false,
    BrainrotThresh = "500K",
    Lockbase = false,
    AutoPreventAFK = false,
    AutoAimbotTaser = false,
    AntiRagdollConditional = false,
    AntiBeeEnabled = false,
    ReduceGraphics = false,
    FlyToBestUIEnabled = false,
    TpToBestUIEnabled = false,
    SpeedBoostUI_PosX = 30,
    SpeedBoostUI_PosY = 90,
    SB_Spam = {
        REEQUIP_DELAY = 0
    }
}
local Config = {}
for k, v in pairs(DefaultConfig) do
    Config[k] = v
end
local function loadConfig()
    if not isfolder or not isfile or not readfile then return Config end
    if not isfolder(CONFIG_FOLDER) then
        if makefolder then makefolder(CONFIG_FOLDER) end
        return Config
    end
    if not isfile(CONFIG_FILE) then return Config end
    local success, data = pcall(function()
        local content = readfile(CONFIG_FILE)
        if content and #content > 0 then
            return HttpService:JSONDecode(content)
        end
    end)
    if success and data then
        for k, v in pairs(data) do
            Config[k] = v
        end
    end
    return Config
end
local function saveConfig(updates)
    if updates then
        for k, v in pairs(updates) do
            Config[k] = v
        end
    end
    if not writefile or not isfolder then return end
    if not isfolder(CONFIG_FOLDER) then
        if makefolder then makefolder(CONFIG_FOLDER) end
    end
    pcall(function()
        writefile(CONFIG_FILE, HttpService:JSONEncode(Config))
    end)
end
local function mergeSpamConfig(base, override)
    local result = {}
    for k, v in pairs(base) do
        result[k] = v
    end
    if type(override) == "table" then
        for k, v in pairs(override) do
            if base[k] ~= nil and type(v) == type(base[k]) then
                result[k] = v
            end
        end
    end
    return result
end
loadConfig()
local function getPackages()
    return ReplicatedStorage:FindFirstChild("Packages")
end
local function getNet()
    local packages = getPackages()
    return packages and packages:FindFirstChild("Net")
end
local function getRemote(name)
    local net = getNet()
    return net and net:FindFirstChild(name)
end
local function getREUseItem()
    return getRemote("RE/UseItem")
end
local function getRESell()
    return getRemote("RE/PlotService/Sell")
end
local function getRFBuy()
    return getRemote("RF/CoinsShopService/RequestBuy")
end
local function getAllPlots()
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return {} end
    local result = {}
    for _, plot in ipairs(plots:GetChildren()) do
        if plot:IsA("Model") then
            table.insert(result, plot)
        end
    end
    return result
end
local function getAnimalPodiums(plot)
    return plot and plot:FindFirstChild("AnimalPodiums")
end
local function getPodiumSpawn(podiums, index)
    local podium = podiums:FindFirstChild(tostring(index))
    if not podium then return nil end
    local base = podium:FindFirstChild("Base")
    if not base then return nil end
    local spawn = base:FindFirstChild("Spawn")
    return spawn
end
local function findHighestValueBrainrot()
    local highestValue = 0
    local highestSpawn = nil
    local highestName = ""
    local highestPlot = nil
    local plots = getAllPlots()
    for _, plot in ipairs(plots) do
        local podiums = getAnimalPodiums(plot)
        if podiums then
            for i = 1, 40 do
                local spawn = getPodiumSpawn(podiums, i)
                if spawn then
                    local position = spawn.Position
                    if not isNearLosMatteos(position) then
                        local name = getBrainrotDisplayName(spawn)
                        local parent = spawn.Parent
                        if parent then
                            for _, child in ipairs(parent:GetDescendants()) do
                                if child:IsA("TextLabel") and child.Text and child.Text ~= "" then
                                    local price = parsePrice(child.Text)
                                    if price > highestValue then
                                        highestValue = price
                                        highestSpawn = spawn
                                        highestName = name ~= "" and name or ("Podium " .. i)
                                        highestPlot = plot
                                    end
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    local debris = workspace:FindFirstChild("Debris")
    if debris then
        for _, item in ipairs(debris:GetChildren()) do
            if string.lower(item.Name) == "lucky block" or item:IsA("Model") then
                for _, child in ipairs(item:GetDescendants()) do
                    if child:IsA("TextLabel") then
                        local price = parsePrice(child.Text)
                        if price > highestValue then
                            highestValue = price
                            highestSpawn = item:IsA("BasePart") and item or item:FindFirstChildWhichIsA("BasePart")
                            highestName = item.Name
                            highestPlot = nil
                        end
                    end
                end
            end
        end
    end
    return highestSpawn, highestValue, highestName, highestPlot
end
local Connections = {}
local function addConnection(name, connection)
    if Connections[name] then
        pcall(function() Connections[name]:Disconnect() end)
    end
    Connections[name] = connection
end
local function removeConnection(name)
    if Connections[name] then
        pcall(function() Connections[name]:Disconnect() end)
        Connections[name] = nil
    end
end
local function clearConnections()
    for name, conn in pairs(Connections) do
        pcall(function() conn:Disconnect() end)
    end
    Connections = {}
end
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new(0, 0))
end)
local SpeedBoost = {
    Enabled = false,
    Speed = 45,
    Connection = nil
}
function SpeedBoost.getSpeed()
    local speed = tonumber(Config.SpeedBoost_Speed) or 45
    return math.clamp(speed, 16, 200)
end
function SpeedBoost.start()
    if SpeedBoost.Connection then return end
    SpeedBoost.Enabled = true
    SpeedBoost.Connection = RunService.RenderStepped:Connect(function()
        local humanoid = getHumanoid()
        if humanoid then
            humanoid.WalkSpeed = SpeedBoost.getSpeed()
        end
    end)
end
function SpeedBoost.stop()
    SpeedBoost.Enabled = false
    if SpeedBoost.Connection then
        SpeedBoost.Connection:Disconnect()
        SpeedBoost.Connection = nil
    end
    local humanoid = getHumanoid()
    if humanoid then
        humanoid.WalkSpeed = 16
    end
end
local GrappleSpam = {
    Enabled = false,
    Connection = nil,
    CurrentTool = nil,
    REEQUIP_DELAY = 0
}
function GrappleSpam.findGrappleTool()
    local char = getCharacter()
    if not char then return nil end
    for _, tool in ipairs(char:GetChildren()) do
        if isGrappleTool(tool) then
            return tool
        end
    end
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        for _, tool in ipairs(backpack:GetChildren()) do
            if isGrappleTool(tool) then
                return tool
            end
        end
    end
    return nil
end
function GrappleSpam.equip()
    local tool = GrappleSpam.findGrappleTool()
    if not tool then return false end
    local humanoid = getHumanoid()
    if not humanoid then return false end
    if tool.Parent ~= getCharacter() then
        humanoid:EquipTool(tool)
        task.wait(GrappleSpam.REEQUIP_DELAY)
    end
    GrappleSpam.CurrentTool = tool
    return true
end
function GrappleSpam.unequip()
    local humanoid = getHumanoid()
    if humanoid then
        humanoid:UnequipTools()
    end
    GrappleSpam.CurrentTool = nil
end
function GrappleSpam.fire(targetPosition)
    local remote = getREUseItem()
    if not remote then return end
    pcall(function()
        remote:FireServer(1.983, targetPosition)
    end)
end
function GrappleSpam.start(targetPosition)
    if GrappleSpam.Connection then return end
    GrappleSpam.Enabled = true
    GrappleSpam.Connection = RunService.Heartbeat:Connect(function()
        if not GrappleSpam.Enabled then return end
        if GrappleSpam.equip() then
            GrappleSpam.fire(targetPosition)
            task.wait(0.1)
            GrappleSpam.unequip()
            task.wait(GrappleSpam.REEQUIP_DELAY)
        end
    end)
end
function GrappleSpam.stop()
    GrappleSpam.Enabled = false
    if GrappleSpam.Connection then
        GrappleSpam.Connection:Disconnect()
        GrappleSpam.Connection = nil
    end
    GrappleSpam.unequip()
end
local JumpBoost = {
    Enabled = false,
    Power = 50
}
function JumpBoost.apply()
    local humanoid = getHumanoid()
    if not humanoid then return end
    local power = tonumber(Config.CB_JumpBoost) or 50
    humanoid.UseJumpPower = true
    humanoid.JumpPower = power
end
function JumpBoost.reset()
    local humanoid = getHumanoid()
    if humanoid then
        humanoid.UseJumpPower = true
        humanoid.JumpPower = 50
    end
end
local FalldownController = {
    Attachment = nil,
    VectorForce = nil,
    Connection = nil,
    FallIndex = 1
}
local FALL_OPTIONS = {
    [1] = {name = "Normal", multiplier = 1},
    [2] = {name = "Light", multiplier = 0.5},
    [3] = {name = "Floaty", multiplier = 0.25},
    [4] = {name = "Moon", multiplier = 0.1},
    [5] = {name = "Zero-G", multiplier = 0}
}
function FalldownController.setup()
    local hrp = getHRP()
    if not hrp then return end
    FalldownController.clear()
    local attach = Instance.new("Attachment")
    attach.Name = "DTK_Fall_Attach"
    attach.Parent = hrp
    FalldownController.Attachment = attach
    local force = Instance.new("VectorForce")
    force.Name = "DTK_Falldown"
    force.Attachment0 = attach
    force.RelativeTo = Enum.ActuatorRelativeTo.World
    force.ApplyAtCenterOfMass = true
    force.Force = Vector3.new(0, 0, 0)
    force.Parent = hrp
    FalldownController.VectorForce = force
end
function FalldownController.start()
    FalldownController.setup()
    if not FalldownController.VectorForce then return end
    FalldownController.Connection = RunService.RenderStepped:Connect(function(dt)
        local hrp = getHRP()
        if not hrp or not FalldownController.VectorForce then return end
        local fallOption = FALL_OPTIONS[FalldownController.FallIndex] or FALL_OPTIONS[1]
        local multiplier = fallOption.multiplier
        if multiplier == 1 then
            FalldownController.VectorForce.Force = Vector3.new(0, 0, 0)
        else
            local counterForce = hrp.AssemblyMass * workspace.Gravity * (1 - multiplier)
            FalldownController.VectorForce.Force = Vector3.new(0, counterForce, 0)
        end
    end)
end
function FalldownController.stop()
    if FalldownController.Connection then
        FalldownController.Connection:Disconnect()
        FalldownController.Connection = nil
    end
    FalldownController.clear()
end
function FalldownController.clear()
    if FalldownController.VectorForce then
        FalldownController.VectorForce:Destroy()
        FalldownController.VectorForce = nil
    end
    if FalldownController.Attachment then
        FalldownController.Attachment:Destroy()
        FalldownController.Attachment = nil
    end
end
local InfinityJump = {
    Enabled = false,
    InputConnection = nil,
    MobileConnections = {}
}
function InfinityJump.start()
    if InfinityJump.InputConnection then return end
    InfinityJump.Enabled = true
    InfinityJump.InputConnection = UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if not InfinityJump.Enabled then return end
        if input.KeyCode == Enum.KeyCode.Space then
            local humanoid = getHumanoid()
            local hrp = getHRP()
            if humanoid and hrp then
                if humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                    hrp.Velocity = Vector3.new(hrp.Velocity.X, humanoid.JumpPower, hrp.Velocity.Z)
                end
            end
        end
    end)
    InfinityJump.bindMobileJump()
end
function InfinityJump.bindMobileJump()
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if not playerGui then return end
    for _, gui in ipairs(playerGui:GetDescendants()) do
        if gui:IsA("ImageButton") and string.find(string.lower(gui.Name), "jump") then
            local conn = gui.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Touch then
                    local humanoid = getHumanoid()
                    local hrp = getHRP()
                    if humanoid and hrp and humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                        hrp.Velocity = Vector3.new(hrp.Velocity.X, humanoid.JumpPower, hrp.Velocity.Z)
                    end
                end
            end)
            table.insert(InfinityJump.MobileConnections, conn)
        end
    end
end
function InfinityJump.stop()
    InfinityJump.Enabled = false
    if InfinityJump.InputConnection then
        InfinityJump.InputConnection:Disconnect()
        InfinityJump.InputConnection = nil
    end
    for _, conn in ipairs(InfinityJump.MobileConnections) do
        pcall(function() conn:Disconnect() end)
    end
    InfinityJump.MobileConnections = {}
end
local Fly = {
    Enabled = false,
    Speed = 50,
    BodyGyro = nil,
    BodyVelocity = nil,
    Connection = nil
}
function Fly.start()
    if Fly.Connection then return end
    local hrp = getHRP()
    if not hrp then return end
    Fly.Enabled = true
    Fly.BodyGyro = Instance.new("BodyGyro")
    Fly.BodyGyro.P = 9e4
    Fly.BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    Fly.BodyGyro.cframe = hrp.CFrame
    Fly.BodyGyro.Parent = hrp
    Fly.BodyVelocity = Instance.new("BodyVelocity")
    Fly.BodyVelocity.velocity = Vector3.new(0, 0, 0)
    Fly.BodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
    Fly.BodyVelocity.Parent = hrp
    Fly.Connection = RunService.RenderStepped:Connect(function()
        if not Fly.Enabled then return end
        local hrp = getHRP()
        if not hrp or not Fly.BodyGyro or not Fly.BodyVelocity then return end
        Fly.BodyGyro.cframe = Camera.CFrame
        local moveDir = Vector3.new(0, 0, 0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDir = moveDir + Camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDir = moveDir - Camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDir = moveDir - Camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDir = moveDir + Camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDir = moveDir + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            moveDir = moveDir - Vector3.new(0, 1, 0)
        end
        Fly.BodyVelocity.velocity = moveDir * Fly.Speed
    end)
end
function Fly.stop()
    Fly.Enabled = false
    if Fly.Connection then
        Fly.Connection:Disconnect()
        Fly.Connection = nil
    end
    if Fly.BodyGyro then
        Fly.BodyGyro:Destroy()
        Fly.BodyGyro = nil
    end
    if Fly.BodyVelocity then
        Fly.BodyVelocity:Destroy()
        Fly.BodyVelocity = nil
    end
end
local Noclip = {
    Enabled = false,
    Connection = nil
}
function Noclip.start()
    if Noclip.Connection then return end
    Noclip.Enabled = true
    Noclip.Connection = RunService.Stepped:Connect(function()
        if not Noclip.Enabled then return end
        local char = getCharacter()
        if not char then return end
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
end
function Noclip.stop()
    Noclip.Enabled = false
    if Noclip.Connection then
        Noclip.Connection:Disconnect()
        Noclip.Connection = nil
    end
end
local AntiRagdoll = {
    Enabled = false,
    Connections = {}
}
function AntiRagdoll.isInPlayerHitbox(part)
    if not part or not part.Parent then return false end
    if part.Name == "__HITBOX" then return true end
    local char = getCharacter()
    if char and part:IsDescendantOf(char) then
        local hitbox = char:FindFirstChild("__HITBOX")
        if hitbox and part:IsDescendantOf(hitbox) then
            return true
        end
    end
    return false
end
function AntiRagdoll.attachWatcher(part)
    if not part or part.Name == "HumanoidRootPart" then return end
    if AntiRagdoll.isInPlayerHitbox(part) then return end
    local function resetTransparency()
        if not part or not part.Parent then return end
        if AntiRagdoll.isInPlayerHitbox(part) then return end
        if part.Transparency ~= 0 then
            part.Transparency = 0
        end
        if part.LocalTransparencyModifier ~= 0 then
            part.LocalTransparencyModifier = 0
        end
    end
    resetTransparency()
    local conn1 = part:GetPropertyChangedSignal("Transparency"):Connect(resetTransparency)
    local conn2 = part:GetPropertyChangedSignal("LocalTransparencyModifier"):Connect(resetTransparency)
    table.insert(AntiRagdoll.Connections, conn1)
    table.insert(AntiRagdoll.Connections, conn2)
end
function AntiRagdoll.start()
    AntiRagdoll.Enabled = true
    local char = getCharacter()
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            AntiRagdoll.attachWatcher(part)
        end
    end
end
function AntiRagdoll.stop()
    AntiRagdoll.Enabled = false
    for _, conn in ipairs(AntiRagdoll.Connections) do
        pcall(function() conn:Disconnect() end)
    end
    AntiRagdoll.Connections = {}
end
local FlyToBest = {
    Enabled = false,
    TargetSpawn = nil,
    TargetPlot = nil,
    Connection = nil
}
function FlyToBest.getNearestPlotToPos(position)
    local plots = getAllPlots()
    local nearest = nil
    local nearestDist = math.huge
    for _, plot in ipairs(plots) do
        local plotSign = plot:FindFirstChild("PlotSign")
        if plotSign and plotSign:IsA("BasePart") then
            local dist = (plotSign.Position - position).Magnitude
            if dist < nearestDist then
                nearestDist = dist
                nearest = plot
            end
        end
    end
    return nearest
end
function FlyToBest.getPlotFromSpawn(spawn)
    if not spawn then return nil end
    local current = spawn
    for _ = 1, 5 do
        current = current.Parent
        if not current then break end
        if current:IsA("Model") and current.Parent == workspace:FindFirstChild("Plots") then
            return current
        end
    end
    if spawn:IsA("BasePart") then
        return FlyToBest.getNearestPlotToPos(spawn.Position)
    elseif spawn:IsA("Model") then
        local pivot = spawn:GetPivot()
        return FlyToBest.getNearestPlotToPos(pivot.Position)
    end
    return nil
end
function FlyToBest.getPlotSign(plot)
    if not plot or not plot:IsA("Model") then return nil end
    local sign = plot:FindFirstChild("PlotSign", true)
    if sign and sign:IsA("BasePart") then
        return sign
    end
    return nil
end
function FlyToBest.computeTarget()
    local spawn, value, name, plot = findHighestValueBrainrot()
    if spawn then
        FlyToBest.TargetSpawn = spawn
        FlyToBest.TargetPlot = plot or FlyToBest.getPlotFromSpawn(spawn)
        return spawn, value, name
    end
    return nil, 0, ""
end
function FlyToBest.start()
    local spawn = FlyToBest.computeTarget()
    if not spawn then
        warn("[Chilli Hub] No brainrot found to fly to!")
        return
    end
    local targetPos = spawn:IsA("BasePart") and spawn.Position or spawn:GetPivot().Position
    targetPos = targetPos + Vector3.new(0, 5, 0)
    Fly.start()
    FlyToBest.Enabled = true
    FlyToBest.Connection = RunService.RenderStepped:Connect(function()
        if not FlyToBest.Enabled then return end
        local hrp = getHRP()
        if not hrp then return end
        local direction = (targetPos - hrp.Position).Unit
        if Fly.BodyVelocity then
            Fly.BodyVelocity.velocity = direction * Fly.Speed
        end
        if (hrp.Position - targetPos).Magnitude < 5 then
            FlyToBest.stop()
        end
    end)
end
function FlyToBest.stop()
    FlyToBest.Enabled = false
    if FlyToBest.Connection then
        FlyToBest.Connection:Disconnect()
        FlyToBest.Connection = nil
    end
    Fly.stop()
end
function FlyToBest.teleportToBest()
    local spawn = FlyToBest.computeTarget()
    if not spawn then
        warn("[Chilli Hub] No brainrot found to teleport to!")
        return
    end
    local hrp = getHRP()
    if not hrp then return end
    local targetPos = spawn:IsA("BasePart") and spawn.Position or spawn:GetPivot().Position
    hrp.CFrame = CFrame.new(targetPos + Vector3.new(0, 3, 0))
end
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.C then
        if FlyToBest.Enabled then
            FlyToBest.stop()
        else
            FlyToBest.start()
        end
    end
end)
local Pathfinder = {
    CurrentPath = nil,
    Following = false
}
function Pathfinder.pathfindTo(targetPosition)
    local hrp = getHRP()
    local humanoid = getHumanoid()
    if not hrp or not humanoid then return false end
    local path = PathfindingService:CreatePath({
        AgentRadius = 2,
        AgentHeight = 5,
        AgentCanJump = true,
        AgentJumpHeight = 7,
        AgentMaxSlope = 45
    })
    local success, err = pcall(function()
        path:ComputeAsync(hrp.Position, targetPosition)
    end)
    if not success then return false end
    if path.Status ~= Enum.PathStatus.Success then return false end
    Pathfinder.CurrentPath = path
    local waypoints = path:GetWaypoints()
    for _, waypoint in ipairs(waypoints) do
        if not Pathfinder.Following then break end
        humanoid:MoveTo(waypoint.Position)
        if waypoint.Action == Enum.PathWaypointAction.Jump then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
        humanoid.MoveToFinished:Wait()
    end
    return true
end
function Pathfinder.followTarget(target)
    Pathfinder.Following = true
    task.spawn(function()
        while Pathfinder.Following and target and target.Parent do
            local targetPos = target:IsA("BasePart") and target.Position or target:GetPivot().Position
            Pathfinder.pathfindTo(targetPos)
            task.wait(0.5)
        end
    end)
end
function Pathfinder.stopFollowing()
    Pathfinder.Following = false
    Pathfinder.CurrentPath = nil
end
function Pathfinder.findCandidate()
    local spawn, value, name = findHighestValueBrainrot()
    return spawn
end
local AutoCollect = {
    Enabled = false,
    Connection = nil,
    Delay = 0.1
}
function AutoCollect.start()
    if AutoCollect.Connection then return end
    AutoCollect.Enabled = true
    AutoCollect.Connection = RunService.Heartbeat:Connect(function()
        if not AutoCollect.Enabled then return end
        local hrp = getHRP()
        if not hrp then return end
        local debris = workspace:FindFirstChild("Debris")
        if debris then
            for _, item in ipairs(debris:GetChildren()) do
                if item:IsA("BasePart") or item:IsA("Model") then
                    local pos = item:IsA("BasePart") and item.Position or item:GetPivot().Position
                    if (pos - hrp.Position).Magnitude < 15 then
                        if item:IsA("BasePart") then
                            firetouchinterest(hrp, item, 0)
                            task.wait()
                            firetouchinterest(hrp, item, 1)
                        end
                    end
                end
            end
        end
        task.wait(AutoCollect.Delay)
    end)
end
function AutoCollect.stop()
    AutoCollect.Enabled = false
    if AutoCollect.Connection then
        AutoCollect.Connection:Disconnect()
        AutoCollect.Connection = nil
    end
end
local AutoSell = {
    Enabled = false,
    Connection = nil,
    Threshold = 1000000
}
function AutoSell.parseThreshold(text)
    return parsePrice(text)
end
function AutoSell.start()
    if AutoSell.Connection then return end
    AutoSell.Enabled = true
    AutoSell.Threshold = AutoSell.parseThreshold(Config.SellThresholdText or "1M")
    AutoSell.Connection = RunService.Heartbeat:Connect(function()
        if not AutoSell.Enabled then return end
        local sellRemote = getRESell()
        if not sellRemote then return end
        local plots = getAllPlots()
        for _, plot in ipairs(plots) do
            local sign = plot:FindFirstChild("PlotSign")
            if sign then
                local gui = sign:FindFirstChild("SurfaceGui")
                if gui then
                    local frame = gui:FindFirstChild("Frame")
                    if frame then
                        local label = frame:FindFirstChildOfClass("TextLabel")
                        if label and label.Text == LocalPlayer.Name then
                            local podiums = getAnimalPodiums(plot)
                            if podiums then
                                for i = 1, 40 do
                                    local spawn = getPodiumSpawn(podiums, i)
                                    if spawn and spawn.Parent then
                                        for _, child in ipairs(spawn.Parent:GetDescendants()) do
                                            if child:IsA("TextLabel") then
                                                local value = parsePrice(child.Text)
                                                if value > 0 and value < AutoSell.Threshold then
                                                    pcall(function()
                                                        sellRemote:FireServer(i)
                                                    end)
                                                end
                                                break
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        task.wait(1)
    end)
end
function AutoSell.stop()
    AutoSell.Enabled = false
    if AutoSell.Connection then
        AutoSell.Connection:Disconnect()
        AutoSell.Connection = nil
    end
end
local PlayerESP = {
    Enabled = false,
    Highlights = {},
    Billboards = {},
    Connections = {}
}
local ESP_COLOR = Color3.fromRGB(85, 170, 255)
function PlayerESP.createHighlight(character)
    local highlight = Instance.new("Highlight")
    highlight.Name = "PlayerESP_Char"
    highlight.Adornee = character
    highlight.FillColor = ESP_COLOR
    highlight.FillTransparency = 0.22
    highlight.OutlineColor = ESP_COLOR
    highlight.OutlineTransparency = 0.08
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = gethui()
    return highlight
end
function PlayerESP.createBillboard(character, player)
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "PlayerESP_DisplayName"
    billboard.Adornee = hrp
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 600
    billboard.StudsOffsetWorldSpace = Vector3.new(0, (character:GetExtentsSize().Y / 2) + 0.9, 0)
    billboard.Size = UDim2.new(0, 96, 0, 18)
    billboard.Parent = gethui()
    local bg = Instance.new("Frame")
    bg.Name = "BG"
    bg.Parent = billboard
    bg.AnchorPoint = Vector2.new(0.5, 0.5)
    bg.Position = UDim2.fromScale(0.5, 0.5)
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.BackgroundTransparency = 0.45
    Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 6)
    local padding = Instance.new("UIPadding", bg)
    padding.PaddingLeft = UDim.new(0, 6)
    padding.PaddingRight = UDim.new(0, 6)
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Parent = bg
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Font = Enum.Font.GothamSemibold
    label.TextSize = 13
    label.Text = player.DisplayName
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeTransparency = 0.12
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    return billboard
end
function PlayerESP.attachToPlayer(player)
    if player == LocalPlayer then return end
    local function setupESP(character)
        if not character then return end
        character:WaitForChild("HumanoidRootPart", 5)
        if PlayerESP.Highlights[player] then
            PlayerESP.Highlights[player]:Destroy()
        end
        if PlayerESP.Billboards[player] then
            PlayerESP.Billboards[player]:Destroy()
        end
        PlayerESP.Highlights[player] = PlayerESP.createHighlight(character)
        PlayerESP.Billboards[player] = PlayerESP.createBillboard(character, player)
    end
    if player.Character then
        setupESP(player.Character)
    end
    local conn = player.CharacterAdded:Connect(setupESP)
    table.insert(PlayerESP.Connections, conn)
end
function PlayerESP.start()
    PlayerESP.Enabled = true
    for _, player in ipairs(Players:GetPlayers()) do
        PlayerESP.attachToPlayer(player)
    end
    local conn = Players.PlayerAdded:Connect(function(player)
        PlayerESP.attachToPlayer(player)
    end)
    table.insert(PlayerESP.Connections, conn)
end
function PlayerESP.stop()
    PlayerESP.Enabled = false
    for _, highlight in pairs(PlayerESP.Highlights) do
        pcall(function() highlight:Destroy() end)
    end
    PlayerESP.Highlights = {}
    for _, billboard in pairs(PlayerESP.Billboards) do
        pcall(function() billboard:Destroy() end)
    end
    PlayerESP.Billboards = {}
    for _, conn in ipairs(PlayerESP.Connections) do
        pcall(function() conn:Disconnect() end)
    end
    PlayerESP.Connections = {}
end
local HighestNPCESP = {
    Enabled = false,
    Beam = nil,
    Attachment0 = nil,
    Attachment1 = nil,
    Connection = nil,
    Hue = 0
}
function HighestNPCESP.createBeam(targetPart)
    HighestNPCESP.cleanup()
    local hrp = getHRP()
    if not hrp or not targetPart then return end
    HighestNPCESP.Attachment0 = Instance.new("Attachment")
    HighestNPCESP.Attachment0.Parent = hrp
    HighestNPCESP.Attachment1 = Instance.new("Attachment")
    HighestNPCESP.Attachment1.Parent = targetPart
    HighestNPCESP.Beam = Instance.new("Beam")
    HighestNPCESP.Beam.Attachment0 = HighestNPCESP.Attachment0
    HighestNPCESP.Beam.Attachment1 = HighestNPCESP.Attachment1
    HighestNPCESP.Beam.Width0 = 0.3
    HighestNPCESP.Beam.Width1 = 0.3
    HighestNPCESP.Beam.FaceCamera = true
    HighestNPCESP.Beam.Brightness = 2
    HighestNPCESP.Beam.LightEmission = 1
    HighestNPCESP.Beam.LightInfluence = 0
    HighestNPCESP.Beam.Parent = gethui()
end
function HighestNPCESP.start()
    HighestNPCESP.Enabled = true
    HighestNPCESP.Connection = RunService.RenderStepped:Connect(function(dt)
        if not HighestNPCESP.Enabled then return end
        HighestNPCESP.Hue = (HighestNPCESP.Hue + dt * 0.5) % 1
        local rainbowColor = Color3.fromHSV(HighestNPCESP.Hue, 1, 1)
        local spawn, value, name = findHighestValueBrainrot()
        if spawn then
            local targetPart = spawn:IsA("BasePart") and spawn or spawn:FindFirstChildWhichIsA("BasePart")
            if targetPart then
                if not HighestNPCESP.Beam or HighestNPCESP.Attachment1.Parent ~= targetPart then
                    HighestNPCESP.createBeam(targetPart)
                end
                if HighestNPCESP.Beam then
                    HighestNPCESP.Beam.Color = ColorSequence.new(rainbowColor)
                end
            end
        else
            HighestNPCESP.cleanup()
        end
    end)
end
function HighestNPCESP.stop()
    HighestNPCESP.Enabled = false
    if HighestNPCESP.Connection then
        HighestNPCESP.Connection:Disconnect()
        HighestNPCESP.Connection = nil
    end
    HighestNPCESP.cleanup()
end
function HighestNPCESP.cleanup()
    if HighestNPCESP.Beam then
        HighestNPCESP.Beam:Destroy()
        HighestNPCESP.Beam = nil
    end
    if HighestNPCESP.Attachment0 then
        HighestNPCESP.Attachment0:Destroy()
        HighestNPCESP.Attachment0 = nil
    end
    if HighestNPCESP.Attachment1 then
        HighestNPCESP.Attachment1:Destroy()
        HighestNPCESP.Attachment1 = nil
    end
end
local XRayPlots = {
    Enabled = false,
    OriginalTransparencies = {}
}
function XRayPlots.start()
    XRayPlots.Enabled = true
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return end
    for _, plot in ipairs(plots:GetChildren()) do
        for _, part in ipairs(plot:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "Spawn" then
                XRayPlots.OriginalTransparencies[part] = part.Transparency
                part.Transparency = 0.7
            end
        end
    end
end
function XRayPlots.stop()
    XRayPlots.Enabled = false
    for part, transparency in pairs(XRayPlots.OriginalTransparencies) do
        if part and part.Parent then
            part.Transparency = transparency
        end
    end
    XRayPlots.OriginalTransparencies = {}
end
local ReduceGraphics = {
    Enabled = false,
    OriginalSettings = {}
}
function ReduceGraphics.start()
    ReduceGraphics.Enabled = true
    ReduceGraphics.OriginalSettings.GlobalShadows = Lighting.GlobalShadows
    ReduceGraphics.OriginalSettings.FogEnd = Lighting.FogEnd
    ReduceGraphics.OriginalSettings.Brightness = Lighting.Brightness
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 100000
    for _, effect in ipairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") then
            ReduceGraphics.OriginalSettings[effect] = effect.Enabled
            effect.Enabled = false
        end
    end
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end
function ReduceGraphics.stop()
    ReduceGraphics.Enabled = false
    if ReduceGraphics.OriginalSettings.GlobalShadows ~= nil then
        Lighting.GlobalShadows = ReduceGraphics.OriginalSettings.GlobalShadows
    end
    if ReduceGraphics.OriginalSettings.FogEnd ~= nil then
        Lighting.FogEnd = ReduceGraphics.OriginalSettings.FogEnd
    end
    for effect, enabled in pairs(ReduceGraphics.OriginalSettings) do
        if typeof(effect) == "Instance" and effect:IsA("PostEffect") then
            effect.Enabled = enabled
        end
    end
    settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
end
local Aimbot = {
    Enabled = false,
    Connection = nil
}
function Aimbot.findNearestPlayer()
    local hrp = getHRP()
    if not hrp then return nil end
    local nearest = nil
    local nearestDist = math.huge
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local enemyHRP = player.Character:FindFirstChild("HumanoidRootPart")
            if enemyHRP then
                local dist = (enemyHRP.Position - hrp.Position).Magnitude
                if dist < nearestDist then
                    nearestDist = dist
                    nearest = enemyHRP
                end
            end
        end
    end
    return nearest
end
function Aimbot.start()
    Aimbot.Enabled = true
    Aimbot.Connection = RunService.RenderStepped:Connect(function()
        if not Aimbot.Enabled then return end
        local target = Aimbot.findNearestPlayer()
        if target then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
        end
    end)
end
function Aimbot.stop()
    Aimbot.Enabled = false
    if Aimbot.Connection then
        Aimbot.Connection:Disconnect()
        Aimbot.Connection = nil
    end
end
local ChilliBoosterUI = {
    ScreenGui = nil,
    MainFrame = nil,
    Visible = true
}
function ChilliBoosterUI.create()
    if ChilliBoosterUI.ScreenGui then return end
    local gui = Instance.new("ScreenGui")
    gui.Name = "Chilli Booster"
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = gethui()
    ChilliBoosterUI.ScreenGui = gui
    local main = Instance.new("Frame")
    main.Name = "Main"
    main.Size = UDim2.new(0, 200, 0, 180)
    main.Position = UDim2.new(0, Config.SpeedBoostUI_PosX or 30, 0, Config.SpeedBoostUI_PosY or 90)
    main.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    main.BorderSizePixel = 0
    main.Parent = gui
    ChilliBoosterUI.MainFrame = main
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", main)
    stroke.Color = Color3.fromRGB(255, 100, 100)
    stroke.Thickness = 2
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 30)
    header.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
    header.BorderSizePixel = 0
    header.Parent = main
    Instance.new("UICorner", header).CornerRadius = UDim.new(0, 8)
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Text = "🌶️ Chilli Booster"
    title.Size = UDim2.new(1, -40, 1, 0)
    title.Position = UDim2.new(0, 10, 0, 0)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = header
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "Close"
    closeBtn.Text = "×"
    closeBtn.Size = UDim2.new(0, 25, 0, 25)
    closeBtn.Position = UDim2.new(1, -27, 0, 2)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeBtn.BorderSizePixel = 0
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 18
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Parent = header
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 4)
    closeBtn.MouseButton1Click:Connect(function()
        ChilliBoosterUI.toggle(false)
    end)
    local content = Instance.new("Frame")
    content.Name = "Content"
    content.Size = UDim2.new(1, -20, 1, -40)
    content.Position = UDim2.new(0, 10, 0, 35)
    content.BackgroundTransparency = 1
    content.Parent = main
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    layout.Parent = content
    ChilliBoosterUI.createSlider(content, "Speed", 16, 200, tonumber(Config.CB_Speed) or 16, function(value)
        Config.CB_Speed = tostring(value)
        saveConfig()
    end)
    ChilliBoosterUI.createSlider(content, "Jump", 50, 200, tonumber(Config.CB_JumpBoost) or 50, function(value)
        Config.CB_JumpBoost = tostring(value)
        JumpBoost.apply()
        saveConfig()
    end)
    ChilliBoosterUI.createDropdown(content, "Gravity", FALL_OPTIONS, Config.CB_FallIndex or 1, function(index)
        Config.CB_FallIndex = index
        FalldownController.FallIndex = index
        saveConfig()
    end)
    local enableBtn = Instance.new("TextButton")
    enableBtn.Name = "EnableToggle"
    enableBtn.Text = Config.CB_Enabled and "✓ ENABLED" or "○ DISABLED"
    enableBtn.Size = UDim2.new(1, 0, 0, 30)
    enableBtn.BackgroundColor3 = Config.CB_Enabled and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(80, 80, 85)
    enableBtn.BorderSizePixel = 0
    enableBtn.Font = Enum.Font.GothamBold
    enableBtn.TextSize = 12
    enableBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    enableBtn.Parent = content
    Instance.new("UICorner", enableBtn).CornerRadius = UDim.new(0, 6)
    enableBtn.MouseButton1Click:Connect(function()
        Config.CB_Enabled = not Config.CB_Enabled
        enableBtn.Text = Config.CB_Enabled and "✓ ENABLED" or "○ DISABLED"
        enableBtn.BackgroundColor3 = Config.CB_Enabled and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(80, 80, 85)
        if Config.CB_Enabled then
            JumpBoost.apply()
            FalldownController.start()
        else
            JumpBoost.reset()
            FalldownController.stop()
        end
        saveConfig()
    end)
    ChilliBoosterUI.makeDraggable(main, header)
end
function ChilliBoosterUI.createSlider(parent, name, min, max, default, callback)
    local container = Instance.new("Frame")
    container.Name = name
    container.Size = UDim2.new(1, 0, 0, 35)
    container.BackgroundTransparency = 1
    container.Parent = parent
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.4, 0, 0, 15)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Gotham
    label.TextSize = 11
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Text = name .. ":"
    label.Parent = container
    local valueBox = Instance.new("TextBox")
    valueBox.Name = "ValueBox"
    valueBox.Size = UDim2.new(0.3, 0, 0, 20)
    valueBox.Position = UDim2.new(0.65, 0, 0, 0)
    valueBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    valueBox.BorderSizePixel = 0
    valueBox.Font = Enum.Font.GothamSemibold
    valueBox.TextSize = 12
    valueBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    valueBox.Text = tostring(default)
    valueBox.Parent = container
    Instance.new("UICorner", valueBox).CornerRadius = UDim.new(0, 4)
    local sliderBg = Instance.new("Frame")
    sliderBg.Size = UDim2.new(1, 0, 0, 8)
    sliderBg.Position = UDim2.new(0, 0, 0, 22)
    sliderBg.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    sliderBg.BorderSizePixel = 0
    sliderBg.Parent = container
    Instance.new("UICorner", sliderBg).CornerRadius = UDim.new(0, 4)
    local sliderFill = Instance.new("Frame")
    sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    sliderFill.BorderSizePixel = 0
    sliderFill.Parent = sliderBg
    Instance.new("UICorner", sliderFill).CornerRadius = UDim.new(0, 4)
    local dragging = false
    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    sliderBg.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local pos = (input.Position.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X
            pos = math.clamp(pos, 0, 1)
            local value = math.floor(min + (max - min) * pos)
            sliderFill.Size = UDim2.new(pos, 0, 1, 0)
            valueBox.Text = tostring(value)
            callback(value)
        end
    end)
    valueBox.FocusLost:Connect(function()
        local value = tonumber(valueBox.Text)
        if value then
            value = math.clamp(value, min, max)
            valueBox.Text = tostring(value)
            sliderFill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
            callback(value)
        else
            valueBox.Text = tostring(default)
        end
    end)
end
function ChilliBoosterUI.createDropdown(parent, name, options, default, callback)
    local container = Instance.new("Frame")
    container.Name = name
    container.Size = UDim2.new(1, 0, 0, 25)
    container.BackgroundTransparency = 1
    container.Parent = parent
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.4, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Gotham
    label.TextSize = 11
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Text = name .. ":"
    label.Parent = container
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.55, 0, 1, 0)
    btn.Position = UDim2.new(0.45, 0, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    btn.BorderSizePixel = 0
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 11
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = options[default].name
    btn.Parent = container
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    local currentIndex = default
    btn.MouseButton1Click:Connect(function()
        currentIndex = currentIndex % #options + 1
        btn.Text = options[currentIndex].name
        callback(currentIndex)
    end)
end
function ChilliBoosterUI.makeDraggable(frame, handle)
    local dragging = false
    local dragStart, startPos
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)
    handle.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
            Config.SpeedBoostUI_PosX = frame.Position.X.Offset
            Config.SpeedBoostUI_PosY = frame.Position.Y.Offset
            saveConfig()
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end
function ChilliBoosterUI.toggle(visible)
    ChilliBoosterUI.Visible = visible
    if ChilliBoosterUI.ScreenGui then
        ChilliBoosterUI.ScreenGui.Enabled = visible
    end
end
function ChilliBoosterUI.destroy()
    if ChilliBoosterUI.ScreenGui then
        ChilliBoosterUI.ScreenGui:Destroy()
        ChilliBoosterUI.ScreenGui = nil
    end
end
local FloatingToggle = {
    Button = nil
}
function FloatingToggle.create()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "OpenButtonGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = gethui()
    local btn = Instance.new("ImageButton")
    btn.Name = "FloatingToggle"
    btn.Size = UDim2.new(0, 50, 0, 50)
    btn.Position = UDim2.new(0, 10, 0.5, -25)
    btn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
    btn.BorderSizePixel = 0
    btn.Image = "rbxassetid://6031071053"
    btn.ImageColor3 = Color3.fromRGB(255, 255, 255)
    btn.Parent = screenGui
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0.5, 0)
    FloatingToggle.Button = btn
    btn.MouseButton1Click:Connect(function()
        ChilliBoosterUI.toggle(not ChilliBoosterUI.Visible)
    end)
    local dragging = false
    local dragStart, startPos
    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = btn.Position
        end
    end)
    btn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            btn.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end
local function notify(title, description, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title or "Chilli Hub",
            Text = description or "",
            Duration = duration or 3
        })
    end)
end
local Webhook = {
    URL = nil,
    MinValue = 500000
}
function Webhook.send(spawn, value)
    if not Webhook.URL or value < Webhook.MinValue then return end
    if getPlayerCount() ~= 8 then return end
    local name = getBrainrotDisplayName(spawn)
    local location = getLocationDescription(spawn)
    local embed = {
        title = "🌶️ High Value Brainrot Found!",
        description = "**" .. name .. "**\nValue: **$" .. tostring(value) .. "**",
        color = value >= 10000000 and 16711680 or (value >= 1000000 and 16744448 or 65280),
        fields = {
            {name = "Player", value = LocalPlayer.Name .. " (" .. LocalPlayer.UserId .. ")", inline = true},
            {name = "Location", value = location, inline = true},
            {name = "Server", value = getPlayerCount() .. "/8", inline = true}
        },
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }
    if request or http_request then
        local req = request or http_request
        pcall(function()
            req({
                Url = Webhook.URL,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode({embeds = {embed}})
            })
        end)
    end
end
local BatchChecker = {
    LastCheck = 0,
    Interval = 0.5
}
function BatchChecker.check()
    local now = tick()
    if now - BatchChecker.LastCheck < BatchChecker.Interval then return end
    BatchChecker.LastCheck = now
    local map = workspace:FindFirstChild("Map")
    if map then
        local codes = map:FindFirstChild("Codes")
        if codes then
            local progressText = codes:FindFirstChild("Main")
            if progressText then
                local gui = progressText:FindFirstChild("SurfaceGui")
                if gui then
                    local frame = gui:FindFirstChild("MainFrame")
                    if frame then
                        local bar = frame:FindFirstChild("ProgressBar")
                        if bar and bar:FindFirstChild("Bar") then
                            local text = bar.Bar:FindFirstChild("ProgressText")
                            if text and text.Text == "50/250" then
                            end
                        end
                    end
                end
            end
        end
    end
    local spawn, value, name = findHighestValueBrainrot()
    if spawn and value >= Webhook.MinValue then
        Webhook.send(spawn, value)
    end
end
local ChilliBooster = {}
function ChilliBooster.enable()
    Config.CB_Enabled = true
    saveConfig({CB_Enabled = true})
    JumpBoost.apply()
    FalldownController.start()
    notify("Chilli Booster", "Enabled!", 2)
end
function ChilliBooster.disable()
    Config.CB_Enabled = false
    saveConfig({CB_Enabled = false})
    JumpBoost.reset()
    FalldownController.stop()
    notify("Chilli Booster", "Disabled!", 2)
end
function ChilliBooster.reconcileModes()
    local isStealing = LocalPlayer:GetAttribute("Stealing")
    if Config.InfinityJump and not isStealing then
        InfinityJump.start()
    end
    if Config.CB_Enabled then
        JumpBoost.apply()
        FalldownController.start()
    end
end
function ChilliBooster.coldStart()
    if Config.CB_Enabled then
        ChilliBooster.enable()
    end
    if Config.SpeedBoost then
        SpeedBoost.start()
    end
    if Config.InfinityJump then
        InfinityJump.start()
    end
    if Config.ESPHighestNPC_All then
        HighestNPCESP.start()
    end
    if Config.PlayerBox then
        PlayerESP.start()
    end
    if Config.XRayPlots then
        XRayPlots.start()
    end
    if Config.ReduceGraphics then
        ReduceGraphics.start()
    end
    if Config.AutoAimbotTaser then
        Aimbot.start()
    end
    if Config.AutoCollect then
        AutoCollect.start()
    end
    if Config.SellBrainrots then
        AutoSell.start()
    end
end
LocalPlayer.CharacterRemoving:Connect(function()
    FalldownController.stop()
end)
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    task.defer(function()
        ChilliBooster.reconcileModes()
    end)
end)
LocalPlayer:GetAttributeChangedSignal("Stealing"):Connect(function()
    if not LocalPlayer:GetAttribute("Stealing") then
        ChilliBooster.reconcileModes()
    end
end)
local function loadMainUI()
    local success, Window = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/dtkhanh1/CHL2/refs/heads/main/SCRSAB"))()
    end)
    if not success then
        warn("[Chilli Hub] Failed to load UI library, using fallback")
        ChilliBoosterUI.create()
        FloatingToggle.create()
        return
    end
    local MainWindow = Window:Window({
        Title = "Chilli Hub - Steal a Brainrot",
        Subtitle = "v3.0 Complete",
        Size = UDim2.new(0, 500, 0, 400),
        Opened = true
    })
    local TabGroup = MainWindow:TabGroup()
    local StealerTab = TabGroup:Tab({Title = "Stealer", Image = ""})
    local StealerSection = StealerTab:Section({Title = "Auto Farm", Opened = true})
    StealerSection:Toggle({
        Title = "Auto Collect",
        Default = Config.AutoCollect,
        Callback = function(value)
            Config.AutoCollect = value
            if value then AutoCollect.start() else AutoCollect.stop() end
            saveConfig()
        end
    })
    StealerSection:Toggle({
        Title = "Auto Sell Pets",
        Default = Config.SellBrainrots,
        Callback = function(value)
            Config.SellBrainrots = value
            if value then AutoSell.start() else AutoSell.stop() end
            saveConfig()
        end
    })
    StealerSection:Input({
        Title = "Sell Threshold",
        Default = Config.SellThresholdText,
        Callback = function(value)
            Config.SellThresholdText = value
            AutoSell.Threshold = AutoSell.parseThreshold(value)
            saveConfig()
        end
    })
    local HelperTab = TabGroup:Tab({Title = "Helper", Image = ""})
    local UtilitySection = HelperTab:Section({Title = "Utility", Opened = true})
    UtilitySection:Toggle({
        Title = "Aimbot",
        Default = Config.AutoAimbotTaser,
        Callback = function(value)
            Config.AutoAimbotTaser = value
            if value then Aimbot.start() else Aimbot.stop() end
            saveConfig()
        end
    })
    UtilitySection:Toggle({
        Title = "Speed Boost",
        Default = Config.SpeedBoost,
        Callback = function(value)
            Config.SpeedBoost = value
            if value then SpeedBoost.start() else SpeedBoost.stop() end
            saveConfig()
        end
    })
    UtilitySection:Slider({
        Title = "Speed Value",
        Min = 16,
        Max = 200,
        Default = Config.SpeedBoost_Speed,
        Callback = function(value)
            Config.SpeedBoost_Speed = value
            saveConfig()
        end
    })
    UtilitySection:Toggle({
        Title = "Infinity Jump",
        Default = Config.InfinityJump,
        Callback = function(value)
            Config.InfinityJump = value
            if value then InfinityJump.start() else InfinityJump.stop() end
            saveConfig()
        end
    })
    UtilitySection:Toggle({
        Title = "Anti Ragdoll",
        Default = Config.AntiRagdollConditional,
        Callback = function(value)
            Config.AntiRagdollConditional = value
            if value then AntiRagdoll.start() else AntiRagdoll.stop() end
            saveConfig()
        end
    })
    UtilitySection:Toggle({
        Title = "Reduce Graphics",
        Default = Config.ReduceGraphics,
        Callback = function(value)
            Config.ReduceGraphics = value
            if value then ReduceGraphics.start() else ReduceGraphics.stop() end
            saveConfig()
        end
    })
    local FinderTab = TabGroup:Tab({Title = "Finder", Image = ""})
    local ESPSection = FinderTab:Section({Title = "ESP", Opened = true})
    ESPSection:Toggle({
        Title = "Highest Value Brainrot ESP",
        Default = Config.ESPHighestNPC_All,
        Callback = function(value)
            Config.ESPHighestNPC_All = value
            if value then HighestNPCESP.start() else HighestNPCESP.stop() end
            saveConfig()
        end
    })
    ESPSection:Toggle({
        Title = "Player ESP",
        Default = Config.PlayerBox,
        Callback = function(value)
            Config.PlayerBox = value
            if value then PlayerESP.start() else PlayerESP.stop() end
            saveConfig()
        end
    })
    ESPSection:Toggle({
        Title = "XRay Plots",
        Default = Config.XRayPlots,
        Callback = function(value)
            Config.XRayPlots = value
            if value then XRayPlots.start() else XRayPlots.stop() end
            saveConfig()
        end
    })
    local TeleportSection = FinderTab:Section({Title = "Teleport", Opened = true})
    TeleportSection:Button({
        Title = "Fly to Best Brainrot (C)",
        Callback = function()
            if FlyToBest.Enabled then
                FlyToBest.stop()
            else
                FlyToBest.start()
            end
        end
    })
    TeleportSection:Button({
        Title = "TP to Best Brainrot",
        Callback = function()
            FlyToBest.teleportToBest()
        end
    })
    local ServerTab = TabGroup:Tab({Title = "Server", Image = ""})
    local ServerSection = ServerTab:Section({Title = "Server Info", Opened = true})
    ServerSection:Paragraph({
        Title = "Player Count",
        Desc = getPlayerCount() .. "/8"
    })
    ServerSection:Button({
        Title = "Rejoin Server",
        Callback = function()
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end
    })
    local DiscordTab = TabGroup:Tab({Title = "Discord", Image = ""})
    local NotesSection = DiscordTab:Section({Title = "Discord / Notes", Opened = true})
    NotesSection:Paragraph({
        Title = "",
        Desc = "Works best on low-ping servers (<120)"
    })
    NotesSection:Button({
        Title = "Discord Link (Click to copy)",
        Callback = function()
            if setclipboard then
                setclipboard("https://discord.gg/chillihub")
                notify("Copied", "Discord link copied to clipboard.")
            end
        end
    })
    ChilliBoosterUI.create()
    FloatingToggle.create()
end
local function initialize()
    print("[Chilli Hub] Starting...")
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    waitForCharacter()
    loadConfig()
    ChilliBooster.coldStart()
    task.spawn(loadMainUI)
    RunService.Heartbeat:Connect(function()
        BatchChecker.check()
    end)
    print("[Chilli Hub] Loaded successfully!")
    notify("Chilli Hub", "Loaded! Press C to fly to best brainrot.", 5)
end
task.spawn(initialize)
_G.ChilliHub = {
    Config = Config,
    SpeedBoost = SpeedBoost,
    JumpBoost = JumpBoost,
    InfinityJump = InfinityJump,
    Fly = Fly,
    Noclip = Noclip,
    GrappleSpam = GrappleSpam,
    FalldownController = FalldownController,
    FlyToBest = FlyToBest,
    Pathfinder = Pathfinder,
    PlayerESP = PlayerESP,
    HighestNPCESP = HighestNPCESP,
    XRayPlots = XRayPlots,
    AutoCollect = AutoCollect,
    AutoSell = AutoSell,
    Aimbot = Aimbot,
    AntiRagdoll = AntiRagdoll,
    ReduceGraphics = ReduceGraphics,
    ChilliBoosterUI = ChilliBoosterUI,
    FloatingToggle = FloatingToggle,
    findHighestValueBrainrot = findHighestValueBrainrot,
    parsePrice = parsePrice,
    notify = notify,
    saveConfig = saveConfig,
    loadConfig = loadConfig
}
return _G.ChilliHub
]],
})

table.insert(SCRIPTS, {
    name = "Best Pet ESP",
    icon = "👁️",
    desc = "ESP • PET TRACKER • OVERLAY",
    kind = "embed",
    code = [[
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
    name = "Insta Grab",
    icon = "🎯",
    desc = "INSTANT STEAL • AUTO GRAB",
    kind = "embed",
    code = [[
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
    name = "Mango Dual",
    icon = "🥭",
    desc = "DUAL • AUTO • COMBAT",
    kind = "http",
    code = "loadstring(game:HttpGet(\"https://vss.pandadevelopment.net/virtual/file/32642c04666f436b\"))()",
})

table.insert(SCRIPTS, {
    name = "Nameless Hub",
    icon = "🌐",
    desc = "ALL-IN-ONE • HUB • TOOLS",
    kind = "http",
    code = "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/ily123950/Vulkan/refs/heads/main/Tr\"))()",
})


--========================================================
-- GUI
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
panelStroke.Thickness = 1.8; panelStroke.Color = Color3.fromRGB(0,180,255)

task.spawn(function()
    while Panel.Parent do
        TweenService:Create(panelStroke,TweenInfo.new(0.7,Enum.EasingStyle.Sine),{Color=Color3.fromRGB(80,220,255)}):Play()
        task.wait(0.7)
        TweenService:Create(panelStroke,TweenInfo.new(0.7,Enum.EasingStyle.Sine),{Color=Color3.fromRGB(0,110,210)}):Play()
        task.wait(0.7)
    end
end)

-- SIDEBAR
local Sidebar = Instance.new("Frame", Panel)
Sidebar.Size = UDim2.new(0.32,0,1,0)
Sidebar.BackgroundColor3 = Color3.fromRGB(0,100,200)
Sidebar.BackgroundTransparency = 0.88
Sidebar.BorderSizePixel = 0
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0,14)

local sideDiv = Instance.new("Frame", Sidebar)
sideDiv.Size=UDim2.new(0,1,1,0); sideDiv.Position=UDim2.new(1,-1,0,0)
sideDiv.BackgroundColor3=Color3.fromRGB(0,160,255); sideDiv.BackgroundTransparency=0.7
sideDiv.BorderSizePixel=0

local SideHeader = Instance.new("Frame", Sidebar)
SideHeader.Size=UDim2.new(1,0,0,56)
SideHeader.BackgroundColor3=Color3.fromRGB(0,120,220)
SideHeader.BackgroundTransparency=0.82; SideHeader.BorderSizePixel=0
Instance.new("UICorner",SideHeader).CornerRadius=UDim.new(0,14)

local SHDiv = Instance.new("Frame",SideHeader)
SHDiv.Size=UDim2.new(0.85,0,0,1); SHDiv.Position=UDim2.new(0.075,0,1,-1)
SHDiv.BackgroundColor3=Color3.fromRGB(0,160,255); SHDiv.BackgroundTransparency=0.65; SHDiv.BorderSizePixel=0

local LogoBg = Instance.new("Frame",SideHeader)
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
HubTitle.TextColor3=Color3.fromRGB(190,235,255); HubTitle.TextXAlignment=Enum.TextXAlignment.Left

local HubSub=Instance.new("TextLabel",SideHeader)
HubSub.Size=UDim2.new(1,-50,0,14); HubSub.Position=UDim2.new(0,48,0,29)
HubSub.BackgroundTransparency=1; HubSub.Text="SCRIPT LAUNCHER"
HubSub.Font=Enum.Font.GothamBold; HubSub.TextSize=9
HubSub.TextColor3=Color3.fromRGB(0,190,255); HubSub.TextTransparency=0.25
HubSub.TextXAlignment=Enum.TextXAlignment.Left

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

-- CONTENT
local Content=Instance.new("Frame",Panel)
Content.Name="Content"
Content.Size=UDim2.new(0.68,-2,1,0); Content.Position=UDim2.new(0.32,2,0,0)
Content.BackgroundTransparency=1; Content.BorderSizePixel=0

local CloseBtn=Instance.new("TextButton",Content)
CloseBtn.Size=UDim2.new(0,28,0,28); CloseBtn.Position=UDim2.new(1,-36,0,10)
CloseBtn.BackgroundColor3=Color3.fromRGB(40,20,20); CloseBtn.BackgroundTransparency=0.3
CloseBtn.BorderSizePixel=0; CloseBtn.Text="✕"
CloseBtn.Font=Enum.Font.GothamBold; CloseBtn.TextSize=13
CloseBtn.TextColor3=Color3.fromRGB(255,160,160); CloseBtn.ZIndex=5
Instance.new("UICorner",CloseBtn).CornerRadius=UDim.new(1,0)

local ContentPad=Instance.new("Frame",Content)
ContentPad.Size=UDim2.new(1,-24,1,-24); ContentPad.Position=UDim2.new(0,12,0,12)
ContentPad.BackgroundTransparency=1; ContentPad.BorderSizePixel=0

local IconBox=Instance.new("Frame",ContentPad)
IconBox.Size=UDim2.new(0,52,0,52); IconBox.Position=UDim2.new(0,0,0,8)
IconBox.BackgroundColor3=Color3.fromRGB(0,100,200); IconBox.BackgroundTransparency=0.6
IconBox.BorderSizePixel=0
Instance.new("UICorner",IconBox).CornerRadius=UDim.new(0,13)
local IconStroke=Instance.new("UIStroke",IconBox)
IconStroke.Thickness=1; IconStroke.Color=Color3.fromRGB(0,180,255); IconStroke.Transparency=0.4

local IconLbl=Instance.new("TextLabel",IconBox)
IconLbl.Size=UDim2.new(1,0,1,0); IconLbl.BackgroundTransparency=1
IconLbl.TextSize=26; IconLbl.Font=Enum.Font.GothamBold

local ContentName=Instance.new("TextLabel",ContentPad)
ContentName.Size=UDim2.new(1,-70,0,28); ContentName.Position=UDim2.new(0,64,0,10)
ContentName.BackgroundTransparency=1
ContentName.Font=Enum.Font.GothamBold; ContentName.TextSize=18
ContentName.TextColor3=Color3.fromRGB(210,240,255); ContentName.TextXAlignment=Enum.TextXAlignment.Left
ContentName.TextTruncate=Enum.TextTruncate.AtEnd

local ContentDesc=Instance.new("TextLabel",ContentPad)
ContentDesc.Size=UDim2.new(1,-70,0,18); ContentDesc.Position=UDim2.new(0,64,0,38)
ContentDesc.BackgroundTransparency=1
ContentDesc.Font=Enum.Font.GothamBold; ContentDesc.TextSize=10
ContentDesc.TextColor3=Color3.fromRGB(0,190,255); ContentDesc.TextTransparency=0.2
ContentDesc.TextXAlignment=Enum.TextXAlignment.Left

-- HTTP badge (shows when selected script needs internet)
local HttpBadge=Instance.new("TextLabel",ContentPad)
HttpBadge.Size=UDim2.new(0,80,0,18); HttpBadge.Position=UDim2.new(0,64,0,58)
HttpBadge.BackgroundColor3=Color3.fromRGB(0,160,100); HttpBadge.BackgroundTransparency=0.3
HttpBadge.BorderSizePixel=0; HttpBadge.Text="🌐 ONLINE"
HttpBadge.Font=Enum.Font.GothamBold; HttpBadge.TextSize=9
HttpBadge.TextColor3=Color3.fromRGB(200,255,230); HttpBadge.Visible=false
Instance.new("UICorner",HttpBadge).CornerRadius=UDim.new(0,5)

local Divider=Instance.new("Frame",ContentPad)
Divider.Size=UDim2.new(1,0,0,1); Divider.Position=UDim2.new(0,0,0,72)
Divider.BackgroundColor3=Color3.fromRGB(0,150,255); Divider.BackgroundTransparency=0.7; Divider.BorderSizePixel=0

local StatusRow=Instance.new("Frame",ContentPad)
StatusRow.Size=UDim2.new(1,0,0,20); StatusRow.Position=UDim2.new(0,0,0,80)
StatusRow.BackgroundTransparency=1; StatusRow.BorderSizePixel=0

local StatusDot=Instance.new("Frame",StatusRow)
StatusDot.Size=UDim2.new(0,7,0,7); StatusDot.Position=UDim2.new(0,0,0.5,-3.5)
StatusDot.BackgroundColor3=Color3.fromRGB(0,255,140); StatusDot.BorderSizePixel=0
Instance.new("UICorner",StatusDot).CornerRadius=UDim.new(1,0)
task.spawn(function()
    while StatusDot.Parent do
        TweenService:Create(StatusDot,TweenInfo.new(0.8,Enum.EasingStyle.Sine),{BackgroundTransparency=0.5}):Play(); task.wait(0.8)
        TweenService:Create(StatusDot,TweenInfo.new(0.8,Enum.EasingStyle.Sine),{BackgroundTransparency=0}):Play(); task.wait(0.8)
    end
end)

local StatusTxt=Instance.new("TextLabel",StatusRow)
StatusTxt.Size=UDim2.new(0.5,0,1,0); StatusTxt.Position=UDim2.new(0,13,0,0)
StatusTxt.BackgroundTransparency=1; StatusTxt.Text="READY TO LOAD"
StatusTxt.Font=Enum.Font.GothamBold; StatusTxt.TextSize=9
StatusTxt.TextColor3=Color3.fromRGB(0,220,140); StatusTxt.TextXAlignment=Enum.TextXAlignment.Left

local CountTxt=Instance.new("TextLabel",StatusRow)
CountTxt.Size=UDim2.new(0.5,0,1,0); CountTxt.Position=UDim2.new(0.5,0,0,0)
CountTxt.BackgroundTransparency=1; CountTxt.Text=#SCRIPTS.." SCRIPTS LOADED"
CountTxt.Font=Enum.Font.GothamBold; CountTxt.TextSize=9
CountTxt.TextColor3=Color3.fromRGB(0,160,220); CountTxt.TextTransparency=0.3
CountTxt.TextXAlignment=Enum.TextXAlignment.Right

local ExecBtn=Instance.new("TextButton",ContentPad)
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

-- REOPEN ORB
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

-- OPEN / CLOSE
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

-- CONTENT UPDATE
local navBtns={}

local function updateContent(idx)
    local s=SCRIPTS[idx]
    IconLbl.Text=s.icon
    ContentName.Text=s.name
    ContentDesc.Text=s.desc
    selectedScript=s; selectedIndex=idx
    -- Show online badge for HttpGet scripts
    HttpBadge.Visible = (s.kind == "http")
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

-- BUILD NAV
for i,s in ipairs(SCRIPTS) do
    local NavBtn=Instance.new("TextButton",NavScroll)
    NavBtn.Name="Nav_"..i
    NavBtn.Size=UDim2.new(1,0,0,38)
    NavBtn.BackgroundColor3=Color3.fromRGB(0,80,160); NavBtn.BackgroundTransparency=0.88
    NavBtn.BorderSizePixel=0; NavBtn.Text=""; NavBtn.AutoButtonColor=false
    Instance.new("UICorner",NavBtn).CornerRadius=UDim.new(0,9)
    local ns=Instance.new("UIStroke",NavBtn)
    ns.Name="NavStroke"; ns.Thickness=1; ns.Color=Color3.fromRGB(0,180,255); ns.Transparency=0.7

    -- NEW badge on Freeze Trade Legit (index 1)
    if i==1 then
        local nb=Instance.new("TextLabel",NavBtn)
        nb.Size=UDim2.new(0,28,0,14); nb.Position=UDim2.new(1,-32,0,4)
        nb.BackgroundColor3=Color3.fromRGB(0,200,120); nb.BackgroundTransparency=0.2
        nb.BorderSizePixel=0; nb.Text="NEW"; nb.Font=Enum.Font.GothamBold
        nb.TextSize=7; nb.TextColor3=Color3.fromRGB(255,255,255); nb.ZIndex=3
        Instance.new("UICorner",nb).CornerRadius=UDim.new(0,4)
    end

    -- 🌐 badge on HttpGet scripts
    if s.kind=="http" then
        local wb=Instance.new("TextLabel",NavBtn)
        wb.Size=UDim2.new(0,14,0,14); wb.Position=UDim2.new(1,-18,0.5,-7)
        wb.BackgroundTransparency=1; wb.Text="🌐"
        wb.Font=Enum.Font.GothamBold; wb.TextSize=11; wb.ZIndex=3
    end

    local NIcon=Instance.new("TextLabel",NavBtn)
    NIcon.Size=UDim2.new(0,28,1,0); NIcon.Position=UDim2.new(0,5,0,0)
    NIcon.BackgroundTransparency=1; NIcon.Text=s.icon; NIcon.TextSize=16; NIcon.Font=Enum.Font.GothamBold

    local NName=Instance.new("TextLabel",NavBtn)
    NName.Size=UDim2.new(1,-46,1,0); NName.Position=UDim2.new(0,36,0,0)
    NName.BackgroundTransparency=1; NName.Text=s.name
    NName.Font=Enum.Font.GothamBold; NName.TextSize=12
    NName.TextColor3=Color3.fromRGB(180,225,255); NName.TextXAlignment=Enum.TextXAlignment.Left
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

-- EXECUTE — lazy loadstring, runs ONLY on click
ExecBtn.MouseButton1Click:Connect(function()
    TweenService:Create(ExecBtn,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(0,200,80),BackgroundTransparency=0.1}):Play()
    ExecBtn.Text="⏳   LOADING..."
    task.wait(0.2)
    closePanel()
    task.wait(0.1)
    -- Both embedded and HttpGet scripts run the same way via loadstring
    -- The code string for HttpGet scripts IS the loadstring(...) call itself
    local fn, err = loadstring(selectedScript.code)
    if fn then
        task.spawn(fn)
    else
        warn("[67 HUB XoSh] Load error: " .. tostring(err))
    end
    task.delay(0.5,function()
        ExecBtn.Text="▶   EXECUTE SCRIPT"
        TweenService:Create(ExecBtn,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(0,130,255),BackgroundTransparency=0.25}):Play()
    end)
end)

-- ENTRANCE
Panel.Size=UDim2.new(0.88,0,0,0); Panel.Position=UDim2.new(0.06,0,0.5,0)
Panel.BackgroundTransparency=1; Overlay.BackgroundTransparency=1
TweenService:Create(Overlay,TweenInfo.new(0.3),{BackgroundTransparency=0.5}):Play()
TweenService:Create(Panel,TweenInfo.new(0.38,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
    Size=UDim2.new(0.88,0,0.62,0),Position=UDim2.new(0.06,0,0.19,0),BackgroundTransparency=0.06
}):Play()

task.delay(0.05,function() updateContent(1) end)
