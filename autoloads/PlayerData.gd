extends Node

## Emitido quando o jogador leva 3 Strikes.
## O node do menu de derrota escuta esse signal.
signal player_lost

## Emitido quando o jogador vencer a fase.
## Não utilizado se a fase for infinita.
signal player_won

var score : int = 0
var strikes : int = 0

## Chamar sempre antes de começar uma fase.
func reset_game() -> void:
	score = 0
	strikes = 0

## Se o modo é infinito, score aumenta de 100 em 100, pelo psicológico de número maior ser melhor.
## senão, basta aumentar de um em um
func add_score() -> void:
	score += 100

## Toda vez que uma bigorna cai na cidade.
## Se caírem 3, a partida acaba.
func add_strike() -> void:
	strikes += 1
	if strikes >= 3:
		lose_game()

#TODO: Mostrar tela de derrota.
func lose_game() -> void:
	print_debug("VOCE PERDEU")
	player_lost.emit()
