extends CharacterBody2D

var movespeed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * movespeed
	else:
		velocity.x = move_toward(velocity.x, 0, movespeed)
	move_and_slide()
