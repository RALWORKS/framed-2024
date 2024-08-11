extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Music.calm()





func _on_click_pressed():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/Menu/title_screen.tscn")
