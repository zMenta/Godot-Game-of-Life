extends TileMap

onready var generation_timer := $NewGenerationTimer

# map size is 128x75 cells 
var map_size := [128,75]
var i = 0

# Cell code: 0 = dead, 1 = alive
enum Cell {
	dead,
	alive
	}


func _on_NewGenerationTimer_timeout() -> void:
	set_cell(i,0,Cell.alive)
	i += 1
