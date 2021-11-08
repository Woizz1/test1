local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Maxgat5/UiLib/main/lua')))()
local w = library:CreateWindow("rng factory")
local b = w:CreateFolder("script")
local e = w:CreateFolder("TP")

local spin = 0
local tpPlayer = game.Players.LocalPlayer
local player = game.Players.LocalPlayer
local tween = game:GetService("TweenService")

local allPlayers = {}
for _, v in pairs(game.Players:GetPlayers()) do
    table.insert(allPlayers, v)
end

game.Players.PlayerAdded:Connect(function(v)
    table.insert(allPlayers, v)
end)

game.Players.PlayerRemoving:Connect(function(v)
    table.remove(allPlayers, v)
end)

b:Toggle("auto spawn",function(bool)
    shared.toggle = bool
    AutoSpawn = bool
end)


e:Toggle("Auto Tp",function(bool)
    shared.toggle = bool
    autotp = bool
end)

e:Toggle("Spin",function(bool)
    shared.toggle = bool
    isspin = bool
end)

e:Dropdown("Tp To Player", allPlayers, true, function(value)
    tpPlayer = value
end)

while wait() do
    if AutoSpawn == true then
        for i,v in pairs(workspace:GetChildren()) do
            if v:FindFirstChild("ItemMachine") then
                fireclickdetector(v.ItemMachine.SpawnItem.ClickDetector)
            end
        end
    end
    
    if autotp == true then
        if spin > 360 then
            spin = 0
        end
        spin = spin + 1
        if isspin then
                tween:Create(player.Character.HumanoidRootPart, TweenInfo.new(0.02), {CFrame = game.Players[tpPlayer].Character.HumanoidRootPart.CFrame * CFrame.Angles(0, spin, 0)}):Play()
            else
              tween:Create(player.Character.HumanoidRootPart, TweenInfo.new(0.02), {CFrame = game.Players[tpPlayer].Character.HumanoidRootPart.CFrame}):Play()  
        end
    end
    
end
