extends Node3D
class_name FireVFX

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start():
	var cildren = get_children()
	
	for c in cildren:
		var p:GPUParticles3D = c
		p.emitting = true
