extends Node2D
@onready var wario_container: HBoxContainer = $TextureRect/Wario_Container
@onready var wario: TextureRect = $Wario_Container/Wario
@onready var wario_2: TextureRect = $Wario_Container/Wario2
@onready var wario_3: TextureRect = $Wario_Container/Wario3
@onready var wario_4: TextureRect = $Wario_Container/Wario4
@onready var wario_5: TextureRect = $Wario_Container/Wario5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await Timer(0.5)
	
	if Global.minigames_done < 3: # if you havent completed 3 minigames yet 
		Global.minigames_done = Global.minigames_done +1
		get_tree().change_scene_to_file("res://scenes/minigame_" + str(Global.minigames_done) + ".tscn") # changes your scene by arranging this frankenstein path.
		
	else:
		get_tree().change_scene_to_file("res://title_screen.tscn") 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match Global.lives:
		
		4:
			wario.hide()
		3:
			wario.hide()
			wario_2.hide()
		2:
			wario.hide()
			wario_2.hide()
			wario_3.hide()
		1:
			wario.hide()
			wario_2.hide()
			wario_3.hide()
			wario_4.hide()
		0:
			wario_container.hide() #hides all of the Wario's
			
	timer.text = str(time) # make ths text reflect the value of the time variable. this makes names easier. the str() converts the int to a String
	level.text = "Level " + str(Global.minigames_done) # this tells you want minigame you're on using concatenation (google the word yo)
	
func Timer(start_time: float):
	
	time = start_time
	
	while time > 0.0:
		await wait(0.1) #waits for the function to be completed before processing
		time -= 1
		
	#when the timer reaches 0
	return

func wait (seconds: float):
	await get_tree().create_timer(seconds).timeout #makes you wait
