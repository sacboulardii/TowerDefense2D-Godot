extends CanvasLayer

var tower_type_handler = {"SingleCannonBuild": "single_cannon"}

func set_tower_preview(tower_type, mouse_position):
	
	var drag_tower = load("res://" + tower_type_handler[tower_type] + ".tscn").instantiate()
	drag_tower.set_name("DragTower")
	drag_tower.modulate = Color("2dff1ab4")
	drag_tower.set_script(null)
	
	var control = Control.new()
	control.add_child(drag_tower, true)
	control.position = mouse_position
	control.set_name("TowerPreview")
	add_child(control, true)
	move_child($TowerPreview, 0)

func update_tower_preview(new_position, color):
	$TowerPreview.position = new_position
	if $TowerPreview/DragTower.modulate != Color(color):
		$TowerPreview/DragTower.modulate = Color(color)
