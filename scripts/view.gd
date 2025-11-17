extends Node2D

func _ready() -> void:
	save_handler.load_save()
	if not save_handler.settings["glow"]:
		$WorldEnvironment.queue_free()
	if save_handler.settings["capped_fps"]:
		Engine.max_fps = save_handler.settings["max_fps"]
	if save_handler.settings["vsync"]:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	
