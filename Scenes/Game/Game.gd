extends Node2D

const PIPES = preload("res://Scenes/Pipes/Pipes.tscn")

@onready var upper_point: Marker2D = $UpperPoint
@onready var lower_point: Marker2D = $LowerPoint
@onready var pipes_holder: Node = $PipesHolder

const OFF_SCREEN_MARGIN = 100

func _ready() -> void:
	spawn()

func _enter_tree() -> void:
	SignalHub.plane_died.connect(_on_plane_plane_died)

func _on_spawn_timer_timeout() -> void:
	spawn()

func spawn() -> void:
	var new_pipes = PIPES.instantiate()
	new_pipes.position.y = randf_range(upper_point.position.y, lower_point.position.y)
	new_pipes.position.x = upper_point.position.x
	pipes_holder.add_child(new_pipes)


func _on_plane_plane_died() -> void:
	get_tree().paused = true
