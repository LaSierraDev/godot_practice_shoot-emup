extends Area2D

@export var bullet_velocity: float = 800

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += bullet_velocity * delta

func _destroy_me() -> void:
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("asteroides"):
		_destroy_me()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	_destroy_me()	
