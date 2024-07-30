extends CharacterBody3D

@export var health = 100
@export var MAX_SPEED = 10
@export var ACC_FAC = 2
@export var DEACC_FAC = 0.1
@export var ROTATION_DEAC_FAC = 0.4
@export var JUMP_VELOCITY = 4.5
@onready var bullet = preload("res://Bullets/red_bullet.tscn")
@onready var fire_vfx:FireVFX = $Muzzle/FireVFX

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_left"):
		velocity.z = max(velocity.z + ACC_FAC, MAX_SPEED)
		
	elif Input.is_action_pressed("ui_right"):
		velocity.z = min(velocity.z - ACC_FAC, MAX_SPEED)
	
	else:
		velocity.z = lerp(velocity.z, 0.0 , DEACC_FAC)
		$AnimationPlayer.pause()
		rotation_degrees.x = lerp(rotation_degrees.x, 0.0 , ROTATION_DEAC_FAC)
		
	move_and_slide()

func _input(event):
	if event.is_action_pressed("ui_left"):
		
#		var tween = get_tree().create_tween()
#		tween.tween_property(self,"rotation_degrees:x",17,0.3).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_BOUNCE)
		$AnimationPlayer.play("tilt_left")

	if event.is_action_pressed("ui_right"):
		$AnimationPlayer.play("tilt_right")
	
	if event.is_action_pressed("ui_accept"):
		var b = bullet.instantiate()
		get_tree().root.add_child(b)
		b.global_transform = $Muzzle.global_transform
		fire_vfx.start()
