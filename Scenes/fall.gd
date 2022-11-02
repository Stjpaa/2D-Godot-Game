extends BaseState

export (float) var move_speed = 150

func enter() -> void:
	.enter()

func physics_process(delta: float) -> int:
	var move = 0
	
	if Input.is_action_pressed("left"):
		move = -1
		# animation stuff
	elif Input.is_action_pressed("right"):
		move = 1

	player.velocity.x = move * move_speed
	player.velocity.y += player.gravity
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
		
	if player.is_on_floor():
		if move != 0:
			return State.Run
		else:
			return State.Idle
	return State.Null
