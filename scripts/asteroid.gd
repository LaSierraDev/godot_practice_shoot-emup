extends Area2D

@onready var rng: RandomNumberGenerator = RandomNumberGenerator.new()
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var min_random_speed: float = 300
@export var max_random_speed: float = 100
@export var min_random_rotation_speed: float = -180
@export var max_random_rotation_speed: float = 180
@export var direction_random_rotation: float

var speed: float 
var speed_rotation: float

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

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("laser")  or area.is_in_group("player"):
		_destroy_me()

func _destroy_me() -> void: 
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	_destroy_me()
