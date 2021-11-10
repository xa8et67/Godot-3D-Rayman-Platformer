extends Node

var model : HeroModel

func _ready():
	model = self.get_parent() as HeroModel

func _process(_delta):
	# get the inputs
	var right_left = Funcs.get_input_delta("move_right", "move_left")
	var up_down = Funcs.get_input_delta("move_forward", "move_backward")

	# get move axis from player
	var player_forward = Funcs.get_forward(model)
	var player_right = player_forward.cross(Vector3.UP)

	# calculate the movement direction from player
	var dir = up_down * player_forward
	dir += right_left * player_right

	dir.y = 0
	model.move_dir = dir.normalized()

	model.jumping = model.is_on_floor() and Input.is_action_just_pressed("jump")

func _physics_process(delta):
	# Move the hero
	var velocity = Funcs.get_up_velocity(model)
	
	var accel = model.accel

	if !model.is_on_floor():
		accel = model.air_accel

	if model.move_dir.length() > 0.001:
		velocity = lerp(model.velocity, model.move_dir * model.speed, delta * accel)

	else:
		# stop moving Hero if no input
		velocity = lerp(model.velocity, Funcs.get_up_velocity(model), delta * accel)
	
	# hero is on ground
	if model.is_on_floor():
		velocity.y = -0.01
	
	else:
		# hero is in air
		velocity.y = lerp(model.velocity.y, Funcs.gravity.y, delta * model.max_fall_vel)
		
	if model.jumping:
		velocity.y = lerp(model.velocity.y, model.jump_power, delta)

	model.velocity = model.move_and_slide(velocity, Vector3.UP)
