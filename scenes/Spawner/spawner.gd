extends Node
class_name Spawner

signal obstacle_crash

const OBSTACLE = preload("res://scenes/Obstacle/obstacle.tscn")

@onready var timer: Timer = $Timer

func spawn_obstacle() -> void:
	var obs_instance: Obstacle = OBSTACLE.instantiate()
	obs_instance.player_crashed.connect(_player_crashed)
	
	var viewport: Viewport = get_viewport()
	obs_instance.position.x = viewport.get_visible_rect().end.x + 150
	
	var half_height = viewport.size.y / 2
	obs_instance.position.y = randf_range(half_height + 240, half_height -50)
	
	add_child(obs_instance)

func stop_obstacles() -> void:
	timer.stop()
	for obs: Obstacle in get_children().filter(func(x): return x is Obstacle):
		obs.set_speed(0)
	
func _on_timer_timeout() -> void:
	spawn_obstacle()
	
func _player_crashed() -> void:
	obstacle_crash.emit()
	stop_obstacles()
