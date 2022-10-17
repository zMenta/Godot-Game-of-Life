extends Node2D

onready var interface := $Interface
onready var map := $Map


func _ready() -> void:
	interface.connect("speed_changed", map, "_on_SpeedSlider_value_change")
	interface.connect("pause_mode_changed", map, "_on_PauseButton_value_changed")


# func _process(_delta: float) -> void:
# 	var pos_mouse := get_global_mouse_position()

# 	var pos_x := round(pos_mouse.x/8)
# 	var pos_y := round(pos_mouse.y/8)

# 	print(str(pos_x) + " | " + str(pos_y))
