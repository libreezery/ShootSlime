extends Area2D


@export var speed = 150
var direction = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += Vector2(delta * speed * direction,0)


func setDirect(direct:int):
	direction =direct
