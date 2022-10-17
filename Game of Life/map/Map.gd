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

func _ready() -> void:
	# print(get_cell(-1,-1))
	# print(get_cell(0,0))
	# print(get_cell(1,1))
	print(check_surround(1,1))

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
			if change_tile:
				set_cell(i,j,Cell.alive)
			else:
				set_cell(i,j,Cell.dead)

	change_tile = not change_tile


func _on_NewGenerationTimer_timeout() -> void:
	# new_generation()
	pass
