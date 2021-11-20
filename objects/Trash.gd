extends Sprite

func _ready():
	texture=load("res://assets/garbage/trash_"+str(int(rand_range(0,4.5)))+".png")
	pass

func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		if body.name == "Player":
			body.trash+=1
			queue_free()
