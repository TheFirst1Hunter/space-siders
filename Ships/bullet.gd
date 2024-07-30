extends Node3D

@export var damage:int = 2
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform.origin.x -= delta * speed


func _on_area_3d_body_entered(body):
	if body.name == "Blue":
		body.health -= damage
	
	if body.name != "Red":
		queue_free()


func _on_death_timeout():
	queue_free()
