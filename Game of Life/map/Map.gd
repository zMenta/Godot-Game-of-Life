extends TileMap

onready var generation_timer := $NewGenerationTimer

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


# Returns the alive cells surrounding a determined cell position.
func check_surround(pos_x: int, pos_y: int) -> int:
	# get_cell(x,y) = -1 -> null
	# get_cell(x,y) = 0 -> dead cell
	# get_cell(x,y) = 1 -> alive cell
	var alive_cells := 0

	for i in range(pos_x - 1, pos_x + 2):
		for j in range(pos_y - 1, pos_y + 2):

			# Discart the counting in the given cell position
			if i == pos_x and j == pos_y:
				continue

			if get_cell(i, j) == 1:
				alive_cells += 1

	return alive_cells


func new_generation() -> void:
	for i in range(map.x):
		for j in range(map.y):
			var cell := get_cell(i, j)
			var alive_cells := check_surround(i, j)

			if cell == Cell.dead and alive_cells == 3:
				set_cell(i, j, Cell.alive)

			if cell == Cell.alive and (alive_cells < 2 or alive_cells > 3):
				set_cell(i, j, Cell.dead)


func _on_NewGenerationTimer_timeout() -> void:
	new_generation()


func _on_SpeedSlider_value_change(value: float) -> void:
	print(value)
