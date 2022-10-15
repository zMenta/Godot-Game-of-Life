extends TileMap

onready var generation_timer := $NewGenerationTimer

var i = 0

# Cell code: 0 = dead, 1 = alive
enum Cell {
	dead,
	alive
	}


func _on_NewGenerationTimer_timeout() -> void:
	set_cell(i,0,Cell.alive)
	i += 1
