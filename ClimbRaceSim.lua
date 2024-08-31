local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Revenant", true))()
local Flags = Library.Flags

local Window = Library:Window({
    Text = "Main Settings"
})

local function autoClick()
    while Flags.AutoClick do
        local args = {[1] = workspace:WaitForChild("Maps"):WaitForChild("Map_1"), [2] = "Click_Normal"}
        game:GetService("ReplicatedStorage"):WaitForChild("ClickGainEnergyTrain_Event"):InvokeServer(unpack(args))
        wait(0.1)
    end
end

local function infWins()
    while Flags.InfWins do
        local args1 = {[1] = 9e9}
        game:GetService("ReplicatedStorage"):WaitForChild("GiveTrohpy_Event"):FireServer(unpack(args1))

        local args2 = {[1] = workspace:WaitForChild("Maps"):WaitForChild("Map_6"):WaitForChild("PetGatcha"):WaitForChild("Gatcha_3"), [2] = "Trophy", [3] = 3}
        game:GetService("ReplicatedStorage"):WaitForChild("Gatcha_Event"):FireServer(unpack(args2))

        wait(0.1)
    end
end

local function infPet()
    while Flags.InfPet do
        local args1 = {[1] = 9e9}
        game:GetService("ReplicatedStorage"):WaitForChild("GiveTrohpy_Event"):FireServer(unpack(args1))

        local args2 = {[1] = workspace:WaitForChild("Maps"):WaitForChild("Map_6"):WaitForChild("PetGatcha"):WaitForChild("Gatcha_4"), [2] = "Trophy", [3] = 3}
        game:GetService("ReplicatedStorage"):WaitForChild("Gatcha_Event"):FireServer(unpack(args2))

        wait(0.1)
    end
end


local function infRebirth()
    while Flags.InfRebirth do
        local args = {[1] = 15}
        game:GetService("ReplicatedStorage"):WaitForChild("RebirthActive_Event"):InvokeServer(unpack(args))
        wait(0.1)
    end
end

Window:Toggle({
    Text = "Auto Click",
    Callback = function(state)
        Flags.AutoClick = state
        if state then
            spawn(autoClick)
        end
    end
})

Window:Toggle({
    Text = "Inf Wins",
    Callback = function(state)
        Flags.InfWins = state
        if state then
            spawn(infWins)
        end
    end
})

Window:Toggle({
    Text = "Inf Wins + Pet",
    Callback = function(state)
        Flags.InfPet = state
        if state then
            spawn(infPet)
        end
    end
})
Window:Toggle({
    Text = "Inf Rebirth",
    Callback = function(state)
        Flags.InfRebirth = state
        if state then
            spawn(infRebirth)
        end
    end
})
