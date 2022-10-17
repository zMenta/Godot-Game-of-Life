extends TileMap

onready var generation_timer := $NewGenerationTimer

var change_tile := true


# Map size enum
# map size is 128x75 cells
enum map {
	x = 128,
	y = 75
	}


# Cell code: 0 = dead, 1 = alive
enum Cell {
	dead,
	alive
	}


func new_generation() -> void:
	for i in range(map.x):
		for j in range(map.y):
			if change_tile:
				set_cell(i,j,Cell.alive)
			else:
				set_cell(i,j,Cell.dead)

	change_tile = not change_tile


func _on_NewGenerationTimer_timeout() -> void:
	new_generation()
