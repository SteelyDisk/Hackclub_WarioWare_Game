extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		Global.minigames_done = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
	

func _on_quit_pressed() -> void:
	get_tree().quit()
	


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://level_scene.tscn")
