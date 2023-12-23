extends Control



func _ready():
	await get_tree().create_timer(1.0).timeout
	$VBox/BtnPlay1.grab_focus()


func _on_btn_play_1_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
	pass


func _on_btn_play_2_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")
	pass


func _on_btn_play_3_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_3.tscn")
	pass


func _on_btn_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/CreditsScreen.tscn")
	pass
