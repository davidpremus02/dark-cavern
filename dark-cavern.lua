if game.PlaceId ~= 9551640993 then return end
repeat task.wait(0.1) until game:IsLoaded()

--------------------------------------------------------------
local Debug = false
local SpinToWin = false
local EventShop = true
local TwoWeekChallenges = true

local Data = {
    Worlds = {
        {Name="The Overworld",
            Currency = "Coins",
            Layers = {
                "Hidden Treasure",
                "Frozen Depths",
                "Gloomy Basin",
                "Molten Core",
                "The Underworld",
                "Crystal Cavern"
            },
            Eggs = {
                {Name="Basic Egg", Price="55"},
                {Name="Spotted Egg", Price="400"},
                {Name="Forest Egg", Price="1.9k"},
                {Name="Exotic Egg", Price="12k"},
                {Name="Arctic Egg", Price="55k"},
                {Name="Ice Egg", Price="225k"},
                {Name="Dark Egg", Price="1.5M"},
                {Name="Volcanic Egg", Price="4.5M"},
                {Name="Underworld Egg", Price="10M"},
                {Name="Crystal Egg", Price="45M"}
            },
        },
        {Name="Cyber Galaxy",
            Currency = "CyberTokens",
            Layers = {
                "Cyber Sewers",
                "Cosmic Abyss",
                "Cyber Core",
                "Glitched Chasm",
            },
            Eggs = {
                {Name="Space Egg", Price="0.25M"},
                {Name="Slime Egg", Price="3M"},
                {Name="Nebula Egg", Price="12M"},
                {Name="Cyborg Egg", Price="32M"},
                {Name="Glitched Egg", Price="55M"},
                {Name="Holographic Egg", Price="90M"},
            },
        },
        {Name="Atlantis",
            Currency = "Shells",
            Layers = {
                "Rocky Depths",
                "Sea Shell Shallows",
                "City of Gold",
                "Dark Coral Depths",
            },
            Eggs = {
                {Name="Coral Egg", Price="25k"},
                {Name="Snorkel Egg", Price="3.25M"},
                {Name="Dark Coral Egg", Price="120M"},
                {Name="Atlantis Egg", Price="250"},
            },
        },
        {Name="Candyland",
            Currency = "Candy",
            Layers = {
                "Chocolate Caves",
                "Gummy Depths",
                "Cupcake Cavern",
                "Donut Depths",
            },
            Eggs = {
                {Name="Gumdrop Egg", Price="25k"},
                {Name="Cake Egg", Price="3.25M"},
                {Name="Candy Egg", Price="65M"},
                {Name="Chocolate Egg", Price="99M"},
                {Name="Pastry Egg", Price="150M"},
            },
        },
        {Name="Toyland",
            Currency = "Bricks",
            Layers = {
                "Blocky Basin",
                "Bear Depths",
                "Building Depths",
                "Pixel Park",
            },
            Eggs = {
                {Name="WindUp Egg", Price="25k"},
                {Name="Brick Egg", Price="3.25M"},
                {Name="Toy Egg", Price="65M"},
                {Name="Pixel Egg", Price="100M"},
                {Name="Cartoon Egg", Price="500M"},
            },
        },
        {Name="Mystic Forest",
            Currency = "Crystals",
            Layers = {
                "Glowing Depths",
                "Neon Rocks",
                "Mystic Cavern",
            },
            Eggs = {
                {Name="Mossy Egg", Price="250k"},
                {Name="Mushroom Egg", Price="20M"},
                {Name="Element Egg", Price="300M"},
            },
        },
        {Name="Rainbow Land",
            Currency = "Stars",
            Layers = {
                "Magenta Forest",
                "Rainbow Depths",
                "Violet Forest",
            },
            Eggs = {
                {Name="Red Egg", Price="20M"},
                {Name="Yellow Egg", Price="100M"},
                {Name="Fancy Egg", Price="300M"},
                {Name="Comet Egg", Price="900M"},
            },
        },
        -- Limited
        {Name="Spring World",
            Currency = "Flowers",
            Layers = {
                "Cyber Sewers",
                "Cosmic Abyss",
                "Cyber Core",
                "Glitched Chasm",
            },
            Eggs = {
                {Name="Delicate Egg", Price="20M"},
                {Name="Yolk Egg", Price="100M"},
                {Name="Bunny Egg", Price="300M"},
                {Name="Critter Egg", Price="600M"},
                {Name="Floral Egg", Price="1.5B"},
                {Name="Guardian Egg", Price="2.75B"},
            },
        }
    },
    Achievements = {
        --Mining
        "Mining Rookie", "Mining Beginner", "Mining Intermediate", "Mining Advanced",
        "Mining Expert", "Mining Master", "Mining All-Star",
        --Hatching
        "Pet Collecter", "Pet Enthusiast", "Pet Fanatic", "Pet Maniac", "Pet Hoader",
        --Rebirthing
        "Rookie Rebirther", "Beginner Rebirther", "Novice Rebirther",
        "Advanced Rebirther", "Expert Rebirther","Super Rebirther",
        --Play-time
        "Fan", "Loyal Fan", "Devoted Fan", "Amazing Fan", "Dedicated Fan",
        "Fantastic Fan", "Godly Fan", "Unreal Fan", "Outrageous Fan"
    },
    Crafts = {
        "Stars 5", "Crystals 5", "Bricks 5", "Candy 5", "Shells 5",
        "Stars 4", "Crystals 4", "Bricks 4", "Candy 4", "Shells 4", "CyberTokens 4", "Coins 4",
        "Stars 3", "Crystals 3", "Bricks 3", "Candy 3", "Shells 3", "CyberTokens 3", "Coins 3",
        "Stars 2", "Crystals 2", "Bricks 2", "Candy 2", "Shells 2", "CyberTokens 2", "Coins 2",
        "Stars 1", "Crystals 1", "Bricks 1", "Candy 1", "Shells 1", "CyberTokens 1", "Coins 1"
    },
    Boosts = {
        Luck = {"Lucky", "Super Lucky", "Omega Lucky"},
        Currency = {"Big Earner", "Super Rich"}
    },
    RemoteUis = {
        "PetEnchant", "RebirthShop", "Forge",
        "AutoDelete", "GemEnchant", "Achievements",
        "Factory", "Quests"
    },
}
--------------------------------------------------------------


if SpinToWin then
    table.insert(Data.RemoteUis,"SpinToWin")
end
if EventShop then
    table.insert(Data.RemoteUis,"EventShop")
end
if TwoWeekChallenges then
    table.insert(Data.RemoteUis,"TwoWeekChallenges")
end


-- Stuff and stuff, yk?
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local LoadModule = require(ReplicatedStorage.LoadModule)
local LocalData = LoadModule("LocalData")
local Constants = LoadModule("Constants")
-- local ChunkUtil = LoadModule("ChunkUtil")
-- local GetHatchSpeed = LoadModule("GetHatchSpeed")
-- local GemEnchantments = LoadModule("GemEnchantments")
local MineSelection = LoadModule("MineSelection")
local GetData = LocalData:GetData()

local LocalPlayer = game.Players.LocalPlayer
local ProfileSettingsName = "dark-cavern_"..LocalPlayer.Name..".txt"
local Settings = {}

local DisabledOption = "Deactivated"
local MineRaycastParms = RaycastParams.new()
MineRaycastParms.CollisionGroup = Constants.CollisionGroups.MineRaycast

if not _G.DarkCavernInstanceId then _G.DarkCavernInstanceId = 0
else _G.DarkCavernInstanceId = _G.DarkCavernInstanceId + 1 end
local DarkCavernInstanceId = _G.DarkCavernInstanceId

-- AntiAFK
if _G.AntiAFK then _G.AntiAFK:Disconnect() end
_G.AntiAFK = LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()VirtualUser:ClickButton2(Vector2.new())
end)

-- Anti Ragdoll
LocalPlayer.Character.Humanoid.StateChanged:Connect(function(oldState, newState)
    if newState == Enum.HumanoidStateType.Ragdoll then
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
    end
end)

-- Functions
function NewSpliter(Order)
    local OldSpliter = LocalPlayer.PlayerGui.ScreenGui.HUD.Debug:FindFirstChild("Spliter"..Order)
    if OldSpliter then OldSpliter:Destroy() end
    local Example = LocalPlayer.PlayerGui.ScreenGui.HUD.Debug:FindFirstChild("Frame")
    local NewSpliter = Example:Clone()
    NewSpliter.Name = "Spliter"..Order
    NewSpliter.LayoutOrder = Order
    NewSpliter.Parent = Example.Parent
end

function NewDebug(Order)
    local OldDebug = LocalPlayer.PlayerGui.ScreenGui.HUD.Debug:FindFirstChild("Debug"..Order)
    if OldDebug then OldDebug:Destroy() end
    local Example = LocalPlayer.PlayerGui.ScreenGui.HUD.Debug:FindFirstChild("Debug16")
    local NewDebug = Example:Clone()
    NewDebug.Name = "Debug"..Order
    NewDebug.LayoutOrder = Order
    NewDebug.Parent = Example.Parent
    return NewDebug
end

function FormatToNumber(text, FormatParms)
    if not FormatParms then FormatParms = {} end
    text = string.gsub(string.gsub(text, " Value", ""), ",", "")
    for index,letter in pairs({"k", "M", "B", "T"}) do
        if string.find(text, letter) then
            text = string.gsub(text, letter, "")
            local number = tonumber(text)
            if FormatParms.Floor then number = math.floor(number) end
            return number * 1000^index
        end
    end
    return tonumber(text)
end

function Distance(pos1, pos2)
    return math.sqrt(
        (pos1.X-pos2.X)^2+
        (pos1.Y-pos2.Y)^2+
        (pos1.Z-pos2.Z)^2)
end

function TweenDuration(pos1, pos2)
    return 0.023*math.sqrt(
        (pos1.X-pos2.X)^2+
        (pos1.Z-pos2.Z)^2)
end

function TweenTo(Info)
    local RootPart = LocalPlayer.Character.HumanoidRootPart
    local Duration = TweenDuration(Info.Location, RootPart.Position)
    if Info.Duration and Duration < Info.Duration then Duration = Info.Duration end
    game:GetService("TweenService"):Create(RootPart, TweenInfo.new(Duration, Enum.EasingStyle.Linear), {CFrame = Info.Location}):Play()
    return Duration
end

function TweenToEgg()
    if Settings["EggToHatch"] == DisabledOption then return end
    local Egg = Workspace.Eggs[Settings["EggToHatch"]]
    local EggName = Egg.EggName.CFrame
    local EggPrice = Egg.Price.CFrame
    local lookVector = EggPrice.Position - EggName.Position
    local TargetCFrame = CFrame.new(EggName.Position, EggName.Position + lookVector)
    if Distance(LocalPlayer.Character.HumanoidRootPart.Position,TargetCFrame) <= 5 then return end
    for _,world in pairs(Data.Worlds) do
        local broke = false
        for _,egg in pairs(world.Eggs) do
            if Settings["EggToHatch"] == egg.Name then
                local world_position = Workspace.Teleports[world.Name].Position
                if Distance(LocalPlayer.Character.HumanoidRootPart.Position,TargetCFrame) > Distance(world_position,TargetCFrame) then
                    ReplicatedStorage.Events.Teleport:FireServer(world.Name)
                    wait(1)
                end
                broke = true
                break
            end
        end
        if broke then break end
    end
    local pos = LocalPlayer.Character.HumanoidRootPart.Position
    local Height = 2000
    wait(TweenTo({Location = CFrame.new(pos.X,Height,pos.Z)}) + 0.3)
    wait(TweenTo({Location = CFrame.new(TargetCFrame.X,Height,TargetCFrame.Z)}) + 0.3)
    wait(TweenTo({Location = TargetCFrame + Vector3.new(0,LocalPlayer.Character.Humanoid.HipHeight+1,0)}))
end

local TransformDimentions = Vector3.new(1, -1, 1)
local v24 = Vector3.new(1 - Constants.ChunkSize, -1, 1 - Constants.ChunkSize) * Constants.CellSize
local v25 = v24 / 2
function WorldPositionToCell(WorldPosition)
    local v57 = (WorldPosition - v25) * TransformDimentions
    return Vector3.new(math.round(v57.X / Constants.CellSize), math.round(v57.Y / Constants.CellSize), math.round(v57.Z / Constants.CellSize)) + Vector3.new(1, 1, 1)
end
function CellToWorldPosition(Cell)
    return ((Cell + Vector3.new(-1, -1, -1)) * Constants.CellSize) * TransformDimentions + v25
end

-- Debug Elements
NewSpliter(17)
local DebugBlocksUntilCollapse = NewDebug(18)
local SignInfo = Workspace.Worlds["The Overworld"].Sign.Display.SurfaceGui.Info
function UpdateBlocksUntilCollapse()
    local BlocksUntilCollapseText = SignInfo.Text:gsub(" Blocks until Collapse", "")
    local BlocksUntilCollapse = BlocksUntilCollapseText:gsub(",", "")
    if tonumber(BlocksUntilCollapse) == nil then return end
    local red = 255-math.floor(255 * (BlocksUntilCollapse / Constants.MinedBlocksResetLimit))
    if not DebugBlocksUntilCollapse:FindFirstChild("Label") then return end
    DebugBlocksUntilCollapse.Label.Text = "Blocks until Collapse: <font color='rgb("..red..", "..255-red..", 0)'>" .. BlocksUntilCollapseText .. "</font>"
end
local DebugBlocksUntilCollapseLabelUpdate = DebugBlocksUntilCollapse.Label:GetPropertyChangedSignal("TextBounds"):Connect(function()
    DebugBlocksUntilCollapse.Size = UDim2.fromOffset(DebugBlocksUntilCollapse.Label.TextBounds.X / LocalPlayer.PlayerGui.ScreenGui.UIScale.Scale + 14, 40)
end)
local SignInfoUpdate = SignInfo:GetPropertyChangedSignal("Text"):Connect(UpdateBlocksUntilCollapse)
spawn(function()
    while wait(1) do
        if DarkCavernInstanceId ~= _G.DarkCavernInstanceId then
            DebugBlocksUntilCollapseLabelUpdate:Disconnect()
            SignInfoUpdate:Disconnect()
            break
        end
    end
end)
UpdateBlocksUntilCollapse()

local Speedometer = NewDebug(19)
local SpeedometerLabelUpdate = Speedometer.Label:GetPropertyChangedSignal("TextBounds"):Connect(function()
    Speedometer.Size = UDim2.fromOffset(Speedometer.Label.TextBounds.X / LocalPlayer.PlayerGui.ScreenGui.UIScale.Scale + 14, 40)
end)
spawn(function()
    local SpeedSamples = {}
    repeat
        local Sum = 0
        for _,SpeedSample in ipairs(SpeedSamples) do
            Sum = Sum + SpeedSample
        end
        local AverageSpeed = math.round(Sum / #SpeedSamples)
        local red = math.round(math.min(AverageSpeed, 30)/30)
        local green = 1-red
        Speedometer.Label.Text = "Vertical Speed: <font color='rgb("..(red*255)..", "..(green*255)..", 0)'>"..AverageSpeed.." Studs/s</font>"
        local YBegin = LocalPlayer.Character.HumanoidRootPart.Position.Y
        wait((Settings["SampleRate"] or 0.1))
        local YEnd = LocalPlayer.Character.HumanoidRootPart.Position.Y
        table.insert(SpeedSamples, math.abs(YBegin-YEnd)/(Settings["SampleRate"] or 0.1))
        if #SpeedSamples > (Settings["SampleLimit"] or 10) then
            table.remove(SpeedSamples, 1)
        end
    until DarkCavernInstanceId ~= _G.DarkCavernInstanceId
    SpeedometerLabelUpdate:Disconnect()
end)


local Worlds = {}
local Eggs = {}
local Layers = {}
for _,world in pairs(Data.Worlds) do
    table.insert(Worlds,world.Name)
    for _,egg in pairs(world.Eggs) do
        table.insert(Eggs,egg.Name) end
    for _,layer in pairs(world.Layers) do
        table.insert(Layers,layer) end
end


local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Title = "dark cavern"
local Window = Rayfield:CreateWindow({
	Name = Title,
	LoadingTitle = Title,
	LoadingSubtitle = "Don't trip, fam"
})

function Print(Type, Message, DoNotify)
    if Type == 4 and not Debug then return end
    for index,type in pairs({"Info", "Warning", "ERROR", "Debug"}) do
        if Type == index then
            print(type.." - "..Title..": "..Message)
            if DoNotify then
                game.StarterGui:SetCore("SendNotification",{
                    Title = type.." - "..Title,
                    Text = Message
                })
            end
            break
        end
    end
end

local HttpService = game:GetService("HttpService")
if (readfile and isfile and isfile(ProfileSettingsName)) then
    Settings = HttpService:JSONDecode(readfile(ProfileSettingsName))
    Print(1,"Loaded profile settings.",false)
elseif not isfile(ProfileSettingsName) then
    Print(4,"Profile settings were not found.",false)
end

local Elements = {}
local Tabs = {
    {Name="Farming",
        Elements = {
            {Name="General",Type="Section"},
            {Name="SmartFactory",
                Type = "Toggle",
                RepeatDelay = 60,
                Callback = function()
                    for factory_slot=1,3 do
                        ReplicatedStorage.Events.ClaimFactoryCraft:FireServer(factory_slot)
                        wait(1)
                        for _,type in pairs(Data.Crafts) do
                            ReplicatedStorage.Events.StartFactoryCraft:FireServer(type,factory_slot)
                        end
                    end
                end,
            },
            {Name="BuyShopBoosts",
                Type = "Toggle",
                RepeatDelay = 60,
                Callback = function()
                    for _,catagory in pairs(Data.Boosts) do
                        for _,type in pairs(catagory) do
                            for hours=1,2 do
                                ReplicatedStorage.Events.BuyBoost:FireServer(type,hours)
                            end
                        end
                    end
                end,
            },
            {Name="ClaimGroupBenefits",
                Type = "Toggle",
                RepeatDelay = 600,
                Callback = function()
                    ReplicatedStorage.Functions.ClaimGroupBenefits:InvokeServer()
                end,
            },
            {Name="ClaimAchievements",
                Type = "Toggle",
                RepeatDelay = 600,
                Callback = function()
                    for _,type in pairs(Data.Achievements) do
                        ReplicatedStorage.Events.ClaimAchievementReward:FireServer(type)
                        wait(1)
                    end
                end,
            },
            {Name="ClaimGenieQuests",
                CommingSoon = true,
                Type = "Toggle",
                RepeatDelay = 600,
            },
            {Name="DepositShards",
                Type = "Toggle",
                RepeatDelay = 10,
                Callback = function()                
                    ReplicatedStorage.Events.DepositShards:FireServer()
                end,
            },
            {Name="Event",Type="Section"},
            {Name="BuyEventBoosts",
                Type = "Toggle",
                RepeatDelay = 600,
                Callback = function()
                    for i=0,2 do
                        ReplicatedStorage.Events.BuyEventShopItem:FireServer("boost"..i)
                    end
                end,
            },
            {Name="ClaimTwoWeekChallengesRewards",
                Dependancy = TwoWeekChallenges,
                Type = "Toggle",
                RepeatDelay = 600,
                Callback = function()
                    for day=1,14 do
                        ReplicatedStorage.Events.TwoWeekChallengesClaimReward:FireServer(day)
                    end
                end,
            },
            {Name="ClaimSpins",
                Dependancy = SpinToWin,
                Type = "Toggle",
                RepeatDelay = 60,
                Callback = function()
                    ReplicatedStorage.Events.ClaimSpinToWin:FireServer()
                end,
            },
            {Name="BuySpins",
                Dependancy = SpinToWin,
                Type = "Toggle",
                RepeatDelay = 60,
                Callback = function()
                    ReplicatedStorage.Events.BuySpinToWin:FireServer()
                end,
            },
            {Name="PlaySpins",
                Dependancy = SpinToWin,
                Type = "Toggle",
                RepeatDelay = 60,
                Callback = function()
                    ReplicatedStorage.Events.PlaySpinToWin:FireServer()
                end,
            }
        }
    },
    {Name="Grinding",
        Elements = {
            {Name="AutoMining",Type="Section"},
            {Name="Mining",
                Type = "Dropdown",
                Options = {DisabledOption, "Selection", "Block Below"},
                RepeatDelay = 0,
                Callback = function(ElementData)
                    local Cell = nil
                    local CellParentName = nil
                    if Settings["Mining"] == "Selection" then
                        local Selection = MineSelection:get()
                        if not Selection then return end
                        Cell = Selection.Cell
                    elseif Settings["Mining"] == "Block Below" then
                        local raycastResult = Workspace:Raycast(LocalPlayer.Character.HumanoidRootPart.Position, Vector3.new(0, -Constants.MaxSelectionDistance, 0), MineRaycastParms)
                        if not raycastResult then return end
                        CellParentName = raycastResult.Instance.Parent.Parent.Name
                        Cell = WorldPositionToCell(raycastResult.Position - raycastResult.Normal)
                        if not Cell then return end
                    else return end
                    if Settings["TeleportToCell"] then
                        if CellParentName == "Chunks" then
                            LocalPlayer.Character.Humanoid.PlatformStand = true
                            local duration = TweenTo({Location = CFrame.new(CellToWorldPosition(Cell)) + Vector3.new(0, LocalPlayer.Character.Humanoid.HipHeight, 0)})
                            if duration > 0 then wait(duration) end
                        end
                    else
                        LocalPlayer.Character.Humanoid.PlatformStand = false
                    end
                    if Settings["StripMine"] then
                        local ElementInstanceId = ElementData.InstanceId
                        local raycastResult = Workspace:Raycast(CellToWorldPosition(Cell + Vector3.new(-1, 0, 0)), Vector3.new(Constants.MaxSelectionDistance, 0, 0), MineRaycastParms)
                        if raycastResult and raycastResult.Instance.Parent.Parent.Name == "Chunks" then
                            while raycastResult and Settings["StripMine"] and Settings["Mining"] ~= DisabledOption and DarkCavernInstanceId == _G.DarkCavernInstanceId and ElementInstanceId == ElementData.InstanceId do
                                if raycastResult.Instance.Parent.Parent.Name ~= "Chunks" then break end
                                local NextCell = WorldPositionToCell(raycastResult.Position - raycastResult.Normal)
                                local Distance = math.abs(Cell.X - NextCell.X)
                                for index=0, Constants.MaxSelectionDistance / Constants.CellSize - Distance do
                                    ReplicatedStorage.Events.MineBlock:FireServer(NextCell + Vector3.new(index, 0, 0))
                                    wait(Constants.MinMiningTime)
                                end
                                raycastResult = Workspace:Raycast(CellToWorldPosition(Cell + Vector3.new(-1, 0, 0)), Vector3.new(Constants.MaxSelectionDistance, 0, 0), MineRaycastParms)
                            end
                        else ReplicatedStorage.Events.MineBlock:FireServer(Cell) end
                    elseif Settings["Mining"] == "Block Below" then
                        for index=0,Constants.MaxSelectionDistance / Constants.CellSize do
                            ReplicatedStorage.Events.MineBlock:FireServer(Cell + Vector3.new(0, index, 0))
                            wait(0)
                        end
                    else
                        ReplicatedStorage.Events.MineBlock:FireServer(Cell)
                    end
                end,
            },
            {Name="TeleportToCell",
                Type = "Toggle",
            },
            {Name="StripMine",
                Type = "Toggle",
            },
            {Name="CollapseProtection",
                Type = "Toggle",
                Callback = function(Value, ElementData)
                    local ElementInstanceId = ElementData.InstanceId
                    local LastCFrame = nil
                    local CollapseProtection = ReplicatedStorage.Events.MineCollapsed.OnClientEvent:Connect(function()
                        if DarkCavernInstanceId ~= _G.DarkCavernInstanceId or ElementInstanceId~=ElementData.InstanceId then return end
                        local Cell = WorldPositionToCell(Vector3.new(LastCFrame.X,0,LastCFrame.Z))
                        local Location = CFrame.new(CellToWorldPosition(Cell), LastCFrame.LookVector)
                        wait(1)
                        local Prompt = LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("Prompt")
                        if Prompt and Prompt.Frame.Title.Text == "Collapsed!" then
                            LocalPlayer.PlayerGui.ScreenGui.Prompt:Destroy()
                        else return end
                        wait(49)
                        if not Settings["CollapseProtection"] then return end
                        local CurrentPosition = LocalPlayer.Character.HumanoidRootPart.Position
                        local Height = 2000
                        wait(TweenTo({Location = CFrame.new(CurrentPosition.X,Height,CurrentPosition.Z)}) + 0.3)
                        wait(TweenTo({Location = CFrame.new(Location.X,Height,Location.Z)}) + 0.3)
                        wait(TweenTo({Location = Location + Vector3.new(0, 4+LocalPlayer.Character.Humanoid.HipHeight, 0)}) + 0.3)
                    end)
                    repeat if LocalPlayer.Character.HumanoidRootPart.Position.Y < 0 then
                            LastCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                        wait(3)
                    until not Settings["CollapseProtection"] or DarkCavernInstanceId ~= _G.DarkCavernInstanceId or ElementInstanceId~=ElementData.InstanceId
                    CollapseProtection:Disconnect()
                end
            },
            {Name="DeleteBlocks",Type="Section"},
            {Name="DeleteStone",
                Type = "Toggle",
                Callback = function(Value, ElementData)
                    local ElementInstanceId = ElementData.InstanceId
                    local Blocks = LoadModule("Blocks")
                    local DeleteStone = function(data)
                        local BlocksToDelete = {}
                        for _,data in pairs(data) do
                            if Blocks[data[1]].Type == "Block" then
                                table.insert(BlocksToDelete, data[1])
                            end
                        end
                        ReplicatedStorage.Events.MultiDeleteOres:FireServer(BlocksToDelete)
                    end
                    local BackpackInventory = LocalData:GetData("BackpackInventory")
                    DeleteStone(BackpackInventory)
                    local DataChangedEvent = ReplicatedStorage.Events.DataChanged.OnClientEvent:Connect(function(name, data)
                        if name == "BackpackInventory" then DeleteStone(data) end
                    end)
                    spawn(function()
                        repeat wait(1) until not Settings["DeleteStone"] or DarkCavernInstanceId ~= _G.DarkCavernInstanceId or ElementInstanceId~=ElementData.InstanceId
                        DataChangedEvent:Disconnect()
                    end)
                end,
            },
            {Name="DeleteOres",
                Type = "Toggle",
                Callback = function(Value, ElementData)
                    local ElementInstanceId = ElementData.InstanceId
                    local Blocks = LoadModule("Blocks")
                    local DeleteOres = function(data)
                        local BlocksToDelete = {}
                        for _,data in pairs(data) do
                            if Blocks[data[1]].Type ~= "Block" then
                                table.insert(BlocksToDelete, data[1])
                            end
                        end
                        ReplicatedStorage.Events.MultiDeleteOres:FireServer(BlocksToDelete)
                    end
                    local BackpackInventory = LocalData:GetData("BackpackInventory")
                    DeleteOres(BackpackInventory)
                    local DataChangedEvent = ReplicatedStorage.Events.DataChanged.OnClientEvent:Connect(function(name, data)
                        if name == "BackpackInventory" then DeleteOres(data) end
                    end)
                    spawn(function()
                        repeat wait(1) until not Settings["DeleteOres"] or DarkCavernInstanceId ~= _G.DarkCavernInstanceId or ElementInstanceId~=ElementData.InstanceId
                        DataChangedEvent:Disconnect()
                    end)
                end,
            },
            {Name="Rebirthing",Type="Section"},
            -- notes:
            -- GetRebirthCost
            {Name="Rebirth",
                Type="Toggle",
                Callback = function(Value, ElementData)
                    local ElementInstanceId = ElementData.InstanceId
                    ReplicatedStorage.Events.Teleport:FireServer("Mystic CavernSell")
                    repeat
                        wait(0.1)
                        local RebirthAmount = GetData.GemEnchantments["Multi Rebirth"] + 1
                        local Coins = LocalPlayer.PlayerGui.ScreenGui.Inventory.Frame.Container.Ores.Bottom.Coins
                        local Have = LocalData:GetData("Coins")
                        if Coins.Visible == true then Have = Have + FormatToNumber(Coins.Label.Text, {Floor = true}) end

                        local Need = nil
                        if RebirthAmount == 1 then
                            Need = FormatToNumber(LocalPlayer.PlayerGui.ScreenGui.Rebirth.Frame.Buy.Frame.Container.Label.Text)
                        else
                            Need = FormatToNumber(LocalPlayer.PlayerGui.ScreenGui.Rebirth.Multi.Options[RebirthAmount].Button.Frame.Label.Text)
                        end
                        if Have >= Need then
                            local Location = LocalPlayer.Character.HumanoidRootPart.CFrame
                            ReplicatedStorage.Events.Teleport:FireServer("Mystic CavernSell")
                            ReplicatedStorage.Events.QuickSell:FireServer()
                            if RebirthAmount == 1 then
                                ReplicatedStorage.Events.Rebirth:FireServer()
                            else
                                ReplicatedStorage.Events.MultiRebirth:FireServer(RebirthAmount)
                            end
                            wait(1)
                            if Settings["RebirthTeleportBack"] then
                                local Duration = TweenTo({Location = Location})
                                if Duration < 2 then wait(2) else wait(Duration) end
                            end
                        end
                    until not Settings[ElementData.Name] or ElementInstanceId ~= ElementData.InstanceId or DarkCavernInstanceId ~= _G.DarkCavernInstanceId
                end
            },
            {Name="RebirthTeleportBack",
                Type = "Toggle",
            },
        },
    },
    {Name="Hatching",
        Elements = {
            {Name="AutoHatchEgg",Type="Section"},
            {Name="EggToHatch",
                Type = "Dropdown",
                Options = {DisabledOption, unpack(Eggs)},
                RepeatDelay = 0,
                Callback = function()
                    ReplicatedStorage.Events.OpenEgg:FireServer(Settings["EggToHatch"],GetData.Passes["Triple Hatch"],true)
                end,
            },
            {Name="GoToEggOnStart",
                Type = "Toggle",
            },
            {Name="GoToEgg",
                Type = "Button",
                Callback = function()
                    TweenToEgg()
                end
            },
            {Name="DestroyHatchGui",
                Type = "Toggle",
                Callback = function()
                    local HatchGui = ReplicatedStorage.ClientModules.Other.OpenEgg:FindFirstChild("HatchGui")
                    if HatchGui then HatchGui:Destroy() end
                end,
            },
            {Name="BackupEgg",
                Type = "Dropdown",
                Options = {DisabledOption, unpack(Eggs)},
                RepeatDelay = 10,
                Callback = function()
                    if Settings["EggsLeft"] ~= DisabledOption then
                        for _,world in pairs(Data.Worlds) do
                            for _,egg in pairs(world.Eggs) do
                                if Settings["EggToHatch"] == egg.Name then
                                    local EggsLeft = math.floor(LocalData:GetData(world.Currency) / FormatToNumber(egg.Price))
                                    if EggsLeft < 100 then
                                        Elements.EggToHatch.Element:Set(Settings["BackupEggToHatch"])
                                        Elements.BackupEggToHatch:Set(DisabledOption)
                                        TweenToEgg()
                                    end
                                end
                            end
                        end
                    end
                end,
            },
            {Name="LuckBoostEnabler",
                Type = "Dropdown",
                Options = {DisabledOption, "Minimal", "Omega Limited"},
                RepeatDelay = 60,
                Callback = function(ElementData)
                    if Settings[ElementData.Name] == "Minimal" then
                        local InvalidBoosts = {}
                        for k, v in pairs(Data.Boosts.Luck) do
                            InvalidBoosts[k] = v
                        end
                        for _,active_boost in pairs(LocalData:GetData("ActiveBoosts")) do
                            for _,boost in pairs(Data.Boosts.Luck) do
                                if active_boost[1] == boost then
                                    if active_boost[2] > 300 then
                                        for index,invalid_boost in pairs(InvalidBoosts) do
                                            if invalid_boost == boost then
                                                table.remove(InvalidBoosts, index)
                                            end
                                        end
                                    end
                                    break
                                end
                            end
                        end
                        for _,invalid_boost in pairs(InvalidBoosts) do
                            local LowestDuration = nil
                            for _,inventory_boost in pairs(LocalData:GetData("BoostInventory")) do
                                if inventory_boost[1] == invalid_boost then
                                    if not LowestDuration or inventory_boost[2] < LowestDuration then
                                        LowestDuration = inventory_boost[2]
                                    end
                                end
                            end
                            if LowestDuration then
                                ReplicatedStorage.Events.UseBoost:FireServer(invalid_boost, LowestDuration)
                            end
                        end
                    elseif Settings[ElementData.Name] == "Omega Limited" then
                        Print(2,"The \"Omega Limited\" mode is comming soon",true)
                        return true
                    end
                end,
            },
        },
    },
    {Name="Misc",
        Elements = {
            {Name="Teleports",Type="Section"},
            {Name="World",
                Type = "Dropdown",
                Options = Worlds,
            },
            {Name="TeleportToWorld",
                Type = "Button",
                Callback = function()
                    ReplicatedStorage.Events.Teleport:FireServer(Settings["World"])
                end,
            },
            {Name="Layer",
                Type = "Dropdown",
                Options = Layers,
            },
            {Name="TeleportToLayer",
                Type = "Button",
                Callback = function()
                    ReplicatedStorage.Events.Teleport:FireServer(Settings["Layer"])
                end,
            },
            {Name="UnlockLayer",
                Type = "Button",
                Callback = function()
                    ReplicatedStorage.Events.Teleport:FireServer(Settings["Layer"].."Sell")
                end,
            },
            {Name="Ui's",Type="Section"},
            {Name="RemoteUi's",
                Type = "Dropdown",
                Options = Data.RemoteUis,
            },
            {Name="OpenRemoteUi",
                Type = "Button",
                Callback = function()
                    local Ui = Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild(Settings["RemoteUi's"])
                    Ui.Visible = true
                    Ui.Frame.Close.Frame.Button.MouseButton1Click:Connect(function()
                        Ui.Visible = false
                        Ui.Frame.Close.Frame.Button.MouseButton1Click:Disconnect()
                    end)
                end,
            },
            {Name="DestroyNewItemPrompts",
                Type = "Toggle",
                RepeatDelay = 0,
                Callback = function(ElementData)
                    local ElementInstanceId = ElementData.InstanceId
                    local Prompt = LocalPlayer.PlayerGui.ScreenGui:WaitForChild("Prompt")
                    if Prompt.Frame.Title.Text == "New Items" then
                        if Settings[ElementData.Name] and ElementInstanceId==ElementData.InstanceId and DarkCavernInstanceId==_G.DarkCavernInstanceId then
                            Prompt:Destroy()
                        end
                    end
                end,
            },
            {Name="Speedometer",Type="Section"},
            {Name="SampleLimit",
                Type = "Slider",
                Range = {1, 100},
                Increment = 1,
                CurrentValue = 10
            },
            {Name="SampleRate",
                Type = "Slider",
                Range = {0.03, 1},
                Increment = 0.01,
                CurrentValue = 0.1
            },
            {Name="OtherGuis",Type="Section"},
            {Name="Zeerox'sGui",
                Type = "Button",
                Callback = loadstring(game:HttpGet(("https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua"),true))
            },
            {Name="Tense'sGui",
                Type = "Button",
                Callback = loadstring(game:HttpGet(("https://raw.githubusercontent.com/wingedmother69/thingz/main/ms2ui.lua"),true))
            },
        },
    },
    {Name="Settings",
        Elements = {
            {Name="PerAccountSettings",Type="Section"},
            {Name="SaveSettings",
                Type = "Button",
                Callback = function()
                    local json
                    local HttpService = game:GetService("HttpService")
                    if (writefile) then
                        json = HttpService:JSONEncode(Settings)
                        writefile(ProfileSettingsName, json)
                    end
                    Print(1,"Saved profile settings!",true)
                end,
            },
            {Name="LoadSettings",
                Type = "Button",
                Callback = function()
                    local HttpService = game:GetService("HttpService")
                    if (readfile and isfile and isfile(ProfileSettingsName)) then
                        local LoadedSettings = HttpService:JSONDecode(readfile(ProfileSettingsName))
                        for name,element in pairs(Elements) do
                            if Settings[name] ~= LoadedSettings[name] then
                                element.Element:Set(LoadedSettings[name])
                            end
                        end
                        Settings = LoadedSettings
                        Print(1,"Loaded profile settings.",false)
                    elseif not isfile(ProfileSettingsName) then
                        Print(4,"Profile settings were not found.",false)
                    end
                end,
            }
        }
    }
}

function Run(ElementData, DisabledState, Value)
    if not ElementData.Callback then return end
    if ElementData.CommingSoon then
        Print(2,"\""..string.gsub(ElementData.Name, "%u", " %0").."\" is comming soon",true)
        return
    end
    ElementData.InstanceId = ElementData.InstanceId + 1
    local ElementInstanceId = ElementData.InstanceId
    spawn(function()
        if ElementData.RepeatDelay and ElementData.RepeatDelay >= 0 then
            repeat Print(4,"Executing cycle "..ElementData.Name,false) if ElementData.Callback(ElementData) then return end wait(ElementData.RepeatDelay)
            until Settings[ElementData.Name] == DisabledState or ElementInstanceId~=ElementData.InstanceId or DarkCavernInstanceId~=_G.DarkCavernInstanceId
        else
            Print(4,"Executing single "..ElementData.Name,false)
            ElementData.Callback(Value, ElementData)
        end
    end)
end

function AsyncSetting(ElementData, Default)
    if ElementData.Volatile then return Default end
    if Settings[ElementData.Name] then return Settings[ElementData.Name] end
    Settings[ElementData.Name] = Default
    return Default
end

for _,tab in Tabs do
    local Tab = Window:CreateTab(tab.Name)
    for _,elementData in tab.Elements do
        if not elementData.Name then
            Print(3,"An element is missing it's \"Name\" property.",true)
        elseif not elementData.Type then
            Print(3,"Element \""..elementData.Name.."\" is missing it's \"Type\" property.",true)
        elseif elementData.Dependancy ~= false then
            elementData.InstanceId = 0
            local Name = string.gsub(elementData.Name, "%u", " %0")
            if elementData.CommingSoon then Name = Name.." (Comming Soon)" end
            if elementData.Type == "Toggle" then
                local CurrentValue = AsyncSetting(elementData, false)
                local Element = Tab:CreateToggle({
                    Name = Name,
                    CurrentValue = CurrentValue,
                    Callback = function(Value)
                        if not elementData.Volatile then Settings[elementData.Name] = Value end
                        if not Value then return end
                        Run(elementData, false, Value)
                    end
                })
                Elements[elementData.Name] = {elementData=elementData,Element=Element}
                if not elementData.Volatile then Element.Callback(Settings[elementData.Name]) end
            elseif elementData.Type == "Dropdown" then
                local CurrentValue = AsyncSetting(elementData, elementData.Options[1])
                local Element = Tab:CreateDropdown({
                    Name = Name..":",
                    Options = elementData.Options,
                    CurrentOption = CurrentValue,
                    Callback = function(Value)
                        if not elementData.Volatile then Settings[elementData.Name] = Value[1] end
                        Run(elementData, DisabledOption, Value[1])
                    end
                })
                Elements[elementData.Name] = {elementData=elementData,Element=Element}
                if not elementData.Volatile then Element.Callback({Settings[elementData.Name]}) end
            elseif elementData.Type == "Slider" then
                local CurrentValue = AsyncSetting(elementData, elementData.CurrentValue or elementData.Range[1])
                local Element = Tab:CreateSlider({
                    Name = Name..":",
                    Range = elementData.Range,
                    Increment = elementData.Increment,
                    Suffix = elementData.Suffix,
                    CurrentValue = CurrentValue,
                    Callback = function(Value)
                        if type(Value) ~= "number" then Value = CurrentValue end
                        if not elementData.Volatile then Settings[elementData.Name] = Value end
                        Run(elementData, nil, Value)
                    end
                })
                Elements[elementData.Name] = {elementData=elementData,Element=Element}
                if not elementData.Volatile then Element.Callback({Settings[elementData.Name]}) end
            elseif elementData.Type == "Button" then
                Tab:CreateButton({
                    Name = Name,
                    Callback = elementData.Callback
                })
            elseif elementData.Type == "Section" then
                Tab:CreateSection(Name)
            else
                Print(3,"Invalid (pre-determined) element type: "..elementData.Name.." - \""..elementData.Type.."\".",true)
            end
        end
    end
end
if Settings["GoToEggOnStart"] then TweenToEgg() end