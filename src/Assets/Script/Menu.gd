extends Control

const highscore_file = "user://highscore.txt"

func _ready():
	var player_scores = yield(SilentWolf.Scores.get_scores_by_player(SilentWolf.Players.player_name), "sw_player_scores_received")
	print("Got player scores: " + str(player_scores))
	print("Got: " + str(player_scores.size()) + " scores for player: " + str(SilentWolf.Players.player_name))
	print("Does player have scores? " + str(player_scores.size() > 0))  
	var label = get_node("Label")
	if player_scores.size() > 0:
		Global.highscore = player_scores[0]["score"]
	label.text = "Highscore: " + str(Global.highscore)
	$Name.text = "Welcome, " + str(SilentWolf.Players.player_name) + "!"
	get_tree().paused = false

func _on_Start_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/main.tscn")

func _on_Options_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Options.tscn")

func _on_Quit_pressed():
	get_tree().quit()

func _on_Button_pressed():
	pass # Replace with function body.

func _on_Leaderboard_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://addons/silent_wolf/Scores/Leaderboard.tscn")
