extends Panel

@export var achievement = ""
@export var requirement = 1
@export var tracking = "points"

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
"10_neptun":{"name": "Big guys", "desc": "Created 10 neptunes"},
"100_neptun":{"name": "Lots of big guys", "desc": "Created 100 neptunes"},
"opened_settings":{"name": "The gears are turning", "desc": "Opened settings for the first time"},
"opened_maps":{"name": "New dimensions", "desc": "Opened maps for the first time"},
"opened_achievements":{"name": "The game has goals?", "desc": "Opened achievements for the first time"},
"opened_game":{"name": "Hello world", "desc": "Started your first round"},
"opened_credits":{"name": "Many people", "desc": "Opened credits for the first time"},
"first_death":{"name": "Ive come so far...", "desc": "Your first death"}
}

func _ready() -> void:
	$ProgressBar.max_value = requirement
	$name.text = achievements[achievement]["name"]
	$desc.text = achievements[achievement]["desc"]
	
	
	match tracking:
		"points":
			$ProgressBar.value = save_handler.points_collected
		"merges":
			$ProgressBar.value = save_handler.merges
		"neptuns":
			$ProgressBar.value = save_handler.neptuns
		"none":
			$ProgressBar.value = 1 if save_handler.collected_achievements[achievement] else 0
	$requirement.text = var_to_str(int($ProgressBar.value)) + "/" + var_to_str(requirement)
	if $ProgressBar.value >= requirement:
		self.modulate = Color(1.75,1.75,1.75,1)
