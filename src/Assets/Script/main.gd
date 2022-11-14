extends Node2D

func _ready():
	var player_name = $"UI/Player Name"
	print(Global.player_name)
	player_name.text = str(Global.player_name)
	get_tree().paused = true
		
func _physics_process(_delta):
	pass

func _on_Vanisher_area_entered(area):
	area.queue_free()

func _on_Retry_pressed():
	print("jancokkk")
	get_tree().reload_current_scene()

func _on_Menu_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
