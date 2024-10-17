extends Area2D

@onready var timer=$Timer

func _on_body_entered(body: Node2D) -> void:
	#print("You died")
	Global.coin_collected = get_parent().get_node("%Gamemanager").score
	get_tree().change_scene_to_file("res://black_screen.tscn")
	#Engine.time_scale=0.5
	timer.start()
	#get_parent().die()


#func _on_timer_timeout() -> void:
	#Engine.time_scale=1
	#get_tree().reload_current_scene()
	
	
#extends Node
#
#var score=0
#@onready var score_label=$Scorelabel
#func add_point():
	#score=+1
	#
