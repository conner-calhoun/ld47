extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("body_entered", self, "handle_enter")
	
func handle_enter(body):
	var timer = get_tree().get_nodes_in_group("win")[0]
	var time = timer.time
	
	Globals.set_win_time(time)
	get_tree().change_scene("res://Scenes/WinScene.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
