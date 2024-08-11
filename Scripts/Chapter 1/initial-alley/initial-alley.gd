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

var slide_count = 0

# Sprites
@onready var dorean_blank = $DoreanBlank
@onready var dorean_confused = $DoreanConfused
@onready var dorean_phone_hand = $DoreanPhoneHand
@onready var street_sign = $StreetSign
@onready var marie_phone = $MariePhone

# Dialogue Boxes
@onready var marie_1 = $MarieDialogue1

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# when scene starts - need to hide stuff
	dorean_blank.visible = false
	dorean_confused.visible = false
	dorean_phone_hand.visible = false
	street_sign.visible = false
	marie_1.visible = false
	marie_phone.visible = true
	
	Music.heart()
	
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_just_released("Next"):
		slide_count += 1
