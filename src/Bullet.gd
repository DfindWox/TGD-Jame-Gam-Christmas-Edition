class_name Bullet
extends RigidBody2D


var texture_anvil = preload("res://assets/images/Bigorna_small.png")
var texture_presents = [
	preload("res://assets/images/Presentes_small.png"),
	preload("res://assets/images/Presentes_1.png"),
	preload("res://assets/images/Presentes_2.png"),
	preload("res://assets/images/Presentes_3.png"),
	preload("res://assets/images/Presentes_4.png")
]

enum Type {PRESENT, ANVIL}
@export var item_type : Type = Type.PRESENT

## mudar para true quando o jogador bater nesse item
var was_hit = false

func _ready():
	set_sprite()
	$sfx_falling.play()


func set_sprite():
	match item_type:
		Type.PRESENT:
			$Sprite2D.texture = texture_presents[randi_range(0,4)]
			#$Sprite2D.scale = Vector2(1,1)*0.7
		Type.ANVIL:
			$Sprite2D.texture = texture_anvil
			#$Sprite2D.scale = Vector2(1,1)*0.7
	#print_debug($Sprite2D.scale)


func break_item():
	match item_type:
		Type.PRESENT:
			$sfx_break_present.play()
			#particulas aqui
		Type.ANVIL:
			$sfx_break_anvil.play()
			pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	if not was_hit:
		if item_type == Type.ANVIL:
			$sfx_anvil.play()
			PlayerData.add_strike()
		elif item_type == Type.PRESENT:
			$sfx_happy.play()
			PlayerData.add_score()
	
	# esperar um segundo antes de deletar
	await get_tree().create_timer(1.0).timeout
	queue_free()
