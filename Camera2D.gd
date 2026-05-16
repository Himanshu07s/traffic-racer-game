extends Camera2D

var shake = 0

func _process(delta):

	offset = Vector2(
		rand_range(-shake, shake),
		rand_range(-shake, shake)
	)

	shake = lerp(shake, 0, 5 * delta)
