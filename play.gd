extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Quiz.tscn")

func _on_backbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://Main.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://chapter.tscn")


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://adventure/scenes/game.tscn")
