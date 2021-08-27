extends KinematicBody2D

var lineal_vel = Vector2.ZERO
var SPEED = 300
var GRAVITY = 400

func _physics_process(delta: float) -> void:
	lineal_vel = move_and_slide(lineal_vel, Vector2.UP)
	
	$GridContainer.connect("gui_input")
	
	lineal_vel.y += GRAVITY * delta
	
	var target_vel = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	lineal_vel.x = lerp(lineal_vel.x, target_vel * SPEED, 0.5)
	
	if Input.is_action_just_pressed("jump"):
		lineal_vel.y = -SPEED
	
