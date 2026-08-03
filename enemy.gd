extends AnimatedSprite2D
@onready var enemy: AnimatedSprite2D = $"."


var move = randi_range(0, 2)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemy.flip_h = true
	enemy.flip_v = true
	enemy.play("Move_" + str(move))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
