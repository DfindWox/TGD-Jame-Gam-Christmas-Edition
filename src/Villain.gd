extends CharacterBody2D


var bullet = preload("res://scenes/bullet.tscn")

func _physics_process(delta):
	pass
	


func _on_timer_timeout():
	var inst_bullet : RigidBody2D = bullet.instantiate()
	inst_bullet.global_position = $Marker2D.global_position
	
	# Apply Force
	inst_bullet.apply_central_impulse(Vector2.from_angle(deg_to_rad(215)) * 500)
	
	get_tree().current_scene.add_child(inst_bullet)
