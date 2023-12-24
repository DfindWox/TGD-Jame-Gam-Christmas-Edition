class_name Player
extends CharacterBody2D


const SPEED = 500.0
const DASH_SPEED = 1500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var input_vector = Vector2(
		Input.get_axis("move_left", "move_right"),
		0 #Input.get_axis("move_up", "move_down") # sem movimento vertical
		).normalized()
	
	# fever
	if Input.is_action_pressed("fever"):
		velocity = input_vector * DASH_SPEED
	else:
		velocity = input_vector * SPEED
	move_and_slide()
	
	# limitar movimento
	if global_position.x < 80:
		global_position.x = 80
	if global_position.x > 900:
		global_position.x = 900
	
	# teste: rebater
	#if Input.is_action_just_pressed("ui_accept"):
	#	$AnimationPlayer.play("swing")
	if PlayerData.state == PlayerData.GameState.VICTORY:
		$AnimationPlayer.play("win")
	elif $AnimationPlayer.current_animation != "swing":
		if Input.is_action_pressed("fever"):
			$AnimationPlayer.play("dash")
		else:
			$AnimationPlayer.play("idle")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "swing":
		$AnimationPlayer.play("idle")



func _on_area_hitzone_body_entered(body):
	if body is Bullet:
		$AnimationPlayer.play("swing")
		body.was_hit = true
		body.apply_central_impulse(Vector2.from_angle(deg_to_rad(330))*4000)
		body.break_item()
