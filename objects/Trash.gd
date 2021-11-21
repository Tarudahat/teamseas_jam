extends Sprite

func _ready():
	texture=load("res://assets/garbage/trash_"+str(int(rand_range(0,3.5)))+".png")
	pass

func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		if body.name == "Player":
			body.trash+=1
			var mouth_particles = body.get_node("subbody/Particles2D")
			mouth_particles.modulate=Color(0.30,1,1)
			mouth_particles.emitting = true
			queue_free()
