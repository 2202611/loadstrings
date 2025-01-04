-- Gui to Lua
-- Version: 3.3

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local title = Instance.new("TextLabel")
local KASLIDER = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local katext = Instance.new("TextLabel")
local TextButton_2 = Instance.new("TextButton")
local enabletextka = Instance.new("TextLabel")
local CFRAMESLIDER = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local TextButton_3 = Instance.new("TextButton")
local TextButton2 = Instance.new("TextButton")
local enablecframewalk = Instance.new("TextLabel")
local TextButton3 = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local TextButton4 = Instance.new("TextButton")
local enablefly = Instance.new("TextLabel")
local TextButton5 = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local killaurasize = 50
local cframespeed = 1
--Properties:

ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(68, 61, 61)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 0, 0.428318572, 0)
Frame.Size = UDim2.new(0.234222913, 0, 0.443362856, 0)

UICorner.Parent = Frame

title.Name = "title"
title.Parent = Frame
title.BackgroundColor3 = Color3.fromRGB(125, 125, 125)
title.BorderColor3 = Color3.fromRGB(0, 0, 0)
title.BorderSizePixel = 0
title.Size = UDim2.new(0.998121202, 0, 0.0879478827, 0)
title.Font = Enum.Font.DenkOne
title.Text = "Nigger hub"
title.TextColor3 = Color3.fromRGB(0, 0, 0)
title.TextScaled = true
title.TextSize = 14.000
title.TextWrapped = true

KASLIDER.Name = "KASLIDER"
KASLIDER.Parent = Frame
KASLIDER.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
KASLIDER.BorderColor3 = Color3.fromRGB(0, 0, 0)
KASLIDER.BorderSizePixel = 0
KASLIDER.Position = UDim2.new(0.0164396428, 0, 0.872964144, 0)
KASLIDER.Size = UDim2.new(0.951150775, 0, 0.0390879475, 0)

UICorner_2.Parent = KASLIDER

TextButton.Parent = KASLIDER
TextButton.BackgroundColor3 = Color3.fromRGB(103, 103, 103)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0, 0, -0.833333313, 0)
TextButton.Size = UDim2.new(0.0790123492, 0, 2.58333325, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "0"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

katext.Name = "katext"
katext.Parent = Frame
katext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
katext.BackgroundTransparency = 1.000
katext.BorderColor3 = Color3.fromRGB(0, 0, 0)
katext.BorderSizePixel = 0
katext.Position = UDim2.new(0.0164396428, 0, 0.775244296, 0)
katext.Size = UDim2.new(0.490840793, 0, 0.0651465803, 0)
katext.Font = Enum.Font.Cartoon
katext.Text = "HITBOX SIZE / KILL AURA"
katext.TextColor3 = Color3.fromRGB(255, 0, 4)
katext.TextScaled = true
katext.TextSize = 14.000
katext.TextWrapped = true

TextButton_2.Parent = Frame
TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Position = UDim2.new(0.41803664, 0, 0.654723108, 0)
TextButton_2.Size = UDim2.new(0.0892437771, 0, 0.120521173, 0)
TextButton_2.Font = Enum.Font.SourceSans
TextButton_2.Text = ""
TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.TextScaled = true
TextButton_2.TextSize = 14.000
TextButton_2.TextWrapped = true

enabletextka.Name = "enabletextka"
enabletextka.Parent = Frame
enabletextka.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
enabletextka.BackgroundTransparency = 1.000
enabletextka.BorderColor3 = Color3.fromRGB(0, 0, 0)
enabletextka.BorderSizePixel = 0
enabletextka.Position = UDim2.new(0, 0, 0.654723108, 0)
enabletextka.Size = UDim2.new(0.394551456, 0, 0.110749185, 0)
enabletextka.Font = Enum.Font.SourceSans
enabletextka.Text = "TOGGLE KILL AURA"
enabletextka.TextColor3 = Color3.fromRGB(0, 0, 0)
enabletextka.TextScaled = true
enabletextka.TextSize = 14.000
enabletextka.TextWrapped = true

CFRAMESLIDER.Name = "CFRAMESLIDER"
CFRAMESLIDER.Parent = Frame
CFRAMESLIDER.BackgroundColor3 = Color3.fromRGB(21, 0, 255)
CFRAMESLIDER.BorderColor3 = Color3.fromRGB(0, 0, 0)
CFRAMESLIDER.BorderSizePixel = 0
CFRAMESLIDER.Position = UDim2.new(0.0164396428, 0, 0.570032597, 0)
CFRAMESLIDER.Size = UDim2.new(0.951150775, 0, 0.0390879475, 0)

UICorner_3.Parent = CFRAMESLIDER

TextButton_3.Parent = CFRAMESLIDER
TextButton_3.BackgroundColor3 = Color3.fromRGB(103, 103, 103)
TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.BorderSizePixel = 0
TextButton_3.Position = UDim2.new(0, 0, -0.833333313, 0)
TextButton_3.Size = UDim2.new(0.0790123492, 0, 2.58333325, 0)
TextButton_3.Font = Enum.Font.SourceSans
TextButton_3.Text = "0"
TextButton_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.TextScaled = true
TextButton_3.TextSize = 14.000
TextButton_3.TextWrapped = true

TextButton2.Name = "TextButton2"
TextButton2.Parent = Frame
TextButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton2.BorderSizePixel = 0
TextButton2.Position = UDim2.new(0.41803664, 0, 0.416938096, 0)
TextButton2.Size = UDim2.new(0.0892437771, 0, 0.120521173, 0)
TextButton2.Font = Enum.Font.SourceSans
TextButton2.Text = ""
TextButton2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton2.TextScaled = true
TextButton2.TextSize = 14.000
TextButton2.TextWrapped = true

enablecframewalk.Name = "enablecframewalk"
enablecframewalk.Parent = Frame
enablecframewalk.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
enablecframewalk.BackgroundTransparency = 1.000
enablecframewalk.BorderColor3 = Color3.fromRGB(0, 0, 0)
enablecframewalk.BorderSizePixel = 0
enablecframewalk.Position = UDim2.new(0.0164396428, 0, 0.420195431, 0)
enablecframewalk.Size = UDim2.new(0.394551456, 0, 0.110749185, 0)
enablecframewalk.Font = Enum.Font.SourceSans
enablecframewalk.Text = "TOGGLE CFRAME SPEED"
enablecframewalk.TextColor3 = Color3.fromRGB(0, 0, 0)
enablecframewalk.TextScaled = true
enablecframewalk.TextSize = 14.000
enablecframewalk.TextWrapped = true

TextButton3.Name = "TextButton3"
TextButton3.Parent = Frame
TextButton3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton3.BorderSizePixel = 0
TextButton3.Position = UDim2.new(0.73743546, 0, 0.410423458, 0)
TextButton3.Size = UDim2.new(0.230155006, 0, 0.120521173, 0)
TextButton3.Font = Enum.Font.SourceSans
TextButton3.Text = "INFINITE YIELD"
TextButton3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton3.TextScaled = true
TextButton3.TextSize = 14.000
TextButton3.TextWrapped = true

UICorner_4.Parent = TextButton3

TextButton4.Name = "TextButton4"
TextButton4.Parent = Frame
TextButton4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton4.BorderSizePixel = 0
TextButton4.Position = UDim2.new(0.41803664, 0, 0.263843656, 0)
TextButton4.Size = UDim2.new(0.0892437771, 0, 0.120521173, 0)
TextButton4.Font = Enum.Font.SourceSans
TextButton4.Text = ""
TextButton4.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton4.TextScaled = true
TextButton4.TextSize = 14.000
TextButton4.TextWrapped = true

enablefly.Name = "enablefly"
enablefly.Parent = Frame
enablefly.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
enablefly.BackgroundTransparency = 1.000
enablefly.BorderColor3 = Color3.fromRGB(0, 0, 0)
enablefly.BorderSizePixel = 0
enablefly.Position = UDim2.new(0.0164396428, 0, 0.26710099, 0)
enablefly.Size = UDim2.new(0.394551456, 0, 0.110749185, 0)
enablefly.Font = Enum.Font.SourceSans
enablefly.Text = "FLY"
enablefly.TextColor3 = Color3.fromRGB(0, 0, 0)
enablefly.TextScaled = true
enablefly.TextSize = 14.000
enablefly.TextWrapped = true

TextButton5.Name = "TextButton5"
TextButton5.Parent = Frame
TextButton5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton5.BorderSizePixel = 0
TextButton5.Position = UDim2.new(0.73743546, 0, 0.257328987, 0)
TextButton5.Size = UDim2.new(0.230155006, 0, 0.120521173, 0)
TextButton5.Font = Enum.Font.SourceSans
TextButton5.Text = "DARK DEX"
TextButton5.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton5.TextScaled = true
TextButton5.TextSize = 14.000
TextButton5.TextWrapped = true

UICorner_5.Parent = TextButton5

-- Scripts:

	local script = Instance.new('LocalScript', KASLIDER)

	local Player = game:GetService("Players").LocalPlayer
	local UIS = game:GetService("UserInputService")
	local Runservice = game:GetService("RunService")
	local Frame = script.Parent
	local Button = script.Parent.TextButton
	local db = false
	local step = 0.001
	local percentage = 70
	
	function snap(number,factor)
		if factor == 0 then
			return number
		else
			return math.floor(number/factor+0.5)*factor
		end
	end
	
	UIS.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			db = false
		end
	end)
	
	TextButton.MouseButton1Down:Connect(function()
		db = true
	end)
	
	Runservice.RenderStepped:Connect(function()
		if db then
			local MousePos = UIS:GetMouseLocation().X
			local BtnPos = Button.Position
			local FrameSize = Frame.AbsoluteSize.X
			local FramePos = Frame.AbsolutePosition.X
			local pos = snap((MousePos-FramePos)/FrameSize,step)
			percentage = math.clamp(pos,0,1)
			Button.Text = percentage * 100
            killaurasize = Button.Text
			Button.Position = UDim2.new(percentage,0,BtnPos.Y.Scale,BtnPos.Y.Offset)
		end
	end)


	local script = Instance.new('LocalScript', TextButton_2)

	local killaurasize = 50
	local speedenabled = false
	
	local cframes = coroutine.create(function(toggles)
		speedenabled = false
	end)
	
	local function enablespeed()
        local connection = game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
            if input.KeyCode == Enum.KeyCode.W then
                while game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) do
                task.wait(0.01)
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * cframespeed
                end
            elseif input.KeyCode == Enum.KeyCode.S then
                    while game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) do
                    task.wait(0.01)
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * cframespeed
                    end
            elseif input.KeyCode == Enum.KeyCode.D then
                    while game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) do
                    task.wait(0.01)
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * cframespeed
                    end
            elseif input.KeyCode == Enum.KeyCode.A then
                    while game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) do
                    task.wait(0.01)
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * cframespeed
                    end
            end
        end)
		while speedenabled do
			task.wait(1)
			if not speedenabled then connection:Disconnect() break end
		end
	end
	
	TextButton2.MouseButton1Click:Connect(function()
		if TextButton2.Text ~= "X" then
			TextButton2.Text = "X"
			speedenabled = true
			enablespeed()
		else
			TextButton2.Text = ""
			speedenabled = false
			coroutine.resume(cframes)
		end
	end)

	local script = Instance.new('LocalScript', CFRAMESLIDER)

	local Player = game:GetService("Players").LocalPlayer
	local UIS = game:GetService("UserInputService")
	local Runservice = game:GetService("RunService")
	local Frame = script.Parent
	local Button2 = script.Parent.TextButton
	local db = false
	local step = 0.001
	local percentage = 70
	
	function snap(number,factor)
		if factor == 0 then
			return number
		else
			return math.floor(number/factor+0.5)*factor
		end
	end
	
	UIS.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			db = false
		end
	end)
	
	Button2.MouseButton1Down:Connect(function()
		db = true
	end)
	
	Runservice.RenderStepped:Connect(function()
		if db then
			local MousePos = UIS:GetMouseLocation().X
			local BtnPos = Button.Position
			local FrameSize = Frame.AbsoluteSize.X
			local FramePos = Frame.AbsolutePosition.X
			local pos = snap((MousePos-FramePos)/FrameSize,step)
			percentage = math.clamp(pos,0,1)
			Button2.Text = percentage * 50
            cframespeed = Button2.Text
			Button2.Position = UDim2.new(percentage,0,BtnPos.Y.Scale,BtnPos.Y.Offset)
		end
	end)

local killaurasize = 50
	local auraenabled = false
	
	local killaura = coroutine.create(function(toggles)
		auraenabled = false
		for _,v in pairs(workspace:GetChildren()) do
			if v:FindFirstChild("HumanoidRootPart") and v.Name ~= game:GetService("Players").LocalPlayer.Name then
				v.HumanoidRootPart.CanCollide = false
				v.HumanoidRootPart.Transparency = 1
				v.HumanoidRootPart.Anchored = false
				v.HumanoidRootPart.Size = Vector3.new(2,2,1)
			end
		end
	end)
	
	local function enableka()
		while auraenabled do
			task.wait(1)
			if not auraenabled then break end
			for _,v in pairs(workspace:GetChildren()) do
				if v:FindFirstChild("HumanoidRootPart") and v.Name ~= game:GetService("Players").LocalPlayer.Name then
					for _,b in pairs(v:GetChildren()) do
						if b:IsA("BasePart") then
							b.CanCollide = false
							b.Anchored = false
						end
					end
					v.HumanoidRootPart.Transparency = 0.5
					if size ~= 0 then
						v.HumanoidRootPart.Size = Vector3.new(killaurasize,killaurasize,killaurasize)
					end
				end
			end
		end
	end
	
	TextButton_2.MouseButton1Click:Connect(function()
		if TextButton_2.Text ~= "X" then
			TextButton_2.Text = "X"
			auraenabled = true
			enableka()
		else
			TextButton_2.Text = ""
			auraenabled = false
			coroutine.resume(killaura)
		end
	end)
	

	TextButton3.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end)

 local function LMXOM_fake_script() -- TextButton4.LocalScript 
	local script = Instance.new('LocalScript', TextButton4)

	local fly = coroutine.create(function()
		-- Made By zack;#6969
	
		-- Instances:
	
		local FlyScript = Instance.new("ScreenGui")
		local Gradient = Instance.new("Frame")
		local UIGradient = Instance.new("UIGradient")
		local UICorner = Instance.new("UICorner")
		local Button = Instance.new("TextButton")
		local Shadow = Instance.new("Frame")
		local TextLabel = Instance.new("TextLabel")
	
		--Properties:
	
		FlyScript.Name = "FlyScript"
		FlyScript.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
		FlyScript.ResetOnSpawn = false
	
		Gradient.Name = "Gradient"
		Gradient.Parent = FlyScript
		Gradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Gradient.BorderColor3 = Color3.fromRGB(27, 42, 53)
		Gradient.BorderSizePixel = 0
		Gradient.Position = UDim2.new(0.0199062824, 0, 0.781767964, 0)
		Gradient.Size = UDim2.new(0, 231, 0, 81)
	
		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(57, 104, 252)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(51, 68, 175))}
		UIGradient.Parent = Gradient
	
		UICorner.CornerRadius = UDim.new(0.0399999991, 0)
		UICorner.Parent = Gradient
	
		Button.Name = "Button"
		Button.Parent = Gradient
		Button.BackgroundColor3 = Color3.fromRGB(77, 100, 150)
		Button.BorderSizePixel = 0
		Button.Position = UDim2.new(0.0921155736, 0, 0.238353431, 0)
		Button.Size = UDim2.new(0, 187, 0, 41)
		Button.ZIndex = 2
		Button.Font = Enum.Font.GothamSemibold
		Button.Text = ""
		Button.TextColor3 = Color3.fromRGB(255, 255, 255)
		Button.TextScaled = true
		Button.TextSize = 14.000
		Button.TextWrapped = true
	
		Shadow.Name = "Shadow"
		Shadow.Parent = Button
		Shadow.BackgroundColor3 = Color3.fromRGB(53, 69, 103)
		Shadow.BorderSizePixel = 0
		Shadow.Size = UDim2.new(1, 0, 1, 4)
	
		TextLabel.Parent = Gradient
		TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0.487012982, 0, 0.5, 0)
		TextLabel.Size = UDim2.new(0.878787875, -20, 0.728395045, -20)
		TextLabel.ZIndex = 2
		TextLabel.Font = Enum.Font.GothamBold
		TextLabel.Text = "Fly"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 14.000
		TextLabel.TextWrapped = true
		Button.MouseButton1Down:connect(function()
			repeat wait()
			until game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:findFirstChild("Torso") and game:GetService("Players").LocalPlayer.Character:findFirstChild("Humanoid")
			local mouse = game:GetService("Players").LocalPlayer:GetMouse()
			repeat wait() until mouse
			local plr = game:GetService("Players").LocalPlayer
			local torso = plr.Character.Torso
			local flying = true
			local deb = true
			local ctrl = {f = 0, b = 0, l = 0, r = 0}
			local lastctrl = {f = 0, b = 0, l = 0, r = 0}
			local maxspeed = 50
			local speed = 0
	
			function Fly()
				local bg = Instance.new("BodyGyro", torso)
				bg.P = 9e4
				bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
				bg.cframe = torso.CFrame
				local bv = Instance.new("BodyVelocity", torso)
				bv.velocity = Vector3.new(0,0.1,0)
				bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
				repeat wait()
					plr.Character.Humanoid.PlatformStand = true
					if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
						speed = speed+.5+(speed/maxspeed)
						if speed > maxspeed then
							speed = maxspeed
						end
					elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
						speed = speed-1
						if speed < 0 then
							speed = 0
						end
					end
					if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
						bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
						lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
					elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
						bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
					else
						bv.velocity = Vector3.new(0,0.1,0)
					end
					bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
				until not flying
				ctrl = {f = 0, b = 0, l = 0, r = 0}
				lastctrl = {f = 0, b = 0, l = 0, r = 0}
				speed = 0
				bg:Destroy()
				bv:Destroy()
				plr.Character.Humanoid.PlatformStand = false
			end
			mouse.KeyDown:connect(function(key)
				if key:lower() == "e" then
					if flying then flying = false
					else
						flying = true
						Fly()
					end
				elseif key:lower() == "w" then
					ctrl.f = 1
				elseif key:lower() == "s" then
					ctrl.b = -1
				elseif key:lower() == "a" then
					ctrl.l = -1
				elseif key:lower() == "d" then
					ctrl.r = 1
				end
			end)
			mouse.KeyUp:connect(function(key)
				if key:lower() == "w" then
					ctrl.f = 0
				elseif key:lower() == "s" then
					ctrl.b = 0
				elseif key:lower() == "a" then
					ctrl.l = 0
				elseif key:lower() == "d" then
					ctrl.r = 0
				end
			end)
			Fly()
	
		end)
		-- Scripts:
	
		local function LHMZZV_fake_script() -- FlyScript.Script 
			local script = Instance.new('Script', FlyScript)
	
			frame = script.Parent.Gradient -- Take out {}s, and put name of frame
			frame.Draggable = true
			frame.Active = true
			frame.Selectable = true
		end
		coroutine.wrap(LHMZZV_fake_script)()
	end)
	
	script.Parent.MouseButton1Click:Connect(function()
		coroutine.resume(fly)
	end)
end
coroutine.wrap(LMXOM_fake_script)()
local function SECWLE_fake_script() -- TextButton5.LocalScript 
	local script = Instance.new('LocalScript', TextButton5)

	script.Parent.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/2202611/loadstrings/refs/heads/main/darkdex.lua", true))()
	end)
end
coroutine.wrap(SECWLE_fake_script)()
local function PBKIHBZ_fake_script() -- ScreenGui.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui)

	local keybind = Enum.KeyCode.RightAlt
	local uis = game:GetService("UserInputService")
	
	uis.InputBegan:Connect(function(input)
		if input.KeyCode == keybind then
			script.Parent.Frame.Visible = not script.Parent.Frame.Visible
		end
	end)
end
coroutine.wrap(PBKIHBZ_fake_script)()
