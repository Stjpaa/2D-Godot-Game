extends BaseState

export (float) var jump_force = 240
export (float) var move_speed = 150
export (float) var jump_buffer_threshhold = 0.2

var jump_buffer_timer: float = 0

func enter() -> void:
	.enter()
	player.velocity.y = -jump_force

func input(event: InputEvent) -> int:
	if Input.is_action_just_pressed("jump"):
		jump_buffer_timer = jump_buffer_threshhold
		
	return State.Null

func process(delta: float) -> int:
	jump_buffer_timer -= delta
	return State.Null

func physics_process(delta: float) -> int:
	var move = 0
	
	if Input.is_action_pressed("left"):
		move = -1
		# animation stuff
	elif Input.is_action_pressed("right"):
		move = 1

	player.velocity.x = move * move_speed
	player.velocity += player.gravity
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	#if player.velocity.y > 0:
		#return State.Fall
		
	if player.is_on_floor():
		if jump_buffer_timer > 0:
			return State.Jump
		if move != 0:
			return State.Run
		else:
			return State.Idle
	return State.Null
