extends CharacterBody2D


const SPEED = 500.0
var fever_speed = 1100.0

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
	
	# limitar movimento
	if global_position.x < 80:
		global_position.x = 80
	if global_position.x > 900:
		global_position.x = 900
	
	# teste: rebater
	if Input.is_action_just_pressed("ui_accept"):
		$AnimationPlayer.play("swing")
	
	if $AnimationPlayer.current_animation != "swing":
		if Input.is_action_pressed("fever"):
			$AnimationPlayer.play("dash")
		else:
			$AnimationPlayer.play("idle")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "swing":
		$AnimationPlayer.play("idle")