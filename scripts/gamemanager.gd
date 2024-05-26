extends Node2D
@onready var hud = %hud
@export var score_prefix = "Score: "
var score = 0

func increaseScore():
	score += 1
	print(score)
	hud.get_node('score').text = str(score_prefix,score)

func death():
	hud.get_node("timer").stop_timer()
	hud.get_node("gameover").show()
