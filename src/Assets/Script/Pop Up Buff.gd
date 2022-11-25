extends Node2D


var immune_buff = preload("res://Scenes/Immune Buff.tscn")
var spawn_time = null
	
func _on_Timer_timeout():
	var buffs = [immune_buff]
	var kinds = buffs[randi()% buffs.size()]
	var buff = kinds.instance()
	buff.position = Vector2(rand_range(10,990), rand_range(10,590))
	add_child(buff)

func start_timer():
	spawn_time = rand_range(1,5)
	get_node("Timer").start(spawn_time)
	
