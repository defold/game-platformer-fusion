local M = {}

M.RPC_COIN_COLLECTED = hash("rpc_coin_collected")
M.RPC_REQUEST_COIN_COLLECTED = hash("rpc_request_coin_collect")
M.RPC_RESPAWN_ALL_PLAYERS = hash("rpc_respawn_all_players")
M.RPC_ENABLE = hash("rpc_enable")
M.RPC_DISABLE = hash("rpc_disable")
M.RPC_JUMP = hash("rpc_jump")
M.RPC_LAND = hash("rpc_land")

M.COLLISION_RESPONSE = hash("collision_response")
M.CONTACT_POINT_RESPONSE = hash("contact_point_response")
M.UPDATE_COIN_UI = hash("update_coin_ui")
M.FLAG_REACHED = hash("flag_reached")
M.SPAWN_PLAYER = hash("spawn_player")
M.GAME_WINNER_CHANGED = hash("game_winner_changed")

M.SOUND_COIN_COLLECTED = hash("sound_coin_collected")
M.SOUND_JUMP = hash("sound_jump")
M.SOUND_LAND = hash("sound_land")

return M