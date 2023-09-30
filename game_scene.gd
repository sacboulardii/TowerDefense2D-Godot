extends Node2D

var map_node

var build_mode  = false
var build_valid = false
var build_location
var build_type

func _ready():
	map_node = $Map1
	
	for i in get_tree().get_nodes_in_group("build_buttons"):
		i.pressed.connect(initiate_build_mode.bind(i.name))
	
func initiate_build_mode(tower_type):
	build_type = tower_type
	build_mode = true
	$UI.set_tower_preview(build_type, get_global_mouse_position())

func _process(_delta):
	if build_mode:
		update_tower_preview()

func update_tower_preview():
	var mouse_pos =  get_global_mouse_position()
	
	var current_tile = map_node.get_node("TowerExclusion").local_to_map(mouse_pos)
	var tile_pos = map_node.get_node("TowerExclusion").map_to_local(current_tile)

	if map_node.get_node("TowerExclusion").get_cell_source_id(0, current_tile) == -1:
		get_node("UI").update_tower_preview(tile_pos, "ff410ddc")
		build_valid = false
	else:
		get_node("UI").update_tower_preview(tile_pos, "2dff1ab4")
		build_valid = true
		build_location = tile_pos
	
func verify_and_build():
	pass
