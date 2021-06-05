extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
class EventSorter:
	static func sort_events(a,b):
		return a[0]<b[0]


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
var cheer_events = [[12.419591836734693877551020408163, "Partner Event Recievers", "cheer_short"],
					[13.87369614512471655328798185941, "Partner Event Recievers", "cheer_short"],
					[15.328231292517006802721088435374, "Partner Event Recievers", "cheer_short"],
					[16.783219954648526077097505668934, "Partner Event Recievers", "cheer_short"],
					[18.2375283446712018140589569161, "Partner Event Recievers", "cheer_short"],
					[19.69251700680272108843537414966, "Partner Event Recievers", "cheer_short"],
					[21.1463265306122465120697021484375, "Partner Event Recievers", "cheer_short"],
					[22.600861678004534383035206701606, "Partner Event Recievers", "cheer_short"],
					[24.055623582766440193836388061754, "Partner Event Recievers", "cheer_short"],
					[25.508956916099773337691658525728, "Partner Event Recievers", "cheer_short"],
					[26.965623582766440335944935213774, "Partner Event Recievers", "cheer_short"],
					[28.419931972789115093291911762208, "Partner Event Recievers", "cheer_short"],
					[29.873968253968254060737308464013, "Partner Event Recievers", "cheer_short"],
					[31.329931972789115235400458914228, "Partner Event Recievers", "cheer_short"],
					[32.784693877551021046201640274376, "Partner Event Recievers", "cheer_short"],
					[34.236371882086167772740736836568, "Partner Event Recievers", "cheer_short"],
					[47.328072562358279640193359227851, "Partner Event Recievers", "cheer_short"],
					[48.781882086167797751841135323048, "Partner Event Recievers", "cheer_short"],
					[50.238775510204078500464675016701, "Partner Event Recievers", "cheer_short"],
					[51.690929705215417300223634811118, "Partner Event Recievers", "cheer_short"],
					[53.14641723356009350709427963011, "Partner Event Recievers", "cheer_short"],
					[54.600226757369611618742055725306, "Partner Event Recievers", "cheer_short"],
					[56.054285714285711605953110847622, "Partner Event Recievers", "cheer_short"],
					[57.556530612244898748031118884683, "Partner Event Recievers", "cheer_short"],
					[58.965238095238092341787705663592, "Partner Event Recievers", "cheer_short"],
					[60.419297052154192328998760785908, "Partner Event Recievers", "cheer_short"],
					[61.874058956916101692513620946556, "Partner Event Recievers", "cheer_short"],
					[63.328820861678003950601123506203, "Partner Event Recievers", "cheer_short"],
					[64.759251700680266594645217992365, "Partner Event Recievers", "cheer_short"],
					[66.237868480725623498983622994274, "Partner Event Recievers", "cheer_short"],
					[67.690498866213147266535088419914, "Partner Event Recievers", "cheer_short"],
					[69.146439909297058079573616851121, "Partner Event Recievers", "cheer_short"]
					]
var animation_events = [[0, "Animation Event Recievers", "anim_start"],
						[2.7779365079365079260753645939985+1.0/24.0, "Animation Event Recievers", "partner_pan"],
						[5.6901133786848072659836361708585+1.0/24.0, "Animation Event Recievers", "player_pan"],
						[9.0058730158730160297864131280221+1.0/24.0, "Animation Event Recievers", "to_default"],
						[11.687596371882086998539307387546+1.0/24.0, "Animation Event Recievers", "default"],
						[104.79451247165532379312935518101, "Animation Event Recievers", "anim_end"],
						[105.91918367346939078288414748386, "Main", "end"],
						[105.91918367346939078288414748386, "Audio Tracks", "stop"]
						
						]

func _ready():
#	for i in range(1, len(animation_events)):
#		animation_events[i][0] -= 2.0/24.0
#	animation_events[0][0] = 0
#	for anim_event in animation_events:
#		anim_event[0] += 2.0/24.0
	level_events.append_array(cheer_events)
	level_events.append_array(animation_events)
	level_events.sort_custom(EventSorter, "sort_events")
	randomize()
	var f = File.new()
	f.open("res://assets/music/blammed-hard.json", File.READ)
	var songData = JSON.parse(f.get_as_text()).result
	for noteSections in songData["song"]["notes"]:
		if noteSections["mustHitSection"]:
			for note in noteSections["sectionNotes"]:
				if note[1] > 3:
					get_tree().call_group("Enemy Track", "generateNote", note)
					#get_tree().call_group("Enemy Track", "generateNote", note)
					continue
				get_tree().call_group("Player Track", "generateNote", note)
				#get_tree().call_group("Player Track", "generateNote", note)
				
			continue
		for note in noteSections["sectionNotes"]:
			get_tree().call_group("Enemy Track", "generateNote", note)
	
	return 0
	$Instrumentals.play()
	$"Player Voice".play()
var started = false
func start():
	if !started:
		started = true
		$"Screen UI/Control/Menu Text".visible = false
		$Instrumentals.play()
		$"Player Voice".play()
		add_to_group("Song Time Recievers")
var ended = false
func end():
	if !ended:
		ended = true
		$Instrumentals.stop()
		$"Player Voice".stop()
		$"Screen UI/Control/Menu Text2".visible = true
var past_events = []
func recieve_songtime(t):
	for level_event in level_events:
		if t >= level_events[0][0]:
			var event = level_events.pop_front()
			print("event ", event)
			get_tree().call_group(event[1],event[2])
			past_events.push_back(event)
			continue
		break
func _input(event):
	if event.is_action_pressed("ui_accept") and !started:
		start()
	
	if event.is_action_pressed("restart") and ended:
		get_tree().change_scene("res://assets/scenes/Main.tscn")
		
	
	if event.is_action_pressed("exit") and ended:
		get_tree().quit()
		
	
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
