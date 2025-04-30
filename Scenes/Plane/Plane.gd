extends CharacterBody2D

class_name Tappy

var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var engine_sound: AudioStreamPlayer = $EngineSound

const JUMP_SPEED: float = -350.0 
var tap_pressed = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	fly(delta)
	move_and_slide()
	if is_on_floor():
		die()

func fly(delta: float) -> void:
	if not is_on_floor():
		velocity.y += _gravity * delta
	
	if tap_pressed or Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_SPEED
		animation_player.play("jump")
		tap_pressed = false

func _input(event):
	if event.is_pressed():
		tap_pressed = true

func die() -> void:
	animated_sprite_2d.stop()
	SignalHub.emit_plane_died()
	set_physics_process(false)
	engine_sound.stop()
