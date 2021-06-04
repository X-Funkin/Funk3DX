extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
var boppin = true
func recieve_beat(N, t):
	if !N%2:
		if !is_playing() or boppin:
			boppin = true
			stop()
			play("Enemy Idle Dance")

func recieve_enemy_hit(ms, note_n):
	boppin = false
	stop()
	match note_n:
		0:
			play("Enemy Note Left")
		1:
			play("Enemy Note Down")
		2:
			play("Enemy Note Up")
		3:
			play("Enemy Note Right")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
