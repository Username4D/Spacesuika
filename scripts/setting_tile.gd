extends Control

@export var slider = false
@export var setting = ""
@export var range = [0,0]
@export var value = false

func _ready() -> void:
	$CheckBox.visible = not slider
	$HSlider.visible = slider
	$selected.visible = slider
	if slider:
		$HSlider.value = save_handler.settings[setting]
		$HSlider.min_value = range[0]
		$HSlider.max_value = range[1]
	else:
		$CheckBox.button_pressed = save_handler.settings[setting]
	
	$Label.text = self.name
func _process(delta: float) -> void:
	value = $CheckBox.button_pressed
	$selected.text = var_to_str(int($HSlider.value))


func _on_check_box_pressed() -> void:
	if not slider:
		save_handler.settings[setting] = $CheckBox.button_pressed


func _on_h_slider_drag_ended(value_changed: bool) -> void:
	if slider:
		save_handler.settings[setting] = $HSlider.value
