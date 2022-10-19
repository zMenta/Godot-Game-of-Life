extends Control

signal speed_changed(value)
signal pause_mode_changed(value)
signal board_clear_button_pressed

onready var speed_slider : HSlider = $"%SpeedSlider"
onready var speed_value : Label = $"%SpeedValue"
onready var options_menu := $"%Options"


func _ready() -> void:
	_on_SpeedSlider_value_changed(speed_slider.value)

func _on_SpeedSlider_value_changed(value: float) -> void:
	emit_signal("speed_changed", value)
	speed_value.text = "Speed Value: " + str(value)


func _on_PauseButton_toggled(button_pressed: bool) -> void:
	emit_signal("pause_mode_changed", button_pressed)


func _on_BtnOptions_pressed() -> void:
	options_menu.visible = not options_menu.visible


func _on_BtnClearBoard_pressed() -> void:
	emit_signal("board_clear_button_pressed")
