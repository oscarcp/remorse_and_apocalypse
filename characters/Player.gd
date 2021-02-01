extends Actor

func play_steps_audio() -> void:
    var step_sound = get_node("PlayerStep")
    while Input.is_action_pressed("move_right") or \
          Input.is_action_pressed("move_left"):
        step_sound.pitch_scale = 1.0
        if Input.is_action_pressed("run"):
            step_sound.pitch_scale = 1.25
        if not step_sound.playing:
            step_sound.playing = true
        else:
            return
    step_sound.stop()

func _process(delta: float) -> void:
    if Input.is_action_pressed("jump"):
        $AnimatedSprite.play("jump")
    elif Input.is_action_pressed("attack"):
        $AnimatedSprite.play("punch")
    elif Input.is_action_pressed("move_left") and not \
         Input.is_action_pressed("run"):
        $AnimatedSprite.play("walk")
        $AnimatedSprite.flip_h = true
    elif Input.is_action_pressed("move_right") and not \
         Input.is_action_pressed("run"):
        $AnimatedSprite.play("walk")
        $AnimatedSprite.flip_h = false
    elif Input.is_action_pressed("run") and \
         Input.is_action_pressed("move_left") or \
         Input.is_action_pressed("move_right"):
        $AnimatedSprite.play("run")
    elif Input.is_action_pressed("crouch"):
        $AnimatedSprite.play("crouch")
    else:
        $AnimatedSprite.play("idle")

func _physics_process(delta: float) -> void:
    var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
    var direction: = get_direction()
    _velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
    _velocity = move_and_slide(_velocity, FLOOR_NORMAL)


func get_direction() -> Vector2:
    # Really annoying! Animation istoo fast to sync
    #play_steps_audio()
    return Vector2(
        Input.get_action_strength("move_right") -
        Input.get_action_strength("move_left"),
        -1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0
    )

func calculate_move_velocity(linear_velocity: Vector2,
                             direction: Vector2,
                             speed: Vector2,
                             is_jump_interrupted: bool
                            ) -> Vector2:
    var out: = linear_velocity
    out.x = speed.x * direction.x
    if Input.is_action_pressed("run"):
        out.x = (speed.x * 1.4) * direction.x
    out.y += gravity * get_physics_process_delta_time()
    if direction.y == -1.0:
        out.y = speed.y * direction.y
    if is_jump_interrupted:
        out.y = 0.0
    return out


