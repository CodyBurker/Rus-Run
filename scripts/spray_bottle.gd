extends Node2D
@onready var killzone = $AnimatedSprite2D/killzone


func _on_waterbottle_weakspot_body_entered(body):
	print("You stomped it alright")
	killzone.queue_free()
	self.queue_free()
