extends RichTextLabel

var time = 0.0

func _physics_process(delta):
	time += delta
	text = "TIME: " + "%.2f" % (time) + 's'
