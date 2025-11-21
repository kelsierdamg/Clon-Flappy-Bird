extends Node2D

@onready var spawner: Spawner = $Spawner

func _on_jugador_on_game_started() -> void:
	spawner.timer.start()

func _on_obstacle_player_crashed() -> void:
	pass # Replace with function body.
