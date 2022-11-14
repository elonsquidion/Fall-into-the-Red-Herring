extends KinematicBody2D

signal buff_activated(status)

const highscore_file = "user://highscore.txt"
const heart_size = 64
export var max_hp = 5

onready var start = get_parent().get_node("UI/Start")
onready var game_over = get_parent().get_node("UI/Game Over")
var hit_points = max_hp
var score = 0
var highscore = 0
var direction = Vector2.ZERO
var movement = Vector2.ZERO
var new_high = false

func _ready():
#	reset_highscore()
	load_score()
	var score_bar = get_parent().get_node("UI/Highscore")
	var hp_bar = get_parent().get_node("UI/HP Bar")
	new_high = false
	start.visible = true
	score_bar.text = "Highscore: " + str(highscore)
	hp_bar.rect_size.x = hit_points * heart_size

func _input(event):
	if event is InputEventKey:
		if event.pressed and start.visible:
			start.set_visible(false)
			get_tree().paused = false

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
	if Input.is_action_just_pressed("right") and position.x < 1248:
		global_position.x += 64
	elif Input.is_action_just_pressed("left") and position.x > 32:
		global_position.x -= 64
		
	if Input.is_action_just_pressed("down") and position.y < 608:
		global_position.y += 64
	elif Input.is_action_just_pressed("up") and position.y > 204:
		global_position.y -= 64

func take_damage(body, damage):
	var hp_bar = body.get_parent().get_node("UI/HP Bar")
	body.hit_points -= damage
	hp_bar.rect_size.x = body.hit_points * body.heart_size
	if body.hit_points == 0:
		save_score(body.highscore)
		if body.new_high:
			SilentWolf.Scores.persist_score(Global.player_name, body.highscore)
		body.game_over.visible = true
		body.get_tree().paused = true

func add_point(body, point):
	var score_bar = body.get_parent().get_node("UI/Score")
	var highscore_bar = body.get_parent().get_node("UI/Highscore")
	body.score += point
	score_bar.text = "Score: " +  str(body.score)
	if body.score <= body.highscore:
		highscore_bar.text = "Highscore: " + str(body.highscore)
	else:
		body.new_high = true
		highscore_bar.text = "Highscore: " + str(body.highscore + 1)
