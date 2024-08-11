extends Node2D

var index = 0
var paused = false

var OPTIONS = "OPTIONS"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# when scene starts - need to hide stuff
	hide_panels()
	
	#anim_play.play("Panel 1")
	
	sequence = [
		["1a", $"1"],
		[null, $"2", OPTIONS],
		["3a", $"3"],
		[null, $"4", OPTIONS],
		["5a", $"5"],
		[null, $"6"],
		["7a", $"7"],
		[null, $"8", OPTIONS],
	]
	play()
	
	

func hide_panels():
	for c in $".".get_children():
		if is_instance_of(c, Node2D):
			c.visible = false

var sequence = []

func goto(to_index):
	index = to_index
	play()

func next():
	if paused or OPTIONS in sequence[index]:
		return
	index+=1
	play()
	paused = true
	await get_tree().create_timer(0.23).timeout
	paused = false

func play():
	var page = sequence[index]
	
	if page[1] != null:
		flip(page[1])
	
	if page[0] != null:
		$AnimationPlayer.play(page[0])

func flip(to):
	hide_panels()
	to.visible = true

func _process(delta):
	if Input.is_action_just_pressed("Next"):
		next()
		return
