extends Node

var score=0
@onready var score_label=$Scorelabel
func add_point():
	#print("Coin collected", "Curr: " + str(score))
	get_parent().get_node("CoinSound").play()
	score += 1
	
