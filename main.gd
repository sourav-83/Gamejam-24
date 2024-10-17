extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#get_tree().change_scene_to_file("res://Quiz.tscn")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Play.tscn") # Replace with function body.


func _on_button_3_pressed() -> void:
	get_tree().quit()


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Credits.tscn")
