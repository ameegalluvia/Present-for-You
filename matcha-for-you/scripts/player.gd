extends CharacterBody2D

@export var speed: float = 300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var last_direction: String = "down"

var override_animation: String = ""

func _ready() -> void: 
	override_animation = "" 
	if SceneTransition.target_spawn_name != "": 
		var spawn_pos = SceneTransition.get_spawn_position(get_tree().current_scene) 
		if spawn_pos != Vector2.ZERO: 
			global_position = spawn_pos 
		SceneTransition.target_spawn_name = ""

func _physics_process(delta: float) -> void:
	if MessageBox.is_busy:
		velocity = Vector2.ZERO
		move_and_slide()
		if override_animation != "":
			animated_sprite.play(override_animation)
		else:
			animated_sprite.play("idle_" + last_direction)
		return

	var input_vector: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
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
