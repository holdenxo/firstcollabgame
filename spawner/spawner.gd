extends Node2D

var collectables = [preload("res://items/slots.tscn"), preload("res://items/roulette.tscn"), preload("res://items/pokerchip_1.tscn"), preload("res://items/pokerchip_2.tscn")]

func _on_timer_timeout():
	var newcollectable = collectables[randi() % collectables.size()].instantiate()
	add_child(newcollectable)
	var spawnpos = randf_range(-get_window().content_scale_size.x,get_window().content_scale_size.x)
	newcollectable.position.x = spawnpos
	
