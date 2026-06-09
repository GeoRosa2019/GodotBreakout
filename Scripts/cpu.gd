extends CharacterBody2D

@export var speed: float = 100.0
var direction = 0.0

@onready var ball = get_node("../Ball")

# Grabs the game screen to keep cpu in bounds
var screen_height = ProjectSettings.get_setting("display/window/size/viewport_height")

func _physics_process(delta):
	if ball.position.y < position.y - 10:
		velocity.y = -speed
	elif ball.position.y > position.y + 10:
		velocity.y = speed
	else:
		velocity.y = 0

	position.y = clamp(position.y, 50, screen_height - 50)
	move_and_collide(velocity * delta)
