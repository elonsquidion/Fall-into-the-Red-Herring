extends Label


onready var timer = get_node("Buff Time")
onready var player = get_parent().get_node("Player")


func _on_Player_buff_activated(status):
	text = "Status: " + status
	timer.start(5)

func _on_Buff_Time_timeout():
	player.emit_signal("buff_activated", "-")
