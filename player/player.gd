extends CharacterBody2D

var movespeed = 30000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * movespeed * delta
	else:
		velocity.x = move_toward(velocity.x, 0, movespeed * delta)
	move_and_slide()
   	
	return velocity
