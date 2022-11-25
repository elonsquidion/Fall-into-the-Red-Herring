extends KinematicBody2D

# warning-ignore:unused_signal
signal buff_activated(status)
# warning-ignore:unused_signal
signal debuff_activated(status)

const highscore_file = "user://highscore.txt"
const heart_size = 64
export var max_hp = 5

var immune = false
var reverse = false
var shield_hp = 0
var hit_points = max_hp
var score = 0
var highscore = 0
var direction = Vector2.ZERO
var movement = Vector2.ZERO
var new_high


func _ready():
#	reset_highscore()
	load_score()
	var score_bar = get_parent().get_node("UI/Highscore")
	var hp_bar = get_parent().get_node("UI/HP Bar")
	new_high = false
	score_bar.text = "Highscore: " + str(highscore)
	hp_bar.rect_size.x = hit_points * heart_size

func _process(_delta):
	highscore = max(highscore, score)

func _physics_process(_delta):
	if reverse:
		reverse_mechanics()
	else:
		mechanics()

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


func take_buff(player):
	player.emit_signal("buff_activated", "Immune")
	player.immune = true
	
func take_debuff(player):
	player.reverse = true
	player.emit_signal("debuff_activated", "Reverse")

func reverse_mechanics():
	if Input.is_action_just_pressed("right") and position.x > 32:
		global_position.x -= 64
	elif Input.is_action_just_pressed("left") and position.x < 1248:
		global_position.x += 64
		
	if Input.is_action_just_pressed("down") and position.y > 204:
		global_position.y -= 64
	elif Input.is_action_just_pressed("up") and position.y < 608:
		global_position.y += 64
	


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
	if body.immune == false :
		body.hit_points -= damage
		hp_bar.rect_size.x = body.hit_points * body.heart_size
	else:
		damage = 0
		body.hit_points -= damage
		hp_bar.rect_size.x = body.hit_points * body.heart_size
	if body.hit_points <= 0:
		if body.new_high:
			SilentWolf.Scores.persist_score(SilentWolf.Players.player_name, Global.highscore)
		body.get_tree().reload_current_scene()
#		body.game_over.visible = true
#		body.get_tree().paused = true

func add_point(body, point, area):
	var score_bar = body.get_parent().get_node("UI/Score")
	var highscore_bar = body.get_parent().get_node("UI/Highscore")
	if not area.passed:
		body.score += point
		score_bar.text = "Score: " +  str(body.score)
		area.passed = true
	if body.score <= body.highscore:
		new_high = true
		highscore_bar.text = "Highscore: " + str(body.highscore)
	else:
		highscore_bar.text = "Highscore: " + str(body.highscore + 1)
