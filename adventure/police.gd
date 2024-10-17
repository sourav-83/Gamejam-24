extends Node2D

const speed=60

var direction=-1
@onready var animated_sprite=$AnimatedSprite2D
@onready var ray_cast_right=$RayCastright
@onready var ray_cast_left=$RayCastleft
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding(): 
		direction = -1
		animated_sprite.flip_h=true
	if ray_cast_left.is_colliding(): 
		direction = 1
		animated_sprite.flip_h=false
	
	position.x+=speed*delta*direction
