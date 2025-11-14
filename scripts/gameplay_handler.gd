extends Node

var index = 0
var score = 0

signal pop(x)

func get_next_index():
	index += 1
	return index
