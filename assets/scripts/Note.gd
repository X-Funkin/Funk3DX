extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(float) var hit_time

# Called when the node enters the scene tree for the first time.
func _ready():
	scale.y = 1.0/get_parent().noteSpeed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().time*1000.0>hit_time:
		visible = false
		
