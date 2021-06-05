extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
var boppin = true
func recieve_beat(N, t):
	if !is_playing() or boppin:
		boppin = true
		if N%2:
			play("Partner Dance Left")
		if !N%2:
			play("Partner Dance Right")

func point_left():
	boppin = false
	stop()
	play("Partner Note Left")

func point_right():
	boppin = false
	stop()
	play("Partner Note Right")
	

func cheer():
	boppin = false
	stop()
	play("Partner Cheer")

func cheer_short():
	boppin = false
	stop()
	play("Partner Cheer Short")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
