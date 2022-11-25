extends Area2D

signal last_frame

onready var timer = get_node("Timer")
onready var point_area = get_node("Point Area")
onready var count = 0
var player = preload("res://Scenes/Player.tscn")
var passed = false
var time = 0.8

func _ready():
	var player_instance = player.instance()
# warning-ignore:return_value_discarded
	connect("body_entered", player_instance, "take_damage", [2])
	connect("last_frame", self, "spike_down")
	point_area.connect("body_entered", player_instance, "add_point", [1, self])
	timer.connect("timeout", self, "spike_down")
	timer.start(time)
	$"Spike Area/AnimatedSprite".play("default")
	$"Spike Area/AnimatedSprite2".play("default")
	$"Spike Area/AnimatedSprite3".play("default")
	$"Spike Area/AnimatedSprite4".play("default")
	$"Spike Area/AnimatedSprite5".play("default")
	$"Spike Area/AnimatedSprite6".play("default")

func spike_down():
	$AudioStreamPlayer.playing = true
	position.y += 64
	
func _physics_process(delta): 
	pass
	time -= 0.01*delta
	time = max(time, 0.2)
	$"Spike Area/AnimatedSprite".frames.set_animation_speed("default", 7/time)
	$"Spike Area/AnimatedSprite2".frames.set_animation_speed("default", 7/time)
	$"Spike Area/AnimatedSprite3".frames.set_animation_speed("default", 7/time)
	$"Spike Area/AnimatedSprite4".frames.set_animation_speed("default", 7/time)
	$"Spike Area/AnimatedSprite5".frames.set_animation_speed("default", 7/time)
	$"Spike Area/AnimatedSprite6".frames.set_animation_speed("default", 7/time)
