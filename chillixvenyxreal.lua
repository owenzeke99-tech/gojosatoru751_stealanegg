-- Services
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

-- Cleanup existing UI if executed again
if CoreGui:FindFirstChild("ChilliXKeyUI") then
    CoreGui.ChilliXKeyUI:Destroy()
end

-- Configuration
local CorrectKey = "ChilliXVenyxHubV9KeyoosjwowoLapwijwbsoLsowuwj"
local KeyLink = "https://link4m.org/XVqniRV"
local KeyFileName = "ChilliXVenyx_SavedKey.json"

-- Function to Load Main Script and Destroy Key UI
local function LoadMainScript()
    if CoreGui:FindFirstChild("ChilliXKeyUI") then
        CoreGui.ChilliXKeyUI:Destroy() -- Xóa hoàn toàn menu Key System ngay lập tức
    end
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gojosatoru751/scriptdz/refs/heads/main/chillixvenyxreal.lua"))()
end

-- Silent Auto Key Verification with 24-hour expiration
if readfile and isfile and isfile(KeyFileName) then
    local success, data = pcall(function()
        return HttpService:JSONDecode(readfile(KeyFileName))
    end)
    if success and data and data.Key == CorrectKey and data.ExpiryTime then
        if os.time() < data.ExpiryTime then
            LoadMainScript()
            return
        end
    end
end

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ChilliXKeyUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = CoreGui
elseif gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = CoreGui
end

-- Main Frame (Black / Dark Gray Theme)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 420, 0, 275)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -137.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainUICorner = Instance.new("UICorner")
MainUICorner.CornerRadius = UDim.new(0, 14)
MainUICorner.Parent = MainFrame

-- Red Glowing Border
local MainUIStroke = Instance.new("UIStroke")
MainUIStroke.Color = Color3.fromRGB(220, 38, 38)
MainUIStroke.Thickness = 1.8
MainUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MainUIStroke.Parent = MainFrame

-- Top Bar / Header
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 14)
TopBarCorner.Parent = TopBar

-- Fix Top Bar bottom corners
local TopBarFix = Instance.new("Frame")
TopBarFix.Size = UDim2.new(1, 0, 0, 15)
TopBarFix.Position = UDim2.new(0, 0, 1, -15)
TopBarFix.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
TopBarFix.BorderSizePixel = 0
TopBarFix.Parent = TopBar

-- Title: Chilli X Venyx V9 (Centered & Gray Color)
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Chilli X Venyx V9"
Title.Font = Enum.Font.FredokaOne
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(200, 200, 215)
Title.TextXAlignment = Enum.TextXAlignment.Center
Title.Parent = TopBar

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(240, 240, 250)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 150, 170))
})
TitleGradient.Parent = Title

-- Status Subtitle (Centered)
local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, 0, 0, 20)
SubTitle.Position = UDim2.new(0, 0, 0, 60)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "KEY VERIFICATION SYSTEM"
SubTitle.Font = Enum.Font.GothamBold
SubTitle.TextSize = 11
SubTitle.TextColor3 = Color3.fromRGB(130, 130, 150)
SubTitle.TextXAlignment = Enum.TextXAlignment.Center
SubTitle.Parent = MainFrame

-- Textbox Container
local InputContainer = Instance.new("Frame")
InputContainer.Size = UDim2.new(1, -30, 0, 48)
InputContainer.Position = UDim2.new(0, 15, 0, 90)
InputContainer.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
InputContainer.BorderSizePixel = 0
InputContainer.Parent = MainFrame

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = InputContainer

local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Color3.fromRGB(50, 50, 65)
InputStroke.Thickness = 1
InputStroke.Parent = InputContainer

-- TextBox (Centered Text)
local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -20, 1, 0)
TextBox.Position = UDim2.new(0, 10, 0, 0)
TextBox.BackgroundTransparency = 1
TextBox.PlaceholderText = "Enter key here..."
TextBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 120)
TextBox.Text = ""
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 13
TextBox.TextColor3 = Color3.fromRGB(245, 245, 255)
TextBox.ClearTextOnFocus = false
TextBox.TextXAlignment = Enum.TextXAlignment.Center
TextBox.Parent = InputContainer

-- Modern Notification Alert Box (Hidden by default)
local AlertBox = Instance.new("Frame")
AlertBox.Size = UDim2.new(1, -30, 0, 28)
AlertBox.Position = UDim2.new(0, 15, 0, 145)
AlertBox.BackgroundColor3 = Color3.fromRGB(35, 25, 30)
AlertBox.BackgroundTransparency = 1
AlertBox.BorderSizePixel = 0
AlertBox.Visible = false
AlertBox.Parent = MainFrame

local AlertCorner = Instance.new("UICorner")
AlertCorner.CornerRadius = UDim.new(0, 6)
AlertCorner.Parent = AlertBox

local AlertStroke = Instance.new("UIStroke")
AlertStroke.Color = Color3.fromRGB(220, 38, 38)
AlertStroke.Transparency = 1
AlertStroke.Parent = AlertBox

local AlertText = Instance.new("TextLabel")
AlertText.Size = UDim2.new(1, 0, 1, 0)
AlertText.BackgroundTransparency = 1
AlertText.Text = ""
AlertText.Font = Enum.Font.GothamMedium
AlertText.TextSize = 11
AlertText.TextColor3 = Color3.fromRGB(255, 100, 100)
AlertText.TextXAlignment = Enum.TextXAlignment.Center
AlertText.Parent = AlertBox

-- Function to show modern notification inside menu
local function ShowAlert(message, isSuccess)
    AlertBox.Visible = true
    AlertText.Text = message
    
    if isSuccess then
        AlertBox.BackgroundColor3 = Color3.fromRGB(20, 35, 25)
        AlertStroke.Color = Color3.fromRGB(34, 197, 94)
        AlertText.TextColor3 = Color3.fromRGB(74, 222, 128)
    else
        AlertBox.BackgroundColor3 = Color3.fromRGB(35, 20, 20)
        AlertStroke.Color = Color3.fromRGB(220, 38, 38)
        AlertText.TextColor3 = Color3.fromRGB(248, 113, 113)
    end
    
    AlertBox.BackgroundTransparency = 1
    AlertStroke.Transparency = 1
    AlertText.TextTransparency = 1
    
    TweenService:Create(AlertBox, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
    TweenService:Create(AlertStroke, TweenInfo.new(0.2), {Transparency = 0}):Play()
    TweenService:Create(AlertText, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
end

-- Button Container
local ButtonFrame = Instance.new("Frame")
ButtonFrame.Size = UDim2.new(1, -30, 0, 45)
ButtonFrame.Position = UDim2.new(0, 15, 0, 183)
ButtonFrame.BackgroundTransparency = 1
ButtonFrame.Parent = MainFrame

-- Check Key Button (Red Theme)
local CheckBtn = Instance.new("TextButton")
CheckBtn.Size = UDim2.new(0.48, 0, 1, 0)
CheckBtn.Position = UDim2.new(0, 0, 0, 0)
CheckBtn.BackgroundColor3 = Color3.fromRGB(220, 38, 38)
CheckBtn.Text = "Check Key"
CheckBtn.Font = Enum.Font.GothamBold
CheckBtn.TextSize = 13
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckBtn.AutoButtonColor = false
CheckBtn.Parent = ButtonFrame

local CheckCorner = Instance.new("UICorner")
CheckCorner.CornerRadius = UDim.new(0, 8)
CheckCorner.Parent = CheckBtn

-- Get Key Button (Dark Gray Theme)
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.48, 0, 1, 0)
GetKeyBtn.Position = UDim2.new(0.52, 0, 0, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
GetKeyBtn.Text = "Get Key Link"
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 13
GetKeyBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
GetKeyBtn.AutoButtonColor = false
GetKeyBtn.Parent = ButtonFrame

local GetCorner = Instance.new("UICorner")
GetCorner.CornerRadius = UDim.new(0, 8)
GetCorner.Parent = GetKeyBtn

local GetStroke = Instance.new("UIStroke")
GetStroke.Color = Color3.fromRGB(60, 60, 80)
GetStroke.Thickness = 1
GetStroke.Parent = GetKeyBtn

-- Strong & Clear Shake Animation on Failure
local function ShakeUI()
    local OriginalPos = UDim2.new(0.5, -210, 0.5, -137.5)
    local TweenInfoData = TweenInfo.new(0.04, Enum.EasingStyle.Bounce, Enum.EasingDirection.InOut, 0, true)
    
    local offsets = {-14, 14, -10, 10, -6, 6, 0}
    for _, offsetX in ipairs(offsets) do
        local ShakeTween = TweenService:Create(MainFrame, TweenInfoData, {
            Position = UDim2.new(OriginalPos.X.Scale, OriginalPos.X.Offset + offsetX, OriginalPos.Y.Scale, OriginalPos.Y.Offset)
        })
        ShakeTween:Play()
        ShakeTween.Completed:Wait()
    end
    MainFrame.Position = OriginalPos
end

-- Button Hover Effects
local function AddHoverEffect(button, defaultColor, hoverColor)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = defaultColor}):Play()
    end)
end

AddHoverEffect(CheckBtn, Color3.fromRGB(220, 38, 38), Color3.fromRGB(245, 55, 55))
AddHoverEffect(GetKeyBtn, Color3.fromRGB(35, 35, 48), Color3.fromRGB(50, 50, 68))

-- Check Key Action
CheckBtn.MouseButton1Click:Connect(function()
    local InputText = TextBox.Text
    if InputText == CorrectKey then
        ShowAlert("Access Granted! Loading script...", true)
        
        -- Save key with 24-hour expiration silently
        if writefile then
            local expiry = os.time() + (24 * 60 * 60)
            local data = {
                Key = CorrectKey,
                ExpiryTime = expiry
            }
            pcall(function()
                writefile(KeyFileName, HttpService:JSONEncode(data))
            end)
        end
        
        task.wait(0.8)
        LoadMainScript() -- Menu key sẽ tự động bị xóa biến mất ở đây
    else
        ShowAlert("Invalid Key! Please try again.", false)
        
        -- Auto clear input field & Trigger strong shake
        TextBox.Text = ""
        ShakeUI()
    end
end)

-- Get Key Link Action
GetKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(KeyLink)
        ShowAlert("Key link copied to clipboard!", true)
    else
        ShowAlert("Clipboard function not supported.", false)
    end
end)

-- Make UI Draggable
local Dragging, DragInput, DragStart, StartPos
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        Dragging = true
        DragStart = input.Position
        StartPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                Dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        DragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == DragInput and Dragging then
        local Delta = input.Position - DragStart
        MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset)
    end
end)
