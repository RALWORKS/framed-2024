extends Node2D

# Animation Player
@onready var anim_play = $AnimationPlayer

# Panels
@onready var panel1 = $"Panel 1"
@onready var panel2 = $"Panel 2"
@onready var panel3 = $"Panel 3"
@onready var panel4 = $"Panel 4"
@onready var panel5 = $"Panel 5"
@onready var panel6 = $"Panel 6"
@onready var panel7 = $"Panel 7"
@onready var panel8 = $"Panel 8"

var index = 0
var paused = false

var OPTIONS = "OPTIONS"
var HORROR = "HORROR"
var HEART = "HEART"
var CALM = "CALM"
var END = "END"
var GAMEOVER = "GAMEOVER"
var TRANSITION = "TRANSITION"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# when scene starts - need to hide stuff
	hide_panels()
	
	#anim_play.play("Panel 1")
	
	
	sequence = [
	["Panel 1", $"Panel 1"],
	["Panel 2", $"Panel 2"],
	["Panel 3", $"Panel 3", TRANSITION],
	["Panel 4a", $"Panel 4", TRANSITION],
	["Panel 4b", null],
	["Panel 4c", null],
	["Panel 4d", null],
	["Panel 5", $"Panel 5"],
	["Panel 6", $"Panel 6", TRANSITION],
	["Panel 7", $"Panel 7", TRANSITION],
	["Panel 8", $"Panel 8", TRANSITION],
	[null, $"Panel 9", OPTIONS, TRANSITION]
	]
	play()
	
	

func hide_panels():
	for c in $".".get_children():
		if is_instance_of(c, Node2D):
			c.visible = false

var sequence = []

func next():
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
	
	if TRANSITION in page:
		Transition.transition()
		await Transition.on_transition_finished
	
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

func _process(delta):
	if Input.is_action_just_pressed("Next"):
		next()
		return

func end():
	pass

func goto(to_index):
	index = to_index
	play()
