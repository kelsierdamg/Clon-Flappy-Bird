extends Node2D

@onready var spawner: Spawner = $Spawner
@onready var jugador: Jugador = $Jugador

func _on_jugador_on_game_started() -> void:
	spawner.timer.start()

func _on_spawner_obstacle_crash() -> void:
	jugador.stop_movement()

func _on_ground__on_player_crash() -> void:
	spawner.stop_obstacles()
