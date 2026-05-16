extends Sprite

export var speed = 300
export var reset_min = 200
export var reset_max = 1200
export var collision_distance = 60
export(Array) var lanes = [500, 650]

var near_miss_given = false

onready var player = get_parent().get_node("Sprite")

func _process(delta):

	if player.get_parent().game_over:
		return

	position.y += speed * delta
	speed += delta * 0.5

	# RESET ENEMY
	if position.y > 900:

		near_miss_given = false

		position.y = -rand_range(reset_min, reset_max)
		position.x = lanes[randi() % lanes.size()]

	# NEAR MISS BONUS
	if not near_miss_given:

		if abs(position.x - player.position.x) < 80 and abs(position.y - player.position.y) < 200:

			player.get_parent().score += 50

			near_miss_given = true

	# COLLISION
	if position.distance_to(player.position) < collision_distance:

		player.get_parent().get_node("carCrash").play()

		player.get_parent().game_over = true
