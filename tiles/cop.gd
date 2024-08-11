extends CharacterBody2D
@export var parent: Node



func _on_area_2d_body_entered(body):
	if "is_dorian" in body:
		parent.kill()
