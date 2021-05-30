extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var song_time = 0.0
func _process(delta):
	song_time = get_playback_position()+AudioServer.get_time_since_last_mix()-AudioServer.get_output_latency()
	get_tree().call_group("Song Time Recievers", "recieve_songtime",song_time)
#	pass
