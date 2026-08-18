---Message and RPC identifiers used by the gameplay collection.
---Keeping the protocol in one module prevents senders and receivers from
---silently drifting to different string hashes.
---@class GameMessages
---@field RPC_COIN_COLLECTED hash Coin authority confirmed a score increment.
---@field RPC_REQUEST_COIN_COLLECTED hash Collector requested authority validation.
---@field RPC_RESPAWN_ALL_PLAYERS hash Winner authority started a new round.
---@field RPC_ENABLE hash Re-enable a replicated gameplay object.
---@field RPC_DISABLE hash Disable a replicated gameplay object.
---@field RPC_JUMP hash Play a replicated jump sound.
---@field RPC_LAND hash Play a replicated landing sound.
---@field COLLISION_RESPONSE hash Defold trigger collision response.
---@field CONTACT_POINT_RESPONSE hash Defold contact-point response.
---@field UPDATE_COIN_UI hash Update the local confirmed-coin display.
---@field SET_GAME_GOAL hash Configure the coin target shown by the GUI.
---@field FLAG_REACHED hash Ask the game authority to validate a winner.
---@field GAME_WINNER_CHANGED hash Present a winner locally.
---@field FOLLOW_SHADOW_TARGET hash Make the shadow camera follow a visual object.
---@field RESET_PLAYER hash Reset the locally owned player for a new round.
---@field SOUND_COIN_COLLECTED hash Play the local coin sound.
---@field SOUND_JUMP hash Play the local jump sound.
---@field SOUND_LAND hash Play the local landing sound.
---@type GameMessages
local M = {
	RPC_COIN_COLLECTED = hash("rpc_coin_collected"),
	RPC_REQUEST_COIN_COLLECTED = hash("rpc_request_coin_collect"),
	RPC_RESPAWN_ALL_PLAYERS = hash("rpc_respawn_all_players"),
	RPC_ENABLE = hash("rpc_enable"),
	RPC_DISABLE = hash("rpc_disable"),
	RPC_JUMP = hash("rpc_jump"),
	RPC_LAND = hash("rpc_land"),

	COLLISION_RESPONSE = hash("collision_response"),
	CONTACT_POINT_RESPONSE = hash("contact_point_response"),
	UPDATE_COIN_UI = hash("update_coin_ui"),
	SET_GAME_GOAL = hash("set_game_goal"),
	FLAG_REACHED = hash("flag_reached"),
	GAME_WINNER_CHANGED = hash("game_winner_changed"),
	FOLLOW_SHADOW_TARGET = hash("follow_shadow_target"),
	RESET_PLAYER = hash("reset_player"),

	SOUND_COIN_COLLECTED = hash("sound_coin_collected"),
	SOUND_JUMP = hash("sound_jump"),
	SOUND_LAND = hash("sound_land"),
}

return M
