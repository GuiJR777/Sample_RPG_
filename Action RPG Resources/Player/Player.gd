extends KinematicBody2D


onready var player_animation = $AnimationPlayer
onready var player_animation_tree = $AnimationTree
onready var dice = $Dice
onready var animation_state = player_animation_tree.get("parameters/playback")
# Dice variables
export(bool) var show_dice_log = false
export(bool) var show_dice_name = false
export(int) var dice_faces = 20
export(int) var amount_dices = 1
export(int) var player_modifier = 0
export(String) var dice_rooling_type = 'normal'

var velocity = Vector2(0,0)
var atrict = 800
var last_roll = 0


func _physics_process(delta):
	basic_movement(delta)
	roll_dices()
	
	
func basic_movement(delta):
	var result = Vector2(0,0)
	var max_speed = 75
	var aceleration = 250
	if Input.is_action_pressed("ui_shift"):
		max_speed = 120
		aceleration = 500
	result.x = Input.get_action_strength("ui_d") - Input.get_action_strength("ui_a")
	result.y = Input.get_action_strength("ui_s") - Input.get_action_strength("ui_w")
	result = result.normalized()
	
	if result != Vector2(0,0):
		player_animation_tree.set("parameters/Walk/blend_position", result)
		player_animation_tree.set("parameters/Idle/blend_position", result)
		velocity = velocity.move_toward(result * max_speed, aceleration * delta)
		animation_state.travel("Walk")
	else:
		velocity = velocity.move_toward(Vector2(0,0), atrict * delta)
		animation_state.travel("Idle")

	move_and_slide(velocity)
	
func roll_dices():
	if Input.is_action_just_pressed("Roll"):
		dice.show_dice_name = show_dice_name
		dice.debug_log = show_dice_log
		last_roll = dice.roll(dice_faces,amount_dices,dice_rooling_type,player_modifier)
		print(last_roll)
	
	
