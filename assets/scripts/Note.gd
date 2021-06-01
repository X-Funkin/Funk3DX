extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(float) var hit_time
export(int) var note_type
export(bool) var player_note

# Called when the node enters the scene tree for the first time.
func _ready():
	scale.y = 1.0/get_parent().noteSpeed

# Called every frame. 'delta' is the elapsed time since the previous frame.
var time_ms = 0.0
var active = true
var live = false
func despawn():
	active = false
	live = false
	visible = false
func spawn():
	visible = true
	active = true
	live = false
func group_remove():
	remove_from_group("Scoreable Notes")
	match note_type:
		0:
			remove_from_group("Scoreable Left Notes")
		1:
			remove_from_group("Scoreable Down Notes")
		2:
			remove_from_group("Scoreable Up Notes")
		3:
			remove_from_group("Scoreable Right Notes")
func group_add():
	add_to_group("Scoreable Notes")
	match note_type:
		0:
			add_to_group("Scoreable Left Notes")
		1:
			add_to_group("Scoreable Down Notes")
		2:
			add_to_group("Scoreable Up Notes")
		3:
			add_to_group("Scoreable Right Notes")

func _process(delta):
	time_ms = get_parent().time*1000.0
	if player_note:
		if time_ms>hit_time+180.0 and active:
			despawn()
			print("out of timing window ", hit_time, " ", time_ms)
			group_remove()
			
		if time_ms<hit_time-180.0 and !active and !live:
			print("reactiveated lol ", hit_time, " ", time_ms)
			spawn()
		if time_ms>hit_time-180.0 and active and !live:
			live = true
			print("in timing window ", hit_time, " ", time_ms)
			group_add()
		return 0
	if time_ms>hit_time and active:
		despawn()
	if time_ms<hit_time and !active:
			print("reactiveated lol ", hit_time, " ", time_ms)
			spawn()
