extends Control
class_name StartMenu

@export var bottom_margin: int
@export var left_margin: int

func _ready() -> void:
	$MainThing.position.y -= bottom_margin
	$MainThing.position.x += left_margin

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		queue_free()
		# uh
