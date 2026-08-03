extends Node2D
@onready var animated_sprite: AnimatedSprite2D = $Hand
@onready var enemy: AnimatedSprite2D = $Enemy

var win = false
var lose = false

func _game(event: InputEvent):
	if Input.is_action_just_pressed("ui_accept") or event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if animated_sprite.animation == "Move_0" and enemy.animation == "Move_2" and $Hand.is_playing() and $Enemy.is_playing():
			win = true
			
		elif animated_sprite.animation == "Move_0" and enemy.animation == "Move_1" and $Hand.is_playing() and $Enemy.is_playing():
			lose = true
			
		elif animated_sprite.animation == "Move_1" and enemy.animation == "Move_0" and $Hand.is_playing() and $Enemy.is_playing():
			win = true
			
		elif animated_sprite.animation == "Move_1" and enemy.animation == "Move_2" and $Hand.is_playing() and $Enemy.is_playing():
			lose = true
			
		elif animated_sprite.animation == "Move_2" and enemy.animation == "Move_1" and $Hand.is_playing() and $Enemy.is_playing():
			win = true
			
		elif animated_sprite.animation == "Move_2" and enemy.animation == "Move_0" and $Hand.is_playing() and $Enemy.is_playing():
			lose = true
			

func win_lose_system():
	if lose == true:
		print("can you see this? Good.")
		Global.lives -= 1
		Global.minigames_done -= 1
		get_tree().change_scene_to_file("res://level_scene.tscn")
	elif win == true:
		print("can you see this? Good.")
		get_tree().change_scene_to_file("res://done_screen.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while true:
		win_lose_system()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
