extends State
class_name EnemyIdle

@export var enemy: CharacterBody2D
var player: CharacterBody2D
var idle_time: float

func randomize_idle():
	idle_time = randf_range(2, 4)

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	if enemy:
		enemy.velocity = Vector2.ZERO
	randomize_idle()

func Update(delta: float):
	if idle_time > 0:
		idle_time -= delta
	else:
		Transitioned.emit(self, "EnemyWander")

func PhysicsUpdate(delta: float):
	var direction = player.global_position - enemy.global_position

	if direction.length() < 30:
		Transitioned.emit(self, "EnemyFollow")
