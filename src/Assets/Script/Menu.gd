extends Control

const highscore_file = "user://highscore.txt"
var highscore = 0

func _ready():
	get_tree().paused = false
	var name = $Name
	var container = $VBoxContainer
	var f = File.new()
	f.open(Global.player_name_f, File.READ)
	var content = f.get_as_text()
	Global.player_name = content
	name.text = "Welcome, " + str(Global.player_name) + "!"
	f.close()
	container.rect_pivot_offset = container.rect_size / 2
	print(container.rect_size)
	print(container.rect_pivot_offset)
	
	load_score()

func load_score():
	var f = File.new()
	var label = get_node("VBoxContainer/Label")
	if f.file_exists(highscore_file):
		f.open(highscore_file, File.READ)
		var content = f.get_as_text()
		highscore = int(content)
		f.close()
	label.text = "Highscore: " + str(highscore)

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
