extends Node2D



func _on_button_row_pressed(button: Variant) -> void:
	match button:
		'PLAY':
			var new = load("res://scenes/gameplay_scene.tscn").instantiate()
			new.position.y = - 648
			self.get_parent().add_child(new)
			$Camera2D.position.y -= 648

func home():
	$Camera2D.position.y = 648 / 2
