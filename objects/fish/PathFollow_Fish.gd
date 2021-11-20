extends PathFollow2D


func _process(delta):
	offset+=delta*160*scale.x
