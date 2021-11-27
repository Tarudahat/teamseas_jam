extends KinematicBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(1.2,1,1)
	match int(rand_range(0,6)):
		0:
			modulate = Color(1.2,1,1)
		1:
			modulate = Color(1.5,2,0)
		2:
			modulate = Color(0,3,2)
		3:
			modulate = Color(1,1,3)
		4:
			modulate = Color(1,3,1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
