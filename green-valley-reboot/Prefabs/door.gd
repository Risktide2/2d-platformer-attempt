extends Node3D

var playback : AnimationNodeStateMachinePlayback
var is_open := false

func _ready():
	playback = $AnimationTree.get("parameters/playback")
	
func toggle(_body):
	is_open = not is_open
	
	if is_open:
		playback.travel("Door Open")
		$AudioStreamPlayer3D.play()
	else:
		playback.travel("Door close")
		$AudioStreamPlayer3D.play()
