extends Node

func _ready():
	$MainMenu/M/VB/NewGame.connect("pressed", on_new_game_pressed)
	$MainMenu/M/VB/Quit.connect("pressed", on_quit_pressed)

func on_new_game_pressed():
	$MainMenu.queue_free()
	var game_scene = load("res://game_scene.tscn").instantiate()
	add_child(game_scene)
	
func on_quit_pressed():
	get_tree().quit() 
