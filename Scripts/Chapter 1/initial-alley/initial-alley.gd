extends Node2D

# "initial-alley": Alley

"""
DORIAN stands in an alley doorway, phone held up to his ear.

MARIE's voice yells from the phone speaker.

MARIE (telephone): Just come home, Dorian. This is too much, even for you. I know he screwed you over, but you can't--you can't just--

DORIAN: Marie. Slow down. I didn't kill anybody for God's sake.

DIP TO BLACK FOR VOICE OVER DORIAN (VO): Did I?

DORIAN (to Marie): Tell me just what it is you think is going on.

MARIE (telephone): If you didn't do it, then you have nothing to hide. You can turn yourself in. Where are you? I'll come pick you up. We can drive to the station together--

DORIAN: Marie. Stop. What's going on?

MARIE (telephone): Where are you, Dorian? What did you do? What did you--

Dorian hangs up.

DORIAN: Damnit.

DORIAN (to himself): Where am I?

He glances around for a street sign; catches sight of one.

DORIAN: Marbury and 3rd, seems like. Christ. I need to stop drinking.

DORIAN: And what have I done?

Dorian looks at a spot of blood on the cuff of his sleeve.

DIP TO BLACK

DORIAN (VO): Murder?

DORIAN (VO): After the year I've had, I ... wouldn't put it past myself.
"""


# Variables
var panel_count = 0

var dict = {
	"panel1": {
		"next": "panel2",
		"animations": ["Panel 1"]
	},
	"panel2": {
		"next": "panel3",
		"animations": ["Panel 2"]
	},
	"panel3": {
		"next": "panel4",
		"animations": ["Panel 3"]
	},
	"panel4": {
		"next": "panel5",
		"animations": ["Panel 4a", "Panel 4b", "Panel 4c", "Panel 4d"]
	},
	"panel5": {
		"next": "panel6",
		"animations": ["Panel 5"]
	},
	"panel6": {
		"next": "panel7",
		"animations": ["Panel 6"]
	},
	"panel7": {
		"next": "panel8",
		"animations": ["Panel 7"]
	},
	"panel8": {
		"next": null,
		"animations": ["Panel 8"]
	},
}

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

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# when scene starts - need to hide stuff
	hide_panels()
	
	#anim_play.play("Panel 1")
	
	sequence = [
	["Panel 1", panel1],
	["Panel 2", panel2],
	["Panel 3", panel3],
	["Panel 4a", panel4],
	["Panel 4b", null],
	["Panel 4c", null],
	["Panel 4d", null],
	["Panel 5", panel5],
	["Panel 6", panel6],
	["Panel 7", panel7],
	["Panel 8", panel8],
	]
	play()
	
	

func hide_panels():
	panel1.visible = false
	panel2.visible = false
	panel3.visible = false
	panel4.visible = false
	panel5.visible = false
	panel6.visible = false
	panel7.visible = false
	panel8.visible = false

var sequence = []

func next():
	if paused:
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
	
		if anim_play.current_animation != "Panel 8":
			panel2.visible = true
			panel1.visible = false
			anim_play.play("Panel 2")
		else :
			# change scene
			get_tree().quit()
