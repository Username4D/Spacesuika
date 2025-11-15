extends Button

var speed  = 1

func _on_pressed() -> void:
	self.get_parent().pressed.emit(self.name)

func _process(delta: float) -> void:
	if $Sprite2D:
		$Sprite2D.rotation += speed * delta
	


func _on_mouse_entered() -> void:
	speed =2.5 


func _on_mouse_exited() -> void:
	speed = 0.75
