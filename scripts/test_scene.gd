extends Node2D

var shoot_start = Vector2.ZERO
var shoot_distance
var mesh_start = Vector2.ZERO

var planet_textures = [preload("res://assets/planets/mercury.svg"), preload("res://assets/planets/venus.svg"), preload("res://assets/planets/earth.svg"), preload("res://assets/planets/mars.svg")]
var planet_scales = [Vector2(0.4,0.4),Vector2(0.6,0.6),Vector2(0.8,0.8),Vector2(1.1,1.1)]

var planets = [preload("res://scenes/planets/mercury.tscn"), preload("res://scenes/planets/venus.tscn"), preload("res://scenes/planets/earth.tscn"), preload("res://scenes/planets/mars.tscn")]
var next_planet = 0

signal death_singal

func _process(delta: float) -> void:
	if not $Button.button_pressed and not $Button/Button2.button_pressed:
		var rot = $Area2D.global_position.angle_to_point(get_global_mouse_position()) * -1 + PI / 2
		$Button.position = $Area2D.position + Vector2(sin(rot), cos(rot)) * 256- Vector2(32,32)
		$Button.rotation = rot * -1 -  PI / 2
		$Button/MeshInstance2D.position = Vector2(32,32)
	else:
		shoot_distance = get_global_mouse_position() - shoot_start
		$Button/MeshInstance2D.global_position = mesh_start + (shoot_distance / 2)
	
	$Button/MeshInstance2D.scale = $Button/MeshInstance2D.scale.move_toward(planet_scales[next_planet] * 0.5, 1 * delta)
func _on_button_button_up() -> void:
	if $Button/MeshInstance2D.scale == planet_scales[next_planet] * 0.5:
		var new_shot = planets[next_planet].instantiate()
		new_shot.index = gameplay_handler.get_next_index()
		new_shot.rotation = $Button/MeshInstance2D.global_rotation
		new_shot.position = $Button/MeshInstance2D.global_position + Vector2(0, 648 )
		new_shot.scale = new_shot.nscale
		self.add_child(new_shot)
		new_shot.apply_impulse(shoot_distance * -1)
		var ran = randi_range(0, 12)
		if ran <= 5:
			next_planet = 0
		elif ran <=8:
			next_planet = 1
		elif next_planet <= 9:
			next_planet = 2
		else:
			next_planet = 3
		$Button/MeshInstance2D.texture = planet_textures[next_planet]
		$Button/MeshInstance2D.scale = Vector2(0.01,0.01)
	
	
func _on_button_button_down() -> void:
	mesh_start = $Button/MeshInstance2D.global_position
	shoot_start = get_global_mouse_position()
	
func _ready() -> void:
	for i in range(0, 370, 10 ):
		$Line2D.add_point(Vector2(sin(deg_to_rad(i)), cos(deg_to_rad(i))) * (256 - 48))

func death():
	death_singal.emit()
	var deathscreen = load("res://scenes/deathscreen.tscn").instantiate()
	deathscreen.score = gameplay_handler.score
	deathscreen.position = self.position
	self.get_parent().add_child(deathscreen)

func exit():
	gameplay_handler.score = 0
	self.get_parent().get_node("main_menu").play = false
	self.name = "wooo"
	var timer = get_tree().create_timer(1)
	while timer:
		await get_tree().process_frame
		self.position.y -= 2
	self.queue_free()
