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
	connect("body_entered", player_instance, "take_debuff")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Debuff_icon_area_entered(area):
	queue_free()
