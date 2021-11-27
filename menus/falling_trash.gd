extends AnimatedSprite

export var trashy: bool = true
export var ded: bool = false

func _ready():
	if ded:
		play("ded")
	$trash_sprite.visible = trashy
	position.x = rand_range(200,1800)
	$trash_sprite.position.x= position.x-rand_range(200,300)
	self_modulate = Color(1.2,1,1)
	match int(rand_range(0,6)):
		0:
			self_modulate = Color(1.2,1,1)
		1:
			self_modulate = Color(1.5,2,0)
		2:
			self_modulate = Color(0,3,2)
		3:
			self_modulate = Color(1,1,3)
		4:
			self_modulate = Color(1,3,1)

func _process(delta):
	position.x+=delta*220
	if position.x>=1250:
		$trash_sprite.position.x= position.x-rand_range(200,300)
		position.x = 0-rand_range(200,800)
		
