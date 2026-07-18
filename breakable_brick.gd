extends StaticBody2D

@export var points := 10

func _ready() -> void:
	add_to_group("bricks")

func hit() -> void:
	# Add score, play a sound, spawn a particle effect, etc. here later
	queue_free()
	
