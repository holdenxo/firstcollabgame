extends Node2D

@export var rewards = {
    100: 0.4,
    -20: 0.6
}

func _ready() -> void:
    var reward = get_random_reward()
    print("Selected Reward: ", reward)

func get_random_reward() -> String:
    var random_value = randf()
    var cumulative_probability = 0.0

    for reward in rewards.keys():
        cumulative_probability += rewards[reward]
        if random_value < cumulative_probability:
            return reward

    return ""
