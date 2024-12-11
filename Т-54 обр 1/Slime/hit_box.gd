extends Area2D

@onready var player = $".."



func _on_body_entered(body: Node2D) -> void:
	if body is spike:
		player.hp -= 1
		print (1)
