extends Node2D


var shield_buff = preload("res://Scenes/Shield Buff.tscn")
var immune_buff = preload("res://Scenes/Immune Buff.tscn")
var movement_buff = preload("res://Scenes/Movement Speed Buff.tscn")
var spawn_time = null

func _on_Timer_timeout():
	randomize()
	var buffs = [shield_buff, immune_buff, movement_buff]
	var kinds = buffs[randi()% buffs.size()]
	var buff = kinds.instance()
	buff.position = Vector2(rand_range(10,990), rand_range(10,590))
	add_child(buff)
	spawn_time = rand_range(15,30)
	
	
