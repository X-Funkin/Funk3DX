extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

export(String) var scene_target
export(String) var plaintext
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _gui_input(event):
	if has_focus():
		text = ">%s<"%plaintext
		prev_focus = true
	else:
		text = plaintext
	if pressed:
		if plaintext == "Exit":
			get_tree().quit()
			return 0
		get_tree().change_scene(scene_target)
var prev_focus = false
func _process(delta):
	if !has_focus() and prev_focus:
		prev_focus = false
		text = plaintext
