class_name Bullet
extends RigidBody2D


var texture_anvil = preload("res://assets/images/Bigorna.png")
var texture_present = preload("res://assets/images/Presentes.png")

enum Type {PRESENT, ANVIL}
@export var item_type : Type = Type.PRESENT


func _ready():
	set_sprite()
	$sfx_falling.play()


func set_sprite():
	match item_type:
		Type.PRESENT:
			$Sprite2D.texture = texture_present
			$Sprite2D.scale = Vector2(1,1)*0.7
		Type.ANVIL:
			$Sprite2D.texture = texture_anvil
			$Sprite2D.scale = Vector2(1,1)*1.2
	#print_debug($Sprite2D.scale)


func _on_visible_on_screen_notifier_2d_screen_exited():
	if item_type == Type.ANVIL:
		$sfx_anvil.play()
		PlayerData.add_strike()
	elif item_type == Type.PRESENT:
		$sfx_happy.play()
		PlayerData.add_score()
	
	# esperar um segundo antes de deletar
	await get_tree().create_timer(1.0).timeout
	queue_free()
