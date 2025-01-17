extends CharacterBody2D

func _ready():
	print("CharacterBody2D Human is ready!")

@onready var sprite = $Sprite2D
const SPEED = 200
const JUMP_VELOCITY = -500.0
const GRAVITY = 30
const BASE_MAX_HEALTH = 100
var health = BASE_MAX_HEALTH

func _physics_process(delta):
	
	# Gravity
	velocity.y += GRAVITY
	
	# Jump
	if Input.is_action_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# chasing algorithm which idk how tf im supposed to get to work
	#if player.global_position.x > global_position.x:
	#	velocity.x = -SPEED
	#	$Sprite2D/AnimationPlayer.play("walk")
	#elif player.global_position.x < global_position.x:
	#	velocity.x = SPEED
	#	$Sprite2D/AnimationPlayer.play("walk")
	#else:
	#	velocity.x = 0
	#	$Sprite2D/AnimationPlayer.stop()

	# Rotation
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
	move_and_slide()
