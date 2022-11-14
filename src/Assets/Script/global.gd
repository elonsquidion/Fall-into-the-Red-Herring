extends Node

const player_name_f = "user://name.txt"

var highscore = 0
var player_name

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
#	SilentWolf.Scores.wipe_leaderboard()
	var f = File.new()
	if not f.file_exists(player_name_f):
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Scenes/Create.tscn")
