class_name Player
extends KinematicBody2D

const default_gravity: Vector2 = Vector2(0, 12)
var gravity: Vector2 = Vector2.ZERO
var velocity = Vector2.ZERO

const move_speed = 150
const jump_force = 240
var horizontal_movement = 0

onready var states = $state_manager

func _ready() -> void:
	gravity = default_gravity
	states.init(self)

func _unhandled_input(event: InputEvent) -> void:
	states.input(event)
	
func _physics_process(delta: float) -> void:
	states.physics_process(delta)

func _process(delta: float) -> void:
	states.process(delta)

func GravityFieldEntered(body, field_gravity):
	gravity = field_gravity
	print("Body entered")
	print(gravity)

func GravityFieldExited(body):
	gravity = default_gravity
	print("Body Exited")
