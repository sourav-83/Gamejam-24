extends CharacterBody2D

var alive = true

func die():
	alive = false

func died():
	return !alive
