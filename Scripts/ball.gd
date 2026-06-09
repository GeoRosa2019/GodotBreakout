extends CharacterBody2D

@export var speed := 500.0
var launched = false

func _ready():
	velocity = Vector2.ZERO
	
func _process(delta):
	if not launched and Input.is_action_just_pressed("space_button"):
		launched = true
		randomize_direction()

func randomize_direction():
	# Randomly choose left or right
	var x_direction = [-1, 1].pick_random()

	# Random vertical angle
	var y_direction = randf_range(-0.6, 0.6)

	# Create normalized direction vector
	velocity = Vector2(x_direction, y_direction).normalized() * speed

func _physics_process(delta):
	
	var collision = move_and_collide(velocity * delta)

	if collision:
		# Bounce using collision normal
		velocity = velocity.bounce(collision.get_normal())

		# Optional: slightly increase speed over time
		velocity *= 1.05

# Resets the ball after scoring
func reset():
	position = Vector2(0, -1)
	velocity = Vector2.ZERO
	launched = false
