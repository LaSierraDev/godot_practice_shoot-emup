extends Area2D

@onready var rng: RandomNumberGenerator = RandomNumberGenerator.new()
@onready var sprite_2d: Sprite2D = $Sprite2D

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

func destroy_me() -> void: 
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	var is_laser: bool = area.is_in_group("laser")
	var is_player: bool = area.is_in_group("player")
	
	if is_laser:
		GameManager.add_score(points)
	
	if is_laser or is_player:
		destroy_me()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	GameManager.game_over()
	destroy_me()
