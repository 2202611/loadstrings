print("Loaded")
local wrap = coroutine.create(function()
local duration = 0.05
local speed = 0.05
local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
local hop = false

task.spawn(function()
    while true do
        wait()
        if not hrp then
            hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
        end
    end
end)

local autosell = true
local busy = false
local time = 1
local boolean = true

local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"

local items = {
    ["Mysterious Arrow"] = 0,
    ["Rokakaka"] = 0,
    ["Gold Coin"] = 0,
    ["Diamond"] = 0,
    ["Quinton's Glove"] = 0,
    ["Steel Ball"] = 0,
    ["Rib Cage of The Saint's Corpse"] = 0,
    ["Zepellin's Headband"] = 0,
    ["Zeppeli's Hat"] = 0,
    ["Caesar's Headband"] = 0,
    ["Clackers"] = 0,
    ["Stone Mask"] = 0,
    ["Ancient Scroll"] = 0,
    ["Dio's Diary"] = 0,
    ["Pure Rokakaka"] = 0,
    ["Gold Umbrella"] = 0,
    ["Casual MBR Money 1"] = 0,
    ["Casual MBR Money 2"] = 0,
    ["Casual MBR Money 3"] = 0,
    ["Comp MBR Money 1"] = 0,
    ["Comp MBR Money 2"] = 0,
    ["Comp MBR Money 3"] = 0,
}

local maxLimits = {
    ["Mysterious Arrow"] = 25,
    ["Rokakaka"] = 25,
    ["Gold Coin"] = 45,
    ["Diamond"] = 25,
    ["Pure Rokakaka"] = 10,
    ["Quinton's Glove"] = 10,
    ["Steel Ball"] = 10,
    ["Rib Cage of The Saint's Corpse"] = 10,
    ["Zepellin's Headband"] = 10,
    ["Zeppeli's Hat"] = 10,
    ["Caesar's Headband"] = 10,
    ["Clackers"] = 10,
    ["Stone Mask"] = 10,
    ["Ancient Scroll"] = 10,
    ["Dio's Diary"] = 10,
    ["Lucky Stone Mask"] = 999,
    ["Lucky Arrow"] = 999,
    ["Gold Umbrella"] = 999,
    ["Left Arm of The Saint's Corpse"] = 999,
    ["Heart of The Saint's Corpse"] = 999,
    ["Pelvis of The Saint's Corpse"] = 999,
}

repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen1") == nil
game.Players.LocalPlayer.PlayerStats.Prestige.Value = "0"

task.spawn(function()
    for i,v in pairs(getconnections(game.Players.LocalPlayer.PlayerGui:WaitForChild("LoadingScreen").Frames.Main.Play.Play.MouseButton1Down)) do
        v:Fire()
    end
end)

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
Frame.BackgroundTransparency = 1.000
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.436, 0,0, 0)
Frame.Size = UDim2.new(0.128108516, 0, 0.217252403, 0)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 0,0, 0)
TextLabel.Size = UDim2.new(0, 170, 0, 46)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "FINDING ITEMS.."
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

UICorner.Parent = TextLabel

function sellItem(item)
    local plrName = game.Players.LocalPlayer.Name
    local itemName = game.Players.LocalPlayer.Backpack:FindFirstChild(item.Name)
    itemName.Parent = game.Workspace.Living:FindFirstChild(plrName)

    local args1 = {"EndDialogue", {["NPC"] = "Merchant", ["Option"] = "Option2", ["Dialogue"] = "Dialogue2"}}
    local args2 = {"EndDialogue", {["NPC"] = "Merchant", ["Option"] = "Option2", ["Dialogue"] = "Dialogue5"}}
    
    game.Players.LocalPlayer.Character.RemoteEvent:FireServer(unpack(args1))
    game.Players.LocalPlayer.Character.RemoteEvent:FireServer(unpack(args2))
end

local _place,_id = game.PlaceId, game.JobId
local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=10"

function ListServers(cursor)
    local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
    return Http:JSONDecode(Raw)
end

local function travelTo(place, cframe)
    local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
    local vector = (cframe and place or place.Position) - plr.Position
    local length = vector.Magnitude
    local num_tp = math.ceil(length / 50)
    plr.CFrame = plr.CFrame + vector / num_tp
end

task.spawn(function()
    while task.wait() do
        for _, item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if items[item.Name] then
                sellItem(item)
            end
        end
    end
end)

task.spawn(function()
    for _,v in pairs(workspace.Map:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Transparency = 0.5
            v.CanCollide = false
        end
    end
    for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
    end
end)

function start()
    while boolean do
        task.wait(0.01)
        if not busy then
            busy = true
            task.delay(3, function()
                busy = false
            end)
            local oldBV = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildWhichIsA("BodyVelocity")
            if oldBV then oldBV:Destroy() end
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            bv.Velocity = Vector3.new(0,-0.01,0)
            bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart

            for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                    v.Anchored = false
                end
            end

            TextLabel.Text = "ITEMS SPAWNED: "..#workspace.Item_Spawns.Items:GetChildren()
            if #workspace.Item_Spawns.Items:GetChildren() == 0 then
                travelTo(workspace.Dialogues:GetChildren()[math.random(1,#workspace.Dialogues:GetChildren())].TalkBox.Position + Vector3.new(0,-50,0), true)
                task.wait(0.05)
            end

            if #workspace.Item_Spawns.Items:GetChildren() == 0 and time >= 190 and hop == true then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                local Servers = ListServers()
                local Server = Servers.data[math.random(1,#Servers.data)]
                TPS:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
            end

            for _, v in pairs(game.Workspace.Item_Spawns.Items:GetChildren()) do
                local item = v:FindFirstChild("MeshPart") or v:FindFirstChild("Part")
                for _,m in pairs(v:GetChildren()) do
                    if (m:IsA("MeshPart") and m:FindFirstChildOfClass("PointLight")) or (m:IsA("BasePart") and m:FindFirstChildOfClass("BodyGyro")) then
                        item = m
                    end
                end
                if item and (item:FindFirstChild("PointLight") or item:FindFirstChild("SpawnedItemWisps") or item:FindFirstChildOfClass("BodyGyro")) then
                    TextLabel.Text = "Item found, teleporting.."
                    local proxPrompt = v.ProximityPrompt
                    proxPrompt.HoldDuration = duration
                    local attempts = 0
                    while attempts < 1 do
                        local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
                        if (item.Position - plr.Position).Magnitude > 20 then
                            travelTo(item.Position + Vector3.new(0,-7.5,0), true)
							task.wait(0.02)
                        else
						    for i = 1,5 do
								travelTo(item.Position + Vector3.new(0,-7.5,0), true)
							    task.wait(0.02 + (1 * game.Players.LocalPlayer:GetNetworkPing()))
							end
                            for i = 1,5 do
                                attempts += 1
                                for _,p in pairs(v:GetChildren()) do
                                    if p:IsA("ProximityPrompt") then
                                        fireproximityprompt(p,2)
                                    end
                                end
                                TextLabel.Text = "picking up and selling item.."
                                task.wait(0.1)
                            end
                        end
                        task.wait(0.01)
                    end
                    if v:FindFirstChild("ProximityPrompt") then
                        v:Destroy()
                    end
                    busy = false
                end
            end
            busy = false
        end
    end
end

task.spawn(start)

-- GUI toggle
local toggle = Instance.new("ScreenGui")
local TextButton5 = Instance.new("TextButton")

toggle.Name = "toggle"
toggle.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
toggle.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
toggle.ResetOnSpawn = false

TextButton5.Parent = toggle
TextButton5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton5.Position = UDim2.new(1, -80, 0.5, -25)
TextButton5.Size = UDim2.new(0, 80, 0, 50)
TextButton5.Font = Enum.Font.SourceSans
TextButton5.Text = "ON"
TextButton5.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton5.TextSize = 14.000

TextButton5.MouseButton1Down:Connect(function()
    boolean = not boolean
    TextButton5.Text = tostring(boolean)
    if not boolean then
        for _,v in pairs(workspace.Map:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Transparency = 0
                v.CanCollide = true
            end
        end
        for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = true
            end
        end
        local bv = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildWhichIsA("BodyVelocity")
        if bv then bv:Destroy() end
    else
        for _,v in pairs(workspace.Map:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Transparency = 0.5
                v.CanCollide = false
            end
        end
        for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
        task.spawn(start)
    end
end)
end)

coroutine.resume(wrap)

game.Players.PlayerRemoving:Connect(function(plr)
    if plr == game.Players.LocalPlayer then
        game:GetService('TeleportService'):Teleport(game.PlaceId)
        coroutine.yield(wrap)
    end
end)
