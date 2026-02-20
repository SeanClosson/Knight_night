extends Node

var score: int = 0

@onready var player_hud: CanvasLayer = $PlayerHUD

func add_points():
	score += 1
	#print("score = " + str(score))
	update_score(score)

func update_score(score):
	# print("func update score: " + str(player_hud.get_children()))
	var a = player_hud.get_canvas()
	print("canvas: " + str(a))
	pass
