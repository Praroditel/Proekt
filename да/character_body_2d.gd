extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
const SPEED = 300.0
const JUMP_VELOCITY = -350.0
var anim2 = true
var рывок = 4000
var исп_рывок = true
var rivok_direction = Vector2.ZERO



func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	var direction2 = Input.get_axis("ui_left", "ui_right")	
	if Input.is_action_pressed("ui_left"):
		rivok_direction = Vector2.LEFT
		velocity.x = direction2 * рывок
		
	elif Input.is_action_pressed("ui_right"):
		rivok_direction = Vector2.RIGHT 
		velocity.x = direction2 * рывок

	
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
	dach()
	move_and_slide()
	
func dach():#рывок
	if Input.is_action_just_pressed("shift") and исп_рывок:
		velocity = rivok_direction.normalized() * 2000
		исп_рывок = false 
		await get_tree().create_timer(2).timeout
		print("5")
		исп_рывок = true
	 
		
		
