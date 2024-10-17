extends Area2D

var shoot_delay = 2.0 # Time before enemy starts shooting
var is_dead = false


func _ready():
	$Timer.start(shoot_delay)
	#await get_tree().create_timer(shoot_delay).timeout
	#if not is_dead:
		#shoot()

func shoot():
	# Implement shooting behavior here
	get_parent().gun()
	get_parent().shot()

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		die()

func die():
	is_dead = true
	get_parent().enemy_killed()
	queue_free() # Remove enemy from the scene


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		
		get_parent().gun()
		die() # Replace with function body.


func _on_timer_timeout() -> void:
	if not is_dead:
		shoot()
