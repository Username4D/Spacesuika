extends Node2D


func _on_planet_button_pressed() -> void:
	self.get_parent().get_parent().add_child(load("res://scenes/view.tscn").instantiate())
	self.get_parent().queue_free()

func _process(delta: float) -> void:
	if $"ScrollContainer/VBoxContainer/V-Sync".value:
		$"ScrollContainer/VBoxContainer/Capped FPS".modulate.a = 0.3
		$"ScrollContainer/VBoxContainer/Capped FPS".process_mode = Node.PROCESS_MODE_DISABLED
		$"ScrollContainer/VBoxContainer/Max FPS".process_mode = Node.PROCESS_MODE_DISABLED
		$"ScrollContainer/VBoxContainer/Max FPS".modulate.a = 0.3
	elif not $"ScrollContainer/VBoxContainer/Capped FPS".value:
		$"ScrollContainer/VBoxContainer/Capped FPS".process_mode = Node.PROCESS_MODE_INHERIT
		$"ScrollContainer/VBoxContainer/Max FPS".process_mode = Node.PROCESS_MODE_DISABLED
		$"ScrollContainer/VBoxContainer/Max FPS".modulate.a = 0.3
		$"ScrollContainer/VBoxContainer/Capped FPS".modulate.a = 1
	else:
		$"ScrollContainer/VBoxContainer/Max FPS".process_mode = Node.PROCESS_MODE_INHERIT
		$"ScrollContainer/VBoxContainer/Capped FPS".process_mode = Node.PROCESS_MODE_INHERIT
		$"ScrollContainer/VBoxContainer/Max FPS".modulate.a = 1
		$"ScrollContainer/VBoxContainer/Capped FPS".modulate.a = 1
