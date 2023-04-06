if game.PlaceId == 6516141723 then

task.wait(1.4)

local LobbyMusic = game.Workspace.Lobby.Lobby_Ambience
local LobbyLighting = game.Lighting.Caves
local OldLobbyMusic = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Lobby:WaitForChild("Music")
local OldLobbyMusicEnd = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Lobby:WaitForChild("MusicEnd")
local FireplaceExtinguished = game.Workspace.Lobby.Assets.Furniture.Fireplace.Fireplace_Logs
local PlayerUsername = game:GetService("Players").LocalPlayer
local Tweens = game:GetService("TweenService")

LobbyMusic.Playing = true
LobbyMusic.Volume = 0.8
LobbyLighting.Enabled = true
OldLobbyMusic.Playing = false
game.Lighting.FogEnd = 0
OldLobbyMusicEnd:Destroy()

Tweens:Create(game.Lighting, TweenInfo.new(2.5), {FogEnd = 55}):Play()

task.wait(1)

firesignal(game:GetService("ReplicatedStorage").EntityInfo.Caption.OnClientEvent, 'Welcome back, '..PlayerUsername.Name..'. Are you enjoying your stay?',true,15)
end
