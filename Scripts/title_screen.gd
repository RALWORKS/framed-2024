extends Control

# Add textures for buttons and background. 

# Called when the node enters the scene tree for the first time.
func _ready():
	# cue music
	pass # Replace with function body.

func _on_play_button_pressed():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/Chapter 1/initial-alley.tscn")

func _on_quit_button_pressed():
	get_tree().quit()


