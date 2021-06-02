extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var song_time = 0.0
var subseconds = 0.0
var seconds = 0
var delta_arr = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var diff_arr = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var frametime_arr = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var songframe_arr = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var bpm = 95.0*1.0
var beat_length = 60.0/bpm
var beat_time = 0.0
var beat_num = 0
func _process(delta):
	subseconds += delta
	if subseconds > 1.0:
		seconds += 1
		subseconds = fmod(subseconds, 1.0)
	var current_time = get_playback_position()+AudioServer.get_time_since_last_mix()-AudioServer.get_output_latency()
	var diff = current_time-song_time
	if diff < 0 and abs(diff)<0.3:
		current_time = song_time + delta
	var song_delta = 0.0
	beat_time += current_time-song_time
	if beat_time >= beat_length:
		beat_time = fmod(beat_time, beat_length)
		beat_num += 1
		print("BEAT ", current_time)
		get_tree().call_group("Beat Recievers", "recieve_beat", beat_num, current_time)
	if delta != 0:
		song_delta = diff/delta
	delta_arr.pop_front()
	delta_arr.append(song_delta)
	diff_arr.pop_front()
	diff_arr.append(diff)
	if delta != 0:
		frametime_arr.pop_front()
		frametime_arr.append(1.0/delta)
	if diff != 0:
		songframe_arr.pop_front()
		songframe_arr.append(1.0/diff)
	if (current_time<song_time):
		print(float(seconds)+subseconds, " STUTTER ON AUDIO: ", current_time-song_time," SONG DELTA: ", song_delta, " DELTA ARRAY: ", diff_arr)
		print("SONG FRAME ARRAY: ", songframe_arr)
		print("FRAME TIME ARRAY: ", frametime_arr)
		print("\n\n")
	song_time = current_time
	get_tree().call_group("Song Time Recievers", "recieve_songtime",song_time-15.5/1000.0)
	
#	pass
