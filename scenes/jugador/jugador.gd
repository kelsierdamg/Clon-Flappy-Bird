extends CharacterBody2D
class_name Jugador

signal on_game_started
@onready var jump_audio: AudioStreamPlayer = $jumpAudio
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


@export var gravedad := 1000.0
@export var fuerza_salto := 400.0
@export var velocidad_maxima := 400.0
@export var velocidad_rotacion := 2.0

var is_started := false
var should_process_input := true

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("saltar") and should_process_input:
		if is_started == false:
			is_started = true
			on_game_started.emit()
		salto()
		
	if not is_started:
		return
	
	velocity.y += gravedad * delta
	velocity.y = min(velocity.y, velocidad_maxima)
	
		
	move_and_slide()
	rotar_jugador()

func salto() -> void:
	velocity.y = -fuerza_salto
	rotation = deg_to_rad(-30)
	animated_sprite_2d.play("volar")
	jump_audio.play()
	
func rotar_jugador() -> void:
	if velocity.y > 0 and rad_to_deg(rotation) < 90:
		rotation += velocidad_rotacion * deg_to_rad(1)
		
func stop_movement() -> void:
	should_process_input = false

func stop_gravity() -> void:
	gravedad = 0
	velocity = Vector2.ZERO
