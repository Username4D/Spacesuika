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
