extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func input(event):
	if event.is_action_pressed("down_note"):
		modulate = Color("00ffff")
	if event.is_action_released("down_note"):
		modulate = Color("ffffff")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
