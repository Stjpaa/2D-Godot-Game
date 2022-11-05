extends Area2D

export(Vector2) var field_gravity = Vector2.ZERO

func _ready():
	var PowDirection: Vector2 = $PowDirection.position
	field_gravity = Vector2(PowDirection.x, -PowDirection.y)
