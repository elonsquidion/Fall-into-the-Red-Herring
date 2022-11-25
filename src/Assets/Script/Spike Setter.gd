extends Node2D

var spawn_positions = null
var spike = preload("res://Scenes/Spike.tscn")
var time = 7

func _ready():
	randomize()
	spawn_positions = $"Spike Positions".get_children()
	start_timer()

func _on_Timer_timeout():
	print("jancokk")
	var spike_instance = spike.instance()
	var index = randi() % spawn_positions.size()
	spike_instance.global_position = spawn_positions[index].global_position
	add_child(spike_instance)
	start_timer()

func _process(delta):
	time -= (0.05*delta)
	time = max(time, 2)
#	print(time)

func start_timer():
	get_node("Timer").start(time)
