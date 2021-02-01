extends Node2D

onready var animation = get_node("AnimationPlayer")

func _physics_process(delta: float) -> void:
    # Play animation
    animation.play("fadeout")
    # Wait for it to finish
    yield(animation, "animation_finished")
    # Load new scenario
    get_tree().change_scene("res://interface/Menu.tscn")
