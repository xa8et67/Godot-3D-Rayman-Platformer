extends KinematicBody

export var speed := 7.0
export var jump_strength := 20.0
export var gravity := 50.0 

var _velocity := Vector3.ZERO
var _snap_vector := Vector3.DOWN

onready var _camera_arm := $CameraArm
onready var _model := $hero3DV

func get_input_delta(positive_action:String, negative_action:String) -> float:
	return Input.get_action_strength(positive_action) - Input.get_action_strength(negative_action)

func _physics_process(delta: float) -> void:
	var move_direction := Vector3.ZERO
	move_direction.x = get_input_delta("move_right", "move_left")
	move_direction.z = get_input_delta("move_forward", "move_backward")
	move_direction = move_direction.rotated(Vector3.UP, _camera_arm.rotation.y).normalized()

	_velocity.x = move_direction.x * speed
	_velocity.z = move_direction.z * speed
	_velocity.y -= gravity * delta

	var just_landed := is_on_floor() and _snap_vector == Vector3.ZERO
	var is_jumping := is_on_floor() and Input.is_action_just_pressed("jump")
	
	if is_jumping:
		_velocity.y = jump_strength
		_snap_vector = Vector3.ZERO
	
	elif just_landed:
		_snap_vector = Vector3.DOWN

	_velocity = move_and_slide_with_snap(_velocity, _snap_vector, Vector3.UP, true)

	if _velocity.length() > 0.2:
		var look_direction := Vector2(_velocity.z, _velocity.x)
		_model.rotation.y = look_direction.angle()

func _process(delta:float) -> void:
	_camera_arm.translation = translation


