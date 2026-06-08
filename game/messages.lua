local M = {}

M.RPC_COLLECTED = hash("rpc_collected")
M.RPC_REQUEST_COLLECTED = hash("rpc_request_collect")
M.RPC_RESPAWN_ALL_PLAYERS = hash("rpc_respawn_all_players")

M.COLLISION_RESPONSE = hash("collision_response")
M.CONTACT_POINT_RESPONSE = hash("contact_point_response")
M.COIN_COLLECTED = hash("coin_collected")
M.UPDATE_COIN_UI = hash("update_coin_ui")
M.FLAG_REACHED = hash("flag_reached")
M.SPAWN_PLAYER = hash("spawn_player")
M.GAME_WINNER_CHANGED = hash("game_winner_changed")

return M