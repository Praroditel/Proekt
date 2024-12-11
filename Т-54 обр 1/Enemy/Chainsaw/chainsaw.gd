extends Node2D
var speed = 100
var direction = Vector2(1, 0)
var is_colliding = false


func _process(delta: float) -> void:
	position += direction * speed * delta
	
