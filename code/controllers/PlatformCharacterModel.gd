extends KinematicBody
class_name PlatformCharacterModel

# Export vars

## Movement variables
export var accel := 14.0
export var speed := 4.5
export var air_accel := 5.6
export var jump_power := 8.5
export var max_fall_vel := 20

# Public variables
## Movement variables
var jumping := false
var move_dir := Vector3()
var velocity := Vector3()
