class_name Bullet
extends RigidBody2D


var texture_anvil = preload("res://assets/images/icons8-anvil-60.png")
var texture_present = preload("res://assets/images/icons8-present-100.png")

enum Type {PRESENT, ANVIL}
@export var item_type : Type = Type.PRESENT


func _ready():
	set_sprite()


func set_sprite():
	match item_type:
		Type.PRESENT:
			$Sprite2D.texture = texture_present
			$Sprite2D.scale = Vector2(1,1)*0.7
		Type.ANVIL:
			$Sprite2D.texture = texture_anvil
			$Sprite2D.scale = Vector2(1,1)*1.2
	#print_debug($Sprite2D.scale)
