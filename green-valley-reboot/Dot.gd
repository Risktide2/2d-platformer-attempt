extends Interactible

var brokenstate : = true


func _on_interacted(body: Variant) -> void:
		if brokenstate and GameState.get_total("Component") > 1:
			brokenstate = false
			GameState.set_value("Key", GameState.get_value("Key") + 1)
			queue_free()
			
		
