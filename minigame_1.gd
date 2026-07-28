extends Node2D
@onready var themed_timer: Timer = $ThemedTimer
@onready var timer: RichTextLabel = $"Timer"

var time
var garlic_collected = 0
var timer_end = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	themed_timer.wait_time = 10.0
	themed_timer.start()
	await Timer(1.0)
	
	timer_end = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
		
	if garlic_collected == 1:
		Global.minigames_done += 1
		
		if Global.minigames_done > 3:
			get_tree().change_scne_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://minigame_2.tscn")
	
	if timer_end:
		Global.minigames_done -= 1 #go back a minigame
		Global.lives -= 1 #lose a life
		get_tree().change_scene_to_file("res://level_scene.tscn")
	
	timer.text = str(time)





func Timer(_start_time: float):
	
	time = 10.0
	
	while time > 0.0:
		await wait(1.0) #waits for the function to be completed before processing
		time -= 1
		
	#when the timer reaches 0
	return

func wait (seconds: float):
	await get_tree().create_timer(seconds).timeout #makes you wait


func _on_garlic_garlic_collected() -> void:
	garlic_collected = garlic_collected +1
	return
