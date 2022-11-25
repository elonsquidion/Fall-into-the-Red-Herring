extends KinematicBody2D

# warning-ignore:unused_signal
signal buff_activated(status)
# warning-ignore:unused_signal
signal debuff_activated(status)

const highscore_file = "user://highscore.txt"
const heart_size = 50
export var max_hp = 24

var immune = false
var reverse = false
var shield_hp = 0
var hit_points = max_hp
var score = 0
var highscore = Global.highscore
var direction = Vector2.ZERO
var movement = Vector2.ZERO
var new_high

onready var animation = get_node("Sprite")
onready var dmg_audio = $"../dmg"
onready var fts_audio = $"../footstep"

func _ready():
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

func take_buff(player):
	player.emit_signal("buff_activated", "Immune")
	player.immune = true
	
func take_debuff(player):
	player.reverse = true
	player.emit_signal("debuff_activated", "Reverse")

func reverse_mechanics():
	if Input.is_action_pressed("right") and position.x > 32:
		fts_audio.playing = true
		animation.play("left")
		global_position.x -= 10
	elif Input.is_action_pressed("left") and position.x < 1248:
		fts_audio.playing = true
		animation.play("right")
		global_position.x += 10	
	elif Input.is_action_pressed("down") and position.y > 204:
		fts_audio.playing = true
		animation.play("back")
		global_position.y -= 10
	elif Input.is_action_pressed("up") and position.y < 608:
		fts_audio.playing = true
		animation.play("front")
		global_position.y += 10

func mechanics():
	if Input.is_action_pressed("right") and position.x < 1248:
		fts_audio.playing = true
		animation.play("right")
		global_position.x += 10
	elif Input.is_action_pressed("left") and position.x > 32:
		fts_audio.playing = true
		animation.play("left")
		global_position.x -= 10
	elif Input.is_action_pressed("down") and position.y < 608:
		fts_audio.playing = true
		animation.play("front")
		global_position.y += 10
	elif Input.is_action_pressed("up") and position.y > 204:
		fts_audio.playing = true
		animation.play("back")
		global_position.y -= 10


func take_damage(body, damage):
	var hp_bar = body.get_parent().get_node("UI/HP Bar")
	if body.immune == false :
		body.dmg_audio.playing = true
		body.hit_points -= damage
		hp_bar.rect_size.x = body.hit_points * body.heart_size
	else:
		damage = 0
		body.hit_points -= damage
		hp_bar.rect_size.x = body.hit_points * body.heart_size
	if body.hit_points <= 0:
		if body.new_high:
			SilentWolf.Scores.persist_score(SilentWolf.Players.player_name, Global.highscore)
		body.back_menu()


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

func back_menu():
	get_tree().change_scene("res://Scenes/Menu.tscn")
	get_parent().get_node("bg2").queue_free()
	bg_music.playing = true
