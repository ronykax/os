extends Node

@onready var window: Control = get_parent()
var dragging := false
var drag_offset := Vector2.ZERO

func _on_draggable_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				drag_offset = window.position - event.global_position
			else:
				dragging = false
	elif event is InputEventMouseMotion and dragging:
		window.position = event.global_position + drag_offset

func _on_close_button_pressed() -> void:
	# actually remove the app process in future
	window.queue_free()
