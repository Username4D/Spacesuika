extends HBoxContainer

var hovered = 0
var active = false


func _ready() -> void:
	for i in self.get_children():
		i.get_node("Label").text = i.name

func _process(delta: float) -> void:
	hovered = floor((get_local_mouse_position().x + 128 - self.size.x / 2 ) / 256)
	if abs(hovered) <= floor(self.get_child_count() / 2) and active:
		for i in self.get_children():
			if i.get_index() != hovered + floor(self.get_child_count() / 2):
				i.custom_minimum_size.x = move_toward(i.custom_minimum_size.x, 128, 1024 * delta)
		self.get_child(hovered + floor(self.get_child_count() / 2)).custom_minimum_size.x =move_toward(self.get_child(hovered + floor(self.get_child_count() / 2)).custom_minimum_size.x, 256, 1024 * delta)
	else:
		for i in self.get_children():
			i.custom_minimum_size.x = move_toward(i.custom_minimum_size.x, 128, 1024 * delta)
	
	if clamp(get_global_mouse_position().y, self.position.y, self.position.y + 128) == get_global_mouse_position().y:
		active = true
	else:
		active = false 
	
signal pressed(button)
