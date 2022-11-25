extends Node2D

var player = preload("res://Scenes/Player.tscn")
onready var area_icon = get_node("Buff Icon") 


func passed(is_passed):
	return is_passed
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var player_instance = player.instance()
	$"Buff Icon".connect("body_entered", player_instance, "take_buff")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Buff_Icon_body_entered(body):
	queue_free()
