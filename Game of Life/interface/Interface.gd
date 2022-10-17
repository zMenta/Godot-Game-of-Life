extends Control

signal speed_changed(value)

onready var speed_slider : HSlider = $"%SpeedSlider"


func _on_SpeedSlider_value_changed(value: float) -> void:
	emit_signal("speed_changed", value)
