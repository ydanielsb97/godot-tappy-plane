extends CanvasLayer

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()

func switch_scene() -> void:
	get_tree().change_scene_to_packed(GameManager.next_scene)
