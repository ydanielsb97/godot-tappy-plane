extends Node

signal plane_died
signal point_scored

func emit_plane_died() -> void:
	plane_died.emit()

func emit_point_scored() -> void:
	point_scored.emit()
