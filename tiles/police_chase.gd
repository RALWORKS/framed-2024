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
	# TODO
	$Cop1.free()
	$Cop2.free()
	pass
