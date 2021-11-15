extends Node
class_name PlatformCharacterMoveController

var model : PlatformCharacterModel

func _ready():
	model = self.get_parent() as PlatformCharacterModel

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
	var j := Input.is_action_just_pressed("jump")
	model.jumping = j and model.is_on_floor()