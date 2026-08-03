extends AnimatedSprite2D
@onready var animated_sprite: AnimatedSprite2D = $"Hand"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var moves = [0, 1, 2]
	while not Input.is_action_just_pressed("ui_accept"):
		for move in moves:
			await wait(1.0)
			animated_sprite.play("Move_" + str(move))

func wait (seconds: float):
	await get_tree().create_timer(seconds).timeout #makes you wait
