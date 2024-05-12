extends CanvasLayer

func _on_exit_button_pressed():
	get_tree().quit()

func _on_start_desert_button_pressed():
	get_tree().change_scene_to_file("res://scenes/desert_world.tscn")
	

func _on_start_town_button_pressed():
	get_tree().change_scene_to_file("res://scenes/town_world.tscn")
