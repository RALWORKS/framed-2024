extends Button

@export var to_index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	


func _on_pressed():
	owner.goto(to_index)
