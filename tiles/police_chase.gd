extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	Music.horror()
	$Cops.play("base")
	$EXIT.play("blink")

func kill():
	$Dorian.position = Vector2(59, 933)
	$FX.play("die")


func _on_exit_area_body_entered(body):
	if "is_dorian" in body:
		win()

func win():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/Chapter 3/mc_kenzie_the_younger.tscn")
