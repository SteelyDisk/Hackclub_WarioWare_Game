extends Node2D
@onready var themed_timer: Timer = $ThemedTimer

var buttons_pressed := 0
var timer_end = false
var time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await Timer(7.0)
	timer_end = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if buttons_pressed == 4:
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
	
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -= 1
		get_tree().change_scene_to_file("res://level_scene.tscn")
	
func Timer(_start_time: float):
	
	time = 10.0
	
	while time > 0.0:
		await wait(1.0) #waits for the function to be completed before processing
		time -= 1
		
	#when the timer reaches 0
	return

func wait (seconds: float):
	await get_tree().create_timer(seconds).timeout #makes you wait
