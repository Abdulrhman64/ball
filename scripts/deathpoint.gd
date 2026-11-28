extends Area2D
@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2
var per
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		per = body
		body.modulate = Color.TOMATO
		body.rotate(deg_to_rad(-90))
		var coll = body.get_child(1)
		coll.queue_free()
		timer.start()
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
