extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	get_node("second").visible = true
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://Chapter2.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
