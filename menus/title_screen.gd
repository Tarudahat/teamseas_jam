extends Control




func _on_Label_meta_clicked(meta):
	OS.shell_open(str(meta))

func _on_RichTextLabel_meta_clicked(meta):
	OS.shell_open(str(meta))


func _on_Button_pressed():
	get_tree().change_scene("res://levels/Level.tscn")


func _on_Button2_pressed():
	get_tree().quit()
