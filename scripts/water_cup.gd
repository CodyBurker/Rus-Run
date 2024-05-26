extends Node2D
var is_upright = true
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var label = $Label
@onready var timer = $Label/Timer
@onready var gamemanager = %gamemanager

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if is_upright:
		is_upright = false
		animated_sprite_2d.play("spill")
		label.show()
		gamemanager.increaseScore()
		timer.start()



func _on_timer_timeout():
	label.hide()
