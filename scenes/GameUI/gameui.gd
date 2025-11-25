extends CanvasLayer
class_name GameUI

@onready var score_label: Label = $MarginContainer/ScoreLabel
@onready var start_menu: Control = $MarginContainer/StartMenu
@onready var game_over_menu: VBoxContainer = $MarginContainer/GameOverMenu
@onready var medal_img: TextureRect = $MarginContainer/GameOverMenu/Panel/MarginContainer/HBoxContainer/VBoxContainer/MedalImg
@onready var current_score: Label = %CurrentScore
@onready var high_score: Label = %HighScore

const MEDAL_BRONZE = preload("uid://b2akkjgeahful")
const MEDAL_GOLD = preload("uid://c5q8rpg33holx")
const MEDAL_SILVER = preload("uid://be7nyiw44n3bu")

func _ready() -> void:
	score_label.text = "0"
	
func update_score(value: int) -> void:
	score_label.text = str(value)
	
func game_over() -> void:
	game_over_menu.show()
	score_label.hide()
	
func calculate_score(score: int, high: int) -> void:
	current_score.text = str(score)
	high_score.text = str(high)
	if score >= 20:
		medal_img.texture = MEDAL_GOLD
	elif score >= 10:
		medal_img.texture = MEDAL_SILVER
	else:
		medal_img.texture = MEDAL_BRONZE

func _on_play_button_pressed() -> void:
	get_tree().reload_current_scene()
