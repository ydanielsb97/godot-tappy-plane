extends Node

const MAIN = preload("res://Scenes/Main/Main.tscn")
const GAME = preload("res://Scenes/Game/Game.tscn")
const SIMPLE_TRANSITION = preload("res://Scenes/SimpleTransition/SimpleTransition.tscn")
var COMPLEX_TRANSITION = load("res://Scenes/ComplexTransition/ComplexTransition.tscn")

var next_scene: PackedScene

func _add_complex_transition() -> void:
	var complex_transition = COMPLEX_TRANSITION.instantiate()
	add_child(complex_transition)

func load_game_scene() -> void:
	next_scene = GAME
	_add_complex_transition()

func load_main_scene() -> void:
	next_scene = MAIN
	_add_complex_transition()
