extends Node

const SCORES_PATH: String = "user://tappy.tres"

var _highscore: int = 0
var highscore: int:
	get:
		return _highscore
	set(value):
		if value > _highscore:
			_highscore = value
			save_highscore()

func _ready() -> void:
	load_highscore()

func load_highscore() -> void:
	if ResourceLoader.exists(SCORES_PATH):
		var hsr: HighscoreResource = load(SCORES_PATH)
		if hsr:
			_highscore = hsr.highscore

func save_highscore() -> void:
	var hsr: HighscoreResource = HighscoreResource.new()
	hsr.highscore = _highscore
	ResourceSaver.save(hsr, SCORES_PATH)
