local log = require("game.utils.log")

local M = {}

local co = nil
local co_message_id = nil

function M.until_true(fn)
	co = coroutine.running()
	assert(co, "You must call this from within a coroutine")
	local wait = true
	timer.delay(0, true, function(self, handle, time_elapsed)
		if fn() then
			wait = false
			timer.cancel(handle)
		end
		local ok, err = coroutine.resume(co)
		if not ok then
			log("error while waiting for condition: %s", err)
			timer.cancel(handle)
			sys.exit(1)
		end
	end)
	while wait do
		coroutine.yield()
	end
end

function M.until_elapsed(seconds)
	co = coroutine.running()
	assert(co, "You must call this from within a coroutine")
	timer.delay(seconds, false, function(self, handle, time_elapsed)
		local ok, err = coroutine.resume(co)
		if not ok then
			log("error while waiting for time to elapse: %s", err)
			sys.exit(1)
		end
	end)
	coroutine.yield()
end

function M.until_message(message_id)
	co = coroutine.running()
	assert(co, "You must call this from within a coroutine")
	co_message_id = message_id
	coroutine.yield()
end

function M.until_loaded(proxy_url)
	msg.post(proxy_url, "async_load")
	M.until_message(hash("proxy_loaded"))
	msg.post(proxy_url, "init")
	M.until_elapsed(0)
end

function M.handle_message(message_id, message, sender)
	if co_message_id == message_id then
		assert(co)
		co_message_id = nil
		local ok, err = coroutine.resume(co)
		if not ok then
			log("error while waiting for message: %s", err)
			sys.exit(1)
		end
	end
end

return M