extends Sprite

var speed = 300

func _process(delta):

	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta

	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta

	position.x = clamp(position.x, 450, 950)
		 
