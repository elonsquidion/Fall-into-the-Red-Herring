extends Node2D

var player = preload("res://Scenes/Player.tscn")
onready var area_icon = get_node("Debuff icon") 


func passed(is_passed):
	return is_passed
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var player_instance = player.instance()
	$"Debuff icon".connect("body_entered", player_instance, "take_debuff")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_Debuff_icon_body_entered(body):
	queue_free()
