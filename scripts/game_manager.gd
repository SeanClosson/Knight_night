extends Node

var score: int = 0

@onready var player_hud: CanvasLayer = $PlayerHUD

func add_points(points: int) -> void:
	score += points
	#print("score = " + str(score))
	update_score(score)

func update_score(score):
	# update the label "ScoreValue" that a child of Control which is a child of PlayerHUD
	var label := player_hud.get_node("Control/ScoreValue") as Label
	label.text = str(score)


func _on_end_zone_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
