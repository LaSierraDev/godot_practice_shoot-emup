extends Node

var score: int:
	get: return score
	set(value): score = value

var is_game_over: bool = false:
	get: return is_game_over
	set(game_over): is_game_over = game_over

func _process(_delta: float) -> void:
	restart_game()

func restart_game():
	if is_game_over and Input.is_action_just_pressed("Shoot"):
		get_tree().reload_current_scene()
		is_game_over = false
		score = 0

func add_score(points: int) -> void:
	if not is_game_over:
		score += points

func game_over() -> void:
	is_game_over = true
