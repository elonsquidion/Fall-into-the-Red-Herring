extends Node

#var player_name
var highscore = 0
var audio = AudioStreamPlayer

func _ready():
	SilentWolf.configure({
		"api_key": "h1aKH9MHXS1XIqZx0yyGn5zPryReu4pt33WTu5vm",
		"game_id": "Lost",
		"game_version": "1.0.0",
		"log_level": 0
	})
	SilentWolf.configure_scores({
		"open_scene_on_close": "res://Scenes/Menu.tscn"
	})
	var auth_main = "res://Scenes/auth_main.tscn"
	SilentWolf.configure_auth_redirect_to_scene(auth_main)
#	SilentWolf.Scores.wipe_leaderboard()
