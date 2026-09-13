extends Interactible



func _on_interacted(body: Variant) -> void:
	GameState.set_total("Component", GameState.get_total("Component") + 1)
	queue_free()
