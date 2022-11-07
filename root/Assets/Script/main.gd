extends Node2D

func _ready():
	pass
		
func _physics_process(_delta):
	pass

func _on_Vanisher_area_entered(area):
	area.queue_free()
