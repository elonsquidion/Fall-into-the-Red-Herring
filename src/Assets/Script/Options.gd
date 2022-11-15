extends Control

const highscore_file = "user://highscore.txt"
onready var container = $VBoxContainer

func _ready():
	container.rect_pivot_offset = container.rect_size / 2

func _on_Change_Username_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Change.tscn")

func _on_Log_Out_pressed():
	SilentWolf.Auth.logout_player()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/auth_main.tscn")

func _on_Menu_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Menu.tscn")
