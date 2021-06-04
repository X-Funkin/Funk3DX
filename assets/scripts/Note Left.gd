extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func _ready():
	pass
	
func input(event):
	if event.is_action_pressed("left_note") or event.is_action_pressed("left_note_2"):
		print("NOTE INPUTE EVENT ", event.pressed)
		$"Note Left Animation".play("Left Press")
		#modulate = Color("ff00ff")
	if event.is_action_released("left_note") or event.is_action_released("left_note_2"):
		print("NOTE INPUTE EVENT ", event.pressed)
		$"Note Left Animation".stop()
		$"Note Left Animation".play("Left Default")
		#modulate = Color("ffffff")
#func _input(event):
#	event.to_string()
#
func note_hit():
	$"Note Left Animation".stop()
	$"Note Left Animation".play("Left Confirm")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
