extends Node2D
@onready var killzone = $AnimatedSprite2D/killzone
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var killzone_2 = $AnimatedSprite2D/killzone2

var is_squashed = false

func _on_waterbottle_weakspot_body_entered(body):
	if not is_squashed:
		is_squashed = true
		killzone.queue_free()
		killzone_2.queue_free()
		animated_sprite_2d.play('squash')
