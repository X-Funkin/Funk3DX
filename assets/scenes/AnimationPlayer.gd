extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
var boppin = true
func recieve_beat(N, t):
	if N%2:
		if !is_playing() or boppin:
			boppin = true
			stop()
			play("player idle dance")
		
func recieve_player_hit(ms, note_n):
	print("player animation resciever hit boiis")
	boppin = false
	stop()
	match note_n:
		0:
			play("player note left")
		1:
			play("player note down")
		2:
			play("player note up")
		3:
			play("player note right")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
