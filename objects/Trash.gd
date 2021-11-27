extends KinematicBody2D

func _ready():
	$Sprite.texture=load("res://assets/garbage/trash_"+str(int(rand_range(0,3.5)))+".png")
	pass
