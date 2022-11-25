extends Label


onready var timer = get_node("Buff Time")
onready var player = get_parent().get_parent().get_node("Player")

func _ready():
	print("tolonglah asu")
	player.connect("buff_activated", self, "_on_Player_buff_activated")

func _on_Player_buff_activated(status):
	print("hueeeeeeee")
	print(status)
	text = "Status: " + status
	timer.start(5)

func _on_Buff_Time_timeout():
	player.emit_signal("buff_activated", "-")
