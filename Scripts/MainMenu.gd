extends Node2D

func _process(delta):
	if Input.is_action_pressed("jump"):
		$Control/RichTextLabel.text = "ENJOY!"
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene("res://Scenes/World.tscn")
