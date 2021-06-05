extends Position3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var LNote = preload("res://assets/scenes/Left Note.tscn")
var DNote = preload("res://assets/scenes/Down Note.tscn")
var UNote = preload("res://assets/scenes/Up Note.tscn")
var RNote = preload("res://assets/scenes/Right Note.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	noteSpeed = get_parent().scale.y

func createNote(noteData):
#	print("creating note ", noteData)
	var noteType = int(noteData[1])%4
	#var noteType = int(randf()*4.0)%4
#	print(noteType)
	var player_track = get_parent().get_parent().player_track
	match noteType:
		0:
#			print("trying")
			var noteInst = LNote.instance()
			noteInst.add_to_group("Notes")
			noteInst.add_to_group("Left Notes")
			noteInst.hit_time = noteData[0]
			noteInst.translation.y = -noteData[0]/1000.0
			noteInst.translation.x = -2.335
			noteInst.player_note = player_track
#			noteInst.scale.y = 1/10.0
#			print("added note", noteData)
			#print(noteInst.transform)
			add_child(noteInst)
		1:
			var noteInst = DNote.instance()
			noteInst.add_to_group("Notes")
			noteInst.add_to_group("Down Notes")
			noteInst.hit_time = noteData[0]
			noteInst.note_type = 1
			noteInst.player_note = player_track
			noteInst.translation.y = -noteData[0]/1000.0
			noteInst.translation.x = -0.785
#			noteInst.scale.y = 1/10.0
			add_child(noteInst)
		2:
			var noteInst = UNote.instance()
			noteInst.add_to_group("Notes")
			noteInst.add_to_group("Up Notes")
			noteInst.hit_time = noteData[0]
			noteInst.note_type = 2
			noteInst.player_note = player_track
			noteInst.translation.y = -noteData[0]/1000.0
			noteInst.translation.x = 0.785
#			noteInst.scale.y = 1/10.0
			add_child(noteInst)
		3:
			var noteInst = RNote.instance()
			noteInst.add_to_group("Notes")
			noteInst.add_to_group("Right Notes")
			noteInst.hit_time = noteData[0]
			noteInst.note_type = 3
			noteInst.player_note = player_track
			noteInst.translation.y = -noteData[0]/1000.0
			noteInst.translation.x = 2.335
#			noteInst.scale.y = 1/10.0
			add_child(noteInst)
		
export(float) var time = 0.0
export(float) var noteSpeed = 10.0
func createNotes(noteSection):
	for note in noteSection:
		if note[1] < 4:
			createNote(note)
			
func recieve_songtime(t):
	if t<time:
		print("STUTTER: ", time-t)
	time = t
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translation.y = time
	noteSpeed = get_parent().scale.y
