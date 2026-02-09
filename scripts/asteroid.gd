extends Area2D

@onready var rng: RandomNumberGenerator = RandomNumberGenerator.new()
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var explotion_scene: PackedScene = preload("res://scenes/particles/explosion.tscn")

@export var min_random_speed: float = 300
@export var max_random_speed: float = 100
@export var min_random_rotation_speed: float = -180
@export var max_random_rotation_speed: float = 180
@export var points: int

var speed: float 
var speed_rotation: float
var direction_random_rotation: float

func random(min_number, max_number):
	rng.randomize() ## Inicializa el randomizador
	return rng.randf_range(min_number, max_number)

func destroy_me() -> void: 
	_create_explotion()
	queue_free()

func add_score() -> void:
	GameManager.add_score(points)

func _ready() -> void:
	if speed == 0:
		speed = rng.randf_range(min_random_speed, max_random_speed) 
		speed *= -1
	direction_random_rotation = rng.randi_range(0,100)
	sprite_2d.rotation = direction_random_rotation
	speed_rotation = rng.randf_range(min_random_rotation_speed, max_random_rotation_speed)	

func _process(delta: float) -> void:
	position.x += speed * delta
	sprite_2d.rotation_degrees += speed_rotation * delta

func _create_explotion() -> void:
	var explotion_instance = explotion_scene.instantiate()
	add_sibling(explotion_instance)
	explotion_instance.position = self.position

func _on_area_entered(area: Area2D) -> void:
	var is_laser: bool = area.is_in_group("laser")
	var is_player: bool = area.is_in_group("player")
	
	if is_laser:
		add_score()
	
	if is_laser or is_player:
		destroy_me()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	GameManager.game_over()
	destroy_me()
