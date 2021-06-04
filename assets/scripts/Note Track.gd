extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
export(bool) var player_track
func _ready():
	pass # Replace with function body.

func cast_input(event):
	$"Note Left".call("input", event)
	$"Note Down".call("input", event)
	$"Note Up".call("input", event)
	$"Note Right".call("input", event)

func cast_hit(ms, note_n):
	match note_n:
		0:
			$"Note Left".note_hit()
		1:
			$"Note Down".note_hit()
		2:
			$"Note Up".note_hit()
		3:
			$"Note Right".note_hit()

func recieve_player_hit(ms, note_n):
	cast_hit(ms,note_n)

func recieve_player_input(event):
	cast_input(event)


func recieve_enemy_hit(ms, note_n):
	cast_hit(ms,note_n)
	
func recieve_enemy_input(event):
	cast_input(event)


func generateNote(noteData):
	$"Note Transforms/Notes".call("createNote", noteData)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
