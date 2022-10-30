extends KinematicBody2D

export (int) var speed = 300
var direction = Vector2.ZERO
var movement = Vector2.ZERO

func buff():
	pass

func mechanics():
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	movement = speed * direction
	
func _physics_process(_delta):
	mechanics()
	
	if Input.is_action_just_pressed("activate_buff"):
		buff()
		
	movement = move_and_slide(movement)
