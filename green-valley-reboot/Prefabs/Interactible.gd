extends Interactible





func _on_interacted(body: Variant) -> void:
	if GameState.get_value("Key") > 0:
		$AudioStreamPlayer3D.play()
	
