extends CharacterBody2D

func _ready():
	print("CharacterBody2D Max is ready!")

@onready var sprite = $Sprite2D
const SPEED = 300.0
const JUMP_VELOCITY = -500.0
const GRAVITY = 30

func _physics_process(delta):
	# Gravity
	velocity.y += GRAVITY
	
	# for some reason it can jump even if not on floor
	if Input.is_action_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Left-Right Movement
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite2D/AnimationPlayer.play("walk")
	elif Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite2D/AnimationPlayer.play("walk")
	else:
		velocity.x = 0
		$Sprite2D/AnimationPlayer.stop()

	# Rotation
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
	move_and_slide()
