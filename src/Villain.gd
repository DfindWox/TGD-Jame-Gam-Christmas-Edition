extends CharacterBody2D


var bullet = preload("res://scenes/bullet.tscn")
var alternate_bullet = 1
var chance_for_anvil := 0.5 # 50%

func _physics_process(delta):
	pass


func _on_timer_timeout():
	#test
	change_bullet_pattern()
	throw_item()
	#change_bullet_pattern()
	#throw_item()
	#change_bullet_pattern()
	#throw_item()


func change_bullet_pattern():
	# Random:
	alternate_bullet = randi_range(1,3)
	# Progressive:
	#alternate_bullet += 1
	#if alternate_bullet >= 4: alternate_bullet -= 3


func throw_item():
	var angle : float = 0
	var impulse : float = 0
	# Change params
	match alternate_bullet:
		1:
			angle = 220
			impulse = 720
		2:
			angle = 230
			impulse = 600
		3:
			angle = 250
			impulse = 500
	
	var inst_bullet : RigidBody2D = bullet.instantiate()
	inst_bullet.global_position = $Marker2D.global_position
	inst_bullet.apply_central_impulse(Vector2.from_angle(deg_to_rad(angle)) * impulse)
	
	if randf() < chance_for_anvil: inst_bullet.item_type = Bullet.Type.ANVIL
	else: inst_bullet.item_type = Bullet.Type.PRESENT
	
	get_tree().current_scene.add_child(inst_bullet)



