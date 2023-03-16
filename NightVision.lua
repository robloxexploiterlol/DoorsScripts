-------------------------------Variables and Services (no services brah)
local UserInputService = game:GetService("UserInputService")

local NightVisionGui = Instance.new("ScreenGui")

local NightVisionCorrection = Instance.new("ColorCorrectionEffect")
NightVisionCorrection.Parent = game.Lighting

local button = game:GetService("UserInputService")

local Vignette = Instance.new("ImageLabel")

local StaticEffect = Instance.new("ImageLabel")

local Border = Instance.new("ImageLabel")

local Player = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()

local Light = Instance.new("PointLight")

local NVCSText = Instance.new("TextLabel")

local FPS = Instance.new("TextLabel")

local Battery = Instance.new("ImageLabel")

-------------------------------Gui, Correction and Light

NightVisionGui.Name = "NightVisionGui"
NightVisionGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
NightVisionGui.Enabled = true
NightVisionGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
NightVisionGui.IgnoreGuiInset = true
NightVisionGui.Name = "NightVisionGui"

Vignette.Parent = NightVisionGui
Vignette.Size = UDim2.new(1, 0, 1, 0)
Vignette.Visible = true
Vignette.Image = ("rbxassetid://4576475446")
Vignette.BackgroundTransparency = 1
Vignette.ZIndex = 1.5
Vignette.Name = "vignette"

Border.Parent = NightVisionGui
Border.Size = UDim2.new(1, 0, 1, 0)
Border.Visible = true
Border.Image = ("rbxassetid://12785690511")
Border.BackgroundTransparency = 1
Border.ZIndex = 1.3
Border.Name = "yay border"

NVCSText.Parent = NightVisionGui
NVCSText.Size = UDim2.new(0,200,0,50)
NVCSText.Position = UDim2.new(0.726,0,0.065,0)
NVCSText.Visible = true
NVCSText.BackgroundTransparency = 1
NVCSText.Name = "nvcs text"
NVCSText.Text = "NVCS-3000"
NVCSText.TextSize = 60
NVCSText.TextColor3 = Color3.new(236, 236, 236)
NVCSText.ZIndex = 1.3

FPS.Parent = NightVisionGui
FPS.Size = UDim2.new(0,200,0,50)
FPS.Position = UDim2.new(0.792,0,0.171,0)
FPS.Visible = true
FPS.BackgroundTransparency = 1
FPS.Name = "fps"
FPS.Text = "60 FPS"
FPS.TextSize = 55
FPS.TextColor3 = Color3.new(236, 236, 236)
FPS.ZIndex = 1.3

Battery.Parent = NightVisionGui
Battery.Size = UDim2.new(0,186,0,103)
Battery.Position = UDim2.new(0.03,0,0.048,0)
Battery.Visible = true
Battery.BackgroundTransparency = 1
Battery.Name = "battery"
Battery.Image = ("rbxassetid://12787720861")
Battery.ZIndex = 1.3

StaticEffect.Parent = NightVisionGui
StaticEffect.Size = UDim2.new(1, 0, 1, 0)
StaticEffect.Visible = true
StaticEffect.Image = ("rbxassetid://12738683910")
StaticEffect.BackgroundTransparency = 1
StaticEffect.ImageTransparency = 0.4
StaticEffect.Name = "static lol"
StaticEffect.ZIndex = 0.9

NightVisionCorrection.TintColor = Color3.fromRGB(88, 168, 81)
NightVisionCorrection.Contrast = 0.4
NightVisionCorrection.Saturation = -1
NightVisionCorrection.Brightness = 0.4
NightVisionCorrection.Enabled = true
NightVisionCorrection.Name = "da green color"

Light.Range = 200
Light.Enabled = true
Light.Parent = Player:WaitForChild("Head")
Light.Name = "i should really use brightness instead"

-----------------this part aint mine i took it from devforum since im too dumb to make my own toggle

local Toggled = false
local Debounce = os.clock()

local function ChangeStatus(Input, GameProcessedEvent)
	if GameProcessedEvent or (os.clock() - Debounce) < 1 then return end

	if Input.KeyCode == Enum.KeyCode.R then
		if Toggled == false then
			NightVisionGui.Enabled = true

			Light.Enabled = true

			NightVisionCorrection.Enabled = true

			print("On")
			Toggled = true
		else
			NightVisionGui.Enabled = false

			Light.Enabled = false

			NightVisionCorrection.Enabled = false

			print("Off")
			Toggled = false
		end

		Debounce = os.clock()
	end
end

UserInputService.InputBegan:Connect(ChangeStatus)


firesignal(game:GetService("ReplicatedStorage").EntityInfo.Caption.OnClientEvent, 'Executed.',true,3)

print("Executed")

if NightVisionGui.Enabled == true then

	while true do
		StaticEffect.Image = ("rbxassetid://12738673739")
		task.wait(0.1)
		StaticEffect.Image = ("rbxassetid://12738678510")
		task.wait(0.1)
		StaticEffect.Image = ("rbxassetid://12738681224")
		task.wait(0.1)
		StaticEffect.Image = ("rbxassetid://12738683836")
		task.wait(0.1)
	end
else
	print("Not Enabled")
end
