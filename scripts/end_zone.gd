extends Area2D

@export var next_level: String = ""

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("You finished!")
	Engine.time_scale = 0.5
	body.scale.x = 1.5
	body.scale.y = 1.5
	var tween := create_tween()
	tween.tween_property(body, "rotation", body.rotation + TAU, 0.2)  # 0.5 seconds spin
	timer.start()

func _on_timer_timeout() -> void:
	print("timer completed")
	Engine.time_scale = 1.0
	if next_level != "":
		print("going to level " + str(next_level))
		get_tree().change_scene_to_file(next_level)
	else:
		print("else-ing to stay and reload current level")
		get_tree().reload_current_scene()
