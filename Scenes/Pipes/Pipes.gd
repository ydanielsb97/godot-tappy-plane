extends Node2D

const SPEED: float = 120.0
const OFF_SCREEN: float = 100.0

@onready var laser: Area2D = $Laser

func _physics_process(delta: float) -> void:
	position.x -= SPEED * delta
	
	if position.x < get_viewport_rect().position.x - OFF_SCREEN:
		remove()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	remove()

func remove() -> void:
	queue_free()

func _on_pipe_body_entered(body: Node2D) -> void:
	if body is Tappy:
		body.die()


func _on_laser_body_entered(body: Node2D) -> void:
	if body is Tappy:
		laser.body_entered.disconnect(_on_laser_body_entered)
		SignalHub.emit_point_scored()
