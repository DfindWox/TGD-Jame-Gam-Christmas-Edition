extends Node

## Emitido quando o jogador leva 3 Strikes.
## O node do menu de derrota escuta esse signal.
signal player_lost

## Emitido quando o jogador vencer a fase.
## Não utilizado se a fase for infinita.
signal player_won

var score : int = 0
var required_score : int = 10
var strikes : int = 0

enum GameState {RUNNING, VICTORY, DEFEAT}
var state : GameState = GameState.RUNNING

## Chamar sempre antes de começar uma fase.
func reset_game() -> void:
	score = 0
	strikes = 0
	state = GameState.RUNNING

## Se o modo é infinito, score aumenta de 100 em 100, pelo psicológico de número maior ser melhor.
## senão, basta aumentar de um em um
func add_score() -> void:
	if state != GameState.RUNNING: return
	score += 1
	if score >= required_score:
		win_game()

## Toda vez que uma bigorna cai na cidade.
## Se caírem 5, a partida acaba.
func add_strike() -> void:
	if state != GameState.RUNNING: return
	strikes += 1
	if strikes >= 5:
		lose_game()

#TODO: Mostrar tela de derrota.
func lose_game() -> void:
	state = GameState.DEFEAT
	player_lost.emit()
	print_debug("VOCE PERDEU")

func win_game() -> void:
	state = GameState.VICTORY
	player_won.emit()
	print_debug("VOCE VENCEU")
