extends Node
class_name CameraController

var model : CameraModel

func _ready():
	model = get_parent() as CameraModel
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
func _input(event):
	if event is InputEventMouseMotion:
		model.hero.rotation_degrees.y -= event.relative.x * model.mouse_sensitivity
		model.pivot.rotation_degrees.x -= event.relative.y * model.mouse_sensitivity
		model.pivot.rotation_degrees.x = clamp(model.pivot.rotation_degrees.x, model.min_pitch, model.max_pitch)
