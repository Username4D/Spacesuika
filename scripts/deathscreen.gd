extends Control

@export var score = 0

func _ready() -> void:
	$Control/Label2.text = "SCORE: " + var_to_str(int(score))
	await get_tree().process_frame
	self.visible = true



func _on_back_to_menu_pressed() -> void:
	self.get_parent().get_node("main_menu").home()
	self.get_parent().get_node("gameplay_scene").exit()
	exit()

func _process(delta: float) -> void:
	$Control.position.y = 96 - ease($Timer.time_left / 2, 4) * 1024
	

func exit():
	self.name = ""
	var timer = get_tree().create_timer(1)
	while timer:
		await get_tree().process_frame
		self.position.y -= 3
	self.queue_free()
