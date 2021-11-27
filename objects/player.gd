extends KinematicBody2D

var velocity:Vector2
var trash:int = 0
var hp:int = 3
export var movement_speed:int = 350
onready var basement = $UI.get_children()
onready var max_trash = get_parent().get_node("Trash").get_child_count()
var end_position: Vector2 = Vector2(9304,992)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	velocity -= velocity*0.07

	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		velocity =  get_local_mouse_position().normalized()*movement_speed
		if velocity.x>1:
			$subbody/AnimatedSprite.flip_v=false
		else:
			$subbody/AnimatedSprite.flip_v=true
		$subbody.look_at(get_global_mouse_position())
		
	velocity = move_and_slide(velocity)
	$UI/Label.text = str(trash)+"/"+str(max_trash)
	if trash >= max_trash:
		$end_pointer.visible = true
		$end_pointer.look_at(end_position)


func _on_mouth_body_entered(body):
	if body is KinematicBody2D:
		$crunch_sfx_player.playing=true
		$subbody/Particles2D.emitting = true
		if "Fish" in body.name:
			hp-=1
			$subbody/Particles2D.modulate=Color(1,1,1)
		elif "Hart_item" in body.name:
			hp+=1 
			$subbody/Particles2D.modulate=Color(0,9,1.5)
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
			get_tree().change_scene("res://menus/game_over.tscn")
	elif body is StaticBody2D:
		if "End_flag" in body.name:
			get_tree().change_scene("res://menus/end.tscn")
		
		
		

