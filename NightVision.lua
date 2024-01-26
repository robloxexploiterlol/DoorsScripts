local UIS = game:GetService("UserInputService")
local UI = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
local ImageBorder = Instance.new("ImageLabel")
local Battery = Instance.new("ImageLabel")
local FPS = Instance.new("TextLabel")
local Vignette = Instance.new("ImageLabel")
local Flash = Instance.new("Frame")
local ColorCorrection = Instance.new("ColorCorrectionEffect")
local Bloom = Instance.new("BloomEffect")
local Distortion = Instance.new("ImageLabel")
local Blur = Instance.new("BlurEffect")
local DepthOfField = Instance.new("DepthOfFieldEffect")
local TweenService = game:GetService("TweenService")
local Info = TweenInfo.new(0.3, Enum.EasingStyle.Circular, Enum.EasingDirection.In)
local BlurInfo = TweenInfo.new(2, Enum.EasingStyle.Circular, Enum.EasingDirection.In)
local Tween = TweenService:Create(Flash, Info, {BackgroundColor3 = Color3.fromRGB(0, 255, 0)})
local Tween2 = TweenService:Create(Flash, Info, {BackgroundTransparency = 1})
local BlurTween = TweenService:Create(Blur, BlurInfo, {Size = 5})
local Humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
local PreviousHealth = Humanoid.Health

DepthOfField.FarIntensity = 0
DepthOfField.FocusDistance = 6
DepthOfField.InFocusRadius = 0
DepthOfField.NearIntensity = 1
DepthOfField.Enabled = false
Blur.Enabled = false
Blur.Size = 5
Bloom.Enabled = false
Bloom.Intensity = 3
Bloom.Size = 10
Bloom.Threshold = 2
ColorCorrection.Brightness = 0.2
ColorCorrection.Contrast = 0.4
ColorCorrection.Saturation = 1
ColorCorrection.TintColor = Color3.fromRGB(88, 168, 81)
ColorCorrection.Enabled = false
Blur.Parent = game.Lighting
Bloom.Parent = game.Lighting
ColorCorrection.Parent = game.Lighting
DepthOfField.Parent = game.Lighting
ImageBorder.Image = "http://www.roblox.com/asset/?id=12785690511"
ImageBorder.ImageTransparency = 0.1
ImageBorder.ImageColor3 = Color3.fromRGB(150, 150, 150)
ImageBorder.Size = UDim2.new(1, 0, 1, 0)
ImageBorder.BackgroundTransparency = 1
ImageBorder.ZIndex = 2
ImageBorder.Visible = false
ImageBorder.Parent = UI
Battery.Size = UDim2.new(0, 186, 0, 103)
Battery.Position = UDim2.new(0.03, 0, 0.048, 0)
Battery.Image = "rbxassetid://12787720861"
Battery.ImageColor3 = Color3.fromRGB(150, 150, 150)
Battery.ZIndex = 2
Battery.BackgroundTransparency = 1
Battery.Visible = false
Battery.Parent = UI
FPS.Size = UDim2.new(0, 159, 0, 54)
FPS.Position = UDim2.new(0.795, 0, 0.06, 0)
FPS.BackgroundTransparency = 1
FPS.TextColor3 = Color3.fromRGB(150, 150, 150)
FPS.ZIndex = 2
FPS.TextSize = 40
FPS.Text = "60 FPS"
FPS.Visible = false
FPS.Parent = UI
Distortion.BackgroundTransparency = 1
Distortion.Image = "http://www.roblox.com/asset/?id=5029613765"
Distortion.ZIndex = 1.6
Distortion.Size = UDim2.new(1, 0, 1, 0)
Distortion.ImageColor3 = Color3.fromRGB(88, 168, 81)
Distortion.Visible = false
Distortion.Parent = UI
Flash.Size = UDim2.new(1, 0, 1, 0)
Flash.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
Flash.BackgroundTransparency = 1
Flash.ZIndex = 2
Flash.Parent = UI
ImageLabel.ImageTransparency = 0.4
ImageLabel.BackgroundTransparency = 1
ImageLabel.Size = UDim2.new(1, 0, 1, 0)
Vignette.Size = UDim2.new(1, 0, 1, 0)
Vignette.Visible = false
Vignette.Image = "http://www.roblox.com/asset/?id=491227056"
Vignette.BackgroundTransparency = 1
Vignette.ZIndex = 0.5
Vignette.Parent = UI
UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
UI.IgnoreGuiInset = true
UI.Enabled = false
UI.Parent = game.Players.LocalPlayer.PlayerGui
ImageLabel.Parent = UI

local Enabled = false
local Debounce = os.clock()

UIS.InputBegan:Connect(function(Input, GameProcessedEvent)
	if GameProcessedEvent or (os.clock() - Debounce) < 1 then return end
	if Input.KeyCode == Enum.KeyCode.Z then
		if Enabled == false then
			UI.Enabled = true
			game.Lighting.Brightness += 12
			FPS.Visible = true
			Battery.Visible = true
			ColorCorrection.Enabled = true
			Blur.Enabled = true
			Bloom.Enabled = true
			DepthOfField.Enabled = true
			Enabled = true
			ImageLabel.Visible = true
			ImageBorder.Visible = true
			Vignette.Visible = true
			Flash.BackgroundTransparency = 0
			Tween:Play()
			Tween2:Play()
			Tween.Completed:Connect(function()
				Flash.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
			end)
			while Enabled == true do
				local Randomize = math.random(54, 60)
				local Randomize2 = math.random(1, 2)
				FPS.Text = Randomize.." FPS"
				ImageLabel.Image = "http://www.roblox.com/asset/?id=12738673739"
				task.wait(0.07)
				ImageLabel.Image = "http://www.roblox.com/asset/?id=12738678510"
				task.wait(0.07)
				if Randomize2 == 2 then
					FPS.Text = "60 FPS"
				end
				ImageLabel.Image = "http://www.roblox.com/asset/?id=12738681224"
				task.wait(0.07)
				ImageLabel.Image = "http://www.roblox.com/asset/?id=12738683836"
				task.wait(0.07)
				if Randomize2 == 1 then
					FPS.Text = "60 FPS"
				end
			end
		else
			game.Lighting.Brightness -= 12
			FPS.Visible = false
			Battery.Visible = false
			UI.Enabled = false
			ColorCorrection.Enabled = false
			Enabled = false
			ColorCorrection.Enabled = false
			Blur.Enabled = false
			Bloom.Enabled = false
			DepthOfField.Enabled = false
			ImageLabel.Visible = false
			ImageBorder.Visible = false
			Vignette.Visible = false
		end
		Debounce = os.clock()
	end
end)

Humanoid.HealthChanged:Connect(function(NewHealth)
	if PreviousHealth > NewHealth then
		Blur.Size = 30
		BlurTween:Play()
		local Randomize = math.random(27, 43)
		FPS.Text = Randomize.." FPS"
		local Crack = Instance.new("ImageLabel")
		local Randomizer = Random.new()
		local Size = Randomizer:NextNumber(0.15, 0.5)
		Crack.BackgroundTransparency = 1
		Crack.ImageTransparency = math.random(0, 0.6)
		Crack.Size = UDim2.new(Size, 0, Size, 0)
		Crack.Position = UDim2.new(Randomizer:NextNumber(0, 0.9), 0, Randomizer:NextNumber(0, 0.9), 0)
		Crack.Rotation = math.random(-90, 90)
		Crack.ZIndex = 4
		if math.random(1, 2) == 2 then
			Crack.Image = "http://www.roblox.com/asset/?id=12394244315"
		else
			Crack.Image = "http://www.roblox.com/asset/?id=12394188595"
		end
		Crack.Parent = UI
		PreviousHealth = NewHealth
		task.wait(0.05)
		FPS.Text = "60 FPS"
	else
		PreviousHealth = NewHealth
	end
end)

Humanoid.Died:Connect(function()
	if UI.Enabled == true then
		Distortion.Visible = true
		while true do
			FPS.Text = math.random(1, 5).." FPS"
			Humanoid.CameraOffset = Vector3.zero
			Distortion.Image = "http://www.roblox.com/asset/?id=5029613765"
			task.wait(0.05)
			Distortion.Image = "http://www.roblox.com/asset/?id=5029614324"
			Humanoid.CameraOffset = Vector3.new(0.3, 0, 0)
			FPS.Text = math.random(1, 3).." FPS"
			task.wait(0.05)
		end
	end
	local Randomizer = Random.new()
	local Crack = Instance.new("ImageLabel")
	local Size = Randomizer:NextNumber(0.5, 0.8)
	Crack.Rotation = math.random(-90, 90)
	Crack.BackgroundTransparency = 1
	Crack.ImageTransparency = math.random(0, 0.6)
	Crack.Size = UDim2.new(Size, 0, Size, 0)
	Crack.ZIndex = 4
	Crack.Position = UDim2.new(Randomizer:NextNumber(0, 0.9), 0, Randomizer:NextNumber(0, 0.9), 0)
	if math.random(1, 2) == 2 then
		Crack.Image = "http://www.roblox.com/asset/?id=12394244315"
	else
		Crack.Image = "http://www.roblox.com/asset/?id=12394188595"
	end
	Crack.Parent = UI
end)

firesignal(game:GetService("ReplicatedStorage").EntityInfo.Caption.OnClientEvent, "Night vision script loaded", true, 5)
print("Loaded")
