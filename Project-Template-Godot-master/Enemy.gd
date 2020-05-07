extends KinematicBody2D

const GRAVITY = 0
const SPEED = 30
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var direction = 1
var is_dead = false

func dead():
	is_dead = true
	velocity = Vector2(0,0)
	$CollisionShape2D.call_deferred("set_disabled", true)
	$AnimatedSprite.position.y = 5
	$AnimatedSprite.play("Die")
	$Timer.start()

func _physics_process(delta):
	if is_dead == false:
		velocity.x = SPEED * direction
	
	if direction == 1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	
	if is_dead == false:
		$AnimatedSprite.play("Walk")
	
	velocity.y += GRAVITY
	
	velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		direction = direction * -1
		


func _on_Timer_timeout():
	queue_free()
