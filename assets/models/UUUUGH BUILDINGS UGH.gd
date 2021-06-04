extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var base_mat = preload("res://assets/models/building_base.tres")
var win1_mat = preload("res://assets/models/building_windows_1.tres")
var win2_mat = preload("res://assets/models/building_windows_2.tres")
func _ready():
	pass

func recieve_player_input(event):
#	var mat = get_surface_material(1)
	if event.is_action_pressed("left_note"):
		win1_mat.emission = Color("ff00ff")
	if event.is_action_pressed("down_note"):
		win1_mat.emission = Color("00ffff")
		
	if event.is_action_pressed("up_note"):
		win1_mat.emission = Color("00ff00")
	if event.is_action_pressed("right_note"):
		win1_mat.emission = Color("ff0000")
	return 0
	
	
func recieve_enemy_input(event):
#	var mat = get_surface_material(1)
	if event.is_action_pressed("left_note_2"):
		win2_mat.emission = Color("ff00ff")
	if event.is_action_pressed("down_note_2"):
		win2_mat.emission = Color("00ffff")
		
	if event.is_action_pressed("up_note_2"):
		win2_mat.emission = Color("00ff00")
	if event.is_action_pressed("right_note_2"):
		win2_mat.emission = Color("ff0000")
	return 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
