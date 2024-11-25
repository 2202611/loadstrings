local duration = 0
local speed = 0.05
local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
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
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen") then
for i, v in next, {"MouseButton1Click", "MouseButton1Down", "Activated"} do firesignal(game.Players.LocalPlayer.PlayerGui.LoadingScreen.Play[v]) end
end

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

local function travelTo(place) -- Does the math and teleports you in chunks to bypass tp anticheat
    local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
    local vector = place.Position - plr.Position

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
while task.wait(1) do
    workspace.CurrentCamera.CFrame = CFrame.new(hrp.Position + hrp.CFrame.UpVector*10) * CFrame.Angles(math.rad(-90),0,0)
end
end)

while true do
    task.wait(.1)
	time += .1
    if busy == false then
    busy = true
    task.delay(3,function()
        busy = false
    end)
    if #workspace.Item_Spawns.Items:GetChildren() == 0 and time >= 190 then
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
				if item and item:FindFirstChild("PointLight") then -- Checks if there actually is an item in this location
					local proxPrompt = v.ProximityPrompt
                    proxPrompt.HoldDuration = duration
					while item:IsDescendantOf(game.Workspace) do
						local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
						travelTo(item)
						if (item.Position - plr.Position).Magnitude < 5 then
							maxItems()
							fireproximityprompt(proxPrompt)
						end
						task.wait(0.05)
					end
					maxItems()
				end
			end
            end
    end
--end
