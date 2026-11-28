extends Area2D
@onready var anim = $"../AnimationPlayer"
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("int"):
		anim.play("open")
