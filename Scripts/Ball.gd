extends Node2D

onready var body = $Rigidbody2D
export (Texture) var sprite

func _ready():
	body.get_node("Sprite").set_texture(sprite)

func _physics_process(delta):
	body.angular_velocity = 0
