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
<<<<<<< HEAD
	connect("body_entered", player_instance, "take_damage", [1])
	hit_area.connect("body_entered", player_instance, "add_point", [1])
	timer.connect("timeout", self, "toxic_down")
	timer.start(0.2)
=======
	connect("body_entered", player_instance, "take_damage", [2])
	hit_area.connect("body_entered", player_instance, "add_point", [2])
	timer.connect("timeout", self, "toxic_stop")
	timer.start(0.1)
>>>>>>> c2f6544e6b9db018552ed6e4ffaf0c59f72092cd

func toxic_down():
	position.y += 20

