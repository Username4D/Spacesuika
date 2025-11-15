extends RigidBody2D

@export var index = 0
@export var next_planet: Resource
@export var nscale = Vector2.ONE

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("planet") and area.get_parent().nscale == nscale:
		if area.get_parent().index > self.index:
			area.get_parent().spawn_new(area)
			self.queue_free()
	else:
		print(area.name)

func spawn_new(area):
	if next_planet:
		
		var new_planet = next_planet.instantiate()
		new_planet.position = self.position
		new_planet.scale = new_planet.nscale
		new_planet.index = gameplay_handler.get_next_index()
		self.get_parent().add_child(new_planet)
		await get_tree().process_frame
		self.queue_free()
		gameplay_handler.score += nscale.x *  10
		gameplay_handler.pop.emit(nscale.x)

func _ready() -> void:
	for i in self.get_children():
		i.scale = nscale if i.name != "Sprite2D" else nscale * 0.5


func _process(delta: float) -> void:
	if self.get_parent().get_node("Area2D"):
		if not next_planet:
			print(256 - 64 - nscale.x * 32, )
			print( self.position.distance_to(self.get_parent().get_node("Area2D").position))
		if self.position.distance_to(self.get_parent().get_node("Area2D").position) > 256 - 48 - nscale.x * 32:
			if $Area2D/death_timer.is_stopped(): 
				$Area2D/death_timer.start()
			self.modulate.g = 1 - (3 - $Area2D/death_timer.time_left) / 5
			self.modulate.b = 1 - (3 - $Area2D/death_timer.time_left) / 5
			print("lol")
		else: 
			$Area2D/death_timer.stop()
			self.modulate.g = move_toward(self.modulate.g, 1, 2 * delta)
			self.modulate.b = move_toward(self.modulate.g, 1, 2 * delta)
	



func _on_death_timer_timeout() -> void:
	self.queue_free()
