extends Node

var points_collected = 100
var merges = 0
var neptuns = 0

signal achievements(achievement)

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
