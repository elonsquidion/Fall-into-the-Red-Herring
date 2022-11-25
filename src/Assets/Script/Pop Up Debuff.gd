extends Node2D


var reverse_debuff = preload("res://Scenes/Reverse Debuff.tscn")
var spawn_time = null


# Called when the node enters the scene tree for the first time.
func _ready():
	start_timer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var debuffs = [reverse_debuff]
	var kinds = debuffs[randi()% debuffs.size()]
	var debuff = kinds.instance()
	debuff.position = Vector2(rand_range(10,990), rand_range(10,590))
	add_child(debuff)

func start_timer():
	spawn_time = rand_range(10,20)
	get_node("Timer").start(spawn_time)
