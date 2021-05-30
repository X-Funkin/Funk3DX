extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var f = File.new()
	f.open("res://assets/music/blammed-hard.json", File.READ)
	var songData = JSON.parse(f.get_as_text()).result
	for noteSections in songData["song"]["notes"]:
		if noteSections["mustHitSection"]:
			for note in noteSections["sectionNotes"]:
				get_tree().call_group("Note Tracks", "createNote", note)
	$Instrumentals.play()
	$"Player Voice".play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
