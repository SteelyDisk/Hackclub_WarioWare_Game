extends Node2D
@onready var player: CharacterBody2D = $"../Player"
@onready var self_area = $Area2D
@onready var player_area = $"../Player/Area2D"

#making a signal that the garlic has been collected
signal garlic_collected


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if player_area.overlaps_area(self_area):
		if self.visible:
			emit_signal("garlic_collected") #signals that the garlic has been collected
			self.hide() #hides the garlic after the signal passes
			
