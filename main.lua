-- CONFIG
_G.ButtonText = "Leave"
_G.Message = "You have been disconnected from the game becuse you are hacking. Your IP: 173.64.234.13"
_G.EnableError = true
_G.Error = "277"
_G.BlurSize = 24

-- BLUR
local Blur = Instance.new("BlurEffect")
Blur.Name = "KickBlur"
Blur.Size = _G.BlurSize
Blur.Parent = game:GetService("Lighting")

-- UI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KickMessage"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 420, 0, 240)
Frame.Position = UDim2.new(0.5, -210, 0.5, -120)
Frame.BackgroundColor3 = Color3.fromRGB(35, 37, 39)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "Disconnected"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 28
Title.Parent = Frame

-- Message
local Message = Instance.new("TextLabel")
Message.Size = UDim2.new(1, -40, 0, 100)
Message.Position = UDim2.new(0, 20, 0, 60)
Message.BackgroundTransparency = 1
Message.Text = _G.Message
Message.TextColor3 = Color3.fromRGB(200, 200, 200)
Message.Font = Enum.Font.Gotham
Message.TextSize = 18
Message.TextWrapped = true
Message.TextYAlignment = Enum.TextYAlignment.Top
Message.Parent = Frame

-- Error Code
if _G.EnableError then
	local ErrorCode = Instance.new("TextLabel")
	ErrorCode.Size = UDim2.new(1, 0, 0, 30)
	ErrorCode.Position = UDim2.new(0, 0, 0, 165)
	ErrorCode.BackgroundTransparency = 1
	ErrorCode.Text = "(Error Code: " .. _G.Error .. ")"
	ErrorCode.TextColor3 = Color3.fromRGB(150, 150, 150)
	ErrorCode.Font = Enum.Font.Gotham
	ErrorCode.TextSize = 16
	ErrorCode.Parent = Frame
end

-- Leave Button
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 120, 0, 36)
Button.Position = UDim2.new(0.5, -60, 1, -46)
Button.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 16
Button.Text = _G.ButtonText
Button.Parent = Frame

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 6)
Corner.Parent = Button

Button.MouseButton1Click:Connect(function()
	game:Shutdown() -- this simulates exiting; may not work in executor context
end)

-- Optional Sound
local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://9118823104" -- creepy glitched sound
Sound.Volume = 1
Sound.Parent = ScreenGui
Sound:Play()

-- Freeze player (harmless effect)
pcall(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
end)
