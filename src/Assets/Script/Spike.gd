extends Area2D

onready var timer = get_node("Timer")
onready var point_area = get_node("Point Area")
var player = preload("res://Scenes/Player.tscn")
var passed = false

func _ready():
	var player_instance = player.instance()
# warning-ignore:return_value_discarded
	connect("body_entered", player_instance, "take_damage", [2])
	point_area.connect("body_entered", player_instance, "add_point", [1, self])
	timer.connect("timeout", self, "spike_down")
	timer.start(0.2)

func spike_down():
	position.y += 20

