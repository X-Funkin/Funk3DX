extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func _ready():
	pass
	
func input(event):
	if event.is_action_pressed("right_note") or event.is_action_pressed("right_note_2"):
		$"Note Right Animation".play("Right Press")
		#modulate = Color("ff0000")
	if event.is_action_released("right_note") or event.is_action_released("right_note_2"):
		$"Note Right Animation".stop()
		$"Note Right Animation".play("Right Default")
		#modulate = Color("ffffff")

func note_hit():
	$"Note Right Animation".stop()
	$"Note Right Animation".play("Right Confirm")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
