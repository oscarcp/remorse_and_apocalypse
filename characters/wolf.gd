extends KinematicBody2D

onready var animation = $AnimationPlayer

func _on_PlayerDetector_body_entered(body: Node) -> void:
    print("##################################################################")
    print(body.name)
    if body.name == "Player":
        print("PLAYER IS HERE!")
        animation.play("dissapear")
        yield(animation, "animation_finished")
        queue_free()
