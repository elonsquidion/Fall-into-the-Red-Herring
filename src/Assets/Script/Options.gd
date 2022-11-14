extends Control

const highscore_file = "user://highscore.txt"
onready var container = $VBoxContainer

func _ready():
	container.rect_pivot_offset = container.rect_size / 2
func _on_Reset_Highscore_pressed():
	var f = File.new()
	f.open(highscore_file, File.WRITE)
	f.store_string(str(0))
	f.close()

func _on_Menu_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Menu.tscn")

func _on_Change_Username_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Change.tscn")
