extends Node2D


# Declare member variables here. Examples:
var spawn_positions = null
var roots = preload("res://Scenes/Roots.tscn")

func _ready():
	randomize()
	spawn_positions = $"Roots Positions".get_children()

func _on_Timer_timeout():
	var roots_instance = roots.instance()
	var index = randi() % spawn_positions.size()
	roots_instance.global_position = spawn_positions[index].global_position
	add_child(roots_instance)
	
