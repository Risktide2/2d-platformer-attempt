extends CharacterBody3D


var truespeed = 5.0
const JUMP_VELOCITY = 4.5
const SPRINT_VELOCITY = 2

var walkspeed = 5
var crawlspeed = 2.5

var crouch_height = 0.5
var stand_height = 2.0
var crouching = false

@onready var pivot: Node3D = $CameraOrigin
@export var sens = 0.5
@onready var footstepaudio_3d: AudioStreamPlayer3D = %Footstepaudio3d

var foot_step_play := true
var footstep_landed

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func crouch():
	if Input.is_action_just_pressed("crouch"):
		crouching = !crouching
		if crouching:
			$AnimationPlayer.play("StandingToCrouch")
			truespeed = crawlspeed
		else:
			$AnimationPlayer.play_backwards("StandingToCrouch")
			truespeed = walkspeed
	

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * sens))
		pivot.rotate_x(deg_to_rad(-event.relative.y * sens))
		pivot.rotation.x = clamp(pivot.rotation.x, deg_to_rad(-90), deg_to_rad(45))

func _physics_process(delta: float) -> void:
	
	crouch()
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * truespeed
		velocity.z = direction.z * truespeed
		#check if sprinting
		if Input.is_action_pressed("sprint"):
			#we are sprinting
			velocity.z *= SPRINT_VELOCITY
	else:
		velocity.x = move_toward(velocity.x, 0, truespeed)
		velocity.z = move_toward(velocity.z, 0, truespeed)

	move_and_slide()
	
	if not footstep_landed and is_on_floor(): #landed
		%Footstepaudio3d.play
	elif footstep_landed and not is_on_floor(): #jumped
		%Footstepaudio3d.play
	footstep_landed = is_on_floor()
		


func toggle(body: Variant) -> void:
	pass # Replace with function body.
