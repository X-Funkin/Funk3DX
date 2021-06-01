extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
export(bool) var player_track
func _ready():
	pass # Replace with function body.
func recieve_player_input(event):
	$"Note Left".call("input", event)
	$"Note Down".call("input", event)
	$"Note Up".call("input", event)
	$"Note Right".call("input", event)
func generateNote(noteData):
	$"Note Transforms/Notes".call("createNote", noteData)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
