extends Control

# Add tesxtures for buttons and background. 

# Called when the node enters the scene tree for the first time.
func _ready():
	# cue music
	pass # Replace with function body.

func _on_play_button_pressed():
	# change the scene to Scene 1
	# get_tree().change_scene("path to scene 1")
	pass



func _on_quit_button_pressed():
	get_tree().quit()
	pass
