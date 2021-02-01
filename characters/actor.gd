extends KinematicBody2D
class_name Actor

const FLOOR_NORMAL = Vector2.UP

# Hmmm... should speed be variable during gameplay as a mechanic?
export var speed: = Vector2(100.0, 750.0)
export var gravity = 400.0
var _velocity: = Vector2.ZERO
