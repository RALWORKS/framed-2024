extends Node

var heart_playing = false
var calm_playing = false
var horror_playing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Heart.playing = true
	$Horror.playing = true
	$Calm.playing = true
	
	if $DemoUI.visible:
		_show_demo_ui()
	
	calm()

func calm():
	if horror_playing:
		$Horror/Fader.play("off")
		horror_playing = false
	if heart_playing:
		$Heart/Fader.play("off")
		heart_playing = false
	$Calm/Fader.play("on")
	calm_playing = true

func heart():
	if horror_playing:
		$Horror/Fader.play("off")
		horror_playing = false
	if calm_playing:
		$Calm/Fader.play("off")
		calm_playing = false
	$Heart/Fader.play("on")
	heart_playing = true

func horror():
	if calm_playing:
		$Calm/Fader.play("off")
		calm_playing = false
	if heart_playing:
		$Heart/Fader.play("off")
		heart_playing = false
	$Horror/Fader.play("on")
	horror_playing = true
	

func _show_demo_ui():
	# this is for demos
	# it deactivates when the demo node is not visible,
	$DemoUI/Heart.connect("pressed", heart)
	$DemoUI/Calm.connect("pressed", calm)
	$DemoUI/Horror.connect("pressed", horror)
