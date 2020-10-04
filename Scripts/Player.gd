extends RigidBody2D

const TORQUE = 100
const JUMP_MOD = 150
const MAX_JUMP = 6
const JUMP_TICK = .25
const AIR_CONTROL = 5

export var debug = false

var rotate = 0
var jump_power = 0
var velocity = Vector2.ZERO
var on_ground = true

onready var jumpbar = get_parent().get_node("JumpBar")

func handle_spin():
	if Input.is_action_pressed("left"):
		if on_ground:
			apply_torque_impulse(-TORQUE)
		else:
			apply_central_impulse(Vector2(-AIR_CONTROL, 0))
	elif Input.is_action_pressed("right"):
		if on_ground:
			apply_torque_impulse(TORQUE)
		else:
			apply_central_impulse(Vector2(AIR_CONTROL, 0))
	
func handle_jump():
	jumpbar.position = position + Vector2(0, -2)
	if jump_power == 0:
		jumpbar.play("default")
	elif jump_power < 2:
		jumpbar.play("25")
	elif jump_power < 4:
		jumpbar.play("50")
	elif jump_power < MAX_JUMP:
		jumpbar.play("75")
	elif jump_power == MAX_JUMP:
		jumpbar.play("100")
	
	if Input.is_action_pressed("jump"):
		jump_power = min(jump_power + JUMP_TICK, MAX_JUMP)
	
	if Input.is_action_just_released("jump"):
		if on_ground:
			apply_central_impulse(Vector2(0, -jump_power * JUMP_MOD))
		jump_power = 0
		
func check_ground():
	var space_state = get_world_2d().direct_space_state
	
	var raycasts = []
	for i in range(10):
		raycasts.append(space_state.intersect_ray(global_position, Vector2(global_position.x+i, global_position.y + 18 - (i/2))))
		raycasts.append(space_state.intersect_ray(global_position, Vector2(global_position.x-i, global_position.y + 18 - (i/2))))

	on_ground = false
	for cast in raycasts:
		if cast:
			on_ground = true
			break

func handle_cheats():
	if Input.is_action_pressed("cheat_place"):
		angular_velocity = 0
		linear_velocity = Vector2.ZERO
		position = get_viewport().get_mouse_position()
		

func _physics_process(delta):
	handle_spin()
	handle_jump()
	check_ground()
	
	if debug:
		handle_cheats()
