extends Control

const GAME_OVER = preload("res://Assets/audio/game_over.wav")
var main = load("res://Scenes/Main/Main.tscn")

@onready var game_over_label: Label = $MarginContainer/GameOverLabel
@onready var press_space_label: Label = $MarginContainer/PressSpaceLabel
@onready var game_over_timer: Timer = $GameOverTimer
@onready var score_label: Label = $MarginContainer/ScoreLabel
@onready var score_sound: AudioStreamPlayer = $ScoreSound

var _score: int = 0

func _ready() -> void:
	_score = 0

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit") or (
		event.is_action_pressed("ui_accept") and 
		press_space_label.visible):
		GameManager.load_main_scene()
		
func _input(event: InputEvent) -> void:
	if event.is_pressed() and press_space_label.visible:
		GameManager.load_main_scene()
		
# Called when the node enters the scene tree for the first time.
func _enter_tree() -> void:
	SignalHub.plane_died.connect(on_plane_died)
	SignalHub.point_scored.connect(on_point_score)

func update_score_label() -> void:
	score_label.text = "%04d" % _score

func on_plane_died() -> void:
	score_sound.stop()
	score_sound.stream = GAME_OVER
	score_sound.play()
	game_over_label.show()
	game_over_timer.start()

func _on_game_over_timer_timeout() -> void:
	game_over_label.hide()
	press_space_label.show()

func on_point_score() -> void:
	_score += 1
	ScoreManager.highscore = _score
	update_score_label()
	score_sound.play()
