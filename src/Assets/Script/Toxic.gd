extends Area2D


onready var timer = get_node("Timer")
onready var hit_area = get_node("Hit Area")
var player = preload("res://Scenes/Player.tscn")
var passed = false

func _ready():
	var player_instance = player.instance()
# warning-ignore:return_value_discarded
	connect("body_entered", player_instance, "take_damage", [2])
	hit_area.connect("body_entered", player_instance, "add_point", [2, self])
	timer.connect("timeout", self, "toxic_down")
	timer.start(0.2)

func toxic_down():
	position.y += 64

