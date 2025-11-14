extends Node2D

var shoot_start = Vector2.ZERO
var shoot_distance
var mesh_start = Vector2.ZERO

var planet = preload("res://scenes/planets/mercury.tscn")

func _process(delta: float) -> void:
	if not $Button.button_pressed and not $Button/Button2.button_pressed:
		var rot = $Area2D.position.angle_to_point(get_local_mouse_position()) * -1 + PI / 2
		$Button.position = $Area2D.position + Vector2(sin(rot), cos(rot)) * 256- Vector2(32,32)
		$Button.rotation = rot * -1 -  PI / 2
		$Button/MeshInstance2D.position = Vector2(32,32)
	else:
		shoot_distance = get_local_mouse_position() - shoot_start
		$Button/MeshInstance2D.global_position = mesh_start + (shoot_distance / 2)
		print(shoot_distance)

func _on_button_button_up() -> void:
	var new_shot = planet.instantiate()
	new_shot.index = gameplay_handler.get_next_index()
	new_shot.position = $Button/MeshInstance2D.global_position
	new_shot.scale = new_shot.nscale
	self.add_child(new_shot)
	new_shot.apply_impulse(shoot_distance * -1)
	print(shoot_distance)
func _on_button_button_down() -> void:
	mesh_start = $Button/MeshInstance2D.global_position
	shoot_start = get_local_mouse_position()
	
func _ready() -> void:
	for i in range(0, 370, 10 ):
		$Line2D.add_point(Vector2(sin(deg_to_rad(i)), cos(deg_to_rad(i))) * 256 )
