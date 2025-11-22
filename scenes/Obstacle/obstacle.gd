extends Node2D
class_name Obstacle

signal player_crashed

@export var move_speed := 150.0

func _process(delta: float) -> void:
	position.x -= move_speed * delta
	
func set_speed(value: float) -> void:
	move_speed = value

func _on_area_body_entered(body: Node2D) -> void:
	player_crashed.emit()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
