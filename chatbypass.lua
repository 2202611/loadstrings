local TextChatService = game:GetService("TextChatService")
local UIS = game:GetService("UserInputService")
local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")

local ScreenGui = Instance.new("ScreenGui")
local TextBox = Instance.new("TextBox")

ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

TextBox.Parent = ScreenGui
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0, 0, 0.920000017, 0)
TextBox.Size = UDim2.new(0.151057407, 0, 0.0799999982, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

ChatInputBarConfiguration.Enabled = false

UIS.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.Slash then
        TextBox:CaptureFocus()
        TextBox.PlaceholderText = "Enter text here.."
    end
end)

TextBox.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
    if enterPressed then
        local filtered = TextBox.Text:gsub(".", "%1>"):sub(1, -2)
        local newmsg = string.gsub(filtered, "%s", "")
        local final = string.gsub(newmsg, "/", "")
        local filtered_single = final:gsub(">>", ">")

        game:GetService("TextChatService").TextChannels:WaitForChild("RBXGeneral"):SendAsync("" .. filtered_single)
        TextBox.Text = "Sent"
    end
end)
