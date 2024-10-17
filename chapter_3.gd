extends Node2D


var health = 10
const speed = 250
var time = 0

@onready var player = $Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	if(time > 30):
		$Screen.visible = true
		$Screen.get_node("Respawn").visible = false
		return
	if(health < 1):
		$Screen.visible = true
		$Screen.get_node("Respawn").visible = true
		$Screen.get_node("Label").text = "You did not save Bangladesh.\n Block the bullets next time!"
		return
	$GreenBar.size.x = 44.9 * health
	if Input.is_action_pressed("ui_down"):
		player.position.y += speed * delta
	if Input.is_action_pressed("ui_up"):
		player.position.y -= speed * delta


func hit():
	health -= 1


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://chapter.tscn") # Replace with function body.


func _on_respawn_pressed() -> void:
	get_tree().reload_current_scene()# Replace with function body.
