extends KinematicBody2D

signal buff_activated(status)

const highscore_file = "user://highscore.txt"
export var hit_points = 5
var score = 0
var highscore = 0
var direction = Vector2.ZERO
var movement = Vector2.ZERO

func _ready():
#	reset_highscore()
	load_score()
	var score_bar = get_parent().get_node("Highscore")
	score_bar.text = "Highscore: " + str(highscore)

func _process(_delta):
	highscore = max(highscore, score)

func _physics_process(_delta):
	mechanics()
	
	if Input.is_action_just_pressed("activate_buff"):
		buff()
		
	movement = move_and_slide(movement)

func load_score():
	var f = File.new()
	if f.file_exists(highscore_file):
		f.open(highscore_file, File.READ)
		var content = f.get_as_text()
		highscore = int(content)
		f.close()

func save_score(new):
	var f = File.new()
	f.open(highscore_file, File.WRITE)
	f.store_string(str(new))
	f.close()

func reset_highscore():
	var f = File.new()
	f.open(highscore_file, File.WRITE)
	f.store_string(str(0))
	f.close()


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
	if Input.is_action_just_pressed("right") and position.x < 1200:
		global_position.x += 160
	elif Input.is_action_just_pressed("left") and position.x > 80:
		global_position.x -= 160
		
	if Input.is_action_just_pressed("down") and position.y < 560:
		global_position.y += 160
	elif Input.is_action_just_pressed("up"):
		global_position.y -= 160


func take_damage(body, damage):
	var hp_bar = body.get_parent().get_node("HP Bar")
	body.hit_points -= damage
	hp_bar.value = body.hit_points
	if body.hit_points == 0:
		save_score(body.highscore)
		body.get_tree().reload_current_scene()

func add_point(body, point):
	var score_bar = body.get_parent().get_node("Score")
	var highscore_bar = body.get_parent().get_node("Highscore")
	body.score += point
	score_bar.text = "Score: " +  str(body.score)
	if body.score <= body.highscore:
		highscore_bar.text = "Highscore: " + str(body.highscore)
	else:
		highscore_bar.text = "Highscore: " + str(body.highscore + 1)
