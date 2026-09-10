extends RayCast3D

@onready var prompt: Label = $prompt

func _physics_process(_delta):
	prompt.text = ""
	
	if is_colliding():
		prompt.text = "something else..."
