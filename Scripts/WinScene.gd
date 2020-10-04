extends Node2D

func _ready():
	$Control/RichTextLabel.text = "CONGRATULATIONS. Final Time: " + \
		str(Globals.get_win_time()) + \
		"s\nPress Space to Play Again"

func _process(delta):
	if Input.is_action_pressed("jump"):
		$Control/RichTextLabel.text = "ENJOY!"
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene("res://Scenes/World.tscn")
