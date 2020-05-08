extends Area

var damage = 40
var speed = 15 
var velocity = Vector3()

func start(xform):
	transform = xform
	velocity = -transform.basis.z * speed
	
func _process(delta):
	transform.origin += velocity * delta
	
	


func _on_Timer_timeout():
	queue_free()


func _on_Bullet_body_entered(body):
	if body is StaticBody:
		queue_free()
	if body.is_in_group("Enemy"):
		print(body.health)
		body.take_damage(damage)
		queue_free()
