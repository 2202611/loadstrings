print("Loaded")
local wrap = coroutine.create(function()
local duration = 0.1
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
---
local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"
---

items = {
    ["Mysterious Arrow"] = 0,
    ["Rokakaka"] = 0,
    ["Gold Coin"] = 0,
    ["Diamond"] = 0,
    ["Pure Rokakaka"] = 0,
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
    ["Lucky Stone Mask"] = 0,
    ["Gold Umbrella"] = 0,
    --["Yellow Candy"] = 0,
    --["Green Candy"] = 0,
    --["Red Candy"] = 0,
    --["Blue Candy"] = 0,
}

local maxLimits = {  -- Add to the list if I missed an item
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
    ["Pure Rokakaka"] = 999,
    ["Lucky Stone Mask"] = 999,
    ["Lucky Arrow"] = 999,
    ["Gold Umbrella"] = 999,
    ["Left Arm of The Saint's Corpse"] = 999,
    ["Heart of The Saint's Corpse"] = 999,
    ["Pelvis of The Saint's Corpse"] = 999,
    --["Yellow Candy"] = 999,
    --["Green Candy"] = 999,
    --["Red Candy"] = 999,
    --["Blue Candy"] = 999,
}

repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen1") == nil
game.Players.LocalPlayer.PlayerStats.Prestige.Value = "0"

task.spawn(function()
for i, v in next, {"MouseButton1Click", "MouseButton1Down", "Activated"} do firesignal(game.Players.LocalPlayer.PlayerGui:WaitForChild("LoadingScreen").Play[v]) end
end)

-- Gui to Lua
-- Version: 3.3

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")

--Properties:

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

function maxItems()
    for _, item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if items[item.Name] then
            items[item.Name] = items[item.Name] + 1
            if (items[item.Name] >= (maxLimits[item.Name] or 25)) then
            sellItem(item)
            end
        end
    end
end

function sellItem(item)
    local plrName = game.Players.LocalPlayer.Name
    local itemName = game.Players.LocalPlayer.Backpack:FindFirstChild(item.Name)
    itemName.Parent = game.Workspace.Living:FindFirstChild(plrName)

    local args = {
        [1] = "EndDialogue",
        [2] = {
            ["NPC"] = "Merchant",
            ["Option"] = "Option2",
            ["Dialogue"] = "Dialogue2"
        }
    }

    game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))
    local args = {
        [1] = "EndDialogue",
        [2] = {
            ["NPC"] = "Merchant",
            ["Option"] = "Option2",
            ["Dialogue"] = "Dialogue5"
        }
    }

    game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))
end

local _place,_id = game.PlaceId, game.JobId

local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=10"
function ListServers(cursor)
   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
   return Http:JSONDecode(Raw)
end

local function travelTo(place,cframe) -- Does the math and teleports you in chunks to bypass tp anticheat
    local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
    local vector
    if cframe then
        vector = place - plr.Position
    end
    if place then
    vector = place.Position - plr.Position
    end

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
    task.wait(.5)
	time += .5
    print(time)
    if busy == false then
    busy = true
    task.delay(3,function()
        busy = false
    end)
    for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
            v.Anchored = false
        end
    end
    TextLabel.Text = "ITEMS SPAWNED: "..#workspace.Item_Spawns.Items:GetChildren()
    if #workspace.Item_Spawns.Items:GetChildren() == 0 then
        TextLabel.Text = "Hiding..: "..#workspace.Item_Spawns.Items:GetChildren()
        while true do
            travelTo(workspace.Locations["Naples' Sewers"].CFrame)
            if (workspace.Locations["Naples' Sewers"].Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5 then
                break
            end
            task.wait(0.05)
        end
    end
    if #workspace.Item_Spawns.Items:GetChildren() == 0 and time >= 190 and hop == true then
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        local Servers = ListServers()
        local Server = Servers.data[math.random(1,#Servers.data)]
        TPS:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
    end
           -- if v:FindFirstChild("PointLight") then
			--for _,v in pairs(hrp.Parent:GetChildren()) do
             --   if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
            --        v.Anchored = true
            --    end
          --  end
            --hrp.Anchored = false
            for _, v in pairs(game.Workspace.Item_Spawns.Items:GetChildren()) do
				local item = v:FindFirstChild("MeshPart")
                if not item then
                    item = v:FindFirstChild("Part")
                end
                for _,m in pairs(v:GetChildren()) do
                   if m:IsA("MeshPart") and m:FindFirstChildOfClass("PointLight") or m:IsA("BasePart") and m:FindFirstChildOfClass("BodyGyro") then
                    item = m
                   end
                end
				if item and item:FindFirstChild("PointLight") or item and item:FindFirstChild("SpawnedItemWisps") or item and item:FindFirstChildOfClass("BodyGyro") then
                    TextLabel.Text = "Item found, teleporting.."
					local proxPrompt = v.ProximityPrompt
                    proxPrompt.HoldDuration = duration
                    local attempts = 0
					while attempts < 1 do
						local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
                        if (item.Position - plr.Position).Magnitude > 5 then
						travelTo(item)
                        else
							--maxItems()
                            for i = 1,1 do
                            attempts += 1
                            for _,p in pairs(v:GetChildren()) do
                                if p:IsA("ProximityPrompt") then
							     fireproximityprompt(p,2)
                                end
                            end
                            TextLabel.Text = "picking up and selling item.."
                            task.wait(0.3)
                        end
						end
						task.wait(0.05)
					end
					--maxItems()
				end
			end
            end
    end
--end
end
task.spawn(function()
start()
end)

-- Gui to Lua
-- Version: 3.3

-- Instances:

local toggle = Instance.new("ScreenGui")
local TextButton5 = Instance.new("TextButton")

--Properties:

toggle.Name = "toggle"
toggle.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
toggle.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
toggle.ResetOnSpawn = false

TextButton5.Parent = toggle
TextButton5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton5.BorderSizePixel = 0
TextButton5.Position = UDim2.new(1, -80, 0.5, -25)
TextButton5.Size = UDim2.new(0, 80, 0, 50)
TextButton5.Font = Enum.Font.SourceSans
TextButton5.Text = "ON"
TextButton5.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton5.TextSize = 14.000

-- Scripts:

local function BKOLUE_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton5)
	
	script.Parent.MouseButton1Down:Connect(function()
		boolean = not boolean
		script.Parent.Text = tostring(boolean)
        start()
	end)
end
coroutine.wrap(BKOLUE_fake_script)()

end)

coroutine.resume(wrap)

game.Players.PlayerRemoving:Connect(function(plr)
    if plr == game.Players.LocalPlayer then
      game:GetService('TeleportService'):Teleport(game.PlaceId)
      coroutine.yield(wrap)
    end
end)
