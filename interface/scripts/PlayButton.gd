extends Button

onready var animation = get_node("../../AnimationPlayer")

func _on_PlayButton_button_up() -> void:
    # Play animation
    animation.play("fadeout")
    # Wait for it to finish
    yield(animation, "animation_finished")
    # Load new scenario
    get_tree().change_scene("res://scenes/story.tscn")
