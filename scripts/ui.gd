extends Node2D

var score = 0

func _process(delta: float) -> void:
	score = move_toward(score, gameplay_handler.score, 16 * delta)
	$Label.text = var_to_str(int(score))
	$Label.scale = $Label.scale.move_toward(Vector2(1,1), 2 * delta)
func pop_up(s):
	$Label.scale =Vector2.ONE +  Vector2(s,s)

func _ready() -> void:
	gameplay_handler.pop.connect(pop_up)
