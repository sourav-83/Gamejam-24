extends Node2D

var spawn_schedule = [
	{"time": 0.5, "position": Vector2(400, 300)},
	{"time": 0.8, "position": Vector2(400, 300)},
	{"time": 0.7, "position": Vector2(400, 300)},
	{"time": 0.59, "position": Vector2(400, 300)},
	{"time": 2.5, "position": Vector2(500, 350)},
	{"time": 6.2, "position": Vector2(300, 200)},
	{"time": 5.6, "position": Vector2(200, 400)},
	{"time": 2.2, "position": Vector2(800, 250)},
	{"time": 4.1, "position": Vector2(700, 100)},
	{"time": 10.7, "position": Vector2(250, 100)},
	{"time": 1.5, "position": Vector2(600, 200)},
	{"time": 9.3, "position": Vector2(800, 450)},
	{"time": 7.0, "position": Vector2(900, 150)},
	{"time": 8.5, "position": Vector2(100, 300)},
	{"time": 11.2, "position": Vector2(400, 500)},
	#{"time": 12.9, "position": Vector2(750, 350)},
	#{"time": 13.4, "position": Vector2(550, 400)},
	#{"time": 14.1, "position": Vector2(200, 150)},
	#{"time": 15.8, "position": Vector2(650, 300)},
	#{"time": 16.3, "position": Vector2(850, 100)},
	#{"time": 17.9, "position": Vector2(500, 200)},
	#{"time": 18.5, "position": Vector2(300, 450)},
	#{"time": 19.2, "position": Vector2(700, 250)},
	#{"time": 20.6, "position": Vector2(100, 100)},
	#{"time": 21.0, "position": Vector2(600, 400)},
	#{"time": 22.7, "position": Vector2(400, 150)},
	#{"time": 23.4, "position": Vector2(900, 300)},
	#{"time": 24.8, "position": Vector2(500, 100)},
	#{"time": 25.3, "position": Vector2(800, 350)},
	#{"time": 26.1, "position": Vector2(200, 250)},
	#{"time": 27.5, "position": Vector2(650, 450)},
	#{"time": 28.6, "position": Vector2(300, 100)},
	#{"time": 29.3, "position": Vector2(750, 300)}
]


@onready var init = $init_background

@onready var health = 5.0
@onready var enemy_count = len(spawn_schedule)


@onready var time = 0
var game_running = false
var crosshair = load("res://crosshair1.png")

var spawn_index = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("gamebg").visible = false
	init.visible = true
	init.get_node("Text").visible = false
	await get_tree().create_timer(0.5).timeout
	init.get_node("Text").visible = true
	await get_tree().create_timer(5).timeout
	
	init.visible = false
	get_node("gamebg").visible = true
	game_running = true
	Input.set_custom_mouse_cursor(crosshair, 0, crosshair.get_size() / 2)
	$Timer.start(1.0)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(game_running):
		if(enemy_count < 1):
			victory()
			return
		if(health < 1):
			defeat()
			return
		time += delta
		$Healthbar.size.x = (50 * health)


func _on_timer_timeout() -> void:
	if spawn_index < spawn_schedule.size():
		var enemy_data = spawn_schedule[spawn_index]
		spawn_enemy(enemy_data.position)
		spawn_index += 1
		$Timer.start(enemy_data.time)
	else:
		$Timer.stop()
		
		
func spawn_enemy(position):
	var enemy = preload("res://enemy.tscn").instantiate()
	add_child(enemy)
	enemy.position = position
	
func shot():
	health -= 1
	
func enemy_killed():
	enemy_count -= 1
	
func victory():
	game_running = false
	$over.visible = true
	$over.get_node("Label").text  += "\nYou Won!"
	$over.get_node("Respawn").visible = false


func defeat():
	game_running = false
	$over.visible = true
	$over.get_node("Label").text = "Time survived: " + str(floor(time)) + " seconds"


func _on_respawn_pressed() -> void:
	get_tree().reload_current_scene() # Replace with function body.


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://chapter.tscn")# Replace with function body.
	
func gun():
	$gunsound.play()
