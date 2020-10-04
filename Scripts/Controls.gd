extends RichTextLabel

var fade = false

func _ready():
	yield(get_tree().create_timer(15), "timeout")
	queue_free()
