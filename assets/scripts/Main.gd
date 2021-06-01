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
				if note[1] > 3:
					get_tree().call_group("Enemy Track", "generateNote", note)
					continue
				get_tree().call_group("Player Track", "generateNote", note)
				
			continue
		for note in noteSections["sectionNotes"]:
			get_tree().call_group("Enemy Track", "generateNote", note)
	
	
	$Instrumentals.play()
	$"Player Voice".play()

func _input(event):
	get_tree().call_group("Player Input Reciever", "recieve_player_input", event)
	if event.is_action_pressed("left_note") || event.is_action_pressed("down_note") || event.is_action_pressed("up_note") || event.is_action_pressed("right_note"):
		print("note inputs")
		var scorables = get_tree().get_nodes_in_group("Scoreable Notes")
		var input_note = 0
		
		if event.is_action_pressed("left_note"): scorables = get_tree().get_nodes_in_group("Scoreable Left Notes")
		if event.is_action_pressed("down_note"): scorables = get_tree().get_nodes_in_group("Scoreable Down Notes")
		if event.is_action_pressed("up_note"): scorables = get_tree().get_nodes_in_group("Scoreable Up Notes")
		if event.is_action_pressed("right_note"): scorables = get_tree().get_nodes_in_group("Scoreable Right Notes")
		
		if scorables == []:
			get_tree().call_group("Player Miss Receiver", "recieve_player_miss", input_note)
			print("things empty cheif")
			return 0
		print("thing's not emptey cheif")
		var dt_ms = 180.0
		var t_ms = -15.5+1000.0*($Instrumentals.get_playback_position()+AudioServer.get_time_since_last_mix()-AudioServer.get_output_latency())
		var closest_note = scorables[0]
		if len(scorables) > 1:
			for note in scorables:
				if abs(note.hit_time-t_ms) <= abs(closest_note.hit_time-t_ms):
					closest_note = note
		dt_ms = closest_note.hit_time-t_ms
		closest_note.despawn()
		closest_note.group_remove()
		get_tree().call_group("Player Hit Receiver", "recieve_player_hit", dt_ms)
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
