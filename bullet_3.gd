extends Area2D

var velocity = Vector2.ZERO
var speed = 10
var fired = false

func set_direction_and_speed(direction: Vector2, bullet_speed: float) -> void:
	# Set the velocity based on direction and speed
	velocity = direction.normalized() * bullet_speed
	# Rotate the bullet to face the direction it's traveling
	rotation = velocity.angle()

func _process(delta: float) -> void:
	# Move the bullet
	if(fired):
		position += velocity * delta
	# If the bullet goes off screen or reaches a certain distance, remove it
	#if !get_viewport_rect().has_point(global_position):
		#queue_free()
		
func fire():
	fired = true

#func _on_Bullet_body_entered(body: Node) -> void:
	## Check if the bullet hits the player
	#if body.name == "Player":
		#body.die()  # Call the player's die function
		#queue_free()  # Destroy the bullet


func _on_body_entered(body: Node2D) -> void:
	#if(body.name == 'Player'): # Replace with function body.
		#queue_free()
	if(body is StaticBody2D):
		body.hit()
		queue_free()
	queue_free()
