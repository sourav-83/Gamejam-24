extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Coinlabel.text = "You collected " + str(Global.coin_collected) + " coins"


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Play.tscn")


func _on_respawn_pressed() -> void:
	get_tree().change_scene_to_file("res://adventure/scenes/game.tscn")
