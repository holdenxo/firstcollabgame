extends Area2D

@export_multiline var rewards = "100: 0.5\n-100: 0.5"
@export var dropspeed = 5
@onready var sound_scene = preload("res://winsound.tscn")
var rewards_dict: Dictionary = {}

func _ready() -> void:
	parse_rewards()

func _process(_delta):
	position.y += dropspeed

func _on_body_entered(_body):
	var root = get_tree().root
	root.get_node("Main/scoreboard").score += get_random_reward()
	
	var sound_instance = sound_scene.instantiate()
	root.add_child(sound_instance)
	sound_instance.play()
	
	queue_free()

func parse_rewards() -> void:
	for line in rewards.split("\n"):
		var parts = line.split(":")
		if parts.size() == 2:
			var key = parts[0].strip_edges()
			var value = parts[1].strip_edges().to_float()
			rewards_dict[int(key)] = float(value)

func get_random_reward():
	var random_value = randf()
	var cumulative_probability = 0.0

	for reward in rewards_dict.keys():
		cumulative_probability += rewards_dict[reward]
		if random_value < cumulative_probability:
			return reward

	return 1
