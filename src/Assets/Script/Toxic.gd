extends Area2D


onready var timer = get_node("Timer")
var player = preload("res://Scenes/Player.tscn")
onready var hit_area = get_node("Hit Area")


# Called when the node enters the scene tree for the first time.
func passed(is_passed):
	return is_passed

func _ready():
	var player_instance = player.instance()
# warning-ignore:return_value_discarded
	connect("body_entered", player_instance, "take_damage", [2])
	hit_area.connect("body_entered", player_instance, "add_point", [2])
	timer.connect("timeout", self, "toxic_stop")
	timer.start(0.1)

func toxic_stop():
	position.y += 64

