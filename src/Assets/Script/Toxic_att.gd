extends Node2D


# Declare member variables here. Examples:
var spawn_positions = null
var toxic = preload("res://Scenes/Toxic.tscn")

func _ready():
	randomize()
	spawn_positions = $"Toxic Positions".get_children()

func _on_Timer_timeout():
	var toxic_instance = toxic.instance()
	var index = randi() % spawn_positions.size()
	toxic_instance.global_position = spawn_positions[index].global_position
	add_child(toxic_instance)
