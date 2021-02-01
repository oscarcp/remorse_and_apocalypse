extends Button

onready var quit_sound = get_node("../../Goodbye")

func _on_QuitButton_button_up() -> void:
    quit_sound.play()
    # TODO: Patch this bs, AudioStreamPlayer is broken, it loops audio and
    #       never stops, what the hell Godot Team.
    OS.delay_msec(1300)
    get_tree().quit()
