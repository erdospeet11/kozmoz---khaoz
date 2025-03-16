extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENSITIVITY = 0.1

var gravity = Vector3(0, -9.8, 0)

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	velocity += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity -= gravity.normalized() * JUMP_VELOCITY  

	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

func _process(delta: float) -> void:
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var look_vector : Vector3 = Vector3(event.position.x, event.position.y, 0) * MOUSE_SENSITIVITY
		
		rotate_y(deg_to_rad(-event.relative.x * MOUSE_SENSITIVITY))
		$Camera3D.rotate_x(deg_to_rad(-event.relative.y * MOUSE_SENSITIVITY))
		#$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(70), deg_to_rad(70))
