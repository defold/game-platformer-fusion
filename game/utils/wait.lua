local log = require("game.utils.log")

local M = {}

---Yields the current coroutine until a condition becomes true.
---A zero-delay timer checks once per frame, so the Defold update loop remains
---responsive while the asynchronous Fusion startup state changes.
---@param predicate fun(): boolean
function M.until_true(predicate)
	local thread = coroutine.running()
	assert(thread, "You must call this from within a coroutine")
	local waiting = true
	timer.delay(0, true, function(self, handle, time_elapsed)
		if predicate() then
			waiting = false
			timer.cancel(handle)
		end
		local ok, err = coroutine.resume(thread)
		if not ok then
			log("error while waiting for condition: %s", err)
			timer.cancel(handle)
			sys.exit(1)
		end
	end)
	while waiting do
		coroutine.yield()
	end
end

return M
