extends Control

const GAME = preload("res://Scenes/Game/Game.tscn")
@onready var highscore_value_label: Label = $MarginContainer/HighscoreValueLabel

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		GameManager.load_game_scene()

func _input(event: InputEvent) -> void:
	if event.is_pressed():
		GameManager.load_game_scene()
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void: 
	get_tree().paused = false
	highscore_value_label.text = "%04d" % ScoreManager.highscore
