extends Node2D

func _ready():
	$"UI/Name".text = str(SilentWolf.Players.player_name)
	$bg2.playing = true
		
func _physics_process(_delta):
	bg_music.stop()

func _on_Vanisher_area_entered(area):
	area.queue_free()
	
