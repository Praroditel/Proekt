extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
const SPEED = 300.0
const JUMP_VELOCITY = -350.0
var anim2 = true
var рывок = 40
var исп_рывок = true
var rivok_direction = Vector2.ZERO
var TIMER = false
var hp = 3


func _ready() -> void:
	var TIMER2 = get_node("Timer")
	TIMER2.timeout.connect(_on_timer_timeout)
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	var direction = Input.get_axis("ui_left", "ui_right")	
	
	
	
	
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if direction:
		velocity.x = direction * SPEED
		anim.play("Ходьба")
		anim2 = false
		if direction == -1 and Input.is_action_pressed("shift") and исп_рывок == true:
			rivok_direction = Vector2.LEFT
			velocity.x = direction * рывок * SPEED
			исп_рывок = false
			if TIMER == false:
				$Timer.wait_time=1
				$Timer.start()
				TIMER = true
			#if  исп_рывок == false:
			#	get_tree().create_timer(2).timeout
				#исп_рывок = true
			   
			  
			   
			
		if direction == 1 and Input.is_action_pressed("shift") and исп_рывок:
			rivok_direction = Vector2.RIGHT
			velocity.x = direction * рывок * SPEED
			исп_рывок = false
			if TIMER == false:
				$Timer.wait_time=3
				$Timer.start()
				TIMER = true
			#await get_tree().create_timer(2).timeout
			#исп_рывок = true
		
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
func _on_timer_timeout() -> void:
	if TIMER == true:
	#	исп_рывок = true
		print("GG")
		исп_рывок = true
		TIMER = false
