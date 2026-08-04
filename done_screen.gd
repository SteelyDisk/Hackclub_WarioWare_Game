extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await wait(5.0)
	get_tree().change_scene_to_file("res://title_screen.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func wait (seconds: float):
	await get_tree().create_timer(seconds).timeout #makes you wait
