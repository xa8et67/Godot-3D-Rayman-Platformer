extends KinematicBody
class_name HeroModel

# Export vars

## Movement variables
export var accel := 14.0
export var speed := 4.5
export var air_accel := 5.6
export var jump_power := 8.5
export var max_fall_vel := 20

## Combat/Damage variables
export var max_health := 100.0
export var max_power := 100.0

# Public variables
## Movement variables
var jumping := false
var move_dir := Vector3()
var velocity := Vector3()

## Combat/Damage variables
var health := 100.0
var power := 100.0

