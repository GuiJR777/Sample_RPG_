extends Control

export(NodePath) onready var player = get_node(player)

var roll_types = ['normal', 'vantage', 'unvantage']
var selected_type = 0

func _process(delta):
	var type = roll_types[selected_type]
	player.show_dice_log = $LogsCheck.pressed
	player.show_dice_name = $DiceNameCheck.pressed
	player.dice_rooling_type = type
	$DiceType.text = type.capitalize()
	if $FacesDice.text and $FacesDice.text.is_valid_integer():
		player.dice_faces = int($FacesDice.text)
	if $Modifier.text and $Modifier.text.is_valid_integer():
		player.player_modifier = int($Modifier.text)
	if $AmountDices.text and $AmountDices.text.is_valid_integer():
		player.amount_dices = int($AmountDices.text)


func _on_ButtonLeft_pressed():
	if selected_type == 0:
			selected_type = len(roll_types) - 1
	else:
		selected_type+=-1


func _on_ButtonRight_pressed():
	if selected_type == len(roll_types) - 1:
			selected_type = 0
	else:
		selected_type+=1
