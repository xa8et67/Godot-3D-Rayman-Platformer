extends Node

func get_up_velocity(model:HeroModel) -> Vector3:
	return model.velocity * Vector3.UP

func get_forward(model:Spatial) -> Vector3:
	return model.transform.basis.z

func get_up(model:Spatial) -> Vector3:
	return model.transform.basis.y

func get_right(model:Spatial) -> Vector3:
	return model.transform.basis.x

func get_input_delta(positive_action:String, negative_action: String) -> float:
	var p = Input.get_action_strength(positive_action)
	var n = Input.get_action_strength(negative_action)
	return  p - n

var gravity : Vector3 setget , _get_gravity
var _gravity : Vector3
var _gravity_calculated := false

func _get_gravity() -> Vector3:
	if not _gravity_calculated:
		var g = ProjectSettings.get_setting("physics/3d/default_gravity")
		_gravity = g * ProjectSettings.get_setting("physics/3d/default_gravity_vector")
		_gravity_calculated = true

	return _gravity
