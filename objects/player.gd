extends KinematicBody2D

var velocity:Vector2
var trash:int
var hp:int = 3
export var movement_speed:int = 350
onready var basement = $UI.get_children()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
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
		elif "Hart_item" in body.name:
			hp+=1 
		if "Player" in body.name:
			pass
		else:
			body.queue_free()

		for child in basement:
			child.visible=true

		if hp < 3:
			$UI.get_child(2).visible=false
		if hp < 2:
			$UI.get_child(1).visible=false
		if hp < 1:
			get_tree().quit()
		
		
		

