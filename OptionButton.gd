extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

export(String) var plaintextleft
export(String) var plaintextright
export(int) var min_len
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _gui_input(event):
	if has_focus():
		var pretext = ">%s<"%plaintextleft
		text = "%-10s"%pretext+"%10d"%plaintextright
		prev_focus = true
	else:
		text = "%-10s"%plaintextleft+"%10d"%plaintextright
	if pressed:
		pass
var prev_focus = false
func _process(delta):
	if !has_focus() and prev_focus:
		prev_focus = false
		text = "%-10s"%plaintextleft+"%10d"%plaintextright
