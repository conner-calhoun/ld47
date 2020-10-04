extends Sprite

var count = 0
var bounce = .2

func _physics_process(delta):
	translate(transform.basis_xform(Vector2(sin(count)/5, 0)))
	count += bounce
