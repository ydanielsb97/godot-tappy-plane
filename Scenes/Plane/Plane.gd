extends CharacterBody2D

class_name Tappy

var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var engine_sound: AudioStreamPlayer = $EngineSound

const JUMP_SPEED: float = -350.0 

#signal plane_died

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	fly(delta)
	move_and_slide()
	if is_on_floor():
		die()

func fly(delta: float) -> void:
	if not is_on_floor():
		velocity.y += _gravity * delta
	
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_SPEED
		animation_player.play("jump")

func die() -> void:
	animated_sprite_2d.stop()
	SignalHub.emit_plane_died()
	set_physics_process(false)
	engine_sound.stop()
