if game.PlaceId ~= 9551640993 then os.exit() end
repeat task.wait(0.1) until game:IsLoaded()

local InterfaceSettings = {
    EventSection = true;
    EventShopBoosts = true;

    TwoWeekChallenges = false;
    SpinToWin = false;
}

-- UserSettings
_G.ProfileSettings = {
    -- Farming > I need to sperate into meaningful tabs
    ClaimGroupBenefits = false;
    FactoryCraft = false;
    Achievements = false;
    BuyBoosts = false;
    GenieQuests = false;
    DepositShards = false;
    LuckBoostEnabler = "Deactivated";

    -- Event
    BuyEventBoosts = false;
    ClaimTwoWeekChallengesRewards = false;
    
    -- Spin to Win
    BuySpins = false;
    ClaimSpins = false;
    PlaySpins = false;

    -- Mining
    MineSelection = false;
    MineDownFast = false;
    DownFastDelay = 0;
    DownFastAmount = 5;
    CollapseProtection = false;

    -- Rebirthing
    RebirthAmount = 0;
    RebirthTween = false;

    -- Hatching
    HatchEgg = "Deactivated";
    TripleHatch = false;
    DestroyHatchGui = false;
    BackupHatchEgg = "Deactivated";
    EggTP = false;

    -- Misc
    LayerOption = "Hidden Treasure";
    WorldOption = "The Overworld";
}

local Data = { -- To Finish...
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
    }
}

-- Module Locals
local LoadModule = require(game.ReplicatedStorage.LoadModule);
local LocalData = LoadModule("LocalData");
-- local Backpack = LocalData:GetData("BackpackInventory")
-- for _,v in pairs(Backpack) do for i,v2 in pairs(v) do print(i,v2) end end

-- Locals
local LocalPlayer = game.Players.LocalPlayer
local username = LocalPlayer.Name
local ProfileSettingsName = "dark-cavern_"..username..".txt"
-- local Chat = LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller
local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- local UserInputService = game:GetService("UserInputService")

-- AntiAFK
local bb=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
bb:CaptureController()bb:ClickButton2(Vector2.new())
end)


-- Functions
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

function FormatNumber(Number)
    return Number:gsub(",", "")
end

function abb(Value)
    local Number
    local Formatted = Value
    while true do
        Formatted, Number = string.gsub(Formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (Number == 0) then
            break
        end
    end
    return Formatted
end

if InterfaceSettings.SpinToWin then 
    function BuySpins()
        spawn(function()
            while wait(5) do 
                if not _G.ProfileSettings.BuySpins then break end
                ReplicatedStorage.Events.BuySpinToWin:FireServer()
            end
        end)
    end
    function ClaimSpins()
        spawn(function()
            while wait(5) do 
                if not _G.ProfileSettings.ClaimSpins then break end
                ReplicatedStorage.Events.ClaimSpinToWin:FireServer()
            end
        end)
    end
    function PlaySpins()
        spawn(function()
            while wait(5) do 
                if not _G.ProfileSettings.PlaySpins then break end
                ReplicatedStorage.Events.PlaySpinToWin:FireServer()
            end
        end)
    end
end

function GetEggsLeft()
    for _,world_data in pairs(Data.Worlds) do
        for _,egg_data in pairs(world_data.Eggs) do
            if _G.ProfileSettings.HatchEgg == egg_data.Name then
                return math.floor(LocalData:GetData(world_data.Currency) / FormatToNumber(egg_data.Price))
            end
        end
    end
    return "Invalid Input or Not Updated"
end


function BackupEgg()
    spawn(function()
        local StartEggTP = true
        local username = LocalPlayer.Name
        local BackupCount1 = 0
        BackupCount1 = game:GetService("Players")[username].leaderstats.Eggs.Value
        while wait(300) do
            if _G.ProfileSettings.HatchEgg == "Deactivated" then return end
            if _G.ProfileSettings.BackupHatchEgg == "Deactivated" then return end
            if GetEggsLeft() < 100 then
                _G.ProfileSettings.HatchEgg = _G.ProfileSettings.BackupHatchEgg
                if StartEggTP then
                    TweenToEgg()
                    StartEggTP = false
                end
                if not StartEggTP then
                    local username = LocalPlayer.Name
                    local BackupCount2 = 0
                    BackupCount2 = game:GetService("Players")[username].leaderstats.Eggs.Value
                    if BackupCount1 == BackupCount2 then
                        TweenToEgg()
                    else
                        local BackupEggDifference = BackupCount2 - BackupCount1
                        BackupCount1 = BackupCount1 + BackupEggDifference
                    end
                end
            end
        end
    end)
end

function PetInventoryBackup()
    spawn(function()
        while wait(30) do
            if _G.ProfileSettings.HatchEgg == "Deactivated" then return end
            if _G.ProfileSettings.BackupHatchEgg == "Deactivated" then return end
            local GetLoadModule = require(game.ReplicatedStorage.LoadModule);
            local GetPetStorage = GetLoadModule("GetPetStorage");
            local GetAddCommas = GetLoadModule("AddCommas");
            local LocalData = GetLoadModule("LocalData");
            local GetPetsOwned = LocalData:GetData("Pets")
            local PetsOwned = GetAddCommas(#GetPetsOwned)
            local PetStorage = GetPetStorage(LocalData:GetData())
            local PetStorage1 = PetStorage - 10
            print(PetsOwned)
            local PetsOwned = tonumber(FormatNumber(PetsOwned))
            print(PetsOwned)
            if PetsOwned >= PetStorage1 then
                _G.ProfileSettings.HatchEgg = "Basic Egg"
                TweenToEgg()
                break
            end
        end
    end)
end

function SaveProfileSettingsSettings()
    local json
    local HttpService = game:GetService("HttpService")
    if (writefile) then
        json = HttpService:JSONEncode(_G.ProfileSettings)
        writefile(ProfileSettingsName, json)
        game.StarterGui:SetCore("SendNotification",{
            Title = "SUCCESS!",
            Text = "Settings Have Been Saved"})
    end
end

function HatchEgg()
    spawn(function()
        while wait() do
            if _G.ProfileSettings.HatchEgg == "Deactivated" then return end
            ReplicatedStorage.Events.OpenEgg:FireServer(_G.ProfileSettings.HatchEgg,_G.ProfileSettings.TripleHatch,true)
        end
    end)
end

function TweenToEgg()
    spawn(function()
        if _G.ProfileSettings.HatchEgg == "Deactivated" then return end
        local Egg = game:GetService("Workspace").Eggs[_G.ProfileSettings.HatchEgg].EggName.CFrame
        if Distance(LocalPlayer.Character.HumanoidRootPart.Position,Egg) <= 5 then return end
        for _,world in pairs(Data.Worlds) do
            local broke = false
            for _,egg in pairs(world.Eggs) do
                if _G.ProfileSettings.HatchEgg == egg.Name then
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
    end)
end

function ClaimGroupBenefits() spawn(function()
    while true do
        if not _G.ProfileSettings.ClaimGroupBenefits then return end
        ReplicatedStorage.Functions.ClaimGroupBenefits:InvokeServer()
        wait(60)
end end) end

function BuyBoosts() spawn(function() while true do
    local start = time()
    while time() - start < 10 do
        wait()
        if not _G.ProfileSettings.BuyBoosts then return end end
    for _,catagory in pairs(Data.Boosts) do
        for _,type in pairs(catagory) do
            for hours=1,2 do
                ReplicatedStorage.Events.BuyBoost:FireServer(type,hours)
            end
        end
    end
end end) end

if InterfaceSettings.EventShopBoosts then
    function BuyEventBoosts() spawn(function() while wait(5) do
        if not _G.ProfileSettings.BuyEventBoosts then return end
        for i=0,2 do
            ReplicatedStorage.Events.BuyEventShopItem:FireServer("boost"..i)
    end end end) end
end

function FactoryCraft() spawn(function()
    while wait(30) do
        if not _G.ProfileSettings.FactoryCraft then return end
        for i=1,3 do
            ReplicatedStorage.Events.ClaimFactoryCraft:FireServer(i)
            wait(1)
            for _,type in pairs(Data.Crafts) do
                ReplicatedStorage.Events.StartFactoryCraft:FireServer(type,i)
end end end end) end

function TeleportToLayer() spawn(function()
    ReplicatedStorage.Events.Teleport:FireServer(_G.ProfileSettings.LayerOption)
end) end

function UnlockLayer() spawn(function()
    ReplicatedStorage.Events.Teleport:FireServer(_G.ProfileSettings.LayerOption.."Sell")
end) end

function DestroyHatchGui() spawn(function()
    game.ReplicatedStorage.ClientModules.Other.OpenEgg.HatchGui:Destroy()
end) end

function InstantTeleportToLayer() spawn(function()
    ReplicatedStorage.Events.Teleport:FireServer(_G.ProfileSettings.WorldOption)
end) end

-- function FinishStPatricksPassChallenges() spawn(function()
--     while wait(5) do
--         if not _G.ProfileSettings.FinishStPatricksPassChallenges then return end
--         for _,type in pairs({"Easy","Medium","Hard"}) do
--             ReplicatedStorage.Events.FinishStPatricksPassChallenge:FireServer(type)
-- end end end) end

-- function ClaimStPatricksPassRewards() spawn(function()
--     while wait(5) do
--         if not _G.ProfileSettings.ClaimStPatricksPassRewards then return end
--         for i=1,20 do
--             ReplicatedStorage.Events.ClaimStPatricksPassReward:FireServer(i)
--             wait(1)
-- end end end) end

if InterfaceSettings.TwoWeekChallenges then
    function ClaimTwoWeekChallengesRewards() spawn(function()
        while wait(5) do
            if not _G.ProfileSettings.ClaimTwoWeekChallengesRewards then return end
            for i=1,14 do
                ReplicatedStorage.Events.TwoWeekChallengesClaimReward:FireServer(i)
    end end end) end
end

function Achievements()
    spawn(function()
        while true do 
            if not _G.ProfileSettings.Achievements then break end
            for _,type in pairs(Data.Achievements) do
                ReplicatedStorage.Events.ClaimAchievementReward:FireServer(type)
                wait(1) end
            wait(60)
end end) end

function MineSelection() spawn(function()
    local Module = LoadModule("MineSelection")
    while wait() do
        if not _G.ProfileSettings.MineSelection then return end
        if Module:get() then
            local a = Module:get().Cell
            ReplicatedStorage.Events.MineBlock:FireServer(a)
            if _G.ProfileSettings.MineDownFast then
                for i=1,_G.ProfileSettings.DownFastAmount+1 do
                    wait(_G.ProfileSettings.DownFastDelay)
                    ReplicatedStorage.Events.MineBlock:FireServer(a+Vector3.new(0, i, 0))
                end
            end
end end end) end

function Rebirth() spawn(function()
    ReplicatedStorage.Events.Teleport:FireServer("Mystic CavernSell")
    local Need = nil
    while wait(0.1) do
        if _G.ProfileSettings.RebirthAmount == 0 then return end
        local Coins = LocalPlayer.PlayerGui.ScreenGui.Inventory.Frame.Container.Ores.Bottom.Coins
        local Have = LocalData:GetData("Coins")
        if Coins.Visible == true then Have = Have + FormatToNumber(Coins.Label.Text) end
        if _G.ProfileSettings.RebirthAmount == 1 then
            Need = FormatToNumber(LocalPlayer.PlayerGui.ScreenGui.Rebirth.Frame.Buy.Frame.Container.Label.Text)
        else
            Need = FormatToNumber(LocalPlayer.PlayerGui.ScreenGui.Rebirth.Multi.Options[_G.ProfileSettings.RebirthAmount].Button.Frame.Label.Text)
        end
        if Have >= Need then
            local Location = LocalPlayer.Character.HumanoidRootPart.CFrame
            ReplicatedStorage.Events.Teleport:FireServer("Mystic CavernSell")
            ReplicatedStorage.Events.QuickSell:FireServer()
            if _G.ProfileSettings.RebirthAmount == 1 then
                ReplicatedStorage.Events.Rebirth:FireServer()
            else
                ReplicatedStorage.Events.MultiRebirth:FireServer(_G.ProfileSettings.RebirthAmount) 
            end
            wait(1)
            if _G.ProfileSettings.RebirthTween then
                local duration = TweenTo(Location, true)
                local MinWait = 2 - duration
                if MinWait < 0 then MinWait = 0 end
                wait(duration + MinWait)
end end end end) end

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

function CollapseProtection() spawn(function() -- TODO
    local LastCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
    while wait(0.1) do
        if not _G.ProfileSettings.CollapseProtection then return end
        if BlocksUntilCollapse == 0 then
            LastCFrame = CFrame.new(Vector3.new(LastCFrame.X,LocalPlayer.Character.HumanoidRootPart.Position.Y,LastCFrame.Z),LastCFrame.LookVector)
            wait(35)
            local Under = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position.X,LastCFrame.Y-100,LocalPlayer.Character.HumanoidRootPart.Position.Z)
            TweenTo(Under, true)
            TweenTo(CFrame.new(LastCFrame.X,Under.Y,LastCFrame.Z), true)
            TweenTo(LastCFrame, true)
        else
            LastCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
        end
end end) end


function LuckBoostEnabler()spawn(function()
    while true do
        if _G.ProfileSettings.LuckBoostEnabler == "Minimal" then
            local InvalidBoosts = Data.Boosts.Luck
            for _,active_boost in pairs(LocalData:GetData("ActiveBoosts")) do
                for _,boost in pairs(InvalidBoosts) do
                    if active_boost[1] == boost then
                        if active_boost[2] > 590 then
                            table.remove(InvalidBoosts, boost)
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
        elseif _G.ProfileSettings.BoostEnabler == "Omega Limited" then
            print("2")
        else return end
        wait(1)
    end
end) end


-- Beginning of UI
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Title = "Dark Cavern"
local Window = Rayfield:CreateWindow({
	Name = Title,
	LoadingTitle = Title,
	LoadingSubtitle = "Don't trip"
})


-- Tabs
local FarmingTab = Window:CreateTab("Farming")
local GrindingTab = Window:CreateTab("Grinding")
local HatchingTab = Window:CreateTab("Hatching")
local MiscTab = Window:CreateTab("Misc")
local SettingsTab = Window:CreateTab("Settings")


-- Farming
local FactoryCraft = FarmingTab:CreateToggle({
	Name = "Factory (Claim & Craft)",
	CurrentValue = _G.ProfileSettings.FactoryCraft,
	Callback = function(bool)
        _G.ProfileSettings.FactoryCraft = bool
        if bool then
            FactoryCraft()
        end
	end,
})
local BuyBoosts = FarmingTab:CreateToggle({
	Name = "Buy Boosts (Shop)",
	CurrentValue = _G.ProfileSettings.BuyBoosts,
	Callback = function(bool)
        _G.ProfileSettings.BuyBoosts = bool
        if bool then
            BuyBoosts()
        end
	end,
})
local ClaimGroupBenefits = FarmingTab:CreateToggle({
	Name = "Group Benefits",
	CurrentValue = _G.ProfileSettings.ClaimGroupBenefits,
	Callback = function(bool)
        _G.ProfileSettings.ClaimGroupBenefits = bool
        if bool then
            ClaimGroupBenefits()
        end
	end,
})
local Achievements = FarmingTab:CreateToggle({
	Name = "Achievements",
	CurrentValue = _G.ProfileSettings.Achievements,
	Callback = function(bool)
        _G.ProfileSettings.Achievements = bool
        if bool then
            Achievements()
        end
	end,
})
-- local GenieQuests = FarmingTab:CreateToggle({
-- 	Name = "Genie Quests (Comming soon)",
-- 	CurrentValue = false,
-- 	Callback = function(Value)
--         -- _G.ProfileSettings.GenieQuests = Value
--         -- if Value then
--         --     GenieQuests()
--         -- end
-- 	end,
-- })
-- local DepositShards = FarmingTab:CreateToggle({
-- 	Name = "Deposit Shards (Comming soon)",
-- 	CurrentValue = false,
-- 	Callback = function(Value)
--         -- _G.ProfileSettings.DepositShards = Value
--         -- if Value then
--         --     DepositShards()
--         -- end
-- 	end,
-- })

-- Auto Event
if InterfaceSettings.EventSection then
    local EventSection = FarmingTab:CreateSection("Event")
end
local Interface = {}

if InterfaceSettings.EventShopBoosts then
    Interface.BuyEventBoosts = FarmingTab:CreateToggle({
        Name = "Shop Boosts",
        CurrentValue = _G.ProfileSettings.BuyEventBoosts,
        Callback = function(bool)
        _G.ProfileSettings.BuyEventBoosts = bool
        if bool then
            BuyEventBoosts()
        end
        end,
    })
end

-- local FinishStPatricksPassChallenges = FarmingTab:CreateToggle({
--     Name = "Pass Challenges",
--     CurrentValue = _G.ProfileSettings.FinishStPatricksPassChallenges,
--     Callback = function(bool)
--        _G.ProfileSettings.FinishStPatricksPassChallenges = bool
--        if bool then
--             FinishStPatricksPassChallenges()
--        end
--     end,
-- })
-- local ClaimStPatricksPassRewards = FarmingTab:CreateToggle({
-- 	Name = "Pass Rewards",
-- 	CurrentValue = _G.ProfileSettings.ClaimStPatricksPassRewards,
-- 	Callback = function(bool)
--         _G.ProfileSettings.ClaimStPatricksPassRewards = bool
--         if bool then
--             ClaimStPatricksPassRewards()
--         end
-- 	end,
-- })

if InterfaceSettings.TwoWeekChallenges then
    local ClaimTwoWeekChallengesRewards = FarmingTab:CreateToggle({
        Name = "Two Week Challenges",
        CurrentValue = _G.ProfileSettings.ClaimTwoWeekChallengesRewards,
        Callback = function(bool)
        _G.ProfileSettings.ClaimTwoWeekChallengesRewards = bool
        if bool then
            ClaimTwoWeekChallengesRewards()
        end
        end,
    })
end

if InterfaceSettings.SpinToWin then
    local ClaimSpins = FarmingTab:CreateToggle({
        Name = "Claim Spins",
        CurrentValue = _G.ProfileSettings.ClaimSpins,
        Callback = function(bool)
            _G.ProfileSettings.ClaimSpins = bool
            if bool then
                ClaimSpins()
            end
        end,
    })
    local BuySpins = FarmingTab:CreateToggle({
        Name = "Buy Spins",
        CurrentValue = _G.ProfileSettings.BuySpins,
        Callback = function(bool)
        _G.ProfileSettings.BuySpins = bool
            if bool then
                BuySpins()
            end
        end,
    })
    local PlaySpins = FarmingTab:CreateToggle({
        Name = "Play Spins",
        CurrentValue = _G.ProfileSettings.PlaySpins,
        Callback = function(bool)
            _G.ProfileSettings.PlaySpins = bool
            if bool then
                PlaySpins()
            end
        end,
    })
end


-- Grinding
-- Auto Mine
local AutoMineSelection = GrindingTab:CreateSection("Auto Mine")
local MineSelection = GrindingTab:CreateToggle({
	Name = "Mine Selection",
	CurrentValue = _G.ProfileSettings.MineSelection,
	Callback = function(bool)
        _G.ProfileSettings.MineSelection = bool
        if bool then
            MineSelection()
        end
	end,
})
local CollapseProtection = GrindingTab:CreateToggle({
	Name = "Collapse Protection",
	CurrentValue = _G.ProfileSettings.CollapseProtection,
	Callback = function(Value)
        _G.ProfileSettings.CollapseProtection = Value
        if Value then
            CollapseProtection()
        end
	end,
})
local MineDownFast = GrindingTab:CreateToggle({
	Name = "Down Fast",
	CurrentValue = _G.ProfileSettings.MineDownFast,
	Callback = function(bool)
        _G.ProfileSettings.MineDownFast = bool
	end,
})
local DownFastAmount = GrindingTab:CreateSlider({
	Name = "Down Fast Amount",
    Range = {1, 10},
    Increment = 1,
    Suffix = "Blocks",
	CurrentValue = _G.ProfileSettings.DownFastAmount,
	Callback = function(Value)
        _G.ProfileSettings.DownFastAmount = Value
	end,
})
local DownFastDelay = GrindingTab:CreateSlider({
	Name = "Down Fast Delay (for lag):",
    Range = {0, 0.15},
    Increment = 0.01,
    Suffix = "Seconds",
	CurrentValue = _G.ProfileSettings.DownFastDelay,
	Callback = function(Value)
        _G.ProfileSettings.DownFastDelay = Value
	end,
})
-- Auto Rebirth
local AutoRebirthSelection = GrindingTab:CreateSection("Auto Rebirth")
local RebirthAmount = GrindingTab:CreateSlider({
	Name = "Amount:",
    Range = {0, 5},
    Increment = 1,
    Suffix = "Rebirths",
	CurrentValue = _G.ProfileSettings.RebirthAmount,
	Callback = function(Value)
        if _G.ProfileSettings.RebirthAmount==0 and Value~=0 then
            Rebirth()
        end
        _G.ProfileSettings.RebirthAmount = Value
	end,
})
local RebirthTween = GrindingTab:CreateToggle({
	Name = "Teleport Back",
	CurrentValue = _G.ProfileSettings.RebirthTween,
	Callback = function(bool)
        _G.ProfileSettings.RebirthTween = bool
	end,
})


-- Hatching
local AutoHatchEggSection = HatchingTab:CreateSection("Auto Hatch Egg")
local options = {_G.ProfileSettings.HatchEgg}
for _,world in pairs(Data.Worlds) do
    for _,egg in pairs(world.Eggs) do
        table.insert(options,egg.Name)
    end
end
local ChooseEggToHatchDropdown = HatchingTab:CreateDropdown({
	Name = "Choose Egg:",
	Options = options,
	CurrentOption = _G.ProfileSettings.HatchEgg,
	Callback = function(Value)
        _G.ProfileSettings.HatchEgg = Value[1] or Value
        HatchEgg()
        BackupEgg()
        PetInventoryBackup()
	end,
})
local QuadOrTripleEggHatch = HatchingTab:CreateToggle({
	Name = "Quad/Triple Egg Hatch",
	CurrentValue = _G.ProfileSettings.TripleHatch,
	Callback = function(Value)
        _G.ProfileSettings.TripleHatch = Value
	end,
})
local DestroyHatchGuiToggle = HatchingTab:CreateToggle({
	Name = "Destroy Hatch GUI",
	CurrentValue = _G.ProfileSettings.DestroyHatchGui,
	Callback = function(Value)
        _G.ProfileSettings.DestroyHatchGui = Value
        if Value then
            DestroyHatchGui() end
	end,
})
local DestroyHatchGuiLabel = HatchingTab:CreateLabel("(Rejoin to respawn Hatch GUI)")
local ChooseEggToHatchDropdownBackup = HatchingTab:CreateDropdown({
	Name = "Choose Backup:",
	Options = options,
	CurrentOption = _G.ProfileSettings.BackupHatchEgg,
	Callback = function(Value)
        _G.ProfileSettings.BackupHatchEgg = Value[1] or Value
	end,
})
local EggTP = HatchingTab:CreateToggle({
	Name = "Teleport on Start",
	CurrentValue = _G.ProfileSettings.EggTP,
	Callback = function(Value)
        _G.ProfileSettings.EggTP = Value
	end,
})
HatchingTab:CreateButton({
	Name = "Teleport",
	Callback = function()
        TweenToEgg()
    end,
})


-- Misc
-- Worlds Settings
local WorldsSection = MiscTab:CreateSection("Worlds")
local options = {}
for _,world_data in pairs(Data.Worlds) do
    table.insert(options, world_data.Name)
end
local WorldToTpTo = MiscTab:CreateDropdown({
	Name = "World:",
	Options = options,
	CurrentOption = _G.ProfileSettings.WorldOption,
	Callback = function(Value)
        _G.ProfileSettings.WorldOption = Value[1] or Value
	end,
})
local TeleportToWorld = MiscTab:CreateButton({
	Name = "Teleport To World",
	Callback = function()
        InstantTeleportToLayer()
	end,
})

-- Layers Settings
local LayersSection = MiscTab:CreateSection("Layers")
local options = {}
for _,world_data in pairs(Data.Worlds) do
    for _,layer in pairs(world_data.Layers) do
        table.insert(options, layer)
    end
end
local LayerToTpTo = MiscTab:CreateDropdown({
	Name = "Layer:",
	Options = options,
	CurrentOption = _G.ProfileSettings.LayerOption,
	Callback = function(Value)
        _G.ProfileSettings.LayerOption = Value[1] or Value
	end,
})
local TeleportToLayer = MiscTab:CreateButton({
	Name = "Teleport to Layer",
	Callback = function()
        TeleportToLayer()
	end,
})
local UnlockLayer = MiscTab:CreateButton({
	Name = "Unlock Layer",
	Callback = function()
        UnlockLayer()
	end,
})

-- Remote UIs
local RemoteUIsSection = MiscTab:CreateSection("Remote UI's (X buttons dont work)")
local PetEnchantsUI = MiscTab:CreateToggle({
	Name = "Pet Enchantments",
	CurrentValue = false,
	Callback = function(bool)
        game:GetService("Players")[username].PlayerGui.ScreenGui.PetEnchant.Visible = bool
	end,
})
local RebirthShopUI = MiscTab:CreateToggle({
	Name = "Rebirth Shop",
	CurrentValue = false,
	Callback = function(bool)
        game:GetService("Players")[username].PlayerGui.ScreenGui.RebirthShop.Visible = bool
	end,
})
local ForgeUI = MiscTab:CreateToggle({
	Name = "Forge",
	CurrentValue = false,
	Callback = function(bool)
        game:GetService("Players")[username].PlayerGui.ScreenGui.Forge.Visible = bool
	end,
})
local AutoDeleteUI = MiscTab:CreateToggle({
	Name = "Auto Delete",
	CurrentValue = false,
	Callback = function(bool)
        game:GetService("Players")[username].PlayerGui.ScreenGui.AutoDelete.Visible = bool
	end,
})
local GemEnchantsUI = MiscTab:CreateToggle({
	Name = "Gem Enchantments",
	CurrentValue = false,
	Callback = function(bool)
        game:GetService("Players")[username].PlayerGui.ScreenGui.GemEnchant.Visible = bool
	end,
})
local AchievementsUI = MiscTab:CreateToggle({
	Name = "Achievements",
	CurrentValue = false,
	Callback = function(bool)
        game:GetService("Players")[username].PlayerGui.ScreenGui.Achievements.Visible = bool
	end,
})
local FactoryUI = MiscTab:CreateToggle({
	Name = "Factory",
	CurrentValue = false,
	Callback = function(bool)
        game:GetService("Players")[username].PlayerGui.ScreenGui.Factory.Visible = bool
	end,
})
local QuestsUI = MiscTab:CreateToggle({
	Name = "Gem Genie Quests",
	CurrentValue = false,
	Callback = function(bool)
        game:GetService("Players")[username].PlayerGui.ScreenGui.Quests.Visible = bool
	end,
})
-- local StPatricksPassUI = MiscTab:CreateToggle({
-- 	Name = "St Patricks Pass",
-- 	CurrentValue = false,
-- 	Callback = function(bool)
--         game:GetService("Players")[username].PlayerGui.ScreenGui.StPatricksPass.Visible = bool
-- 	end,
-- })
local EventShop = MiscTab:CreateToggle({
	Name = "Event Shop",
	CurrentValue = false,
	Callback = function(bool)
        game:GetService("Players")[username].PlayerGui.ScreenGui.EventShop.Visible = bool
	end,
})
local TwoWeekChallenges = MiscTab:CreateToggle({
	Name = "Event Rewards",
	CurrentValue = false,
	Callback = function(bool)
        game:GetService("Players")[username].PlayerGui.ScreenGui.TwoWeekChallenges.Visible = bool
	end,
})
-- local SpinToWinUI = MiscTab:CreateToggle({
-- 	Name = "Spin to Win",
-- 	CurrentValue = false,
-- 	Callback = function(bool)
--         game:GetService("Players")[username].PlayerGui.ScreenGui.SpinToWin.Visible = bool
-- 	end,
-- })

-- Other GUIs
local OtherGUISection = MiscTab:CreateSection("Other GUIs")
local ActivateZeeroxScript = MiscTab:CreateButton({
	Name = "Zeerox's GUI",
	Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua"),true))()
	end,
})
local ActivateTenseScript = MiscTab:CreateButton({
	Name = "Tense's OP GUI",
	Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/wingedmother69/thingz/main/ms2ui.lua"),true))()
	end,
})

function SetValue(ElementName)
    if Interface[ElementName] then
        Interface[ElementName]:Set(_G.ProfileSettings[ElementName])
    end
end

-- Load Settings
function LoadProfileSettingsSettings()
    local HttpService = game:GetService("HttpService")
    if (readfile and isfile and isfile(ProfileSettingsName)) then
        _G.ProfileSettings = HttpService:JSONDecode(readfile(ProfileSettingsName))
        -- Farming
        FactoryCraft:Set(_G.ProfileSettings.FactoryCraft)
        BuyBoosts:Set(_G.ProfileSettings.BuyBoosts)
        ClaimGroupBenefits:Set(_G.ProfileSettings.ClaimGroupBenefits)
        Achievements:Set(_G.ProfileSettings.Achievements)
        -- GenieQuests:Set(_G.ProfileSettings.GenieQuests)
        -- DepositShards:Set(_G.ProfileSettings.DepositShards)

        SetValue("BuyEventBoosts")
        if InterfaceSettings.TwoWeekChallenges then
            ClaimTwoWeekChallengesRewards:Set(_G.ProfileSettings.ClaimTwoWeekChallengesRewards)
        end

        if InterfaceSettings.SpinToWin then
            ClaimSpins:Set(_G.ProfileSettings.ClaimSpins)
            BuySpins:Set(_G.ProfileSettings.BuySpins)
            PlaySpins:Set(_G.ProfileSettings.PlaySpins)
        end

        -- Grinding
        MineSelection:Set(_G.ProfileSettings.MineSelection)
        CollapseProtection:Set(_G.ProfileSettings.CollapseProtection)
        MineDownFast:Set(_G.ProfileSettings.MineDownFast)
        DownFastDelay:Set(_G.ProfileSettings.DownFastDelay)
        DownFastAmount:Set(_G.ProfileSettings.DownFastAmount)

        RebirthAmount:Set(_G.ProfileSettings.RebirthAmount)
        RebirthTween:Set(_G.ProfileSettings.RebirthTween)

        -- Hatching
        ChooseEggToHatchDropdown:Set(_G.ProfileSettings.HatchEgg)  
        QuadOrTripleEggHatch:Set(_G.ProfileSettings.TripleHatch)
        DestroyHatchGuiToggle:Set(_G.ProfileSettings.DestroyHatchGui)

        EggTP:Set(_G.ProfileSettings.EggTP)

        ChooseEggToHatchDropdownBackup:Set(_G.ProfileSettings.BackupHatchEgg)
        print("Settings: Loaded")
        game.StarterGui:SetCore("SendNotification",{
            Title = "SUCCESS!",
            Text = "Settings Have Been Loaded"})
        return true
    elseif not isfile(ProfileSettingsName) then
        print("Dark Cavern: Settings for profile were not found.")
        return true
    else
        return false
    end
end


if not LoadProfileSettingsSettings() then 
    game.StarterGui:SetCore("SendNotification",{
        Title = "ERROR!",
        Text = "Problem Loading Settings"})
end



-- Initial Checks
if _G.ProfileSettings.EggTP then
    TweenToEgg()
end
if _G.ProfileSettings.DestroyHatchGui then
    DestroyHatchGui()
end

-- Setting Stuff
local SettingsSection = SettingsTab:CreateSection("Setting Options (Settings Save Per Account)")
local SeeCurrentSettings = SettingsTab:CreateButton({
	Name = "See Your Current Settings (Type /console in chat)",
	Callback = function()
        print("---CURRENT SETTINGS---")
        for i,v in pairs(_G.ProfileSettings) do
            print(i,v)
        end
        print("----------------------")
	end,
})
local SaveCurrentSettings = SettingsTab:CreateButton({
	Name = "Save Your Current Settings",
	Callback = function()
        SaveProfileSettingsSettings()
	end,
})
local LoadSavedSettings = SettingsTab:CreateButton({
	Name = "Load Your Saved Settings",
	Callback = function()
        LoadProfileSettingsSettings()
	end,
})