extends Label


onready var timer = get_node("Buff Time")
onready var player = get_parent().get_parent().get_node("Player")

func _ready():
	player.connect("debuff_activated", self, "_on_Player_debuff_activated")

func _on_Player_debuff_activated(status):
	text = status
	timer.start(5)

func _on_Buff_Time_timeout():
	player.emit_signal("debuff_activated", " ")
	player.reverse = false
