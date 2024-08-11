extends Node2D

# "initial-alley": Alley

"""
DORIAN stands in an alley doorway, phone held up to his ear.

MARIE's voice yells from the phone speaker.

MARIE (telephone): Just come home! God, Dorian, whatever 
happened--whatever you did just tell me where you are! 
I'll come I'll help you! I'll--

Dorian hangs up.

DORIAN (to himself): Where I am--

He glances around for a street sign; catches sight of one.

DORIAN: Marbury and 3rd, seems like. Christ. I need to stop drinking.

DORIAN: What I did--

DIP TO BLACK

VO: I have no idea. But it sounds like I've been framed for 
murder.

Options - "Who would I have killed?" --> 
"initial-alley-who-did-i-kill" "Why am I at Marbury and 3rd?" 
--> "why-marbury-and-3rd"
"""

@onready var bg = $AlleyBackground
@onready var phone = $Phone
@onready var blur = $Blur
@onready var marbury_sign = $MarburySign
@onready var dorain_right = $DorainRightPhone

# Called when the node enters the scene tree for the first time.
func _ready():
	blur.visible = false
	
	# fade in with scenario
	
	pass # Replace with function body.


