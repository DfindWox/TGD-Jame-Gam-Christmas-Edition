extends CanvasLayer


func _on_btn_return_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/TitleScreen.tscn")

func _on_btn_retry_pressed():
	get_tree().reload_current_scene()



func set_victory():
	%Label.text = "Level Complete!"
	$AnimationPlayer.play("enter_victory")

func set_defeat():
	%Label.text = "You Lost..."
	$AnimationPlayer.play("enter_defeat")
