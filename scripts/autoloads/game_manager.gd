extends Node

var score: int:
	get: return score
	set(value): score = value

var is_game_over: bool = false:
	get: return is_game_over
	set(game_over): is_game_over = game_over

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_score(points: int) -> void:
	score += points

func game_over() -> void:
	is_game_over = true
