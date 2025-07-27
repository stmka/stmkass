pcall(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/stmka/antibypass/refs/heads/main/main.lua'))()
end)

getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Syphon GUI",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by stmka",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Syphon",
        FileName = "Settings"
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = false
})

local Main = Window:CreateTab("Main", 98952570395426)
local Other = Window:CreateTab("Other", 12809025337)
local Credits = Window:CreateTab("Credits", 15781236875)
local MainLabel = Main:CreateLabel("Choose version, and start farming!")

_G.Version = "V4.4"

local MainDropdown = Main:CreateDropdown({
    Name = "Choose Version",
    Options = {"V4.4", "V4.3", "V4.2", "V4.1", "V4.0"},
    CurrentOption = "V4.4",
    MultiSelection = false,
    Callback = function(Option)
        _G.Version = tostring(Option) -- ✅ fixed typo
    end,
})

local MainButton = Main:CreateButton({
    Name = "Launch Selected Version",
    Callback = function()
        local selected = _G.Version
        Rayfield:Notify({
            Title = "Launching...",
            Content = "Launching " .. selected,
            Duration = 4,
            Image = 4483362458,
        })

        local url = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/SlapFarmGui/Versions/" .. selected .. ".luau"
        loadstring(game:HttpGet(url))()
    end,
})
