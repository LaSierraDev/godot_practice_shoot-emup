extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		_destroy_all_asteroids()
		_destroy_me()

func _destroy_all_asteroids():
	var asteroids = get_tree().get_nodes_in_group("asteroides")
	for node in asteroids:
		node.destroy_me()

func _destroy_me():
	queue_free()
	
