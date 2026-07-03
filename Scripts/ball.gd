extends CharacterBody2D

@export var speed := 500.0
var launched = false

func _ready():
	velocity = Vector2.ZERO
	
func _process(delta):
	if not launched and Input.is_action_just_pressed("space_button"):
		launched = true
		velocity = Vector2.UP * speed  # or whatever direction you want the ball to start moving

# Ball script
func _physics_process(delta: float) -> void:
	if not launched:
		return
	var collision := move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.is_in_group("bricks"):
			print("Hit a brick!")
			collider.queue_free()
		velocity = velocity.bounce(collision.get_normal())
		
