extends Control

func _on_Button_pressed():
	Global.player_name = get_node("VBoxContainer/LineEdit").text
	var f = File.new()
	f.open(Global.player_name_f, File.WRITE_READ)
	f.store_string(str(Global.player_name))
	var content = f.get_as_text()
	Global.player_name = str(content)
	f.close()
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Menu.tscn")
