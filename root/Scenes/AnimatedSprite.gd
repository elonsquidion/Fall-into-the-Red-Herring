extends KinematicBody2D

export var speed = 300

var motion = Vector2.ZERO

func _physics_process(delta):
	motion.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	
