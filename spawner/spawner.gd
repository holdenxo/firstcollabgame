extends Node2D

var collectables = [preload("res://items/slots.tscn"), preload("res://items/roulette.tscn")]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timer_timeout():
	var newcollectable = collectables[randi() % collectables.size()].instantiate()
	add_child(newcollectable)
	var spawnpos = randi_range(0,get_window().content_scale_size.x)
	newcollectable.position.x = spawnpos
	
