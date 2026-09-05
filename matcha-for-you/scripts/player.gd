extends CharacterBody2D

@export var speed: float = 50.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@onready var joystick: Control = $"Camera2D/VirtualJoystick"

var last_direction: String = "down"  

func _physics_process(delta: float) -> void:
	if MessageBox.is_dialogue_mode:
		velocity = Vector2.ZERO
		move_and_slide()
		return
	
	var input_vector: Vector2 = joystick.output
	velocity = input_vector * speed
	move_and_slide()
	_update_animation(input_vector)

func _update_animation(input_vector: Vector2) -> void:
	if input_vector == Vector2.ZERO:
		animated_sprite.play("idle_" + last_direction)
		return

	if abs(input_vector.x) > abs(input_vector.y):
		last_direction = "right" if input_vector.x > 0 else "left"
	else:
		last_direction = "down" if input_vector.y > 0 else "up"

	animated_sprite.play("walk_" + last_direction)


func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
