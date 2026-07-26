extends Node2D
@onready var themed_timer: Timer = $ThemedTimer




var garlic_collected = 0
var timer_end = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	themed_timer.wait_time = 10.0
	themed_timer.start()
	await themed_timer.timeout
	
	timer_end = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if garlic_collected == 1:
		if Global.minigames_done > 3:
			get_tree().change_scne_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
	
	if timer_end:
		Global.minigames_done -= 1 #go back a minigame
		Global.lives -= 1 #lose a life
		get_tree().change_scene_to_file("res://level_scene.tscn")

func garlic_collect() -> void:
	garlic_collected = garlic_collected +1
	return
	
	
