extends TextureProgressBar

@onready var player = $"../.."

func _process(delta: float) -> void:
	value = player.hp 
