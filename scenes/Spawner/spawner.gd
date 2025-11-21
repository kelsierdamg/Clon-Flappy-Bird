extends Node

class_name Spawner

const OBSTACLE = preload("res://scenes/Obstacle/obstacle.tscn")

@onready var timer: Timer = $Timer

func spawn_obstacle() -> void:
	var obs_instance = OBSTACLE.instantiate()
	
	var viewport: Viewport = get_viewport()
	obs_instance.position.x = viewport.get_visible_rect().end.x + 150
	
	var half_height = viewport.size.y / 2
	obs_instance.position.y = randf_range(half_height + 240, half_height -50)
	
	add_child(obs_instance)

func _on_timer_timeout() -> void:
	spawn_obstacle()
