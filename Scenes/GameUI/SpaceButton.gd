extends Control

func is_small_screen() -> bool:
	return DisplayServer.window_get_size().x < 800
