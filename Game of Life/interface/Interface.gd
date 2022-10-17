extends Control

signal speed_changed(value)
signal pause_mode_changed(value)

onready var speed_slider : HSlider = $"%SpeedSlider"
onready var speed_value : Label = $"%SpeedValue"


func _ready() -> void:
	_on_SpeedSlider_value_changed(speed_slider.value)

func _on_SpeedSlider_value_changed(value: float) -> void:
	emit_signal("speed_changed", value)
	speed_value.text = "Speed Value: " + str(value)


func _on_PauseButton_toggled(button_pressed: bool) -> void:
	emit_signal("pause_mode_changed", button_pressed)
