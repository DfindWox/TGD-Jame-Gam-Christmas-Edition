extends CharacterBody2D


var bullet = preload("res://scenes/bullet.tscn")
var alternate_bullet = 1
var chance_for_anvil := 0.5 # 50%

var dead := false
var escaping := false


func _ready():
	PlayerData.player_lost.connect(_on_player_lost)
	PlayerData.player_won.connect(_on_player_won)


func _physics_process(delta):
	
	if dead:
		position.y += delta*300
		rotation_degrees += delta*720
	
	if escaping:
		position.x += delta*200
	
	pass


func _on_timer_timeout():
	if dead or escaping: return
	
	change_bullet_pattern()
	$AnimationPlayer.stop()
	$AnimationPlayer.play("throw")


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


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "throw":
		$AnimationPlayer.play("idle")
	pass # Replace with function body.

func _on_player_won():
	dead = true
	pass

func _on_player_lost():
	escaping = true
	pass
