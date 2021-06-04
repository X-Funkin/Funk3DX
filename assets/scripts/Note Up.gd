extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func _ready():
	pass
	

func input(event):
	if event.is_action_pressed("up_note") or event.is_action_pressed("up_note_2"):
		$"Note Up Animation".play("Up Press")
		#modulate = Color("ff00ff")
	if event.is_action_released("up_note") or event.is_action_released("up_note_2"):
		$"Note Up Animation".stop()
		$"Note Up Animation".play("Up Default")
		#modulate = Color("ffffff")

func note_hit():
	$"Note Up Animation".stop()
	$"Note Up Animation".play("Up Confirm")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
