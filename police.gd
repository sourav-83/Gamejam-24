extends Sprite2D
@onready var bullet_scene = preload("res://Bullet3.tscn")

@onready var fire_interval = randf_range(4,8) # Time interval between bullet fires
@onready var time_since_last_fire = randf_range(0 , 0.9)
const bullet_speed = 200   # Speed of the bullet


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	time_since_last_fire += delta

	# Periodically fire bullet at the player
	if time_since_last_fire >= fire_interval:
		fire_bullet_at_player()
		time_since_last_fire = 0.0
		fire_interval = randf_range(4, 8)


func fire_bullet_at_player():
	# Get direction towards the player


	# Instance a bullet and set its position and velocity
	var bullet = bullet_scene.instantiate()
	bullet.global_position = get_global_position()  # Set bullet starting position
	bullet.set_direction_and_speed(Vector2(-1, 0), bullet_speed)

	# Add the bullet to the scene
	get_tree().current_scene.add_child(bullet)
	bullet.fire()

#
