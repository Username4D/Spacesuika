extends Node2D

var settings = false
@export var play = false
var achievements = false
var maps = false
var credits = false
func _on_button_row_pressed(button: Variant) -> void:
	match button:
		'PLAY':
			if not play:
				var new = load("res://scenes/gameplay_scene.tscn").instantiate()
				new.position.y = - 648
				self.get_parent().add_child(new)
				play = true
			$Camera2D.position.y = -648+ 648 / 2
			$Camera2D.position.x = 1152 / 2
		'ACHIEVEMENTS':
			if not achievements:
				var new = load("res://scenes/achievements_page.tscn").instantiate()
				new.position.x = 1152
				self.get_parent().add_child(new)
				achievements = true
			$Camera2D.position.x = 1152 + 1152 / 2
			$Camera2D.position.y = 648 / 2
		'SETTINGS':
			if not settings:
				var new = load("res://scenes/settings.tscn").instantiate()
				new.position.x = 576
				new.position.y = 648
				self.get_parent().add_child(new)
				settings = true
			$Camera2D.position.x = 576 + 1152 / 2
			$Camera2D.position.y = 648 + 648 / 2
		'MAPS':
			if not settings:
				var new = load("res://scenes/maps.tscn").instantiate()
				new.position.x = -576
				new.position.y = 648
				self.get_parent().add_child(new)
				maps = true
			$Camera2D.position.x = -576 + 1152 / 2
			$Camera2D.position.y = 648 + 648 / 2
		'CREDITS':
			if not credits:
				var new = load("res://scenes/credits.tscn").instantiate()
				new.position.x = -1152
				self.get_parent().add_child(new)
				credits = true
			$Camera2D.position.x = -1152 + 1152 / 2
			$Camera2D.position.y = 648 / 2
func home():
	$Camera2D.position.y = 648 / 2
	$Camera2D.position.x = 1152 / 2

func _ready() -> void:
	$Camera2D.position_smoothing_enabled = save_handler.settings["animations"]
