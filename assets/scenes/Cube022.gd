extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func recieve_player_input(event):
	var mat = mesh.surface_get_material(0)
#	var mat = get_surface_material(1)
	if event.is_action_pressed("left_note"):
		mat.emission = Color("ff00ff")
	if event.is_action_pressed("down_note"):
		mat.emission = Color("00ffff")
		
	if event.is_action_pressed("up_note"):
		mat.emission = Color("00ff00")
	if event.is_action_pressed("right_note"):
		mat.emission = Color("ff0000")
	return 0
	if event.is_action_released("up_note"):
		mat.emission = Color("ffffff")
	if event.is_action_released("up_note"):
		mat.emission = Color("ffffff")
	if event.is_action_released("up_note"):
		mat.emission = Color("ffffff")
	if event.is_action_released("up_note"):
		mat.emission = Color("ffffff")
	
	
func recieve_enemy_input(event):
	var mat = mesh.surface_get_material(0)
#	var mat = get_surface_material(1)
	if event.is_action_pressed("left_note_2"):
		mat.emission = Color("ff00ff")
	if event.is_action_pressed("down_note_2"):
		mat.emission = Color("00ffff")
		
	if event.is_action_pressed("up_note_2"):
		mat.emission = Color("00ff00")
	if event.is_action_pressed("right_note_2"):
		mat.emission = Color("ff0000")
	return 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
