extends Area2D
@onready var timer = $Timer
var gamemanager

# Called when the node enters the scene tree for the first time.
func _ready():
	gamemanager = get_tree().root.get_child(0).get_node("gamemanager")


## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _on_body_entered(body):
	body.get_node("CollisionShape2D").queue_free()
	gamemanager.death()
	timer.start()



func _on_timer_timeout():
	get_tree().reload_current_scene()
