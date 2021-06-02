extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func recieve_beat(N, t):
	if !is_playing():
		if N%2:
			play("Partner Dance Left")
		if !N%2:
			play("Partner Dance Right")

func point_left():
	stop()
	play("Partner Note Left")

func point_right():
	stop()
	play("Partner Note Right")
	

func cheer():
	stop()
	play("Partner Cheer")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
