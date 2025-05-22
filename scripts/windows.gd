extends Control

const PROCESS_GROUP = preload("res://resources/process_group.tres")
const WINDOW = preload("res://scenes/window.tscn")

var item_windows: Dictionary = {}

func _process(_delta: float) -> void:
	# Create windows for new items
	for i in range(PROCESS_GROUP.list.size()):
		var item = PROCESS_GROUP.list[i]
		
		if not item_windows.has(item):
			var new_window: AppWindow = WINDOW.instantiate()
			new_window.process = item
			
			add_child(new_window)
			item_windows[item] = new_window
	
	# Remove windows for items that no longer exist
	for item in item_windows.keys():
		if item not in PROCESS_GROUP.list:
			item_windows[item].queue_free()
			item_windows.erase(item)
