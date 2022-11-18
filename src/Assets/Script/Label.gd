extends Label

var def_color

func _ready():
	def_color = get_color("font_color")
	print(def_color)

func hovered():
	add_color_override("font_color", Color(0,0,0,1))
	$"../../Menu Select".play()

func unhovered():
	add_color_override("font_color", def_color)
