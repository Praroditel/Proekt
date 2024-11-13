extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
const SPEED = 300.0
const JUMP_VELOCITY = -350.0
var anim2 = true


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		anim.play("Ходьба")
		anim2 = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim2= true
		
		
	if anim2:
		anim.play("Стою")	
	if direction == -1:
			$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
		

	move_and_slide()
