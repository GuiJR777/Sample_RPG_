extends Node

onready var visible_value = $Value
onready var dice_color = $Body
onready var dice_name = $Name

export(bool) var show_dice_name = false
export(bool) var debug_log = false
export(float) var show_time = 5.0

var colors = {
	"blue" : Color(0, 0, 0.55, 1 ),
	"red" : Color(0.55, 0, 0, 1 ),
	"green" : Color(0, 0.55, 0, 1),
}

func sum(result_list, modifier):
	var result = 0
	for number in result_list:
		result+=int(number)
	result+=int(modifier)
	
	return result

func normal(result_list, face):
	return ["blue", result_list]

func vantage(result_list, face):
	result_list.append(int(rand_range(1, face)))
	result_list.sort()
	result_list.invert()
	if debug_log:
		print('Result list order ' + str(result_list))
	result_list.pop_back()
	if debug_log:
		print('Result list without min ' + str(result_list))
	
	return ["green", result_list]
	
func unvantage(result_list, face):
	result_list.append(int(rand_range(1, face)))
	result_list.sort()
	if debug_log:
		print('Result list order ' + str(result_list))
	result_list.pop_back()
	if debug_log:
		print('Result list without max ' + str(result_list))
	
	return ["red", result_list]
	
func rolling_type(type, result_list, face):
	if type == "vantage":
		return vantage(result_list, face)
	elif type == "unvantage":
		return unvantage(result_list, face)
	else:
		return normal(result_list, face)

func show(value: int, color: String, face: int):
	dice_color.modulate = colors[color]
	self.visible = true
	if show_dice_name:
		dice_name.text = "D"+str(face)
		dice_name.visible = true
	for i in range(7):
		visible_value.text = str(int(rand_range(1, 20)))
		yield(get_tree().create_timer(0.08), "timeout")
	visible_value.text = str(value)
	yield(get_tree().create_timer(show_time), "timeout")
	self.visible = false
	
func roll(face: int= 20, amount: int= 1, type: String= "normal", modifier: int = 0):
	if debug_log:
		print(
			"Rolling a "+str(amount)+"D"+str(face)+"+"+str(modifier)+
			" with "+type+" rolling.")
	var result_list = []
	for i in range(amount):
		result_list.append(int(rand_range(1, face)))
	if debug_log:
		print('Result list  ' + str(result_list))
	var typing = rolling_type(type, result_list, face)
	var color = typing[0]
	result_list = typing[1]
	var result = sum(result_list, modifier)
	if debug_log:
		print('Total ' + str(result-modifier)+" + "+str(modifier))
	show(result, color, face)
	
	return result
	
