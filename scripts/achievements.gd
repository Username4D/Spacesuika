extends Node2D

var achievements = {"10_points":{"name": "The first ten!", "desc": "Your first ten collected points"},
"100_points":{"name": "FREE POINTS", "desc": "Collected 100 points"},
"1000_points":{"name": "Big boi points", "desc": "Collected 1000 points"},
"10000_points":{"name": "Money go brrrr", "desc": "Collected 10000 points"},
"100000_points":{"name": "Talk to a real human", "desc": "Collected way too many points (100000)"},
"10_merges":{"name": "New Planets", "desc": "Merged 10 Planets"},
"100_merges":{"name": "Merge master", "desc": "Merged 100 Planets"},
"1000_merges":{"name": "This gets repetitive", "desc": "Merged 1000 Planets"},
"10000_merges":{"name": "Why does this feel like a mobile game", "desc": "Merged 10000 Planets"},
"100000_merges":{"name": "I feel obligated to tell you about therapy", "desc": "Merged 100000 Planets"},
"1_neptun":{"name": "Big guy", "desc": "Created 1 neptun"},
"10_neptun":{"name": "Big guys", "desc": "Created 10 neptuns"},
"100_neptun":{"name": "Lots of big guys", "desc": "Created 100 neptuns"},
"opened_settings":{"name": "The gears are turning", "desc": "Opened settings for the first time"},
"opened_maps":{"name": "New dimensions", "desc": "Opened maps for the first time"},
"opened_achievements":{"name": "The game has goals?", "desc": "Opened achievements for the first time"},
"opened_game":{"name": "Hello world", "desc": "Started your first round"},
"opened_credits":{"name": "Many people", "desc": "Opened credits for the first time"},
"first_death":{"name": "Ive come so far...", "desc": "Your first death"}
}

func push(x):
	print(x)
	$CanvasLayer/desc.text = achievements[x]["desc"]
	$CanvasLayer/name.text = achievements[x]["name"]
	$time.wait_time = 1
	$time.start()
	while $time.time_left != 0:
		await get_tree().process_frame
		$CanvasLayer.offset.x = -384 + 384 * ease($time.time_left, 0.5)
	$time.wait_time =2
	$time.start()
	await $time.timeout
	$time.wait_time = 1
	$time.start()
	while $time.time_left != 0:
		await get_tree().process_frame
		$CanvasLayer.offset.x = 0- 384 * ease($time.time_left, 0.5)

func _ready() -> void:
	save_handler.achievements.connect(push)
