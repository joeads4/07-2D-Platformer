extends Area2D

const SPEED = 5
var velocity = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.x = SPEED + delta
	translate(velocity)
	$AnimatedSprite.play("Shoot")
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
