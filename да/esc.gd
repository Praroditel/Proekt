extends Control


func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://node_2d.tscn")	
		print("4")

		
