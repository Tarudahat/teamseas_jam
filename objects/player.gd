extends KinematicBody2D

var velocity:Vector2
var trash:int
var hp:int = 3
export var movement_speed:int = 350

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2()

	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		velocity =  get_local_mouse_position().normalized()*movement_speed
		if velocity.x>=1:
			$subbody/AnimatedSprite.flip_v=false
		else:
			$subbody/AnimatedSprite.flip_v=true
		$subbody.look_at(get_global_mouse_position())
		
	velocity = move_and_slide(velocity)
	


func _on_mouth_body_entered(body):
	if body is KinematicBody2D:
		if "Fish" in body.name:
			hp-=1
			body.queue_free()

