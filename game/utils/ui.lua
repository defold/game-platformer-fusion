local M = {}

---@class GuiInputState
---@field input node|nil Text node that currently owns keyboard input.
---@field pressed node|nil Node pressed by the current pointer gesture.

---@param node node
---@param x number
---@param y number
---@return boolean
local function is_picked(node, x, y)
	return gui.is_enabled(node, true) and gui.pick_node(node, x, y)
end

---@param id string|hash
function M.hide(id)
	gui.set_enabled(gui.get_node(id), false)
end

---Updates one text field and returns its current value.
---@param self GuiInputState
---@param id string|hash
---@param action_id hash|nil
---@param action table
---@return string
function M.input(self, id, action_id, action)
	local node = gui.get_node(id)
	if action.x and action.y then
		if action.pressed then
			self.input = nil
			if is_picked(node, action.x, action.y) then
				self.pressed = node
			end
		elseif action.released then
			if is_picked(node, action.x, action.y) then
				if self.pressed == node then
					self.input = node
					self.pressed = nil
				end
			end
		end
	end

	local text = gui.get_text(node)
	if action_id == hash("backspace") then
		if action.released and self.input == node then
			text = text:sub(1, -2)
			gui.set_text(node, text)
		end
	elseif action.text then
		if self.input == node then
			text = text .. action.text
			gui.set_text(node, text)
		end
	end
	return text
end

---@param self GuiInputState
---@param id string|hash
---@param action table
---@return boolean|nil
function M.button(self, id, action)
	if not action.x or not action.y then
		return
	end

	-- check the currently pressed button if the mouse is still on top of it
	if self.pressed then
		if not is_picked(self.pressed, action.x, action.y) then
			gui.set_scale(self.pressed, vmath.vector4(1.0))
			self.pressed = nil
		end
	end

	local node = gui.get_node(id)
	if is_picked(node, action.x, action.y) then
		if action.pressed then
			gui.set_scale(node, vmath.vector4(1.05))
			self.pressed = node
		elseif action.released then
			if self.pressed then
				gui.set_scale(self.pressed, vmath.vector4(1.0))
				local clicked = node == self.pressed
				self.pressed = nil
				return clicked
			end
		end
	end
	return false
end

return M
