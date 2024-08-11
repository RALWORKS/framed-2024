extends Node2D

var index = 0
var paused = false

var OPTIONS = "OPTIONS"
var HORROR = "HORROR"
var HEART = "HEART"
var CALM = "CALM"
var END = "END"
var GAMEOVER = "GAMEOVER"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# when scene starts - need to hide stuff
	hide_panels()
	
	#anim_play.play("Panel 1")
	
	sequence = [
		# Node2D["1a", $"1"],
		["1a", $"1", END],
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
	if GAMEOVER in sequence[index]:
		gameover()
		return
	if END in sequence[index]:
		end()
		return
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
	
	if HORROR in page:
		Music.horror()
	elif CALM in page:
		Music.calm()
	elif HEART in page:
		Music.heart()

func flip(to):
	hide_panels()
	to.visible = true

func end():
	# TODO
	pass
	
func gameover():
	# TODO
	pass

func _process(delta):
	if Input.is_action_just_pressed("Next"):
		next()
		return
