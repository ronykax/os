extends Control
class_name AppWindow

# attach a process to window upon its creation
@export var process: Process

var dragging := false
var drag_offset := Vector2.ZERO

const PROCESS_GROUP = preload("res://resources/process_group.tres")

func _on_draggable_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				drag_offset = position - event.global_position
			else:
				dragging = false
	elif event is InputEventMouseMotion and dragging:
		position = event.global_position + drag_offset

func _on_close_button_pressed() -> void:
	PROCESS_GROUP.list.erase(process)
	print(PROCESS_GROUP.list)
	#queue_free()
