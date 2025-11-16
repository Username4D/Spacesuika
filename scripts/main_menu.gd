extends Node2D

func _on_button_row_pressed(button: Variant) -> void:
	match button:
		'PLAY':
			if self.get_node("gameplay_scene") == null:
				var new = load("res://scenes/gameplay_scene.tscn").instantiate()
				new.position.y = - 648
				self.get_parent().add_child(new)
			$Camera2D.position.y = -648+ 648 / 2
			$Camera2D.position.x = 1152 / 2
		'ACHIEVEMENTS':
			if self.get_node("achievements_page") == null:
				var new = load("res://scenes/achievements_page.tscn").instantiate()
				new.position.x = 1152
				self.get_parent().add_child(new)
			$Camera2D.position.x = 1152 + 1152 / 2
			$Camera2D.position.y = 648 / 2
		'SETTINGS':
			if self.get_node("settings_page") == null:
				var new = load("res://scenes/settings.tscn").instantiate()
				new.position.x = 576
				new.position.y = 648
				self.get_parent().add_child(new)
			$Camera2D.position.x = 576 + 1152 / 2
			$Camera2D.position.y = 648 + 648 / 2
func home():
	$Camera2D.position.y = 648 / 2
	$Camera2D.position.x = 1152 / 2
