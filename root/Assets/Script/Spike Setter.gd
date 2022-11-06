extends Node2D

var spawn_positions = null
var spike = preload("res://Scenes/Spike.tscn")

func _ready():
	randomize()
	spawn_positions = $"Spike Positions".get_children()

func _on_Timer_timeout():
	var spike_instance = spike.instance()
	var index = randi() % spawn_positions.size()
	spike_instance.global_position = spawn_positions[index].global_position
	if index == 0 or index == 2:
		spike_instance.scale.x = 5
	else:
		spike_instance.scale.x = 7
	add_child(spike_instance)
	
