extends ColorRect

var speed = 700

func _process(delta):

	rect_position.y += speed * delta

	if rect_position.y > 900:
		rect_position.y = -200
