extends KinematicBody

var velocity = Vector3(0,0,0)
const SPEED = 8
const ANGLE = deg2rad(8)

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$MeshInstance.rotate_z(-ANGLE)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$MeshInstance.rotate_z(ANGLE)
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)
	
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_up"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		$MeshInstance.rotate_x(ANGLE)
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		$MeshInstance.rotate_x(-ANGLE)
	else:
		velocity.z = lerp(velocity.z, 0, 0.1)
	
	if Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left"):
		velocity.x = 0
	if Input.is_action_just_released("ui_down") or Input.is_action_just_released("ui_up"):
		velocity.z = 0
		
	move_and_slide(velocity)

func _on_enemy_body_entered(body):
	if body.name == "Steve":
		get_tree().change_scene("res://Assets/GameOver.tscn")

