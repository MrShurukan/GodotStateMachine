extends State
class_name EnemyFollow

@onready var alert: Sprite2D = %Alert
@export var enemy: CharacterBody2D
var move_speed := 50
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	alert.visible = true

func Exit():
	alert.visible = false

func PhysicsUpdate(delta: float):
	var direction = player.global_position - enemy.global_position

	if direction.length() > 25:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2.ZERO

	if direction.length() > 100:
		Transitioned.emit(self, "EnemyIdle")
