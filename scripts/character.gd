extends CharacterBody2D

@onready var anim = $AnimationPlayer
@onready var skeleton = $Skeleton2D2
@onready var ct = $clickt

@export var speed = 600
@export var acc = 1800
@export var friction = 2200

var moving = false
var clicking = false

func _physics_process(delta):

	if not is_on_floor():
		velocity.y += 1800 * delta

	if Input.is_action_just_pressed("e"):
		clicking = true
		anim.play("click")
		ct.start()

	if Input.is_action_just_pressed("m1"):
		if is_on_floor():
			clicking = true
			anim.play("hit")
			ct.start()

	if Input.is_action_pressed("a"):
		skeleton.scale.x = -1
		velocity.x = move_toward(velocity.x, -speed, acc * delta)

	elif Input.is_action_pressed("d"):
		skeleton.scale.x = 1
		velocity.x = move_toward(velocity.x, speed, acc * delta)

	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)

	if is_on_floor():
		if Input.is_action_just_pressed("space"):
			velocity.y = -600

	move_and_slide()

	if not is_on_floor ():
		anim.play("fall")

	elif abs(velocity.x) > 10:
		anim.play("walk")

	else:
		if not clicking:
			anim.play("idle")

func _on_clickt_timeout() -> void:
	clicking = false
