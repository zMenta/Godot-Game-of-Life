extends Control

onready var speed_slider : HSlider = $"%SpeedSlider"


func _on_SpeedSlider_value_changed(value: float) -> void:
	print(value)
