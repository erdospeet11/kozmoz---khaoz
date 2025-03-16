extends Area3D

@export var direction : Global.GravityState
@onready var gravityZoneMesh : MeshInstance3D

func _on_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
		match direction:
			Global.GravityState.NONE:
				body.gravity = Vector3.ZERO
			Global.GravityState.UP:
				body.gravity = Vector3(0, 9.8, 0)
			Global.GravityState.DOWN:
				body.gravity = Vector3(0, -9.8, 0)
			Global.GravityState.LEFT:
				body.gravity = Vector3(-9.8, 0, 0)
			Global.GravityState.RIGHT:
				body.gravity = Vector3(9.8, 0, 0)
			Global.GravityState.FORWARD:
				body.gravity = Vector3(0, 0, -9.8)
			Global.GravityState.BACKWARD:
				body.gravity = Vector3(0, 0, 9.8)

func _on_body_exited(body: Node3D) -> void:
	body.gravity = Vector3(0, -9.8, 0)
