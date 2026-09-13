extends Node


var state := {
	"Health": 100,
	"Key": 0,
	"Component": 0
}

func get_value(Key):
	if state.has(Key):
		return state[Key]
		
	printerr("Key not present in state: ", Key)
		
func set_value(Key, value):
	state[Key] = value
	
func get_total(Component):
	if state.has(Component):
		return state[Component]
		
func set_total(Component, value):
	state[Component] = value
