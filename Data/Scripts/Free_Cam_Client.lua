---@type Free_Cam
local Free_Cam = require(script:GetCustomProperty("Free_Cam"))

---@Type Tween
local Tween = require(script:GetCustomProperty("Tween"))

---@type Folder
local ROOT = script:GetCustomProperty("Root"):WaitForObject()

---@type UIPanel
local FREE_CAM_PANEL = script:GetCustomProperty("FreeCamPanel"):WaitForObject()

---@type UIContainer
local CONTAINER = script:GetCustomProperty("Container"):WaitForObject()

---@type Color
local NORMAL_COLOR = script:GetCustomProperty("NormalColor")

---@type Color
local NORMAL_HOVER_COLOR = script:GetCustomProperty("NormalHoverColor")

---@type Color
local NORMAL_PRESSED_COLOR = script:GetCustomProperty("NormalPressedColor")

---@type Color
local ACTIVE_COLOR = script:GetCustomProperty("ActiveColor")

---@type Color
local ACTIVE_HOVER_COLOR = script:GetCustomProperty("ActiveHoverColor")

---@type Color
local ACTIVE_PRESSED_COLOR = script:GetCustomProperty("ActivePressedColor")

---@type UIButton
local TOGGLE_UI = script:GetCustomProperty("ToggleUI"):WaitForObject()

---@type UIButton
local LOCK_CAMERA = script:GetCustomProperty("LockCamera"):WaitForObject()

---@type UIButton
local SHOW_PLAYER = script:GetCustomProperty("ShowPlayer"):WaitForObject()

---@type UIButton
local ENABLE_FLY = script:GetCustomProperty("EnableFly"):WaitForObject()

---@type UIImage
local SPEED_PANEL = script:GetCustomProperty("SpeedPanel"):WaitForObject()

---@type UIButton
local SPEED_HIT = script:GetCustomProperty("SpeedHit"):WaitForObject()

---@type UIImage
local SPEED_BAR = script:GetCustomProperty("SpeedBar"):WaitForObject()

---@type UIText
local SPEED_TXT = script:GetCustomProperty("SpeedTxt"):WaitForObject()

---@type UIImage
local DECEL_PANEL = script:GetCustomProperty("DecelPanel"):WaitForObject()

---@type UIButton
local DECEL_HIT = script:GetCustomProperty("DecelHit"):WaitForObject()

---@type UIImage
local DECEL_BAR = script:GetCustomProperty("DecelBar"):WaitForObject()

---@type UIText
local DECEL_TXT = script:GetCustomProperty("DecelTxt"):WaitForObject()

local LOCAL_PLAYER = Game.GetLocalPlayer()
local is_showing = false
local tween = nil
local all_ui = World.FindObjectsByType("UIContainer")
local is_enabled = false
local speed_hit_pressed = false
local decel_hit_pressed = false
local speed = 0
local decel_speed = 0

local states = {}

local function remap(value, in_min, in_max, out_min, out_max)
	return (value - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
end

local function number_format(i)
	return tostring(i):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

local function show_settings()
	if(is_showing or not is_enabled) then
		return
	end

	tween = Tween:new(.5, { x = FREE_CAM_PANEL.x }, { x = 30 })
	tween:set_easing(Tween.Easings.Out_Back)

	UI.SetCanCursorInteractWithUI(true)
	UI.SetCursorVisible(true)

	tween:on_change(function(c)
		FREE_CAM_PANEL.x = c.x
	end)

	is_showing = true
end

local function hide_settings()
	if(not is_showing) then
		return
	end

	tween = Tween:new(.5, { x = FREE_CAM_PANEL.x }, { x = -415 })
	tween:set_easing(Tween.Easings.In_Back)

	UI.SetCanCursorInteractWithUI(false)
	UI.SetCursorVisible(false)
	

	tween:on_change(function(c)
		FREE_CAM_PANEL.x = c.x
	end)

	is_showing = false
end

local function on_action_pressed(player, action)
	if(Free_Cam.has_permission(player)) then
		if(action == "Enable/Disable") then
			is_enabled = not is_enabled

			if(is_enabled) then
				show_settings()
			else
				hide_settings()
			end

		elseif(action == "Show/Hide Settings") then
			if(is_showing) then
				hide_settings()
			else
				show_settings()
			end
		end
	end
end

local function toggle_state(obj)
	if(not states[obj]) then
		states[obj] = false
	end
	
	if(states[obj]) then
		obj:SetButtonColor(NORMAL_COLOR)
		obj:SetHoveredColor(NORMAL_HOVER_COLOR)
		obj:SetPressedColor(NORMAL_PRESSED_COLOR)
		states[obj] = false
	else
		obj:SetButtonColor(ACTIVE_COLOR)
		obj:SetHoveredColor(ACTIVE_HOVER_COLOR)
		obj:SetPressedColor(ACTIVE_PRESSED_COLOR)
		states[obj] = true
	end

	return states[obj]
end

local function toggle_ui(button)
	local state = toggle_state(button)

	if(state) then
		button:FindChildByName("Text").text = "Show UI"
	else
		button:FindChildByName("Text").text = "Hide UI"
	end

	for index, ui in ipairs(all_ui) do
		if(ui ~= CONTAINER) then
			if(ui.visibility == Visibility.FORCE_OFF) then
				ui.visibility = Visibility.INHERIT
			else
				ui.visibility = Visibility.FORCE_OFF
			end
		end
	end
end

local function toggle_locked_camera(button)
	local state = toggle_state(button)

	if(state) then
		button:FindChildByName("Text").text = "Unlock Camera"
		Events.BroadcastToServer("FreeCam.Camera.Lock")
	else
		button:FindChildByName("Text").text = "Lock Camera"
		Events.BroadcastToServer("FreeCam.Camera.Unlock")
	end
end

local function toggle_player(button)
	local state = toggle_state(button)

	if(state) then
		button:FindChildByName("Text").text = "Show Player"
		Events.BroadcastToServer("FreeCam.Player.Hide")
	else
		button:FindChildByName("Text").text = "Hide Player"
		Events.BroadcastToServer("FreeCam.Player.Show")
	end
end

local function toggle_fly(button)
	local state = toggle_state(button)

	if(state) then
		button:FindChildByName("Text").text = "Disable Fly"
		Events.BroadcastToServer("FreeCam.Fly.Enable")
	else
		button:FindChildByName("Text").text = "Enable Fly"
		Events.BroadcastToServer("FreeCam.Fly.Disable")
	end
end

local function on_speed_hit_pressed(button)
	speed_hit_pressed = true
end

local function on_speed_hit_released(button)
	speed_hit_pressed = false
	Events.BroadcastToServer("FreeCam.Speed", speed)
end

local function on_decel_hit_pressed(button)
	decel_hit_pressed = true
end

local function on_decel_hit_released(button)
	decel_hit_pressed = false
	Events.BroadcastToServer("FreeCam.Decel", decel_speed)
end

function Tick(dt)
	if(tween ~= nil) then
		tween = tween:tween(dt)
	end

	if(is_showing) then
		if(speed_hit_pressed) then
			local cursor_pos = Input.GetCursorPosition()
			local pos = SPEED_BAR:GetAbsolutePosition()

			if(cursor_pos.x > pos.x and cursor_pos.x < (370 + pos.x)) then
				SPEED_BAR.width = math.floor(cursor_pos.x - pos.x)
				speed = remap(SPEED_BAR.width, 0, 370, 400, 10000)
				SPEED_TXT.text = "Speed (" .. number_format(math.floor(speed)) .. ")"
			end
		elseif(decel_hit_pressed) then
			local cursor_pos = Input.GetCursorPosition()
			local pos = SPEED_BAR:GetAbsolutePosition()

			if(cursor_pos.x > pos.x and cursor_pos.x < (370 + pos.x)) then
				DECEL_BAR.width = math.floor(cursor_pos.x - pos.x)
				decel_speed = remap(DECEL_BAR.width, 0, 370, 0, 5000)
				DECEL_TXT.text = "Deceleration (" .. number_format(math.floor(decel_speed)) .. ")"
			end
		end
	end
end

speed = remap(SPEED_BAR.width, 0, 370, 400, 10000)
SPEED_TXT.text = "Speed (" .. number_format(math.floor(speed)) .. ")"

decel_speed = remap(DECEL_BAR.width, 0, 370, 0, 5000)
DECEL_TXT.text = "Deceleration (" .. number_format(math.floor(decel_speed)) .. ")"

Events.BroadcastToServer("FreeCam.Speed", speed)
Events.BroadcastToServer("FreeCam.Decel", decel_speed)

TOGGLE_UI.pressedEvent:Connect(toggle_ui)
LOCK_CAMERA.pressedEvent:Connect(toggle_locked_camera)
SHOW_PLAYER.pressedEvent:Connect(toggle_player)
ENABLE_FLY.pressedEvent:Connect(toggle_fly)

SPEED_HIT.pressedEvent:Connect(on_speed_hit_pressed)
SPEED_HIT.releasedEvent:Connect(on_speed_hit_released)

DECEL_HIT.pressedEvent:Connect(on_decel_hit_pressed)
DECEL_HIT.releasedEvent:Connect(on_decel_hit_released)

Input.actionPressedEvent:Connect(on_action_pressed)