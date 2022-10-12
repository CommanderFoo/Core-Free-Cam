---@type Folder
local ROOT = script:GetCustomProperty("Root"):WaitForObject()

---@type Free_Cam
local Free_Cam = require(script:GetCustomProperty("Free_Cam"))

---@type PlayerSettings
local DEFAULT_SETTINGS = ROOT:GetCustomProperty("DefaultSettings"):WaitForObject()

---@type PlayerSettings
local PLAYER_SETTINGS = script:GetCustomProperty("PlayerSettings"):WaitForObject()

local DEFAULT_PRESET = ROOT:GetCustomProperty("DefaultPreset")

Free_Cam.set_player_settings(DEFAULT_SETTINGS, PLAYER_SETTINGS)
Free_Cam.set_default_preset(DEFAULT_PRESET)