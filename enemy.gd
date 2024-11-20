extends CharacterBody2D

@onready var animation_player: AnimationPlayer = %AnimationPlayer
var lastDirection = "backward";

func _physics_process(delta: float) -> void:
	move_and_slide()

	var angle = rad_to_deg(velocity.angle());

	if velocity.length() == 0:
		match lastDirection:
			"forward":
				animation_player.play("idle_forward")
			"backward":
				animation_player.play("idle_backward")
			"right":
				animation_player.play("idle_right")
			"left":
				animation_player.play("idle_left")

	elif -45 < angle and angle <= 45:
		animation_player.play("walk_right")
		lastDirection = "right"
	elif -135 < angle and angle <= -45:
		animation_player.play("walk_forward")
		lastDirection = "forward"
	elif (135 < angle and angle <= 180) or (-135 > angle and angle >= -180):
		animation_player.play("walk_left")
		lastDirection = "left"
	elif 45 < angle and angle <= 135:
		animation_player.play("walk_backward")
		lastDirection = "backward"
