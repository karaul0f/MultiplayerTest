extends TextureRect

func _on_mouse_entered():
	pass
	
func _on_mouse_exited():
	pass
	
func set_info(info):
	var label = get_node("CardInfo") as Label
	label.text = info
