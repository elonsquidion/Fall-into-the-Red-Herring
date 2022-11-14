extends Control

onready var retry = get_node("VBoxContainer/Retry")
onready var menu = get_node("VBoxContainer/Menu")


func _on_Menu_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Menu.tscn")
