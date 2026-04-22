extends Sprite2D

# exported variable
@export var speed: float = 200.0
@export var sprint_multiplier: float = 2.0

func _process(delta):
	var direction = Vector2.ZERO

	# check keyboard keys
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1

	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	elif Input.is_action_pressed("ui_up"):
		direction.y -= 1

	# \sprint if holding Shift
	var current_speed: float

	if Input.is_action_pressed("ui_accept"):  # spacebar = sprint
		current_speed = speed * sprint_multiplier
		modulate = Color(1, 0.3, 0.3)  # turn red when sprinting
	else:
		current_speed = speed
		modulate = Color(1, 1, 1)  #  ormal white color

	# move the sprite
	position += direction.normalized() * current_speed * delta
