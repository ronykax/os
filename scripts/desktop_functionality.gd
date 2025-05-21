extends Node

@onready var desktop: Control = $".."

const START_MENU = preload("res://scenes/start_menu.tscn")
var startmenu: StartMenu

func _on_start_button_pressed() -> void:
	startmenu = START_MENU.instantiate()
	desktop.add_child(startmenu)
