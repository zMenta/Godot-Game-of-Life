extends TileMap

onready var generation_timer : Timer = $NewGenerationTimer

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

# Checks for cells that need to be changed and then calls draw_generation().
func new_generation() -> void:
	var cells_to_change := []

	for i in range(map.x):
		for j in range(map.y):
			var state := get_cell(i, j)
			var cell = {
				"state" : state,
				"pos_x" : i,
				"pos_y" : j,
				"state_to_change" : -1
				}

			var alive_cells := check_surround(i, j)

			if cell.state == Cell.dead and alive_cells == 3:
				cell.state_to_change = Cell.alive

			if cell.state == Cell.alive and (alive_cells < 2 or alive_cells > 3):
				cell.state_to_change = Cell.dead

			if cell.state_to_change != -1:
				cells_to_change.append(cell)

	draw_generation(cells_to_change)

# Draws the tileset with set_cell() for the changed tiles in the map.
func draw_generation(cells: Array) -> void:
	for cell in cells:
		set_cell(cell.pos_x, cell.pos_y, cell.state_to_change)


func _on_NewGenerationTimer_timeout() -> void:
	new_generation()


func _on_SpeedSlider_value_change(value: float) -> void:
	generation_timer.wait_time = value
	generation_timer.start(value)
	
func _on_PauseButton_value_changed(paused: bool) -> void:
	if paused:
		generation_timer.stop()
	else:
		generation_timer.start()
