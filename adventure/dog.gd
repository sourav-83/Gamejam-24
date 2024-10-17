extends  Node2D

const SPEED=60

var direction_dog=1

@onready var ray_cast_right_dog=$AnimatedSprite2D_dog/RayCastright_dog
@onready var ray_cast_left_dog=$AnimatedSprite2D_dog/RayCastleft_dog
@onready var animated_sprite_dog=$AnimatedSprite2D_dog

func _process(delta):
	if ray_cast_right_dog.is_colliding():
		direction_dog=-1
		animated_sprite_dog.flip_h = false
	if ray_cast_left_dog.is_colliding():
		direction_dog=1
		animated_sprite_dog.flip_h = true
		
	position.x+=direction_dog*SPEED*delta	
