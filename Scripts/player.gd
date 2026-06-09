extends CharacterBody2D

@export var speed: float = 100.0

func get_input():
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed
	velocity.y = 0
	
func _physics_process(delta):
	get_input()
	move_and_slide()
