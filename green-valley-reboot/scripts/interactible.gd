extends CollisionObject3D
class_name Interactible

signal interacted(body)

@export var prompt_message = "Interact"
@export var prompt_input = "interact"



func get_prompt():
	var Key_name = ""
	for action in InputMap.action_get_events(prompt_input):
		if action is InputEventKey:
			Key_name = action.as_text_physical_keycode()
			break
	
	return prompt_message + "\n[" + Key_name + "]"

func interact(body):
	interacted.emit(body)
