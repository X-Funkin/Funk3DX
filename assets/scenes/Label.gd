extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func recieve_player_hit(ms):
	text = "%4.5f ms"%ms
	print("hit of ", ms)
func recieve_player_miss(note):
	print("miss")
	text = "miss"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
