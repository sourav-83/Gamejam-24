extends Node2D

@export var fire_interval = 2 # Time interval between bullet fires
@export var bullet_speed = 200   # Speed of the bullet
@export var randomness_angle = 0.2  # Randomness in the bullet direction (in radians)
var police_car_speed = 10

@onready var car = get_parent().get_node("Car")  # Reference to the player node
@onready var bullet_scene = preload("res://Bullet.tscn")  # Preload the Bullet scene

var time_since_last_fire = 0.0

func _process(delta: float) -> void:
	time_since_last_fire += delta

	position.y += 10 * delta
	# Periodically fire bullet at the player
	if time_since_last_fire >= fire_interval:
		fire_bullet_at_player()
		time_since_last_fire = 0.0

func fire_bullet_at_player():
	# Get direction towards the player
	var player_position = car.get_global_position()
	var direction = (player_position - get_global_position()).normalized()
	if(direction.y < 0 or (player_position - get_global_position()).length() > 1000):
		return
	

	# Add random angle variation to the direction
	var random_angle = randf_range(-randomness_angle, randomness_angle)
	random_angle = 0
	direction = direction.rotated(random_angle)

	# Instance a bullet and set its position and velocity
	var bullet = bullet_scene.instantiate()
	bullet.global_position = get_global_position()  # Set bullet starting position
	bullet.set_direction_and_speed(direction, bullet_speed)

	# Add the bullet to the scene
	get_tree().current_scene.add_child(bullet)
	bullet.fire()
