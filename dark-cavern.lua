if game.PlaceId ~= 9551640993 then os.exit() end
repeat task.wait(0.1) until game:IsLoaded()

--------------------------------------------------------------
local Debug = false
local SpinToWin = false
local TwoWeekChallenges = false

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
            }
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
            }
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
            }
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
            }
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
            }
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
            }
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
            }
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
            }
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
        "Factory", "Quests", "EventShop", "TwoWeekChallenges"
    },
}
--------------------------------------------------------------


if SpinToWin then
    table.insert(Data.RemoteUis,"SpinToWin") end

local LocalPlayer = game.Players.LocalPlayer
local username = LocalPlayer.Name
local ProfileSettingsName = "dark-cavern_"..username..".txt"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LoadModule = require(game.ReplicatedStorage.LoadModule);
local LocalData = LoadModule("LocalData");

local Settings = {}

-- AntiAFK
local VirtualUser=game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
VirtualUser:CaptureController()VirtualUser:ClickButton2(Vector2.new())
end)

-- Debug element: blocks until collapse (currectly broken af)
local BlocksUntilCollapse = nil
spawn(function()
    if LocalPlayer.PlayerGui.ScreenGui.HUD.Debug:FindFirstChild("Debug17") then LocalPlayer.PlayerGui.ScreenGui.HUD.Debug:FindFirstChild("Debug17"):Destroy() end
    local Debug17 = Instance.new("Frame", LocalPlayer.PlayerGui.ScreenGui.HUD.Debug)
    Debug17.Name = "Debug17"
    Debug17.BackgroundColor3 = Color3.new(0,0,0)
    Debug17.BackgroundTransparency = 0.25
    Debug17.BorderSizePixel = 0
    Debug17.LayoutOrder = 17
    Debug17.Size = UDim2.new(0,236,0,40)
    local Debug17Label = Instance.new("TextLabel", Debug17)
    Debug17Label.Name = "Label"
    Debug17Label.AnchorPoint = Vector2.new(0.5,0.5)
    Debug17Label.BackgroundColor3 = Color3.new(0,0,0)
    Debug17Label.BackgroundTransparency = 1
    Debug17Label.BorderSizePixel = 0
    Debug17Label.Position = UDim2.new(0.5,0,0.5,0)
    Debug17Label.Font = Enum.Font.GothamBlack
    Debug17Label.Size = UDim2.new(1,-12,1,-12)
    Debug17Label.TextColor3 = Color3.new(1,1,1)
    Debug17Label.TextSize = 22
    Debug17Label.TextXAlignment = Enum.TextXAlignment.Left
    Debug17Label.RichText = true
    local Sign = game:GetService("Workspace").Worlds:FindFirstChild("The Overworld").Sign.Display.SurfaceGui.Info
    while true do
        local BlocksUntilCollapseText = Sign.Text:gsub(" Blocks until Collapse", "")
        BlocksUntilCollapse = BlocksUntilCollapseText:gsub(",", "")
        local red = 255-math.floor(255 * (BlocksUntilCollapse / 16_000))
        Debug17Label.Text = "Blocks until Collapse: <font color='rgb("..red..", "..255-red..", 0)'>" .. BlocksUntilCollapseText .. "</font>"
        Debug17.Size = UDim2.new(0,Debug17Label.TextBounds.X *1.93+12,0,40)
        wait(0.5)
    end
end)

-- Functions
function RemoveItemByValue(tbl, value)
    for i = #tbl, 1, -1 do
      if tbl[i] == value then
        table.remove(tbl, i)
      end
    end
  end

function FormatToNumber(text)
    text = string.gsub(string.gsub(text, " Value", ""), ",", "")
    for index,letter in pairs({"k", "M", "B", "T"}) do
        if string.find(text, letter) then
            text = string.gsub(text, letter, "")
            return tonumber(text) * 1_000^index
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

function TweenTo(Location, wait_to_end)
    local RootPart = LocalPlayer.Character.HumanoidRootPart
    local duration = TweenDuration(Location, RootPart.Position)
    local ti = TweenInfo.new(duration, Enum.EasingStyle.Linear)
    game:GetService('TweenService'):Create(RootPart, ti, {CFrame = Location}):Play()
    if wait_to_end then wait(duration) end
    return duration
end

function TweenToEgg()
    if Settings.EggToHatch == "Deactivated" then return end
    local Egg = game:GetService("Workspace").Eggs[Settings.EggToHatch].EggName.CFrame
    if Distance(LocalPlayer.Character.HumanoidRootPart.Position,Egg) <= 5 then return end
    for _,world in pairs(Data.Worlds) do
        local broke = false
        for _,egg in pairs(world.Eggs) do
            if Settings.EggToHatch == egg.Name then
                local world_position = game:GetService("Workspace").Teleports[world.Name].Position
                if Distance(LocalPlayer.Character.HumanoidRootPart.Position,Egg) > Distance(world_position,Egg) then
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
    TweenTo(CFrame.new() + Vector3.new(pos.X,Egg.Y-100,pos.Z), true)
    wait(0.2)
    TweenTo(Egg - Vector3.new(0,100,0), true)
    wait(0.2)
    TweenTo(Egg + Vector3.new(0,8,0), true)
end

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

function Print(Type: IntValue, Message: StringValue, DoNotify: BoolValue)
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

if not _G.DarkCavernInstanceId then _G.DarkCavernInstanceId = 0
else _G.DarkCavernInstanceId = _G.DarkCavernInstanceId + 1 end
local DarkCavernInstanceId = _G.DarkCavernInstanceId

local Elements = {}
local Tabs = {
    {Name="Farming",
        Elements = {
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
            {Name="SmartAchievements",
                Type = "Toggle",
                RepeatDelay = 600,
                Callback = function()
                    for _,type in pairs(Data.Achievements) do
                        ReplicatedStorage.Events.ClaimAchievementReward:FireServer(type)
                        wait(1)
                    end
                end,
            },
            {Name="LuckBoostEnabler",
                Type = "Dropdown",
                Options = {false, "Minimal", "Omega Limited"},
                RepeatDelay = 10,
                Callback = function(ElementData)
                    if Settings[ElementData.Name] == "Minimal" then
                        local InvalidBoosts = {}
                        for k, v in pairs(Data.Boosts.Luck) do
                            InvalidBoosts[k] = v
                        end
                        for _,active_boost in pairs(LocalData:GetData("ActiveBoosts")) do
                            for _,boost in pairs(Data.Boosts.Luck) do
                                if active_boost[1] == boost then
                                    if active_boost[2] > 450 then
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
                                game:GetService("ReplicatedStorage").Events.UseBoost:FireServer(invalid_boost, LowestDuration)
                            end
                        end
                    elseif Settings[ElementData.Name] == "Omega Limited" then
                        Print(2,"The \"Omega Limited\" mode is comming soon",true)
                        return true
                    end
                end,
            },
            {Name="ClaimGenieQuests",
                CommingSoon = true,
                Type = "Toggle",
                RepeatDelay = 600,
                Callback = nil,
            },
            {Name="DepositShards",
                Type = "Toggle",
                RepeatDelay = 10,
                Callback = function()                
                    game:GetService("ReplicatedStorage").Events.DepositShards:FireServer()
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
            {Name="AutoMine",Type="Section"},
            {Name="MineSelection",
                Type = "Toggle",
                RepeatDelay = 0,
                Callback = function()
                    local Module = LoadModule("MineSelection")
                    if Module:get() then
                        local SelectedCell = Module:get().Cell
                        ReplicatedStorage.Events.MineBlock:FireServer(SelectedCell)
                        if Settings.DownFast then
                            for i=0,Settings.DownFastAmount do
                                wait(Settings.DownFastDelay)
                                ReplicatedStorage.Events.MineBlock:FireServer(SelectedCell+Vector3.new(0, i+1, 0))
                            end
                        end
                    end
                end,
            },
            {Name="CollapseProtection",
                Type = "Toggle",
                RepeatDelay = 0.1,
                Callback = function()
                    local LastCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
                    if BlocksUntilCollapse == 0 then
                        LastCFrame = CFrame.new(Vector3.new(LastCFrame.X,LocalPlayer.Character.HumanoidRootPart.Position.Y,LastCFrame.Z),LastCFrame.LookVector)
                        wait(35)
                        local Under = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position.X,LastCFrame.Y-100,LocalPlayer.Character.HumanoidRootPart.Position.Z)
                        TweenTo(Under, true)
                        wait(0.1)
                        TweenTo(CFrame.new(LastCFrame.X,Under.Y,LastCFrame.Z), true)
                        wait(0.1)
                        TweenTo(LastCFrame, true)
                    end
                end,
            },
            {Name="DownFast",
                Type = "Toggle",
            },
            {Name="DownFastAmount",
                Type = "Slider",
                Range = {1, 10},
                Increment = 1,
                CurrentValue = 5,
                Suffix = "Blocks",
            },
            {Name="DownFastDelay",
                Type = "Slider",
                Range = {0, 1},
                Increment = 0.01,
                Suffix = "Seconds",
            },

            {Name="AutoRebirth",Type="Section"},
            {Name="Amount",
                Type = "Slider",
                Range = {0, 5},
                Increment = 1,
                Suffix = "Rebirths",
                Callback = function(Value, ElementData)
                    if Settings[ElementData.Name] == 0 then return end
                    local ElementInstanceId = ElementData.InstanceId
                    ReplicatedStorage.Events.Teleport:FireServer("Mystic CavernSell")
                    while wait(0.1) do
                        if Settings[ElementData.Name] == 0 or ElementInstanceId~=ElementData.InstanceId or DarkCavernInstanceId~=_G.DarkCavernInstanceId then return end
                        local Coins = LocalPlayer.PlayerGui.ScreenGui.Inventory.Frame.Container.Ores.Bottom.Coins
                        local Have = LocalData:GetData("Coins")
                        if Coins.Visible == true then Have = Have + FormatToNumber(Coins.Label.Text) end
                        local Need = nil
                        if Settings[ElementData.Name] == 1 then
                            Need = FormatToNumber(LocalPlayer.PlayerGui.ScreenGui.Rebirth.Frame.Buy.Frame.Container.Label.Text)
                        else
                            Need = FormatToNumber(LocalPlayer.PlayerGui.ScreenGui.Rebirth.Multi.Options[Settings[ElementData.Name]].Button.Frame.Label.Text)
                        end
                        if Have >= Need then
                            local Location = LocalPlayer.Character.HumanoidRootPart.CFrame
                            ReplicatedStorage.Events.Teleport:FireServer("Mystic CavernSell")
                            ReplicatedStorage.Events.QuickSell:FireServer()
                            if Settings[ElementData.Name] == 1 then
                                ReplicatedStorage.Events.Rebirth:FireServer()
                            else
                                ReplicatedStorage.Events.MultiRebirth:FireServer(Settings[ElementData.Name]) 
                            end
                            wait(1)
                            if Settings.RebirthTeleportBack then
                                local duration = TweenTo(Location, true)
                                local MinWait = 2 - duration
                                if MinWait < 0 then MinWait = 0 end
                                wait(duration + MinWait)
                            end
                        end
                    end
                end,
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
                Options = {false, unpack(Eggs)},
                RepeatDelay = 0,
                Callback = function()
                    ReplicatedStorage.Events.OpenEgg:FireServer(Settings.EggToHatch,Settings.TripleHatch,true)
                end,
            },
            {Name="TripleHatch",
                Type = "Toggle",
            },
            {Name="DestroyHatchGui",
                Type = "Toggle",
                Callback = function()
                    local HatchGui = game.ReplicatedStorage.ClientModules.Other.OpenEgg:FindFirstChild("HatchGui")
                    if HatchGui then HatchGui:Destroy() end
                end,
            },
            {Name="BackupEgg",
                Type = "Dropdown",
                Options = {false, unpack(Eggs)},
                RepeatDelay = 10,
                Callback = function()
                    if Settings.EggsLeft ~= "Deactivated" then
                        for _,world in pairs(Data.Worlds) do
                            for _,egg in pairs(world.Eggs) do
                                if Settings.EggToHatch == egg.Name then
                                    local EggsLeft = math.floor(LocalData:GetData(world.Currency) / FormatToNumber(egg.Price))
                                    if EggsLeft < 100 then
                                        Elements.EggToHatch.Element:Set(Settings.BackupEggToHatch)
                                        Elements.BackupEggToHatch:Set("Deactivated")
                                        TweenToEgg()
                                    end
                                end
                            end
                        end
                    end
                end,
            },
            {Name="TeleportOnStart",
                Type = "Toggle",
            },
            {Name="TeleportNow",
                Type = "Button",
                Callback = function()
                    TweenToEgg()
                end
            },
        },
    },
    {Name="Misc",
        Elements = {
            {Name="Teleports",Type="Section"},
            {Name="World",
                Volatile = true,
                Type = "Dropdown",
                Options = Worlds,
                Callback = function(Value)
                    ReplicatedStorage.Events.Teleport:FireServer(Value)
                end,
            },
            {Name="Layer",
                Volatile = true,
                Type = "Dropdown",
                Options = Layers,
                Callback = function(Value)
                    ReplicatedStorage.Events.Teleport:FireServer(Value.."Sell")
                    wait(1)
                    ReplicatedStorage.Events.Teleport:FireServer(Value)
                end,
            },
            {Name="RemoteUi's",
                Volatile = true,
                Type = "Dropdown",
                Options = Data.RemoteUis,
                Callback = function(Value)
                    local Ui = game:GetService("Players")[username].PlayerGui.ScreenGui:FindFirstChild(Value)
                    Ui.Visible = true
                    Ui.Frame.Close.Frame.Button.MouseButton1Click:Connect(function()
                        Ui.Visible = false
                        Ui.Frame.Close.Frame.Button.MouseButton1Click:Disconnect()
                    end)
                end,
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
    if ElementData.RepeatDelay and ElementData.RepeatDelay >= 0 then
        spawn(function() repeat Print(4,"Executing cycle "..ElementData.Name,false) if ElementData.Callback(ElementData) then return end wait(ElementData.RepeatDelay)
            until Settings[ElementData.Name] == DisabledState or ElementInstanceId~=ElementData.InstanceId or DarkCavernInstanceId~=_G.DarkCavernInstanceId 
        end)
    else Print(4,"Executing single "..ElementData.Name,false) ElementData.Callback(Value, ElementData) end
end

for _,tab in Tabs do
    local Tab = Window:CreateTab(tab.Name)
    for _,elementData in tab.Elements do
        if elementData.Dependancy ~= false then
            elementData.InstanceId = 0
            local Name = string.gsub(elementData.Name, "%u", " %0")
            if elementData.CommingSoon then Name = Name.." (Comming Soon)" end
            if elementData.Type == "Toggle" then
                local CurrentValue = false
                if not elementData.Volatile and Settings[elementData.Name] then CurrentValue = Settings[elementData.Name] end
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
                for index,option in pairs(elementData.Options) do
                    if not option then elementData.Options[index] = "Deactivated" end
                end
                local CurrentValue = elementData.Options[1]
                if not elementData.Volatile and Settings[elementData.Name] then CurrentValue = Settings[elementData.Name] end
                local Element = Tab:CreateDropdown({
                    Name = Name..":",
                    Options = elementData.Options,
                    CurrentOption = CurrentValue,
                    Callback = function(Value)
                        if not elementData.Volatile then Settings[elementData.Name] = Value[1] end
                        Run(elementData, "Deactivated", Value[1])
                    end
                })
                Elements[elementData.Name] = {elementData=elementData,Element=Element}
                if not elementData.Volatile then Element.Callback({Settings[elementData.Name]}) end
            elseif elementData.Type == "Slider" then
                local CurrentValue = elementData.CurrentValue or elementData.Range[1]
                if not elementData.Volatile and Settings[elementData.Name] then CurrentValue = Settings[elementData.Name] end
                local Element = Tab:CreateSlider({
                    Name = Name..":",
                    Range = elementData.Range,
                    Increment = elementData.Increment,
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
                Print(3,"Invalid (pre-determined) element type: "..elementData.Name.." - \""..elementData.Type.."\".",false)
            end
        end
    end
end