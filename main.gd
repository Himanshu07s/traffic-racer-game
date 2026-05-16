extends Node2D

var paused = false
var score = 0
var game_over = false

onready var pause_label = get_node("pause")
onready var score_label = get_node("Score")

func _process(delta):

	# PAUSE SYSTEM
	if Input.is_action_just_pressed("ui_cancel"):

		paused = !paused

		get_tree().paused = paused

		pause_label.visible = paused

	# SCORE
	if game_over == false and paused == false:

		score += delta * 2

		score_label.text = "Score: " + str(int(score))

	# GAME OVER
	if game_over:

		score_label.text = "GAME OVER\nPress ENTER"

	# RESTART
	if game_over and Input.is_action_just_pressed("ui_accept"):

		get_tree().reload_current_scene()
