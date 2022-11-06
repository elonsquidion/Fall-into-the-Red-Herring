extends Area2D

onready var timer = get_node("Timer")
var player = preload("res://Scenes/Player.tscn")
var is_passed = false

func passed(is_passed):
	return is_passed

func _ready():
	var player_instance = player.instance()
	connect("body_entered", player_instance, "take_damage", [1])
	timer.connect("timeout", self, "spike_down")
	timer.start(0.2)

func spike_down():
	position.y += 64

