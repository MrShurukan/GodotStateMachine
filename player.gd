extends CharacterBody2D


const SPEED = 100.0
const ACCEL = 30.0

var input: Vector2
@onready var animation_player: AnimationPlayer = %AnimationPlayer
var lastDirection = "right"

func _process(delta: float) -> void:
	input.x = Input.get_axis("left", "right")
	input.y = Input.get_axis("up", "down")

	if input.y < 0:
		animation_player.play("walk_forward")
		lastDirection = "forward"
	elif input.y > 0:
		animation_player.play("walk_backward")
		lastDirection = "backward"
	elif input.x > 0:
		animation_player.play("walk_right")
		lastDirection = "right"
	elif input.x < 0:
		animation_player.play("walk_left")
		lastDirection = "left"
	else:
		match lastDirection:
			"forward":
				animation_player.play("idle_forward")
			"backward":
				animation_player.play("idle_backward")
			"right":
				animation_player.play("idle_right")
			"left":
				animation_player.play("idle_left")

	velocity = lerp(velocity, input * SPEED, delta * ACCEL)

	move_and_slide()
