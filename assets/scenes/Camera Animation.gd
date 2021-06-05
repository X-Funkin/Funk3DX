extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func anim_start():
	sky_tilt()

func sky_tilt():
	stop()
	play("Tilt From Sky")
func partner_pan():
	stop()
	play("Dolly from Partner")
func player_pan():
	stop()
	play("Pan from Player")
func to_default():
	stop()
	play("Dolly to Default")
func default():
	stop()
	play("Default")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
