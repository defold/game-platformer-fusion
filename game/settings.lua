---@class GameSettings
---@field LOCAL_PLATFORMER boolean Whether this process bypasses Fusion networking.
---@field FUSION_AVAILABLE boolean Whether the current target exposes the Fusion Lua API.
---@type GameSettings
local M = {}

-- Set to false to use the normal Fusion multiplayer connection flow.
M.LOCAL_PLATFORMER = false

-- Some targets (including x86_64 Linux in the current Fusion extension) link
-- a null extension and do not expose the Lua API at runtime.
M.FUSION_AVAILABLE = rawget(_G, "fusion") ~= nil

---Returns whether the compiled project settings contain a Fusion App ID.
---@return boolean
function M.has_fusion_app_id()
	return sys.get_config_string("fusion.app_id", "") ~= ""
end

---Switches this process to the offline gameplay path.
function M.enable_offline_session()
	M.LOCAL_PLATFORMER = true
end

return M
