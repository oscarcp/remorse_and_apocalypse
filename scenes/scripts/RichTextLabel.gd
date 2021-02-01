extends RichTextLabel

var lapsed = 0

func _ready() -> void:
    lapsed = 0

func _physics_process(delta: float) -> void:
    lapsed += delta
    visible_characters = lapsed / 0.1
    if visible_characters > len(text):
        get_tree().change_scene("res://scenes/level.tscn")
