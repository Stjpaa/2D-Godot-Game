extends BaseState

func input(event: InputEvent) -> int:
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		return State.Run
	elif Input.is_action_just_pressed("jump"):
		return State.Jump
		
	return State.Null
	
func process(delta: float) -> int:
	return State.Null
	
func physics_process(delta: float) -> int:
	player.velocity += player.gravity
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	if !player.is_on_floor():
		return State.Fall
	
	return State.Null
