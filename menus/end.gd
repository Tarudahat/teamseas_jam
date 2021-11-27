extends Control


func _on_RichTextLabel3_meta_clicked(meta):
	OS.shell_open(str(meta))
