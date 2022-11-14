extends Node

const player_name_f = "user://name.txt"

var highscore = 0
var player_name

func _ready():
	var f = File.new()
	if not f.file_exists(player_name_f):
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Scenes/Create.tscn")
