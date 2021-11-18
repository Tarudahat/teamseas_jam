extends Node2D

export var inverse:int = 1

func _ready():
	if inverse==-1:
		for child in get_children():
			child.get_node("Sprite").flip_h=true

func _process(delta):
	rotate(delta*0.9*inverse)
