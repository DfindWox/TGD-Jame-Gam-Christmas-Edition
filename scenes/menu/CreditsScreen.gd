extends Control


func _ready():
	$BtnReturn.grab_focus()


func _on_btn_return_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/TitleScreen.tscn")
