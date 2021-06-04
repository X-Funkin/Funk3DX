extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func _ready():
	pass
	

func input(event):
	if event.is_action_pressed("down_note") or event.is_action_pressed("down_note_2"):
		$"Note Down Animation".play("Down Press")
		#modulate = Color("ff00ff")
	if event.is_action_released("down_note") or event.is_action_released("down_note_2"):
		$"Note Down Animation".stop()
		$"Note Down Animation".play("Down Default")
		#modulate = Color("ffffff")

func note_hit():
	$"Note Down Animation".stop()
	$"Note Down Animation".play("Down Confirm")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
