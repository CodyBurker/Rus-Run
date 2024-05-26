extends Label
var is_running = true
var time_elapsed := 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_running:
		time_elapsed += delta
		self.text = str(time_elapsed).pad_decimals(2)

func stop_timer():
	is_running = false
