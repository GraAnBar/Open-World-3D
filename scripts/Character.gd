extends CharacterBody3D

# How fast the player moves in meters per second.
const SPEED = 5.0
const JUMP_VELOCITY= 4.5

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var camera := $CollisionShape3D/camera


func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var z : int = 0
	if Input.is_action_pressed("forward"):
		z = 1
	elif Input.is_action_pressed("backward"):
		z = -1
	if Input.is_action_pressed("turn_left"):
		rotation.y = rotation.y + deg_to_rad(50) * delta
	elif Input.is_action_pressed("turn_right"):
		rotation.y = rotation.y + deg_to_rad(-50) * delta
	if Input.is_action_pressed("look_up"):
		camera.rotation.x = camera.rotation.x + deg_to_rad(30) * delta
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(25))
	elif Input.is_action_pressed("look_down"):
		camera.rotation.x = camera.rotation.x + deg_to_rad(-30) * delta
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(25))
	
	
	var direction = (transform.basis * Vector3(0,0,z)).normalized()
	if direction: 
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()
