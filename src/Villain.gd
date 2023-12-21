extends CharacterBody2D


var bullet = preload("res://scenes/bullet.tscn")
var alternate_bullet = 1

func _physics_process(delta):
	pass


func _on_timer_timeout():
	match alternate_bullet:
		1:
			shoot_bullet_1()
		2:
			shoot_bullet_2()
		3:
			shoot_bullet_3()


func shoot_bullet_1():
	var inst_bullet : RigidBody2D = bullet.instantiate()
	inst_bullet.global_position = $Marker2D.global_position
	
	# Apply Force
	inst_bullet.apply_central_impulse(Vector2.from_angle(deg_to_rad(215)) * 500)
	
	get_tree().current_scene.add_child(inst_bullet)
	
	alternate_bullet += 1


func shoot_bullet_2():
	var inst_bullet : RigidBody2D = bullet.instantiate()
	inst_bullet.global_position = $Marker2D.global_position
	
	# Apply Force
	inst_bullet.apply_central_impulse(Vector2.from_angle(deg_to_rad(215)) * 700)
	
	get_tree().current_scene.add_child(inst_bullet)
	
	alternate_bullet += 1

func shoot_bullet_3():
	var inst_bullet : RigidBody2D = bullet.instantiate()
	inst_bullet.global_position = $Marker2D.global_position
	
	# Apply Force
	inst_bullet.apply_central_impulse(Vector2.from_angle(deg_to_rad(215)) * 300)
	
	get_tree().current_scene.add_child(inst_bullet)
	
	alternate_bullet = 1

