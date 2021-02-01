extends RichTextLabel

var lapsed = 0
var phrase1: = "I wanted to go on epic adventures..."
var phrase2: = "I guess I got what I wanted in the end"
var phrase3: = "What I wasn't counting on was to get lost in these woods"
var phrase4: = "Oh boy, mom will be really angry..."

var text_list = [phrase1, phrase2, phrase3, phrase4]


func _ready() -> void:
    lapsed = 0

# TODO: I HATE being bound by delta time
func _physics_process(delta: float) -> void:
    for text in text_list:
        get_node(".").set_text(text)
        var total_chars = len(text)
        if visible_characters > total_chars:
            lapsed = 0
#        else:
#            get_node(".").set_text(text)
    lapsed += delta
    visible_characters = lapsed / 0.1
