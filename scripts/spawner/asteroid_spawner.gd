extends Marker2D

@onready var timer_spawn: Timer = $TimerSpawn

@export var asteroids_scenes: Array[PackedScene]
@export var min_random_y: int = 50
@export var max_random_y: int = 650
#@export var spawned_asteroid_count: int = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _create_asteroid() -> void:
	if GameManager.is_game_over:
		timer_spawn.stop()
	var _asteroid_instance = asteroids_scenes.pick_random().instantiate()
	add_child(_asteroid_instance)
	var random_y = randi_range(min_random_y, max_random_y)
	_asteroid_instance.global_position.y = random_y

func _on_timer_timeout() -> void:
	#for i in range(spawned_asteroid_count):
		#_create_asteroid()
	_create_asteroid()
	
