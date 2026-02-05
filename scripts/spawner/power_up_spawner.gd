extends Node2D
@onready var timer_spawn: Timer = $TimerSpawn
@export var power_up_escene: PackedScene
@export var min_max_random_x: Array[float] = [5, 650]
@export var min_max_random_y: Array[float] = [5, 700]

func _on_timer_spawn_timeout() -> void:
	if GameManager.is_game_over:
		timer_spawn.stop()
	var _power_up_scene = power_up_escene.instantiate()
	add_child(_power_up_scene)
	_power_up_scene.global_position = Vector2(randf_range(min_max_random_x[0], min_max_random_x[1]), randf_range(min_max_random_y[0], min_max_random_y[1]))
