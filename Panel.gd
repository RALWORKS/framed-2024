extends Node2D

@export var animation = ""

func play():
	if animation:
		$"..".get_node("AnimationPlayer").play(animation)



func _on_visibility_changed():
	if visible:
		play()
