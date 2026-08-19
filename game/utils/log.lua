---Small fan-out logger used by the in-game console and standard output.
local M = {}


local _print = _G.print


local buffer = {}

---@param s string
M.buffer = function(s)
	if string.sub(s, -1) == "\n" then
		s = string.sub(s, 1, #s - 1)
	end
	table.insert(buffer, 1, s)
	table.remove(buffer, 100)
end

---@param s string
M.print = function(s)
	_print(s)
end


local outputs = { M.buffer, M.print }

---@param s string
local function logstring(s)
	for i=1, #outputs do
		outputs[i](s)
	end
end

---@param ... fun(message: string)
function M.init(...)
	outputs = { ... }
end

---@param fmt any
---@param ... any
function M.log(fmt, ...)
	local s = string.format(tostring(fmt), ...)
	logstring(s)
end

---@param ... any
_G.print = function(...)
	local s = ""
	local t = { ... }
	for i=1,#t do
		s = s .. tostring(t[i]) .. "    "
	end
	logstring(s)
end

---Returns an iterator over the newest buffered messages.
---@param n number|nil
---@return fun(): string|nil
function M.latest(n)
	local i = 1
	n = n or 20
	return function()
		local ret = nil
		if i <= n then
			ret = buffer[i]
			i = i + 1
		end
		return ret
	end
end

return setmetatable(M, {
	__call = function(t, ...)
		return M.log(...)
	end
})
