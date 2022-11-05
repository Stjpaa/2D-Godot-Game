extends Node2D

func _ready() -> void:
	# $Gravityfield.connect("body_entered", $Player, "GravityFieldEntered", [$Gravityfield.field_gravity])
	for i in range(0, ($GravityFieldList.get_child_count())):
		var child = $GravityFieldList.get_child(i)
		child.connect("body_entered", $Player, "GravityFieldEntered", [child.field_gravity])
		child.connect("body_exited", $Player, "GravityFieldExited")
