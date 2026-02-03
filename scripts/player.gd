extends CharacterBody2D

@onready var timer_shoot: Timer = $TimerShoot
@export var laser_scene: PackedScene 
@export var speed: float
@export var displaced_laser: float = 50

var y_input: float
var x_input: float


var can_it_shoot: bool = true

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Shoot") and can_it_shoot:
		can_it_shoot = false
		create_laser()
		_timer_control()
	_process_inputs()
	move_and_slide()

func _process_inputs() -> void:
	y_input= Input.get_axis("Up","Down")
	x_input= Input.get_axis("Left", "Right")
	velocity = Vector2(x_input * speed, y_input * speed)

func create_laser() -> void: 
	var _laser = laser_scene.instantiate()
	_laser.position = position
	_laser.position.x += displaced_laser
	add_sibling(_laser)

func _timer_control() -> void:
	if !can_it_shoot:
		timer_shoot.start()

func _on_timer_timeout() -> void:
	can_it_shoot = true
	timer_shoot.stop()

func _on_detection_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("asteroides"):
		queue_free()
