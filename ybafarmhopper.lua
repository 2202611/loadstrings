print("Loaded")
queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport
local wrap = coroutine.create(function()
local duration = 0.1
local speed = 0.05
local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
local hop = true

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

local HttpService = game:GetService("HttpService")
function vtype(o, t)
    if o == nil then return false end
    if type(o) == "userdata" then return typeof(o) == t end
    return type(o) == t
end

local writefile = type(writefile) == "function" and function(file, data, safe)
    if safe == true then return pcall(writefile, file, data) end
    writefile(file, data)
end

local readfile = type(readfile) == "function" and function(file, safe)
    if safe == true then return pcall(readfile, file) end
    return readfile(file)
end

function writefileExploit()
	if writefile then
		return true
	end
end

function readfileExploit()
	if readfile then
		return true
	end
end

defaultsettings = {
}

defaults = HttpService:JSONEncode(defaultsettings)

local loadedEventData = nil
local jsonAttempts = 0
function saves()
    if writefileExploit() and readfileExploit() and jsonAttempts < 10 then
        local readSuccess, out = readfile("IY_FE.iy", true)
        if readSuccess then
            if out ~= nil and tostring(out):gsub("%s", "") ~= "" then
                local success, response = pcall(function()
                    local json = HttpService:JSONDecode(out)
                end)
                if not success then
                    jsonAttempts = jsonAttempts + 1
                    warn("Save Json Error:", response)
                    warn("Overwriting Save File")
                    writefile("AUTOYBA.iy", defaults, true)
                    wait()
                    saves()
                end
            else
                writefile("AUTOYBA.iy", defaults, true)
                wait()
                local dReadSuccess, dOut = readfile("AUTOYBA.iy", true)
                if dReadSuccess and dOut ~= nil and tostring(dOut):gsub("%s", "") ~= "" then
                    saves()
                else
                    nosaves = true
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Error!", -- Required
                        Text = "failed to save script", -- Required
                    })
                end
            end
        else
            writefile("AUTOYBA.iy", defaults, true)
            wait()
            local dReadSuccess, dOut = readfile("AUTOYBA.iy", true)
            if dReadSuccess and dOut ~= nil and tostring(dOut):gsub("%s", "") ~= "" then
                saves()
            else
                nosaves = true
                game:GetService("StarterGui"):SetCore("SendNotification",{
                    Title = "Error!", -- Required
                    Text = "failed to save script", -- Required
                }) 
           end
        end
    else
        if jsonAttempts >= 10 then
            nosaves = true
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Error!", -- Required
                Text = "failed to save script", -- Required
            })
            else
            nosaves = true
        end
    end
end

saves()


local TeleportCheck = false
game.Players.LocalPlayer.OnTeleport:Connect(function(State)
	if (not TeleportCheck) and queueteleport then
		TeleportCheck = true
		queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/2202611/loadstrings/refs/heads/main/ybafarmhopper.lua'))()")
	end
end)

local _place,_id = game.PlaceId, game.JobId

local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=10"
function ListServers(cursor)
   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
   return Http:JSONDecode(Raw)
end

local waittime = 0
while game.Players.LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen1") do
    task.wait(1)
    waittime += 1
    if waittime >= 15 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        local Servers = ListServers()
        local Server = Servers.data[math.random(1,#Servers.data)]
        TPS:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
        break
    end
end

local waittime2 = 0
while game.Players.LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen") do
    task.wait(1)
    waittime2 += 1
    if waittime2 >= 15 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        local Servers = ListServers()
        local Server = Servers.data[math.random(1,#Servers.data)]
        TPS:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
        break
    end
end

game.Players.LocalPlayer.PlayerStats.Prestige.Value = "0"



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


local function travelTo(place,cframe) -- Does the math and teleports you in chunks to bypass tp anticheat
    local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
    local vector
    if cframe then
        vector = place - plr.Position
    end
    if place and not cframe then
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
bv = Instance.new("BodyVelocity")
bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
bv.Velocity = Vector3.new(0,-0.1,0)
bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
while boolean do
    task.wait(.01)
	time += .01
    print(time)
    if busy == false then
    busy = true
    task.delay(3,function()
        busy = false
    end)
    bv = Instance.new("BodyVelocity")
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
       -- while #workspace.Item_Spawns.Items:GetChildren() == 0 do
            travelTo(workspace.Dialogues:GetChildren()[math.random(1,#workspace.Dialogues:GetChildren())].TalkBox.Position + Vector3.new(0,-50,0),true)
            task.wait(0.05)
            time += 0.05
            print(time)
         --   print(#workspace.Item_Spawns.Items:GetChildren())
        --end
    end
    if #workspace.Item_Spawns.Items:GetChildren() == 0 and time >= 120 and hop == true then
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
                        if (item.Position - plr.Position).Magnitude > 20 then
						travelTo(item.Position + Vector3.new(0,-7.5,0),true)
                        else
                            task.wait(0.1)
							--maxItems()
                            for i = 1,1 do
                            attempts += 1
                            local prompt
                            for _,p in pairs(v:GetChildren()) do
                                if p:IsA("ProximityPrompt") then
                                   prompt = p
				                   fireproximityprompt(p,2)
                                end
                            end
                            TextLabel.Text = "picking up and selling item.."
                            --task.wait(0.1)
                            time += 1
                            print(time)
			                if not prompt then
                                break
                            elseif prompt then
                                task.wait(0.1)
                                if prompt then
                                for i = 1,10 do
                                   task.wait(0.1)
                                   if not prompt then
                                    break
                                   end
                                end
                                end
                                break
                            end
                        end
						end
						task.wait(0.01)
                        time += 0.01
					end
                    if v and v:FindFirstChild("ProximityPrompt") then
                        v:Destroy()
                    end
                    busy = false
					--maxItems()
				end
			end
            busy = false
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
local toggled = true
local function BKOLUE_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton5)
	
	script.Parent.MouseButton1Down:Connect(function()
		boolean = not boolean
		script.Parent.Text = tostring(boolean)
        if boolean == false then
            task.spawn(function()
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
                if bv then
                    bv:Destroy()
                end
            end)
        elseif boolean == true then
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
        end
        start()
	end)
end
coroutine.wrap(BKOLUE_fake_script)()

end)

coroutine.resume(wrap)
