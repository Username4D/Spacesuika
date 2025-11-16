extends Node

var points_collected = 0
var merges = 0
var neptuns = 0

signal achievements(achievement)

var settings = {"vsync": false, "max_fps": 60, "capped_fps": false, "glow": true, "animations": true, "sfx_volume": 10, "music_volume": 10}

var collected_achievements = {
 "10_points": false,
 "100_points": false,
 "1000_points": false,
 "10000_points": false,
 "100000_points": false,
 "10_merges": false,
 "100_merges": false,
 "1000_merges": false,
 "10000_merges": false,
 "100000_merges": false,
 "1_neptun": false,
 "10_neptun": false,
 "100_neptun": false,
 "opened_achievements": false,
 "opened_settings": false,
 "opened_game": false,
 "opened_maps": false,
 "opened_credits": false,
 "first_death": false}

func check():
	if points_collected >= 100000 and not collected_achievements["100000_points"]:
		collected_achievements["100000_points"] = true
		achievements.emit("100000_points")
	elif points_collected >= 10000 and not collected_achievements["10000_points"]:
		collected_achievements["10000_points"] = true
		achievements.emit("10000_points")
	elif points_collected >= 1000 and not collected_achievements["1000_points"]:
		collected_achievements["1000_points"] = true
		achievements.emit("1000_points")
	elif points_collected >= 100 and not collected_achievements["100_points"]:
		collected_achievements["100_points"] = true
		achievements.emit("100_points")
	elif points_collected >= 10 and not collected_achievements["10_points"]:
		collected_achievements["10_points"] = true
		achievements.emit("10_points")
	
	if merges >= 100000 and not collected_achievements["100000_merges"]:
		collected_achievements["100000_merges"] = true
		achievements.emit("100000_merges")
	elif merges >= 10000 and not collected_achievements["10000_merges"]:
		collected_achievements["10000_merges"] = true
		achievements.emit("10000_merges")
	elif merges >= 1000 and not collected_achievements["1000_merges"]:
		collected_achievements["1000_merges"] = true
		achievements.emit("1000_merges")
	elif merges >= 100 and not collected_achievements["100_merges"]:
		collected_achievements["100_merges"] = true
		achievements.emit("100_merges")
	elif merges >= 10 and not collected_achievements["10_merges"]:
		collected_achievements["10_merges"] = true
		achievements.emit("10_merges")
	
	print(points_collected, merges)

func load_save():
	var file = FileAccess.open("user://savefile.dat", FileAccess.READ)
	if file != null:
		var content = file.get_var()
		points_collected = content["points_collected"]
		merges = content["merges"]
		neptuns = content["neptuns"]
		settings = content["settings"]
		collected_achievements = content["collected_achievements"]
		
func save_save():
	var content = {"points_collected": points_collected, "merges": merges, "neptuns": neptuns, "settings": settings, "collected_achievements": collected_achievements}
	var file = FileAccess.open("user://savefile.dat", FileAccess.WRITE)
	file.store_var(content)
