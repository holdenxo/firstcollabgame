extends CharacterBody2D

var movespeed = 600

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * movespeed
	else:
		velocity.x = move_toward(velocity.x, 0, movespeed)
	move_and_slide()
   	
	return velocity
