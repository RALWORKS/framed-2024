extends CanvasLayer

# This is a global scene
# It emits signal on_transition_finished when called
# For the script it is called from add this:-
# Transition.transition()
# await Transition.on_transition_finished
# change scene

signal on_transition_finished

@onready var color_rect = $ColorRect
@onready var anim_play = $AnimationPlayer

func _ready():
	color_rect.visible = false
	anim_play.animation_finished.connect(_on_animation_finished)
	

func _on_animation_finished(anim_name):
	if anim_name == "Fade_to_Black":
		on_transition_finished.emit()
		anim_play.play("Fade_to_Normal")
	elif anim_name == "Fade_to_Normal":
		color_rect.visible = false


func transition():
	color_rect.visible = true
	anim_play.play("Fade_to_Black")
	
