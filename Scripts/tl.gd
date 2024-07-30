extends Node

@export var player1Camera:Camera3D
@export var player2Camera:Camera3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	player1Camera.get_parent().remove_child.call_deferred(player1Camera)
	$HBoxContainer/SubViewportContainer/SubViewport.add_child.call_deferred(player1Camera)
	player2Camera.get_parent().remove_child.call_deferred(player2Camera)
	$HBoxContainer/SubViewportContainer2/SubViewport.add_child.call_deferred(player2Camera)
