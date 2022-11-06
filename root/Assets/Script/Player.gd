extends KinematicBody2D

signal buff_activated(status)

export (int) var hit_points = 5

var score = 0
var highscore = 0
var direction = Vector2.ZERO
var movement = Vector2.ZERO

func _ready():
	pass

func buff():
	if hit_points == 0:
		return false
	else:
		emit_signal("buff_activated", "Buff")
	# kasih percabangan di sini, si user mau buff yang mana

func debuff():
	emit_signal("buff_activated", "Debuff")
	# kasih percabangan juga sama

func shield():
	pass

func immune():
	pass

func movement_speed():
	pass

func reverse():
	pass

func blindness():
	pass

func slow_movement():
	pass

func mechanics():
	if Input.is_action_just_pressed("right"):
		global_position.x += 70
	elif Input.is_action_just_pressed("left"):
		global_position.x -= 70
		
	if Input.is_action_just_pressed("down"):
		global_position.y += 70
	elif Input.is_action_just_pressed("up"):
		global_position.y -= 70
	
func _process(delta):
	highscore = max(highscore, score)

func _physics_process(_delta):
	mechanics()
	
	if Input.is_action_just_pressed("activate_buff"):
		buff()
		
	movement = move_and_slide(movement)

func take_damage(body, damage):
	var hp_bar = body.get_parent().get_node("HP Bar")
	body.hit_points -= damage
	hp_bar.value = body.hit_points
	if body.hit_points == 0:
		body.get_tree().reload_current_scene()
