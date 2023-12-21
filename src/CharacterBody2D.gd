extends CharacterBody2D


const SPEED = 400.0
var fever_speed = 1200.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var input_vector = Vector2(
		Input.get_axis("move_left", "move_right"),
		0 #Input.get_axis("move_up", "move_down") # sem movimento vertical
		).normalized()
	
	# fever
	if Input.is_action_pressed("fever"):
		velocity = input_vector * fever_speed
	else:
		velocity = input_vector * SPEED
	move_and_slide()
