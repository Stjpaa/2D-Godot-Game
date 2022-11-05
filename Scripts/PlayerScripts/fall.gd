extends BaseState

export (float) var gravity_multiplier = 2.0 #higher gravity when falling, does not impact upwards movement
export (float) var move_speed = 150
export (float) var coyote_threshhold = 0.2 #the threshhold of the players jump input after running of a ledge

var jump_buffer_timer: float = 0
var coyote_timer: float = 0

func enter() -> void:
	.enter()
	jump_buffer_timer = 0
	coyote_timer = coyote_threshhold

func input(event: InputEvent) -> int:
	if Input.is_action_just_pressed("jump") and coyote_timer > 0:
		return State.Jump
	
	return State.Null
	
func process(delta: float) -> int:
	jump_buffer_timer -= delta
	coyote_timer -= delta
	return State.Null

func physics_process(delta: float) -> int:
	var move = 0
	
	if Input.is_action_pressed("left"):
		move = -1
		# animation stuff
	elif Input.is_action_pressed("right"):
		move = 1

	player.velocity.x = move * move_speed
	player.velocity += player.gravity * gravity_multiplier
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
		
	if player.is_on_floor():
		if move != 0:
			return State.Run
		else:
			return State.Idle
			
	return State.Null
