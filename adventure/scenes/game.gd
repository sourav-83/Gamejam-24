extends Node2D

@onready var vict = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Bgsound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(vict):
		return
	if($Player.position.x > 164 && $Player.position.x < 200 && $Player.position.y > -350 && $Player.position.y < -150):
		print($Player.position)
		vict = true
		victory()
		#

func victory():
	get_node("Lalshobuj").play()
	await get_tree().create_timer(10).timeout
	get_tree().change_scene_to_file("res://Play.tscn")


#func _on_flagcol_body_entered(body: Node2D) -> void:
	
