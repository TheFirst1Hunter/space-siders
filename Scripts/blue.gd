extends CharacterBody3D

const SPEED = 5.0
const MAX_SPEED = 10
const ACC_FAC = 1
const DEACC_FAC = 0.05
const ROTATION_DEAC_FAC = 0.4
const JUMP_VELOCITY = 4.5

@onready var bullet = preload("res://Bullets/blue_bullet.tscn")
@onready var fireVFX1 = $Muzzle/FireVFX
@onready var fireVFX2 = $Muzzle2/FireVFX
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	
	if Input.is_action_pressed("p2_l"):
		velocity.z = min(velocity.z - ACC_FAC, MAX_SPEED)
	
	elif Input.is_action_pressed("p2_r"):
		velocity.z = max(velocity.z + ACC_FAC, MAX_SPEED)
	
	else:
		velocity.z = lerp(velocity.z, 0.0 , DEACC_FAC)
		$AnimationPlayer.pause()
		rotation_degrees.x = lerp(rotation_degrees.x, 0.0 , ROTATION_DEAC_FAC)
		
	move_and_slide()

func _input(event):
	if event.is_action_pressed("p2_r"):
		
#		var tween = get_tree().create_tween()
#		tween.tween_property(self,"rotation_degrees:x",17,0.3).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_BOUNCE)
		$AnimationPlayer.play("tilt_right")

	if event.is_action_pressed("p2_l"):
		$AnimationPlayer.play("tilt_left")
		
	if event.is_action_pressed("p2_shoot"):
		var b = bullet.instantiate()
		get_tree().root.add_child(b)
		b.global_transform = $Muzzle.global_transform
		
		var b2 = bullet.instantiate()
		get_tree().root.add_child(b2)
		b2.global_transform = $Muzzle2.global_transform
		
		fireVFX1.start()
		fireVFX2.start()

