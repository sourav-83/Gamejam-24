extends Node2D

const speed = 400
const goal_y = -8700
#const goal_y = -1000

@export var cutscene_running = false
var game_over = false

@onready var car = get_node("Car")
@onready var police = get_node("Policeman")
@onready var time = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(game_over):
		return
	time+= delta
	print(car.get_global_position())
	if(cutscene_running):
		police.position.y += delta * 200
		if(police.position.y > car.position.y - 150):
			game_over = true
			await get_tree().create_timer(1.0).timeout
			$sniper.play()
			show_score()
		return
	
	if(car.get_global_position().y < goal_y):
		cutscene()
		return
		
	if(car.died()):
		process_death()
		return
		
	
	var direction = Vector2()  # Zero vector for movement

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1


	# Normalize the direction to ensure consistent speed and move the sprite
	#car.position += direction.normalized() * speed * delta
	car.velocity = direction.normalized() * speed
	
	car.move_and_slide()

func cutscene():
	cutscene_running = true
	$siren.stop()
	
	police.position.x = car.position.x + 20
	police.position.y = car.position.y - 500
	police.visible = true


func process_death():
	#get_tree().reload_current_scene()
	$siren.stop()
	game_over = true
	car.get_node("BlackScreen").visible = true
	car.get_node("BlackScreen").get_node("Label").text = "You survived " + str(ceil(time)) + " seconds"
	
	
func show_score():
	$siren.stop()
	car.get_node("BlackScreen").visible = true
	car.get_node("BlackScreen").get_node("Respawn").visible = false
	
	


func _on_respawn_pressed() -> void:
	game_over = false
	time = 0
	get_tree().reload_current_scene() # Replace with function body.
	car.get_node("BlackScreen").visible = false


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://chapter.tscn") # Replace with function body.
