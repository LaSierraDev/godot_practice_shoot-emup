extends Node2D
@onready var timer_spawn: Timer = $TimerSpawn

@export var power_up_escene: PackedScene
@export var random_x: Array[float] = [5, 650]
@export var random_y: Array[float] = [5, 700]
@export var random_spawn_seconds: Array[float] = [5, 20]

var _there_is_power_up: bool 

func _ready() -> void:
	_allocate_time(_randomized_time())
	timer_spawn.start()

func _randomized_time() -> float: 
	return randf_range(random_spawn_seconds[0],random_spawn_seconds[1])

func _allocate_time(time: float) -> void:
	timer_spawn.stop()
	timer_spawn.wait_time = time
	timer_spawn.start()

func _create_power_up() -> void: 
	var _power_up_scene = power_up_escene.instantiate()
	add_child(_power_up_scene)
	_power_up_scene.global_position = Vector2(randf_range(random_x[0], random_x[1]), 
	randf_range(random_y[0], random_y[1]))

func _on_timer_spawn_timeout() -> void:
	if GameManager.is_game_over:
		timer_spawn.stop()
	
	if get_tree().get_nodes_in_group("power_up").size() == 0:
		_create_power_up()
		_allocate_time(_randomized_time())
		
	else: 
		_allocate_time(5)
