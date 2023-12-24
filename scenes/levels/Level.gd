extends Node2D

## Quantos presentes devem ser salvos para concluir a fase
@export var required_score := 10

## De 0 (0%) a 1 (100%), probabilidade de jogar bigornas
@export var chance_for_anvil := 0.5
## De 0.3 a 1, o tempo entre lançamento de itens
@export var throw_timer := 0.8

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerData.reset_game()
	PlayerData.required_score = required_score
	
	$Villain.set_timer_duration(throw_timer)
	$Villain.chance_for_anvil = chance_for_anvil
	
	$music.play()


