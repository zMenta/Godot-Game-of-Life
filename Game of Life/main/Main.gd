extends Node2D

onready var interface := $Interface
onready var map := $Map


func _ready() -> void:
	interface.connect("speed_changed", map, "_on_SpeedSlider_value_change")
	interface.connect("pause_mode_changed", map, "_on_PauseButton_value_changed")
