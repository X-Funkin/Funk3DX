extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
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
var level_events = [[11.68761904761904761904761904761905, "Partner Event Recievers", "point_left"],
					[17.513219954648526077097505668934, "Partner Event Recievers", "point_right"],
					[23.32387755102040816326530612, "Partner Event Recievers", "point_left"],
					[29.14462585034013605442176870748, "Partner Event Recievers", "point_right"],
					[35.056326530612244897959183673469, "Partner Event Recievers", "point_left"],
					[40.7817687074829931972789115646, "Partner Event Recievers", "point_right"],
					[46.560702947845804988662131519274, "Partner Event Recievers", "point_left"],
					[52.374399092970521541950113378, "Partner Event Recievers", "point_right"],
					[58.191337868480725623582766439909, "Partner Event Recievers", "point_left"],
					[64.009206349206349206349206349206, "Partner Event Recievers", "point_right"],
					[69.87251700680272108843537414966, "Partner Event Recievers", "point_left"],
					[75.689433106575963718820861678005, "Partner Event Recievers", "point_right"],
					[81.511836734693877551020408163265, "Partner Event Recievers", "point_left"],
					[87.326666666666666666666666666667, "Partner Event Recievers", "point_right"],
					[93.142176870748299319727891156463, "Partner Event Recievers", "cheer"]
					]
var past_events = []
func recieve_songtime(t):
	for level_event in level_events:
		if t >= level_event[0]:
			var event = level_events.pop_front()
			print("event ", event)
			get_tree().call_group(event[1],event[2])
			past_events.push_back(event)
			continue
		break
func _input(event):
	if event.is_action_pressed("left_note_2") || event.is_action_pressed("down_note_2") || event.is_action_pressed("up_note_2") || event.is_action_pressed("right_note_2") ||event.is_action_released("left_note_2") || event.is_action_released("down_note_2") || event.is_action_released("up_note_2") || event.is_action_released("right_note_2"):
		print("ENEMY INPUT ", event, "ITME IS ", -15.5+1000.0*($Instrumentals.get_playback_position()+AudioServer.get_time_since_last_mix()-AudioServer.get_output_latency()))
		print("ENEMY BUTTON DOWN IS ", event.pressed)
		get_tree().call_group("Enemy Input Recievers", "recieve_enemy_input", event)
		
		return 0
	get_tree().call_group("Player Input Reciever", "recieve_player_input", event)
	if event.is_action_pressed("left_note") || event.is_action_pressed("down_note") || event.is_action_pressed("up_note") || event.is_action_pressed("right_note"):
		print("note inputs")
		var scorables = get_tree().get_nodes_in_group("Scoreable Notes")
		var input_note = 0
		
		if event.is_action_pressed("left_note"): 
			scorables = get_tree().get_nodes_in_group("Scoreable Left Notes")
			input_note = 0
		
		if event.is_action_pressed("down_note"):
			scorables = get_tree().get_nodes_in_group("Scoreable Down Notes")
			input_note = 1
		
		if event.is_action_pressed("up_note"):
			scorables = get_tree().get_nodes_in_group("Scoreable Up Notes")
			input_note = 2
		
		if event.is_action_pressed("right_note"):
			scorables = get_tree().get_nodes_in_group("Scoreable Right Notes")
			input_note = 3
		
		if scorables == []:
			get_tree().call_group("Player Miss Recievers", "recieve_player_miss", input_note)
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
		get_tree().call_group("Player Hit Recievers", "recieve_player_hit", dt_ms, input_note)
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
