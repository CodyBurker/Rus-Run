extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

@onready var player = $"."
@export var SPEED = 150.0
@export var JUMP_VELOCITY = -200.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		animated_sprite_2d.play('jump')

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		animated_sprite_2d.play('walk')
		velocity.x = direction * SPEED
		if direction > 0:
			animated_sprite_2d.flip_h = false
		else:
			animated_sprite_2d.flip_h = true
	else:
		if is_on_floor():
			animated_sprite_2d.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_just_pressed("swipe"):
		print("Swiped")
		animated_sprite_2d.play("swipe")

	move_and_slide()
