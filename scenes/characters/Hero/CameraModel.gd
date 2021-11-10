extends Camera
class_name CameraModel

export var hero_nodepath: NodePath
export var pivot_nodepath : NodePath

export(float, 0.1, 1) var mouse_sensitivity : float = 0.3
export(float, -90, 0) var min_pitch : float = -90
export(float, 0, 90) var max_pitch : float = 90

var pivot:Spatial setget , _get_pivot
var _pivot:Spatial

func _get_pivot() -> Spatial:
  if _pivot == null:
    _pivot = get_node(pivot_nodepath)

  return _pivot

var hero:HeroModel setget , _get_hero
var _hero:HeroModel

func _get_hero() -> HeroModel:
  if _hero == null:
    _hero = get_node(hero_nodepath)
    
  return _hero



