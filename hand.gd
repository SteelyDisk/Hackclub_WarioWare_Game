extends AnimatedSprite2D
@onready var animated_sprite: AnimatedSprite2D = $"."

var stp = false 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_loop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		stp = true
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			stp = true

func animation_loop(): #loops through each hand sprite
	while not stp:
		var moves: Array[int] = [0, 1, 2]
		for move in moves:
			
			await wait(0.2) #wauts a for a bit so the loop doesn't move too fast
			animated_sprite.play("Move_" + str(move))
			
			if stp == true:
				break #stops the hand cycle

func wait (seconds: float):
	await get_tree().create_timer(seconds).timeout #makes you wait
